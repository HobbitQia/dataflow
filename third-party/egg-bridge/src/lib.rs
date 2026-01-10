//! egg-bridge: A C/C++ FFI bridge for the egg e-graph library
//!
//! This crate provides a C-compatible interface for using egg's equality
//! saturation capabilities from C++ code (specifically for MLIR dialects).

use egg::{rewrite as rw, *};
use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::ptr;

// Define a simple expression language that can represent arithmetic operations
// This can be extended to match Neura dialect operations
define_language! {
    /// A simple language for representing expressions
    pub enum SimpleExprLang {
        // Constants
        Num(i64),
        Float(ordered_float::NotNan<f64>),
        Symbol(Symbol),

        // Binary arithmetic operations
        "+" = Add([Id; 2]),
        "-" = Sub([Id; 2]),
        "*" = Mul([Id; 2]),
        "/" = Div([Id; 2]),

        // Unary operations
        "neg" = Neg(Id),
        
        // Comparison operations
        "==" = Eq([Id; 2]),
        "!=" = Ne([Id; 2]),
        "<" = Lt([Id; 2]),
        "<=" = Le([Id; 2]),
        ">" = Gt([Id; 2]),
        ">=" = Ge([Id; 2]),
        "icmp" = Icmp([Id; 3]),  // Integer comparison with mode

        // Logical operations
        "and" = And([Id; 2]),
        "or" = Or([Id; 2]),
        "not" = Not(Id),

        // Control flow / selection
        "select" = Select([Id; 3]),

        // Memory operations (for Neura dialect)
        "load" = Load(Id),
        "store" = Store([Id; 2]),
        "gep" = Gep([Id; 2]),

        // Neura dialect specific operations
        "grant_once" = GrantOnce(Id),
        "reserve" = Reserve(Id),
        "phi_start" = PhiStart([Id; 2]),
        "phi_end" = PhiEnd([Id; 2]),
        "grant_pred" = GrantPred([Id; 2]),
        "ctrl_mov" = CtrlMov([Id; 2]),
        "data_mov" = DataMov(Id),
        "return_value" = ReturnValue(Id),
        "yield" = Yield,
        
        // Floating point operations
        "fadd" = FAdd([Id; 2]),
        "fsub" = FSub([Id; 2]),
        "fmul" = FMul([Id; 2]),
        "fdiv" = FDiv([Id; 2]),

        // Vector operations
        "vadd" = VAdd([Id; 2]),
        "vmul" = VMul([Id; 2]),

        // Generic function call with variable arity
        "call" = Call(Box<[Id]>),
        
        // Fused operations (dynamically matched)
        "fused" = Fused(Box<[Id]>),
    }
}

/// Result structure returned by equality saturation
#[repr(C)]
pub struct EggResult {
    /// The optimized expression as a string (owned, must be freed)
    pub result_expr: *mut c_char,
    /// Error message if any (owned, must be freed), null if success
    pub error_msg: *mut c_char,
    /// Number of iterations performed
    pub iterations: u32,
    /// Final e-graph size (number of e-classes)
    pub egraph_size: u32,
    /// Whether saturation was reached
    pub saturated: bool,
}

/// Configuration for the equality saturation runner
#[repr(C)]
pub struct EggConfig {
    /// Maximum number of iterations
    pub iter_limit: u32,
    /// Maximum number of nodes in the e-graph
    pub node_limit: u32,
    /// Time limit in seconds (0 = no limit)
    pub time_limit_secs: u32,
}

impl Default for EggConfig {
    fn default() -> Self {
        EggConfig {
            iter_limit: 30,
            node_limit: 10000,
            time_limit_secs: 60,
        }
    }
}

/// Create a default configuration
#[no_mangle]
pub extern "C" fn egg_config_default() -> EggConfig {
    EggConfig::default()
}

/// Parse rewrite rules from a string format
/// Format: "name: lhs => rhs" or "name: lhs <=> rhs" for bidirectional
fn parse_rules(rules_str: &str) -> Result<Vec<Rewrite<SimpleExprLang, ()>>, String> {
    let mut rules = Vec::new();
    
    for line in rules_str.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') || line.starts_with("//") {
            continue;
        }
        
        // Parse "name: lhs => rhs" or "name: lhs <=> rhs"
        let parts: Vec<&str> = line.splitn(2, ':').collect();
        if parts.len() != 2 {
            return Err(format!("Invalid rule format: {}", line));
        }
        
        let name = parts[0].trim();
        let rule_part = parts[1].trim();
        
        if rule_part.contains("<=>") {
            // Bidirectional rule
            let sides: Vec<&str> = rule_part.split("<=>").collect();
            if sides.len() != 2 {
                return Err(format!("Invalid bidirectional rule: {}", line));
            }
            let lhs = sides[0].trim();
            let rhs = sides[1].trim();
            
            let lhs_pattern: Pattern<SimpleExprLang> = lhs.parse()
                .map_err(|e| format!("Failed to parse LHS '{}': {:?}", lhs, e))?;
            let rhs_pattern: Pattern<SimpleExprLang> = rhs.parse()
                .map_err(|e| format!("Failed to parse RHS '{}': {:?}", rhs, e))?;
            
            rules.push(Rewrite::new(
                format!("{}-fwd", name),
                lhs_pattern.clone(),
                rhs_pattern.clone(),
            ).map_err(|e| format!("Failed to create rule {}: {}", name, e))?);
            
            rules.push(Rewrite::new(
                format!("{}-bwd", name),
                rhs_pattern,
                lhs_pattern,
            ).map_err(|e| format!("Failed to create rule {}: {}", name, e))?);
        } else if rule_part.contains("=>") {
            // Unidirectional rule
            let sides: Vec<&str> = rule_part.split("=>").collect();
            if sides.len() != 2 {
                return Err(format!("Invalid rule: {}", line));
            }
            let lhs = sides[0].trim();
            let rhs = sides[1].trim();
            
            let lhs_pattern: Pattern<SimpleExprLang> = lhs.parse()
                .map_err(|e| format!("Failed to parse LHS '{}': {:?}", lhs, e))?;
            let rhs_pattern: Pattern<SimpleExprLang> = rhs.parse()
                .map_err(|e| format!("Failed to parse RHS '{}': {:?}", rhs, e))?;
            
            rules.push(Rewrite::new(
                name,
                lhs_pattern,
                rhs_pattern,
            ).map_err(|e| format!("Failed to create rule {}: {}", name, e))?);
        } else {
            return Err(format!("Rule must contain '=>' or '<=>': {}", line));
        }
    }
    
    Ok(rules)
}

/// Run equality saturation on the given expression with the provided rules
///
/// # Arguments
/// * `expr_str` - The initial expression as a string (S-expression format)
/// * `rules_str` - The rewrite rules as a string (one rule per line)
/// * `config` - Configuration for the runner
///
/// # Returns
/// An EggResult containing the optimized expression or an error message
#[no_mangle]
pub extern "C" fn egg_run_saturation(
    expr_str: *const c_char,
    rules_str: *const c_char,
    config: EggConfig,
) -> EggResult {
    // Helper to create error result
    let make_error = |msg: &str| -> EggResult {
        EggResult {
            result_expr: ptr::null_mut(),
            error_msg: CString::new(msg).unwrap().into_raw(),
            iterations: 0,
            egraph_size: 0,
            saturated: false,
        }
    };
    
    // Parse input strings
    let expr_str = unsafe {
        if expr_str.is_null() {
            return make_error("Expression string is null");
        }
        match CStr::from_ptr(expr_str).to_str() {
            Ok(s) => s,
            Err(_) => return make_error("Invalid UTF-8 in expression string"),
        }
    };
    
    let rules_str = unsafe {
        if rules_str.is_null() {
            return make_error("Rules string is null");
        }
        match CStr::from_ptr(rules_str).to_str() {
            Ok(s) => s,
            Err(_) => return make_error("Invalid UTF-8 in rules string"),
        }
    };
    
    // Parse the expression
    let start_expr: RecExpr<SimpleExprLang> = match expr_str.parse() {
        Ok(e) => e,
        Err(e) => return make_error(&format!("Failed to parse expression: {:?}", e)),
    };
    
    // Parse the rules
    let rules = match parse_rules(rules_str) {
        Ok(r) => r,
        Err(e) => return make_error(&format!("Failed to parse rules: {}", e)),
    };
    
    // Create and configure the runner
    let mut runner = Runner::default()
        .with_expr(&start_expr)
        .with_iter_limit(config.iter_limit as usize)
        .with_node_limit(config.node_limit as usize);
    
    if config.time_limit_secs > 0 {
        runner = runner.with_time_limit(std::time::Duration::from_secs(config.time_limit_secs as u64));
    }
    
    // Run equality saturation
    let runner = runner.run(&rules);
    
    // Extract the best expression
    let extractor = Extractor::new(&runner.egraph, AstSize);
    let (_, best_expr) = extractor.find_best(runner.roots[0]);
    
    // Check if saturated
    let saturated = matches!(runner.stop_reason, Some(StopReason::Saturated));
    
    // Return result
    EggResult {
        result_expr: CString::new(best_expr.to_string()).unwrap().into_raw(),
        error_msg: ptr::null_mut(),
        iterations: runner.iterations.len() as u32,
        egraph_size: runner.egraph.number_of_classes() as u32,
        saturated,
    }
}

/// Free the memory allocated for an EggResult
#[no_mangle]
pub extern "C" fn egg_result_free(result: EggResult) {
    unsafe {
        if !result.result_expr.is_null() {
            drop(CString::from_raw(result.result_expr));
        }
        if !result.error_msg.is_null() {
            drop(CString::from_raw(result.error_msg));
        }
    }
}

/// Free a string allocated by the Rust library
#[no_mangle]
pub extern "C" fn egg_string_free(s: *mut c_char) {
    if !s.is_null() {
        unsafe {
            drop(CString::from_raw(s));
        }
    }
}

/// Get the version of the egg-bridge library
#[no_mangle]
pub extern "C" fn egg_version() -> *const c_char {
    static VERSION: &[u8] = b"0.1.0\0";
    VERSION.as_ptr() as *const c_char
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_simple_saturation() {
        let expr = "(+ 0 (* 1 a))";
        let rules = r#"
            add-0: (+ ?x 0) => ?x
            mul-1: (* ?x 1) => ?x
            commute-add: (+ ?a ?b) <=> (+ ?b ?a)
            commute-mul: (* ?a ?b) <=> (* ?b ?a)
        "#;
        
        let start: RecExpr<SimpleExprLang> = expr.parse().unwrap();
        let rules = parse_rules(rules).unwrap();
        
        let runner = Runner::default()
            .with_expr(&start)
            .run(&rules);
        
        let extractor = Extractor::new(&runner.egraph, AstSize);
        let (cost, best) = extractor.find_best(runner.roots[0]);
        
        println!("Best (cost {}): {}", cost, best);
        assert_eq!(best.to_string(), "a");
    }
}

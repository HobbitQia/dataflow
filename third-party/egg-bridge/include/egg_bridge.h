#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

/**
 * Configuration for the equality saturation runner
 */
typedef struct EggConfig {
  /**
   * Maximum number of iterations
   */
  uint32_t iter_limit;
  /**
   * Maximum number of nodes in the e-graph
   */
  uint32_t node_limit;
  /**
   * Time limit in seconds (0 = no limit)
   */
  uint32_t time_limit_secs;
} EggConfig;

/**
 * Result structure returned by equality saturation
 */
typedef struct EggResult {
  /**
   * The optimized expression as a string (owned, must be freed)
   */
  char *result_expr;
  /**
   * Error message if any (owned, must be freed), null if success
   */
  char *error_msg;
  /**
   * Number of iterations performed
   */
  uint32_t iterations;
  /**
   * Final e-graph size (number of e-classes)
   */
  uint32_t egraph_size;
  /**
   * Whether saturation was reached
   */
  bool saturated;
} EggResult;

/**
 * Create a default configuration
 */
struct EggConfig egg_config_default(void);

/**
 * Run equality saturation on the given expression with the provided rules
 *
 * # Arguments
 * * `expr_str` - The initial expression as a string (S-expression format)
 * * `rules_str` - The rewrite rules as a string (one rule per line)
 * * `config` - Configuration for the runner
 *
 * # Returns
 * An EggResult containing the optimized expression or an error message
 */
struct EggResult egg_run_saturation(const char *expr_str,
                                    const char *rules_str,
                                    struct EggConfig config);

/**
 * Free the memory allocated for an EggResult
 */
void egg_result_free(struct EggResult result);

/**
 * Free a string allocated by the Rust library
 */
void egg_string_free(char *s);

/**
 * Get the version of the egg-bridge library
 */
const char *egg_version(void);

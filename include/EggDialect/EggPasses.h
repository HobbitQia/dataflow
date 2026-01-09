// EggPasses.h - Egg dialect passes
#ifndef EGG_PASSES_H
#define EGG_PASSES_H

#include "mlir/Pass/Pass.h"
#include <memory>

namespace mlir {
namespace egg {

#define GEN_PASS_DECL
#include "EggDialect/EggPasses.h.inc"

// Create the ProcessNeura pass
std::unique_ptr<Pass> createProcessNeuraPass();

#define GEN_PASS_REGISTRATION
#include "EggDialect/EggPasses.h.inc"

} // namespace egg
} // namespace mlir

#endif // EGG_PASSES_H

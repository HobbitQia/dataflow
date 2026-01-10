# Add the Egg dialect library
add_mlir_dialect_library(MLIREgg
        Egg.cpp
        EggOps.cpp
        EggPasses.cpp
        EggSaturation.cpp
        NeuraToSExpr.cpp
        RewriteRules.cpp
        SExprToNeura.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/EggDialect

        DEPENDS
        MLIREggOpsIncGen
        MLIREggTransformsIncGen
        
        LINK_LIBS PUBLIC
        MLIRIR
        MLIRSupport
        MLIRPass
        MLIRTransforms
        MLIRNeura
        )

# Link egg-bridge if available
message(STATUS "EGG_BRIDGE_FOUND = ${EGG_BRIDGE_FOUND}")
message(STATUS "EGG_BRIDGE_INCLUDE_DIR = ${EGG_BRIDGE_INCLUDE_DIR}")
if(EGG_BRIDGE_FOUND)
    target_include_directories(MLIREgg PRIVATE ${EGG_BRIDGE_INCLUDE_DIR})
    target_link_libraries(MLIREgg PRIVATE egg_bridge)
    # Link additional libraries needed by Rust on Linux
    if(UNIX AND NOT APPLE)
        target_link_libraries(MLIREgg PRIVATE dl pthread)
    endif()
    target_compile_definitions(MLIREgg PRIVATE EGG_BRIDGE_AVAILABLE)
    # Also add to the object library
    target_compile_definitions(obj.MLIREgg PRIVATE EGG_BRIDGE_AVAILABLE)
    message(STATUS "EGG_BRIDGE_AVAILABLE defined for MLIREgg")
endif()

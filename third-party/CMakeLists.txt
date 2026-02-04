# CMakeLists.txt for third-party dependencies

# Build egg-bridge Rust library (now located under egg/bridge)
find_program(CARGO cargo)
if(CARGO)
    message(STATUS "Found cargo: ${CARGO}")
    
    set(EGG_DIR ${CMAKE_CURRENT_SOURCE_DIR}/egg)
    set(EGG_BRIDGE_DIR ${EGG_DIR}/bridge)
    
    # Use a local directory for Rust build artifacts to avoid NFS issues
    # Default to /tmp/egg_build if not on local disk
    if(DEFINED ENV{CARGO_TARGET_DIR})
        set(CARGO_TARGET_DIR $ENV{CARGO_TARGET_DIR})
    else()
        set(CARGO_TARGET_DIR ${CMAKE_CURRENT_BINARY_DIR}/cargo-target)
    endif()
    set(EGG_BRIDGE_LIB_DIR ${CARGO_TARGET_DIR}/release)
    
    # Determine library name based on platform
    if(WIN32)
        set(EGG_BRIDGE_LIB ${EGG_BRIDGE_LIB_DIR}/egg_bridge.lib)
    elseif(APPLE)
        set(EGG_BRIDGE_LIB ${EGG_BRIDGE_LIB_DIR}/libegg_bridge.a)
    else()
        set(EGG_BRIDGE_LIB ${EGG_BRIDGE_LIB_DIR}/libegg_bridge.a)
    endif()
    
    # Custom command to build the Rust library
    add_custom_command(
        OUTPUT ${EGG_BRIDGE_LIB}
        COMMAND ${CMAKE_COMMAND} -E env CARGO_TARGET_DIR=${CARGO_TARGET_DIR} ${CARGO} build --release -p egg-bridge
        WORKING_DIRECTORY ${EGG_DIR}
        COMMENT "Building egg-bridge Rust library"
        VERBATIM
    )
    
    # Custom target for the Rust library
    add_custom_target(egg_bridge_build DEPENDS ${EGG_BRIDGE_LIB})
    
    # Create imported library target
    add_library(egg_bridge STATIC IMPORTED GLOBAL)
    set_target_properties(egg_bridge PROPERTIES
        IMPORTED_LOCATION ${EGG_BRIDGE_LIB}
    )
    add_dependencies(egg_bridge egg_bridge_build)
    
    # Export include directory - use CACHE to make it available globally
    set(EGG_BRIDGE_INCLUDE_DIR ${EGG_BRIDGE_DIR}/include CACHE PATH "egg-bridge include directory" FORCE)
    set(EGG_BRIDGE_FOUND TRUE CACHE BOOL "egg-bridge found" FORCE)
    message(STATUS "egg-bridge found: ${EGG_BRIDGE_LIB}")
    message(STATUS "Cargo target directory: ${CARGO_TARGET_DIR}")
    
else()
    message(WARNING "cargo not found, egg-bridge will not be built")
    set(EGG_BRIDGE_FOUND FALSE CACHE BOOL "egg-bridge found" FORCE)
endif()

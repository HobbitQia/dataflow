# CMakeLists.txt for third-party dependencies

# Build egg-bridge Rust library
find_program(CARGO cargo)
if(CARGO)
    message(STATUS "Found cargo: ${CARGO}")
    
    set(EGG_BRIDGE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/egg-bridge)
    set(EGG_BRIDGE_LIB_DIR ${EGG_BRIDGE_DIR}/target/release)
    
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
        COMMAND ${CARGO} build --release
        WORKING_DIRECTORY ${EGG_BRIDGE_DIR}
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
    
    # Export include directory
    set(EGG_BRIDGE_INCLUDE_DIR ${EGG_BRIDGE_DIR}/include PARENT_SCOPE)
    set(EGG_BRIDGE_FOUND TRUE PARENT_SCOPE)
    
else()
    message(WARNING "cargo not found, egg-bridge will not be built")
    set(EGG_BRIDGE_FOUND FALSE PARENT_SCOPE)
endif()

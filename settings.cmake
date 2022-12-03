cmake_minimum_required(VERSION 3.7.2)

set(KernelSupportPCID OFF)

file(GLOB project_modules ${CMAKE_CURRENT_LIST_DIR}/projects/*)
list(
    APPEND
        CMAKE_MODULE_PATH
        ${CMAKE_CURRENT_LIST_DIR}/kernel/
        ${CMAKE_CURRENT_LIST_DIR}/tools/seL4/cmake-tool/helpers/
        ${project_modules}
)

set(SEL4_CONFIG_DEFAULT_ADVANCED ON)

include(application_settings)

set(RELEASE OFF CACHE BOOL "Performance optimized build")
set(VERIFICATION OFF CACHE BOOL "Only verification friendly kernel features")
set(SIMULATION OFF CACHE BOOL "Generate simulation script")

correct_platform_strings()

find_package(seL4 REQUIRED)
sel4_configure_platform_settings()

ApplyCommonReleaseVerificationSettings(${RELEASE} ${VERIFICATION})

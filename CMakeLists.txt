cmake_minimum_required(VERSION 3.7.2)

include(settings.cmake)

project(C CXX ASM)

find_package(seL4 REQUIRED)

set(KernelRootCNodeSizeBits 13 CACHE INTERNAL "")
set(KernelDomainSchedule "${CMAKE_CURRENT_LIST_DIR}/domain_schedule.c" CACHE INTERNAL "")
sel4_import_kernel()

add_subdirectory(apps/hello)

if(SIMULATION)
    include(simulation)
    ApplyCommonSimulationSettings(${KernelSel4Arch})
    SetSimulationScriptProperty(MEM_SIZE "3G")
    GenerateSimulateScript()
endif()


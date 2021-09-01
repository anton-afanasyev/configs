set(CMAKE_BUILD_TYPE RELEASE CACHE STRING "")
set(LLVM_ENABLE_PROJECTS
  clang CACHE STRING "")
set(CLANG_BUILD_EXAMPLES OFF CACHE BOOL "")
set(LLVM_BUILD_TESTS ON CACHE BOOL "")
set(LLVM_ENABLE_ASSERTIONS ON CACHE BOOL "")
set(LLVM_OPTIMIZED_TABLEGEN ON CACHE BOOL "")
set(LLVM_CCACHE_BUILD ON CACHE BOOL "")
set(LLVM_PARALLEL_COMPILE_JOBS 7 CACHE STRING "")
set(LLVM_PARALLEL_LINK_JOBS 2 CACHE STRING "")
set(LLVM_ENABLE_LLD ON CACHE BOOL "")
set(LLVM_TARGETS_TO_BUILD
  X86
  AArch64 CACHE STRING "")
set(CLANG_ENABLE_STATIC_ANALYZER OFF CACHE BOOL "")
set(CLANG_ENABLE_ARCMT OFF CACHE BOOL "")

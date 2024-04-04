CLAPACK port for QNX 7.1 and 8.0
---

To compile this port, use the following steps:

1. Source your QNX SDP environment
2. Make sure that host-side toolchain (`gcc` and its corresponding runtime on Linux) is installed.
   - This project will have to compile some host-side binaries first during the build process
3. In the root of this project, run `make -C qnx/build install`
   - Optionally, set `INSTALL_ROOT_nto` to a staging area, and set `USE_INSTALL_ROOT=true`
   - This ports defaults to assuming being installed under `/usr/local` on target. To change that, set the `PREFIX` variable.
4. To run installed binaries and/or use the `.so` libraries, remember that `<prefix>/lib` must be included in the library search path.

Testing
---

The default build process above produces installed test binaries, inputs and their corresponding test scripts under `<prefix>/bin/clapack_tests`.
These test scripts mirror what is done with `CTest` from the upstream repository.

Tests are intended to be executed on target. All `.sh` files under `<prefix>/bin/clapack_tests` correspond to a single test under `CTest` when executed
with CMake.

Note that these tests are consisted of even smaller test cases, and in fact some tests contain tens of thousands of them. Not all of them are expected
to pass on all targets -- this is expected behavior from floating point arithmetic. Instead, each of the test binaries will fail only if a certain
threshold of failures are crossed. When this happens, the test process *should* exit with a non-zero exit code (see `runtest.cmake`).

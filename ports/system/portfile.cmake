vcpkg_from_git(
        OUT_SOURCE_PATH SOURCE_PATH
        URL https://github.com/chenty0704/System
        REF 7ec2bc577f1b1821b577aac2a1b2e951c6630b17)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME "System")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

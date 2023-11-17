set(VCPKG_USE_HEAD_VERSION ON)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO chenty0704/System
        HEAD_REF main)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
        PACKAGE_NAME "System")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

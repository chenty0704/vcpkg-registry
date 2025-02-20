set(VCPKG_USE_HEAD_VERSION ON)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO "kokkos/mdspan"
        HEAD_REF "stable")

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/mdspan")

file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug"
        "${CURRENT_PACKAGES_DIR}/lib")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

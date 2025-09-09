set(VCPKG_USE_HEAD_VERSION ON)

vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO "WolframResearch/LibraryLinkUtilities"
        HEAD_REF "master")

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(
        PACKAGE_NAME "LLU"
        CONFIG_PATH "cmake/LLU")

file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/LibraryLinkUtilities.wl"
        "${CURRENT_PACKAGES_DIR}/share/LLU/LibraryLinkUtilities.wl")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

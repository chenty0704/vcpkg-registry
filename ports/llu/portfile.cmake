vcpkg_from_git(
        OUT_SOURCE_PATH SOURCE_PATH
        URL https://github.com/WolframResearch/LibraryLinkUtilities
        REF 503f0bdb72450d6a1217bb5ad4c1c1e6722bb7ca)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}")

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

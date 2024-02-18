vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO "WolframResearch/LibraryLinkUtilities"
        REF "503f0bdb72450d6a1217bb5ad4c1c1e6722bb7ca"
        SHA512 "5e404fac1f459603e17355cd5f30064fbbb3b1004a6ca7edadd75e66cf2dc09a722ab2843e5cdfd9b74759ba411661e120e87958630bc54d953ac51226506e6c")

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

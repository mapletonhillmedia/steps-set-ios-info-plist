#!/bin/bash

#test
# exit if a command fails
set -e

#
# Required parameters
if [ -z "${info_plist_file}" ] ; then
  echo " [!] Missing required input: info_plist_file"
  exit 1
fi
if [ ! -f "${info_plist_file}" ] ; then
  echo " [!] File Info.plist doesn't exist at specified path: ${info_plist_file}"
  exit 1
fi

if [ -z "${bundle_identifier}" ] ; then
  echo " No Bundle Identifier (bundle_identifier) specified - existing value retained."
fi

if [ -z "${bundle_version}" ] ; then
  echo " No Bundle Version (bundle_version) specified - existing value retained."
fi

if [ -z "${bundle_version_short}" ] ; then
  echo " No Bundle Short Version String (bundle_version_short) specified - existing value retained."
fi

if [ -z "${bundle_name}" ] ; then
  echo " No Bundle Name (short) (bundle_name) specified - existing value retained."
fi

if [ -z "${bundle_display_name}" ] ; then
  echo " No Bundle Display Name (bundle_display_name) specified - existing value retained."
fi

if [ -z "${app_icon_asset_catalog}" ] ; then
  echo " No App Icon Asset Catalog specified - existing value retained."
fi

if [ -z "${app_launch_images_asset_catalog}" ] ; then
  echo " No Launch Images Asset Catalog specified - existing value retained."
fi

if [ -z "${app_launch_screen}" ] ; then
  echo " No Launch Screen specified - existing value retained."
fi

# ---------------------
# --- Configs:

echo " (i) Provided Info.plist file path              : ${info_plist_file}"
echo " (i) Provided Bundle Identifier                 : ${bundle_identifier}"
echo " (i) Provided Bundle Version                    : ${bundle_version}"
echo " (i) Provided Bundle Short Version String       : ${bundle_version_short}"
echo " (i) Provided Bundle Name (short)               : ${bundle_name}"
echo " (i) Provided Bundle Display Name               : ${bundle_display_name}"
echo " (i) Provided App Launch Screen                 : ${app_launch_screen}"
echo -n " (i) Provided App Icon Asset Catalog             : "; if [ -z "${app_icon_asset_catalog}" ]; then echo "Not specified"; else echo ${app_icon_asset_catalog}; fi
echo -n " (i) Provided App Launch Images Asset Catalog             : "; if [ -z "${app_launch_images_asset_catalog}" ]; then echo "Not specified"; else echo ${app_launch_images_asset_catalog}; fi
# ---------------------
# --- Main:

# verbose / debug print commands
#set -v

function setPlistValue() {
  # ---- Set Info.plist value:
  echo ""
  echo ""
  echo " (i) Replacing $1..."

  ORIGINAL_VALUE="$(/usr/libexec/PlistBuddy -c "Print :$2" "$3")"
  echo " (i) Original Value: $ORIGINAL_VALUE"

  /usr/libexec/PlistBuddy -c "Set :$2 $4" "$3"

  REPLACED_VALUE="$(/usr/libexec/PlistBuddy -c "Print :$2" "$3")"
  echo " (i) Replaced Value: $REPLACED_VALUE"

  # ==> Value patched in Info.plist file for iOS project
}

if [ -n "${bundle_identifier}" ] ; then
  setPlistValue "Bundle Identifier" "CFBundleIdentifier" "${info_plist_file}" "${bundle_identifier}"
else
  echo " (i) Not setting Bundle Identifier"
fi

if [ -n "${bundle_version}" ] ; then
  setPlistValue "Bundle Version" "CFBundleVersion" "${info_plist_file}" "${bundle_version}"
fi

if [ -n "${bundle_version_short}" ] ; then
  setPlistValue "Bundle Short Version" "CFBundleShortVersionString" "${info_plist_file}" "${bundle_version_short}"
fi

if [ -n "${bundle_name}" ] ; then
  setPlistValue "Bundle Name (short)" "CFBundleName" "${info_plist_file}" "${bundle_name}"
fi

if [ -n "${bundle_display_name}" ] ; then
  setPlistValue "Bundle Display Name" "CFBundleDisplayName" "${info_plist_file}" "${bundle_display_name}"
fi

if [ -n "${app_icon_asset_catalog}" ] ; then
  setPlistValue "App Icon Asset Catalog" "XSAppIconAssets" "${info_plist_file}" "${app_icon_asset_catalog}"
fi

if [ -n "${app_launch_images_asset_catalog}" ] ; then
  setPlistValue "App Launch Images Catalog" "XSLaunchImageAssets" "${info_plist_file}" "${app_launch_images_asset_catalog}"
fi

if [ -n "${app_launch_screen}" ] ; then
  setPlistValue "App Launch Images Catalog" "UILaunchStoryboardName" "${info_plist_file}" "${app_launch_screen}"
fi

#!/bin/bash

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
  echo " [!] No Bundle Identifier (bundle_identifier) specified!"
  exit 1
fi

# ---------------------
# --- Configs:

echo " (i) Provided Info.plist file path: ${info_plist_file}"
echo " (i) Provided Bundle Identifier: ${bundle_identifier}"

# ---------------------
# --- Main:

# verbose / debug print commands
set -v

# ---- Set Info.plist Bundle Identifier:
echo ""
echo ""
echo " (i) Replacing Bundle Identifier..."

ORIGINAL_BUNDLE_IDENTIFIER="$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "${info_plist_file}")"
echo " (i) Original Bundle Identifier: $ORIGINAL_BUNDLE_IDENTIFIER"

/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier ${bundle_identifier}" "${info_plist_file}"

REPLACED_BUNDLE_IDENTIFIER="$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "${info_plist_file}")"
echo " (i) Replaced Bundle Identifier: $REPLACED_BUNDLE_IDENTIFIER"

# ==> Bundler Identifier patched in Info.plist file for iOS project

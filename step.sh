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

#INFO_PLIST_FILE=`grep infoPlistFile ${manifest_file} | sed 's/.*versionCode="//;s/".*//'`
#VERSIONNAME=`grep versionName ${manifest_file} | sed 's/.*versionName\s*=\s*\"\([^\"]*\)\".*/\1/g'`

#if [ -z "${VERSIONCODE}" ] ; then
#  echo " [!] Could not find current Version Code!"
#  exit 1
#fi

#echo "Version code detected: ${VERSIONCODE}"
#if [ ! -z "${version_code_offset}" ] ; then
#  echo " (i) Version code offset: ${version_code_offset}"

#  CONFIG_new_version_code=$((${VERSIONCODE} + ${version_code_offset}))

#  echo " (i) Version code: ${CONFIG_new_version_code}"
#else
#  echo " (i) Version code: ${CONFIG_new_version_code}"
#fi


#if [ -z "${VERSIONNAME}" ] ; then
#  echo " [!] Could not find current Version Name!"
#  exit 1
#fi
#echo "Version name detected: ${VERSIONNAME}"


# ---------------------
# --- Main:

# verbose / debug print commands

set -v
# ---- Set Build Version Code:

#sed -i.bak "s/android:versionCode="\"${VERSIONCODE}\""/android:versionCode="\"${CONFIG_new_version_code}\""/" ${manifest_file}

# ---- Set Build Version Code if it was specified:
#if ! [ -z "${version_name}" ] ; then
#  sed -i.bak "s/android:versionName="\"${VERSIONNAME}\""/android:versionName="\"${version_name}\""/" ${manifest_file}
#fi


# ---- Remove backup:

rm -f ${info_plist_file}.bak

# ==> Build Version changed

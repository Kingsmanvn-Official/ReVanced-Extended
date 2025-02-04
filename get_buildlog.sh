#!/usr/bin/env bash

source semver

TEMP_DIR="temp"
BUILD_DIR="build"

WGET_HEADER="User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"

get_prebuilts() {
	echo "Getting prebuilts"
	RV_CLI_URL=$(req https://api.github.com/repos/inotia00/revanced-cli/releases/latest - | tr -d ' ' | sed -n 's/.*"browser_download_url":"\(.*jar\)".*/\1/p')
	RV_CLI_JAR="${TEMP_DIR}/${RV_CLI_URL##*/}"
	log "inotia00 cli: ${RV_CLI_JAR#"$TEMP_DIR/"}"

	RV_INTEGRATIONS_URL=$(req https://api.github.com/repos/inotia00/revanced-integrations/releases/latest - | tr -d ' ' | sed -n 's/.*"browser_download_url":"\(.*apk\)".*/\1/p')
	RV_INTEGRATIONS_APK=${RV_INTEGRATIONS_URL##*/}
	RV_INTEGRATIONS_APK="${TEMP_DIR}/${RV_INTEGRATIONS_APK%.apk}-$(cut -d/ -f8 <<<"$RV_INTEGRATIONS_URL").apk"
	log "\ninotia00 integrations: ${RV_INTEGRATIONS_APK#"$TEMP_DIR/"}"

	RV_PATCHES_URL=$(req https://api.github.com/repos/inotia00/revanced-patches/releases/latest - | tr -d ' ' | sed -n 's/.*"browser_download_url":"\(.*jar\)".*/\1/p')
	RV_PATCHES_JAR="${TEMP_DIR}/${RV_PATCHES_URL##*/}"
	local rv_patches_filename=${RV_PATCHES_JAR#"$TEMP_DIR/"}
	local rv_patches_ver=${rv_patches_filename##*'-'}
	log "\ninotia00 patches: $rv_patches_filename"
	log "[inotia00 patches changelog](https://github.com/inotia00/revanced-patches/releases/tag/v${rv_patches_ver%%'.jar'*})"
}

abort() { echo "abort: $1" && exit 1; }

req() { wget -nv -O "$2" --header="$WGET_HEADER" "$1"; }
log() { echo -e "$1  " >>build.log; }
get_apk_vers() { req "https://www.apkmirror.com/uploads/?appcategory=${1}" - | sed -n 's;.*Version:</span><span class="infoSlide-value">\(.*\) </span>.*;\1;p'; }


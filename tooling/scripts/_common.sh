#!/bin/bash

# Common helpers for build/repair scripts

set -euo pipefail

detect_module() {
	local project_root="$1"
	local settings_file="${project_root}/settings.gradle.kts"
	local module_name=""

	if [[ -f "${settings_file}" ]]; then
		# Extract first include(":ModuleName") and strip leading colon
		module_name=$(awk -F '"' '/include\(/ { for(i=2;i<=NF;i+=2){ if($i ~ /^:.+/){ print substr($i,2); exit } } }' "${settings_file}" || true)
	fi

	if [[ -z "${module_name}" ]]; then
		# Fallback heuristics
		if [[ -d "${project_root}/CleverFerret" ]]; then
			module_name="CleverFerret"
		elif [[ -d "${project_root}/app" ]]; then
			module_name="app"
		else
			module_name="app"
		fi
	fi

	echo "${module_name}"
}

has_android_sdk() {
	local project_root="$1"
	# Check env
	if [[ -n "${ANDROID_HOME:-}" ]] && [[ -d "${ANDROID_HOME}" ]]; then
		return 0
	fi
	# Check local.properties
	local lp="${project_root}/local.properties"
	if [[ -f "${lp}" ]]; then
		local sdk_dir
		sdk_dir=$(grep -E '^sdk\.dir=' "${lp}" | sed 's#sdk.dir=##' | tr -d '\r' || true)
		if [[ -n "${sdk_dir}" ]] && [[ -d "${sdk_dir}" ]]; then
			return 0
		fi
	fi
	return 1
}


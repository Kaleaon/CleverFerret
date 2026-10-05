#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

DETEKT_CACHE_DIR="${HOME}/.cache/detekt"
DETEKT_JAR="${DETEKT_CACHE_DIR}/detekt-cli.jar"
DETEKT_VERSION="1.23.7"
DETEKT_URL="https://github.com/detekt/detekt/releases/download/v${DETEKT_VERSION}/detekt-cli-${DETEKT_VERSION}-all.jar"

ensure_detekt_jar() {
  if [[ ! -f "$DETEKT_JAR" ]]; then
    mkdir -p "$DETEKT_CACHE_DIR"
    if [[ -f "/tmp/detekt-bin/detekt-cli.jar" ]]; then
      cp "/tmp/detekt-bin/detekt-cli.jar" "$DETEKT_JAR"
    elif command -v curl >/dev/null 2>&1; then
      curl -sL --connect-timeout 5 --max-time 20 "$DETEKT_URL" -o "$DETEKT_JAR" || true
    elif command -v wget >/dev/null 2>&1; then
      wget -q -T 20 "$DETEKT_URL" -O "$DETEKT_JAR" || true
    fi
  fi
}

kotlin_files=()

if [[ $# -gt 0 ]]; then
  for arg in "$@"; do
    abs_path="$arg"
    if [[ "$arg" != /* ]]; then
      abs_path="${REPO_ROOT}/${arg}"
    fi
    if [[ -f "$abs_path" ]] && [[ "$abs_path" == *.kt || "$abs_path" == *.kts ]]; then
      kotlin_files+=("$abs_path")
    fi
  done
  if [[ ${#kotlin_files[@]} -eq 0 ]]; then
    exit 0
  fi
else
  if [[ -d "${REPO_ROOT}/CleverFerret/src/main" ]]; then
    kotlin_files+=("${REPO_ROOT}/CleverFerret/src/main")
  fi
fi

if ! command -v java >/dev/null 2>&1; then
  echo "Warning: Java is not installed on PATH. Skipping local Kotlin Detekt check."
  exit 0
fi

ensure_detekt_jar

if [[ -f "$DETEKT_JAR" ]]; then
  CONFIG_FILE="${REPO_ROOT}/config/detekt/detekt.yml"
  inputs=$(IFS=,; echo "${kotlin_files[*]}")

  exec java -jar "$DETEKT_JAR" --config "$CONFIG_FILE" --input "$inputs"
else
  echo "Warning: Unable to fetch Detekt CLI jar. Skipping local Detekt check."
  exit 0
fi

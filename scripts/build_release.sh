#!/bin/bash
# CleverFerret local build/release helper.
#
# ⚠️  DEPRECATED: canonical release automation now lives in
# .github/workflows/main.yml (GitHub Actions CI/CD pipeline).
# Use this script only for local/manual release workflows.

set -Eeuo pipefail

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
APP_DIR="$REPO_ROOT/CleverFerret"
GRADLEW="$REPO_ROOT/gradlew"
RELEASE_DIR="${RELEASE_DIR:-$REPO_ROOT/release}"
APK_DIR="$APP_DIR/build/outputs/apk/debug"
APK_FILE="$APK_DIR/CleverFerret-debug.apk"
CANONICAL_RELEASE_PATH=".github/workflows/main.yml"

log_info() { echo -e "${BLUE}$*${NC}"; }
log_ok() { echo -e "${GREEN}✓${NC} $*"; }
log_warn() { echo -e "${YELLOW}⚠${NC} $*"; }
log_err() { echo -e "${RED}✗${NC} $*"; }

usage() {
  cat <<USAGE
Usage: $(basename "$0") <command>

Commands:
  prepare-release   Validate environment, resolve version from Gradle, and prepare release metadata.
  tag-release       Create annotated git tag for current Gradle version.
  build-apk         Build debug APK and copy it into release directory.
  publish           Push current branch + version tag to origin.
  all               Run prepare-release, tag-release, build-apk, publish.

Environment:
  RELEASE_DIR       Output directory for release artifacts (default: $RELEASE_DIR)

Notes:
  - This script is deprecated for primary release automation.
  - Canonical pipeline: $CANONICAL_RELEASE_PATH
USAGE
}

warn_deprecated() {
  echo -e "${YELLOW}⚠ Deprecated workflow:${NC} local build_release.sh is superseded by CI."
  echo "   Canonical release automation: $CANONICAL_RELEASE_PATH"
  echo "   Preferred flow: push a v* tag and let GitHub Actions build/publish artifacts."
  echo ""
}

require_cmd() {
  local cmd="$1"
  local message="$2"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    log_err "$message"
    exit 1
  fi
}

require_file() {
  local file="$1"
  local message="$2"
  if [[ ! -f "$file" ]]; then
    log_err "$message"
    exit 1
  fi
}

run_gradle_quiet() {
  local task="$1"
  "$GRADLEW" -q ":CleverFerret:${task}" 2>/dev/null | tail -n1
}

resolve_version_from_file() {
  local build_file="$APP_DIR/build.gradle.kts"
  require_file "$build_file" "Cannot find $build_file for fallback version parsing."

  VERSION_NAME="$(sed -nE 's/.*versionName\s*=\s*"([^"]+)".*/\1/p' "$build_file" | head -n1)"
  VERSION_CODE="$(sed -nE 's/.*versionCode\s*=\s*([0-9]+).*/\1/p' "$build_file" | head -n1)"

  VERSION_NAME="${VERSION_NAME:-1.0.0}"
  VERSION_CODE="${VERSION_CODE:-1}"
}


resolve_version_info() {
  require_file "$GRADLEW" "Gradle wrapper not found at $GRADLEW. Run from repository root or restore gradlew."

  VERSION_NAME="$(run_gradle_quiet printVersionName || true)"
  VERSION_CODE="$(run_gradle_quiet printVersionCode || true)"

  if [[ -z "$VERSION_NAME" || -z "$VERSION_CODE" ]]; then
    log_warn "Could not read version from Gradle tasks (often caused by local Android SDK/JDK config)."
    echo "  Action: fix local build env, or continue with fallback parsing from CleverFerret/build.gradle.kts."
    resolve_version_from_file
  fi

  if [[ -z "$VERSION_NAME" || -z "$VERSION_CODE" ]]; then
    log_err "Failed to resolve version via Gradle tasks and fallback parser."
    log_err "Try: ./gradlew :CleverFerret:printVersionInfo"
    exit 1
  fi
}

check_common_env() {
  require_cmd git "git is required. Install git and retry."
  require_cmd bash "bash is required to run this script."
  require_file "$GRADLEW" "Missing gradlew at $GRADLEW."

  if [[ ! -d "$APP_DIR" ]]; then
    log_err "Android app module directory not found: $APP_DIR"
    exit 1
  fi
}

check_java_android_env() {
  require_cmd java "Java is required to build APKs. Install JDK 17+ and ensure 'java' is in PATH."

  local sdk_root="${ANDROID_SDK_ROOT:-${ANDROID_HOME:-}}"
  if [[ -z "$sdk_root" ]]; then
    log_err "ANDROID_SDK_ROOT (or ANDROID_HOME) is not set."
    echo "  Action: export ANDROID_SDK_ROOT=/path/to/Android/Sdk"
    exit 1
  fi

  if [[ ! -d "$sdk_root" ]]; then
    log_err "Android SDK directory does not exist: $sdk_root"
    echo "  Action: install Android SDK and correct ANDROID_SDK_ROOT/ANDROID_HOME."
    exit 1
  fi

  if [[ ! -x "$sdk_root/platform-tools/adb" ]]; then
    log_warn "Android SDK platform-tools not detected at $sdk_root/platform-tools."
    echo "  Action: install via sdkmanager \"platform-tools\"."
  fi
}

check_publish_credentials() {
  if ! git remote get-url origin >/dev/null 2>&1; then
    log_err "No git remote named 'origin' found."
    echo "  Action: configure remote, e.g. git remote add origin <url>"
    exit 1
  fi

  if command -v gh >/dev/null 2>&1; then
    if ! gh auth status >/dev/null 2>&1 && [[ -z "${GH_TOKEN:-}" ]]; then
      log_warn "GitHub CLI is installed but not authenticated (gh auth status failed)."
      echo "  Action: run 'gh auth login' or set GH_TOKEN for non-interactive use."
    fi
  else
    log_warn "GitHub CLI (gh) is not installed."
    echo "  Action: install gh if you plan to create GitHub releases from CLI."
  fi
}

prepare_release() {
  check_common_env
  resolve_version_info
  mkdir -p "$RELEASE_DIR"

  cat > "$RELEASE_DIR/RELEASE_INFO.txt" <<INFO
CleverFerret Release Metadata
=============================
Generated: $(date '+%Y-%m-%d %H:%M:%S %z')
Version Name: ${VERSION_NAME}
Version Code: ${VERSION_CODE}
Git Commit: $(git -C "$REPO_ROOT" rev-parse HEAD)
Canonical CI workflow: ${CANONICAL_RELEASE_PATH}
INFO

  log_ok "Prepared release metadata at $RELEASE_DIR/RELEASE_INFO.txt"
  log_ok "Resolved version: ${VERSION_NAME} (${VERSION_CODE})"
}

tag_release() {
  check_common_env
  resolve_version_info

  local tag="v${VERSION_NAME}"
  if git -C "$REPO_ROOT" rev-parse "$tag" >/dev/null 2>&1; then
    log_warn "Tag ${tag} already exists."
    echo "  Action: delete and recreate manually if needed: git tag -d ${tag}"
    return 0
  fi

  git -C "$REPO_ROOT" tag -a "$tag" -m "CleverFerret ${tag}"
  log_ok "Created git tag ${tag}"
}

build_apk() {
  check_common_env
  check_java_android_env
  resolve_version_info

  log_info "Building debug APK for version ${VERSION_NAME}..."
  "$GRADLEW" :CleverFerret:assembleDebug --stacktrace

  if [[ ! -f "$APK_FILE" ]]; then
    log_err "Expected APK not found: $APK_FILE"
    exit 1
  fi

  mkdir -p "$RELEASE_DIR"
  local out_apk="$RELEASE_DIR/CleverFerret-v${VERSION_NAME}-debug.apk"
  cp "$APK_FILE" "$out_apk"
  log_ok "APK copied to: $out_apk"
}

publish() {
  check_common_env
  check_publish_credentials
  resolve_version_info

  local branch
  local tag="v${VERSION_NAME}"
  branch="$(git -C "$REPO_ROOT" rev-parse --abbrev-ref HEAD)"

  log_info "Pushing branch '${branch}'..."
  git -C "$REPO_ROOT" push origin "$branch"

  if git -C "$REPO_ROOT" rev-parse "$tag" >/dev/null 2>&1; then
    log_info "Pushing tag '${tag}'..."
    git -C "$REPO_ROOT" push origin "$tag"
    log_ok "Published branch and tag ${tag}"
  else
    log_warn "Tag ${tag} does not exist. Run: $(basename "$0") tag-release"
  fi
}

main() {
  local cmd="${1:-all}"

  warn_deprecated

  case "$cmd" in
    prepare-release)
      prepare_release
      ;;
    tag-release)
      tag_release
      ;;
    build-apk)
      build_apk
      ;;
    publish)
      publish
      ;;
    all)
      prepare_release
      tag_release
      build_apk
      publish
      ;;
    -h|--help|help)
      usage
      ;;
    *)
      log_err "Unknown command: $cmd"
      usage
      exit 1
      ;;
  esac
}

main "$@"

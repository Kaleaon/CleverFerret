#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "=== Setting up CleverFerret pre-commit hooks ==="

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: Python 3 is required but not installed." >&2
  exit 1
fi
echo "✓ Python 3 is available ($(python3 --version))"

if ! command -v pre-commit >/dev/null 2>&1; then
  echo "pre-commit binary not found on PATH. Attempting pip installation..."
  python3 -m pip install pre-commit
fi

if ! command -v pre-commit >/dev/null 2>&1 && ! python3 -m pre_commit --version >/dev/null 2>&1; then
  echo "Error: pre-commit tool installation failed or is not accessible." >&2
  exit 1
fi
echo "✓ pre-commit tool is available"

DETEKT_CACHE_DIR="${HOME}/.cache/detekt"
DETEKT_JAR="${DETEKT_CACHE_DIR}/detekt-cli.jar"
if [[ ! -f "$DETEKT_JAR" ]]; then
  mkdir -p "$DETEKT_CACHE_DIR"
  if [[ -f "/tmp/detekt-bin/detekt-cli.jar" ]]; then
    cp "/tmp/detekt-bin/detekt-cli.jar" "$DETEKT_JAR"
  else
    echo "Downloading Detekt CLI jar..."
    curl -sL --connect-timeout 5 --max-time 20 "https://github.com/detekt/detekt/releases/download/v1.23.7/detekt-cli-1.23.7-all.jar" -o "$DETEKT_JAR" || true
  fi
fi
if [[ -f "$DETEKT_JAR" ]]; then
  echo "✓ Detekt CLI runner cached at $DETEKT_JAR"
fi

if git config --get core.hooksPath >/dev/null 2>&1; then
  git config --unset-all core.hooksPath || true
  git config --global --unset-all core.hooksPath || true
fi

echo "Installing pre-commit hooks into .git/hooks/pre-commit..."
cd "$REPO_ROOT"
pre-commit install

HOOK_FILE="${REPO_ROOT}/.git/hooks/pre-commit"
if [[ -f "$HOOK_FILE" ]]; then
  chmod +x "$HOOK_FILE"
  echo "✓ Git pre-commit hook installed successfully at .git/hooks/pre-commit"
else
  echo "Error: Pre-commit hook installation failed." >&2
  exit 1
fi

echo "=== Pre-commit setup complete! ==="

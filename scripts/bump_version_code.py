#!/usr/bin/env python3
import argparse
import re
from pathlib import Path


VERSION_CODE_RE = re.compile(r"(^\s*versionCode\s*=\s*)(\d+)(\s*$)", re.MULTILINE)


def read_version_code(text: str) -> int:
    m = VERSION_CODE_RE.search(text)
    if not m:
        raise SystemExit("Could not find `versionCode = <int>` in file.")
    return int(m.group(2))


def write_version_code(text: str, new_code: int) -> str:
    def repl(m: re.Match) -> str:
        return f"{m.group(1)}{new_code}{m.group(3)}"

    new_text, count = VERSION_CODE_RE.subn(repl, text, count=1)
    if count != 1:
        raise SystemExit("Expected to replace exactly one versionCode occurrence.")
    return new_text


def main() -> None:
    parser = argparse.ArgumentParser(description="Bump Android versionCode in CleverFerret/build.gradle.kts")
    parser.add_argument("--file", default="CleverFerret/build.gradle.kts", help="Path to module build.gradle.kts")
    parser.add_argument("--set", type=int, default=None, help="Set versionCode to this value")
    parser.add_argument("--bump", type=int, default=None, help="Increment versionCode by this amount (e.g. 1)")
    args = parser.parse_args()

    path = Path(args.file)
    if not path.exists():
        raise SystemExit(f"File not found: {path}")

    content = path.read_text(encoding="utf-8")
    current = read_version_code(content)

    if args.set is None and args.bump is None:
        print(current)
        return

    if args.set is not None and args.bump is not None:
        raise SystemExit("Use only one of --set or --bump.")

    new_code = args.set if args.set is not None else current + int(args.bump)
    if new_code <= 0:
        raise SystemExit("versionCode must be > 0")

    if new_code == current:
        print(f"versionCode unchanged ({current})")
        return

    path.write_text(write_version_code(content, new_code), encoding="utf-8")
    print(f"versionCode: {current} -> {new_code}")


if __name__ == "__main__":
    main()


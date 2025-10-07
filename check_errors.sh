#!/bin/bash
echo "=== Attempting Quick Compilation Check ==="
timeout 60 ./gradlew :CleverFerret:compileDebugKotlin --no-daemon 2>&1 | grep -E "error:|^e: " | head -50

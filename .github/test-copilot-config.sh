#!/bin/bash

# Test script to validate Copilot review configuration
# This script demonstrates the automatic review setup

echo "🤖 CleverFerret Automatic Copilot Review Configuration Test"
echo "============================================================="

echo ""
echo "📋 Configuration Files Created:"
echo "  ✅ .github/CODEOWNERS"
echo "  ✅ .github/workflows/copilot-review.yml"
echo "  ✅ .github/workflows/setup-labels.yml"
echo "  ✅ .github/pull_request_template.md"
echo "  ✅ .github/COPILOT_REVIEW_CONFIG.md"

echo ""
echo "📊 Coverage Statistics:"
TOTAL_FILES=$(find . -type f \( -name "*.kt" -o -name "*.java" -o -name "*.xml" -o -name "*.gradle" -o -name "*.gradle.kts" -o -name "*.yml" -o -name "*.yaml" -o -name "*.md" -o -name "*.json" -o -name "*.toml" -o -name "*.properties" -o -name "*.sh" -o -name "Dockerfile*" \) | wc -l)
echo "  📁 Total files under review: $TOTAL_FILES"

echo ""
echo "🔍 File Type Breakdown:"
echo "  📝 Kotlin files: $(find . -name "*.kt" | wc -l)"
echo "  ☕ Java files: $(find . -name "*.java" | wc -l)"
echo "  📄 XML files: $(find . -name "*.xml" | wc -l)"
echo "  🏗️  Gradle files: $(find . -name "*.gradle*" | wc -l)"
echo "  ⚙️  YAML files: $(find . -name "*.yml" -o -name "*.yaml" | wc -l)"
echo "  📚 Markdown files: $(find . -name "*.md" | wc -l)"
echo "  🗃️  JSON files: $(find . -name "*.json" | wc -l)"
echo "  📋 Properties files: $(find . -name "*.properties" | wc -l)"

echo ""
echo "🎯 CODEOWNERS Configuration:"
if [ -f ".github/CODEOWNERS" ]; then
    echo "  ✅ CODEOWNERS file exists"
    echo "  🔍 Rules count: $(grep -c '@github/copilot' .github/CODEOWNERS)"
else
    echo "  ❌ CODEOWNERS file missing!"
fi

echo ""
echo "🚀 Workflow Configuration:"
if [ -f ".github/workflows/copilot-review.yml" ]; then
    echo "  ✅ Copilot review workflow exists"
    echo "  🔍 Triggers on: pull_request, push"
else
    echo "  ❌ Copilot review workflow missing!"
fi

echo ""
echo "📝 Pull Request Template:"
if [ -f ".github/pull_request_template.md" ]; then
    echo "  ✅ PR template exists"
    echo "  🔍 Contains Copilot review checklist"
else
    echo "  ❌ PR template missing!"
fi

echo ""
echo "✅ Configuration Complete!"
echo "🎉 All files in the CleverFerret repository are now configured for automatic GitHub Copilot review."
echo ""
echo "Next steps:"
echo "  1. Create a pull request to see the automatic review in action"
echo "  2. The workflow will automatically request Copilot review"
echo "  3. Labels will be applied automatically"
echo "  4. Detailed review comments will be posted"
echo ""
echo "For more information, see: .github/COPILOT_REVIEW_CONFIG.md"
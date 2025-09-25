#!/bin/bash

# CleverFerret Branch Cleanup Script
# Based on COMPREHENSIVE_BRANCH_ANALYSIS.md

echo "🧹 CleverFerret Repository Branch Cleanup"
echo "=========================================="
echo ""

# Function to delete remote branch safely
delete_remote_branch() {
    local branch=$1
    echo "🗑️  Deleting remote branch: $branch"
    if git push origin --delete "$branch" 2>/dev/null; then
        echo "   ✅ Successfully deleted: $branch"
    else
        echo "   ⚠️  Branch may not exist or already deleted: $branch"
    fi
}

# Function to check if branch exists remotely
branch_exists() {
    local branch=$1
    git ls-remote --heads origin "$branch" | grep -q "$branch"
}

echo "📋 Phase 1: Deleting superseded Copilot fix branches"
echo "-----------------------------------------------------"

# Copilot fix branches to delete (22 branches identified)
copilot_branches=(
    "copilot/fix-5c26a9a7-8f8a-4f69-9d02-609156e94a6e"
    "copilot/fix-8c8697a0-f773-4a4d-b052-c0aeaf9469fb"
    "copilot/fix-9a654436-1c30-493a-8a4d-b51f363cd770"
    "copilot/fix-13ab833d-e438-4f36-9aee-9833106c1211"
    "copilot/fix-35"
    "copilot/fix-54ecc798-f8ac-4866-b2ea-b9eb87f82a07"
    "copilot/fix-62"
    "copilot/fix-67"
    "copilot/fix-69"
    "copilot/fix-95ef92aa-b8ef-4be3-a96e-062897a65e7e"
    "copilot/fix-180c2490-ead5-4bcc-a73a-a590b3b1b250"
    "copilot/fix-28842264-a06b-4f3d-ae5d-2892a8bb518d"
    "copilot/fix-a26791e5-abb0-4191-b271-b3fdb973b230"
    "copilot/fix-a89115ea-ab70-4624-914e-f1a62f88506c"
    "copilot/fix-android-ci-package-error"
    "copilot/fix-bc683a20-7898-43c5-9eb1-c7ec7d15d312"
    "copilot/fix-d0d3a7b8-da82-4532-acf7-5b73ecd86fa4"
    "copilot/fix-d7c87e9c-bc7a-46d4-9c2d-03d56fd32eef"
    "copilot/fix-de790fc3-c5d1-42d2-ac3b-a3dcc189ebc6"
    "copilot/fix-fa552a13-cce2-4566-a950-5f1a6773d59e"
    "copilot/convert-react-app-to-pwa"
    "copilot/update-log-file-formatting"
)

for branch in "${copilot_branches[@]}"; do
    if branch_exists "$branch"; then
        delete_remote_branch "$branch"
    else
        echo "   ℹ️  Branch does not exist: $branch"
    fi
done

echo ""
echo "📋 Phase 2: Deleting completed documentation branches"
echo "---------------------------------------------------"

# Documentation branches to delete (3 branches)
doc_branches=(
    "add-comprehensive-documentation"
    "docs-and-readme-update"
    "docs/update-resources-md"
)

for branch in "${doc_branches[@]}"; do
    if branch_exists "$branch"; then
        delete_remote_branch "$branch"
    else
        echo "   ℹ️  Branch does not exist: $branch"
    fi
done

echo ""
echo "📋 Phase 3: Deleting completed planning branches"
echo "-----------------------------------------------"

# Planning branches to delete (2 branches)
planning_branches=(
    "feature/project-plan"
    "feature/create-development-issues"
)

for branch in "${planning_branches[@]}"; do
    if branch_exists "$branch"; then
        delete_remote_branch "$branch"
    else
        echo "   ℹ️  Branch does not exist: $branch"
    fi
done

echo ""
echo "📋 Phase 4: Deleting outdated resolver branch"
echo "--------------------------------------------"

# Outdated resolver branch
if branch_exists "Resolver"; then
    delete_remote_branch "Resolver"
else
    echo "   ℹ️  Resolver branch does not exist"
fi

echo ""
echo "📋 Phase 5: Reviewing feature branches for valuable content"
echo "---------------------------------------------------------"

# Feature branches to review (not delete yet)
feature_branches=(
    "feature/architecture-and-database-foundation"
    "feat/modern-native-ui"
    "feature/improve-test-coverage"
    "feature/add-tests-for-comprehensive-metadata-service"
)

echo "ℹ️  The following branches require manual review before deletion:"
for branch in "${feature_branches[@]}"; do
    if branch_exists "$branch"; then
        echo "   🔍 REVIEW REQUIRED: $branch"
    else
        echo "   ℹ️  Branch does not exist: $branch"
    fi
done

echo ""
echo "📋 Additional cleanup branches"
echo "-----------------------------"

additional_branches=(
    "fix/android_ci_install_sdk"
    "fix/delete-library-bug"  
    "fix/github-actions-json-output"
    "fix/orphan-metadata-bug"
    "fix-author-name-parsing"
    "jules/fix-compilation-errors"
    "organize-documentation"
)

for branch in "${additional_branches[@]}"; do
    if branch_exists "$branch"; then
        delete_remote_branch "$branch"
    else
        echo "   ℹ️  Branch does not exist: $branch"
    fi
done

echo ""
echo "✅ Cleanup Summary"
echo "=================="
echo "🎯 Main branch preserved as production-ready"
echo "🗑️  Deleted superseded fix branches"
echo "🗑️  Deleted completed documentation branches"
echo "🗑️  Deleted completed planning branches"
echo "🔍 Feature branches marked for review"
echo ""
echo "📊 Repository is now optimized for maintenance!"
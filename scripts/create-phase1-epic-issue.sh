#!/bin/bash
#
# Script to create Phase 1: Make It Work - Core Infrastructure Epic Issue
#
# This script creates a GitHub issue with all the specifications for the Phase 1 epic.
# It requires gh CLI to be installed and authenticated.
#
# Usage: ./scripts/create-phase1-epic-issue.sh
#

set -e

# Check if gh CLI is available
if ! command -v gh &> /dev/null; then
    echo "Error: gh CLI is not installed. Please install it first."
    echo "Visit: https://cli.github.com/"
    exit 1
fi

# Check if gh is authenticated
if ! gh auth status &> /dev/null; then
    echo "Error: gh CLI is not authenticated. Please run 'gh auth login' first."
    exit 1
fi

# Issue details
TITLE="Phase 1: Make It Work - Core Infrastructure"
ASSIGNEE="github-copilot[bot]"
LABELS="epic,priority: critical"

# Multi-line body content
BODY=$(cat <<'EOF'
This epic tracks the critical foundational work needed to make the app functional with real data. Without these components, the app is just a beautiful UI shell.

## Goals
- Enable data persistence across app restarts
- Allow the app to access device storage and media files
- Build the scanning system to find and catalog media files
- Implement proper navigation between screens
- Create detail views for media items

## Sub-Issues
This epic contains 6 critical tasks:
1. Permissions Handler - Request storage/media permissions
2. Room Database Layer - Persistent storage for media items and progress
3. DataStore Settings Persistence - Save user preferences
4. Media Scanning System - Find and catalog files on device
5. Navigation System - Screen-to-screen routing
6. Detail Screens - View individual media items

## Success Criteria
- App can store and retrieve media data
- Settings persist across restarts
- Can scan device for media files
- Can navigate between library, detail, and player screens
- Users can view detailed information about media items

## Priority
🔴 CRITICAL - Nothing else works without these components

## Time Estimate
2-3 weeks total for all sub-issues

## References
See GAP_ANALYSIS.txt for complete technical details.
EOF
)

echo "Creating GitHub issue..."
echo "Title: $TITLE"
echo "Assignee: $ASSIGNEE"
echo "Labels: $LABELS"
echo ""

# Create the issue
if ISSUE_URL=$(gh issue create \
    --repo "Kaleaon/CleverFerret" \
    --title "$TITLE" \
    --assignee "$ASSIGNEE" \
    --label "epic" \
    --label "priority: critical" \
    --body "$BODY"); then
    echo "✅ Issue created successfully!"
    echo "URL: $ISSUE_URL"
else
    echo "❌ Failed to create issue"
    exit 1
fi

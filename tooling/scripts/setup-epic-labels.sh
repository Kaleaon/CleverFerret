#!/bin/bash
#
# Script to setup required labels for Phase 1 Epic Issue
#
# This script creates the necessary labels if they don't already exist.
# It requires gh CLI to be installed and authenticated.
#
# Usage: ./tooling/scripts/setup-epic-labels.sh
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

REPO="Kaleaon/CleverFerret"

echo "Setting up labels for repository: $REPO"
echo ""

# Function to create label if it doesn't exist
create_label_if_missing() {
    local label_name="$1"
    local label_color="$2"
    local label_description="$3"
    
    if gh label list --repo "$REPO" | grep -q "^${label_name}[[:space:]]"; then
        echo "✓ Label '$label_name' already exists"
    else
        echo "Creating label '$label_name'..."
        gh label create "$label_name" \
            --repo "$REPO" \
            --color "$label_color" \
            --description "$label_description"
        echo "✓ Label '$label_name' created"
    fi
}

# Create 'epic' label
create_label_if_missing \
    "epic" \
    "9333EA" \
    "Large feature or project that spans multiple issues"

# Create 'priority: critical' label
create_label_if_missing \
    "priority: critical" \
    "D73A4A" \
    "Critical priority - must be addressed immediately"

echo ""
echo "✅ All required labels are set up!"
echo ""
echo "You can now run: ./tooling/scripts/create-phase1-epic-issue.sh"

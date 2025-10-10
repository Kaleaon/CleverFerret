# Phase 1 Epic Issue Creation Guide

## Overview

This document explains the tooling created to facilitate the creation of the "Phase 1: Make It Work - Core Infrastructure" epic issue on GitHub.

## Problem Statement

Create a GitHub issue with the following specifications:
- **Title**: Phase 1: Make It Work - Core Infrastructure
- **Assignee**: github-copilot[bot]
- **Labels**: epic, priority: critical
- **Body**: Comprehensive epic description with goals, sub-issues, success criteria, priority, time estimate, and references

## Solution

Since direct GitHub issue creation from the sandboxed environment is not possible, three complementary solutions have been provided:

### 1. Shell Script (Recommended for CLI Users)

**Location**: `/scripts/create-phase1-epic-issue.sh`

**Prerequisites**:
- GitHub CLI (`gh`) installed and authenticated
- Execute permission (already set)

**Usage**:
```bash
# Optional: Ensure required labels exist first
./scripts/setup-epic-labels.sh

# Create the issue
./scripts/create-phase1-epic-issue.sh
```

**Features**:
- Validates `gh` CLI installation
- Checks authentication status
- Creates issue with all specified metadata
- Returns issue URL upon success

### 2. GitHub Actions Workflow (Recommended for Repository Maintainers)

**Location**: `/.github/workflows/create-phase1-epic-issue.yml`

**Usage**:
1. Navigate to the Actions tab in GitHub repository
2. Select "Create Phase 1 Epic Issue" workflow
3. Click "Run workflow"
4. Type "create" in the confirmation input field
5. Click "Run workflow" button

**Features**:
- Manual trigger with confirmation
- Runs in GitHub's infrastructure with proper credentials
- Automatic permissions management
- No local setup required

**Permissions Required**:
- `issues: write`
- `contents: read`

### 3. Issue Specification Document (For Manual Creation)

**Location**: `/.github/ISSUE_TEMPLATE/phase1-epic-issue-spec.md`

**Usage**:
This document contains:
- Complete issue metadata
- Full issue body in markdown format
- Multiple creation methods (script, workflow, CLI, web UI)
- Links to related files

**When to Use**:
- Automated methods are not available
- Manual customization is needed
- Documentation reference is required

## Issue Content

### Title
```
Phase 1: Make It Work - Core Infrastructure
```

### Metadata
- **Assignee**: github-copilot[bot]
- **Labels**: epic, priority: critical

### Body Summary

The issue describes critical foundational work needed to make the app functional with real data:

**Goals (5 items)**:
1. Enable data persistence across app restarts
2. Allow access to device storage and media files
3. Build scanning system to find and catalog media files
4. Implement proper navigation between screens
5. Create detail views for media items

**Sub-Issues (6 critical tasks)**:
1. Permissions Handler
2. Room Database Layer
3. DataStore Settings Persistence
4. Media Scanning System
5. Navigation System
6. Detail Screens

**Success Criteria (5 items)**:
- App can store and retrieve media data
- Settings persist across restarts
- Can scan device for media files
- Can navigate between library, detail, and player screens
- Users can view detailed information about media items

**Priority**: 🔴 CRITICAL

**Time Estimate**: 2-3 weeks total

**References**: See GAP_ANALYSIS.txt for complete technical details

## Environment Limitations Addressed

The original task requested direct GitHub issue creation, which is not possible in the sandboxed environment due to:
- No GitHub credentials available in the execution context
- Environment designed for code changes, not GitHub API interactions
- Security restrictions preventing external API calls

**Solution**: Provide multiple pathways for issue creation that work in different contexts:
1. CLI script for developers with local access
2. GitHub Actions workflow for repository automation
3. Documentation for manual creation

## Verification

To verify the tools work correctly:

### Test Shell Script (if you have gh CLI access)
```bash
# Check script exists and is executable
ls -la scripts/create-phase1-epic-issue.sh

# Dry run - check syntax
bash -n scripts/create-phase1-epic-issue.sh

# If authenticated, create a test issue in a test repository
# (Modify repository name in script temporarily)
```

### Test GitHub Actions Workflow
```bash
# Validate workflow syntax
gh workflow view "Create Phase 1 Epic Issue" --yaml

# Or check via GitHub web interface
# Actions tab -> Workflows -> Create Phase 1 Epic Issue
```

### Verify Issue Specification
```bash
# Check document exists
cat .github/ISSUE_TEMPLATE/phase1-epic-issue-spec.md

# Verify markdown formatting
# (Can use markdown linter if available)
```

## Related Files

- **Existing Issue Documentation**:
  - `/issues/phase-1-core-infrastructure.md`
  - `/issues/Phase_1_Make_It_Work_Core_Infrastructure.md`
  - `/issues/implement-permissions-handler.md`

- **New Files Created**:
  - `/scripts/create-phase1-epic-issue.sh` - Shell script to create issue
  - `/scripts/setup-epic-labels.sh` - Shell script to setup required labels
  - `/.github/workflows/create-phase1-epic-issue.yml` - GitHub Actions workflow
  - `/.github/ISSUE_TEMPLATE/phase1-epic-issue-spec.md` - Issue specification
  - `/PHASE1_EPIC_ISSUE_CREATION_GUIDE.md` - This guide

## Next Steps

### Recommended Workflow

1. **Setup labels** (one-time): `./scripts/setup-epic-labels.sh`
2. **Create issue**:
   - **For Repository Maintainers**: Use the GitHub Actions workflow
   - **For CLI Users**: Run `./scripts/create-phase1-epic-issue.sh`
   - **For Manual Creation**: Follow the issue specification document

## Notes

- The issue content references GAP_ANALYSIS.txt which was mentioned in the problem statement but doesn't exist in the repository. This reference is included as specified.
- The assignee `github-copilot[bot]` is set as requested, though it's an automated account
- Both labels `epic` and `priority: critical` must exist in the repository for automated creation to work

## Troubleshooting

### Shell Script Issues
- **"gh command not found"**: Install GitHub CLI from https://cli.github.com/
- **"not authenticated"**: Run `gh auth login` first
- **"invalid label"**: Ensure labels exist in the repository

### GitHub Actions Issues
- **Workflow not appearing**: Check workflow file syntax and commit
- **Permission denied**: Verify workflow has `issues: write` permission
- **Label errors**: Create labels in repository settings first

### Manual Creation Issues
- **Can't assign to github-copilot[bot]**: Use web UI or leave unassigned initially
- **Label not found**: Create labels in repository settings: Settings → Labels

## Summary

Three methods have been provided to create the Phase 1 epic issue, accommodating different user contexts and access levels. The recommended approach is to use the GitHub Actions workflow for automated, secure issue creation with proper credentials.

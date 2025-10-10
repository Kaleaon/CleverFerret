# Phase 1: Make It Work - Core Infrastructure Epic Issue

This document contains the complete specification for creating the Phase 1 epic issue.

## Issue Metadata

- **Title**: Phase 1: Make It Work - Core Infrastructure
- **Assignee**: github-copilot[bot]
- **Labels**: 
  - epic
  - priority: critical

## Issue Body

```markdown
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
```

## How to Create This Issue

### Option 1: Using the Shell Script
```bash
./scripts/create-phase1-epic-issue.sh
```

### Option 2: Using GitHub Actions Workflow
1. Go to the Actions tab in the GitHub repository
2. Select "Create Phase 1 Epic Issue" workflow
3. Click "Run workflow"
4. Type "create" in the confirmation input
5. Click "Run workflow" button

### Option 3: Using GitHub CLI Manually
```bash
gh issue create \
  --repo "Kaleaon/CleverFerret" \
  --title "Phase 1: Make It Work - Core Infrastructure" \
  --assignee "github-copilot[bot]" \
  --label "epic" \
  --label "priority: critical" \
  --body-file <(cat <<'EOF'
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
```

### Option 4: Create Manually via GitHub Web UI
1. Go to https://github.com/Kaleaon/CleverFerret/issues/new
2. Fill in the title: `Phase 1: Make It Work - Core Infrastructure`
3. Assign to: `github-copilot[bot]`
4. Add labels: `epic`, `priority: critical`
5. Copy the issue body from the "Issue Body" section above
6. Click "Submit new issue"

## Related Files

- Existing documentation: `/issues/phase-1-core-infrastructure.md`
- Existing documentation: `/issues/Phase_1_Make_It_Work_Core_Infrastructure.md`
- Implementation details: `/issues/implement-permissions-handler.md`
- Script to create: `/scripts/create-phase1-epic-issue.sh`
- Workflow to create: `/.github/workflows/create-phase1-epic-issue.yml`

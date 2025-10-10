# Quick Start: Create Phase 1 Epic Issue

## TL;DR

Create the "Phase 1: Make It Work - Core Infrastructure" epic issue using one of these methods:

### Method 1: GitHub Actions (Easiest - No Local Setup)
1. Go to: https://github.com/Kaleaon/CleverFerret/actions/workflows/create-phase1-epic-issue.yml
2. Click "Run workflow"
3. Type "create" in the input field
4. Click "Run workflow" button
5. ✅ Done! Issue will be created automatically

### Method 2: Command Line (Fast - Requires gh CLI)
```bash
# One-time setup
gh auth login

# Setup labels (first time only)
./scripts/setup-epic-labels.sh

# Create the issue
./scripts/create-phase1-epic-issue.sh
```

### Method 3: Manual (Fallback)
1. Go to: https://github.com/Kaleaon/CleverFerret/issues/new
2. Copy content from: `.github/ISSUE_TEMPLATE/phase1-epic-issue-spec.md`
3. Paste and submit

---

## Issue Details

**Title**: Phase 1: Make It Work - Core Infrastructure

**Assignee**: github-copilot[bot]

**Labels**: epic, priority: critical

**Description**: This epic tracks 6 critical foundational tasks needed to make the app functional with real data:
1. Permissions Handler
2. Room Database Layer
3. DataStore Settings Persistence
4. Media Scanning System
5. Navigation System
6. Detail Screens

---

## Files Created

| File | Purpose |
|------|---------|
| `scripts/create-phase1-epic-issue.sh` | CLI script to create issue |
| `scripts/setup-epic-labels.sh` | CLI script to setup labels |
| `.github/workflows/create-phase1-epic-issue.yml` | GitHub Actions workflow |
| `.github/ISSUE_TEMPLATE/phase1-epic-issue-spec.md` | Complete issue specification |
| `PHASE1_EPIC_ISSUE_CREATION_GUIDE.md` | Detailed documentation |
| `QUICK_START_PHASE1_ISSUE.md` | This quick-start guide |

---

## Troubleshooting

**Problem**: "gh command not found"  
**Solution**: Install from https://cli.github.com/

**Problem**: "not authenticated"  
**Solution**: Run `gh auth login`

**Problem**: "invalid label"  
**Solution**: Run `./scripts/setup-epic-labels.sh` first

**Problem**: Workflow doesn't appear  
**Solution**: Refresh the Actions page or check workflow file syntax

---

## Full Documentation

For complete details, see: [PHASE1_EPIC_ISSUE_CREATION_GUIDE.md](PHASE1_EPIC_ISSUE_CREATION_GUIDE.md)

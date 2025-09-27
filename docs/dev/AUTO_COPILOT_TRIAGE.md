# Auto Copilot Triage Workflow Documentation

## Overview

The **Auto Copilot Triage** workflow (`auto-copilot-triage.yml`) provides automated failure analysis and remediation assistance for CI/CD pipelines. When any workflow fails on a pull request, it automatically creates a comment mentioning `@copilot` with failure details and logs, enabling Copilot to analyze the issue and propose fixes.

## Features

### 🔄 Automatic Trigger System
- **Workflow Run Monitoring**: Detects failed GitHub Actions workflows triggered by PRs
- **Check Suite Monitoring**: Detects failed external check systems (CI/CD providers, third-party tools)
- **Smart Filtering**: Only triggers on actual failures, skips successful/cancelled/skipped runs
- **Infinite Loop Prevention**: Never triggers on its own runs to prevent recursive behavior

### 📋 Intelligent Log Processing
- **Automatic Log Download**: Retrieves workflow run logs using GitHub CLI
- **Smart Trimming**: Limits log content to ~32KB to fit within GitHub comment limits
- **Failure Focus**: Extracts the last 100 lines of each log file to capture recent errors
- **Fallback Handling**: Gracefully handles cases where logs cannot be retrieved

### 💬 Contextual PR Comments
- **Structured Information**: Provides workflow name, status, run ID, commit SHA, and direct links
- **Embedded Logs**: Includes trimmed failure logs in code blocks for easy analysis
- **Clear Instructions**: Gives Copilot specific tasks for analysis and remediation
- **Professional Formatting**: Uses consistent markdown formatting with emojis for clarity

## Technical Implementation

### Workflow Triggers

```yaml
on:
  workflow_run:
    workflows: ["*"]  # Monitor all workflows
    types: [completed]
  check_suite:
    types: [completed]
```

### Security & Permissions

The workflow uses **least privilege** principles with minimal required permissions:

```yaml
permissions:
  actions: read          # Read workflow run data and download logs
  contents: read         # Read repository contents  
  pull-requests: write   # Write comments to PRs
```

- **No elevated permissions** required
- **Uses GITHUB_TOKEN** (no additional secrets needed)
- **Read-only access** to workflow data
- **Limited write access** only to PR comments

### Job Architecture

#### 1. Triage Workflow Run Job
**Purpose**: Handle failed GitHub Actions workflows

**Conditions**:
- Event is `workflow_run`
- Triggered by `pull_request` event
- Conclusion is not `success`, `skipped`, or `cancelled`
- Workflow name is not `Auto Copilot Triage` (prevents infinite loops)

**Steps**:
1. **Get PR Number**: Extract PR number from workflow run payload
2. **Download Logs**: Use GitHub CLI to download and process workflow logs
3. **Create Comment**: Generate markdown comment with failure details and logs
4. **Post Comment**: Submit comment to PR via GitHub API

#### 2. Triage Check Suite Job
**Purpose**: Handle failed external check systems

**Conditions**:
- Event is `check_suite`
- Conclusion is not `success`, `skipped`, or `cancelled`
- Associated with at least one pull request

**Steps**:
1. **Process Check**: Extract check suite details (name, URL, conclusion, PR number)
2. **Create Comment**: Generate markdown comment with check failure details
3. **Post Comment**: Submit comment to PR via GitHub API

## Log Processing Logic

### Size Management
- **Maximum Size**: 32,000 characters (leaves room for comment metadata)
- **Per-File Limit**: Last 100 lines of each log file
- **Incremental Processing**: Stops adding content when size limit is approached

### Content Priority
1. **Recent Failures**: Focus on the end of log files where errors typically appear
2. **File Headers**: Include filename context for each log section
3. **Error Context**: Preserve surrounding context around error messages

### Fallback Behavior
- If logs cannot be downloaded, posts comment with link to workflow run
- If logs are empty or unreadable, notes the limitation in the comment
- Never fails silently - always provides some form of triage comment

## Comment Templates

### Workflow Run Failure Comment
```markdown
🚨 **CI Failure Detected** 🚨

**@copilot** The **[Workflow Name]** workflow has failed on this PR.

**Failure Details:**
- **Workflow**: [Workflow Name](workflow_url)
- **Status**: failure
- **Run ID**: 12345
- **Commit**: abc1234

**Failure Logs:**
```
[Trimmed log content]
```

**Copilot Instructions:**
Please analyze the failure above and:
1. Identify the root cause of the build/test failure
2. Suggest specific code changes or configuration fixes
3. Provide a step-by-step remediation plan
4. If possible, propose a code patch or pull request to resolve the issue

The goal is to get this PR's CI passing again. Thank you! 🙏
```

### Check Suite Failure Comment
```markdown
🔍 **External Check Failure Detected** 🔍

**@copilot** The **[Check Name]** check has failed on this PR.

**Check Details:**
- **Check Name**: External CI
- **Status**: failure
- **Details**: [View Check Results](check_url)

**Copilot Instructions:**
This appears to be a failure from an external check system. Please:
1. Examine the check details at the provided link
2. Analyze any available error information or status messages
3. Identify potential causes based on the check type and recent changes
4. Suggest appropriate remediation steps or code changes
5. Provide guidance on how to verify the fix

Please help resolve this check failure so the PR can proceed. Thank you! 🙏
```

## Configuration & Customization

### Monitoring Scope
To monitor specific workflows only, modify the trigger:

```yaml
on:
  workflow_run:
    workflows: ["Android CI/CD", "Release Build"]  # Specific workflows
    types: [completed]
```

### Log Processing Limits
Adjust log processing parameters by modifying these variables in the workflow:

```bash
MAX_SIZE=32000    # Maximum total log size in characters
TAIL_LINES=100    # Lines to extract from end of each log file
```

### Comment Customization
Modify the comment templates in the "Create Comment Content" steps to:
- Add/remove sections
- Change formatting style
- Include additional metadata
- Customize Copilot instructions

## Troubleshooting

### Common Issues

#### 1. Workflow Not Triggering
- **Check PR Association**: Ensure failed workflows were triggered by PRs
- **Verify Conclusions**: Only `failure`, `timed_out`, and `action_required` trigger triage
- **Review Filters**: Confirm workflow name doesn't match exclusion criteria

#### 2. Missing Logs
- **GitHub CLI Access**: Workflow requires `gh` CLI tool (pre-installed on GitHub runners)
- **Permissions**: Ensure `actions: read` permission is granted
- **Log Retention**: GitHub deletes workflow logs after retention period expires

#### 3. Comment Posting Issues
- **PR Permissions**: Verify `pull-requests: write` permission
- **JSON Escaping**: Check for special characters in comment content
- **API Rate Limits**: Multiple rapid failures may hit GitHub API limits

### Debugging Steps

1. **Check Workflow Run Logs**: View the triage workflow's own logs for error details
2. **Validate Conditions**: Confirm trigger conditions match the failed workflow
3. **Test API Access**: Ensure GITHUB_TOKEN has sufficient permissions
4. **Verify PR Context**: Confirm the failed workflow was associated with a PR

## Integration with CleverFerret

### Workflow Compatibility
The triage workflow monitors all existing CleverFerret workflows:
- `android-ci.yml` - Main Android CI/CD pipeline
- `universal-build.yml` - Manual universal build system
- `nightly.yml` - Nightly builds
- `release.yml` - Release automation

### Build System Integration
- **Android Build Failures**: Automatically detects Gradle compilation errors, test failures, and dependency issues
- **APK Generation Issues**: Catches signing problems, missing dependencies, and build configuration errors
- **Test Result Analysis**: Provides context for unit test failures and lint check issues

### Development Workflow
1. **Developer Creates PR**: Standard pull request workflow
2. **CI Runs Automatically**: Existing workflows execute on PR
3. **Failure Detection**: If any workflow fails, triage workflow triggers
4. **Automatic Analysis**: Copilot receives failure context and logs
5. **Remediation Assistance**: Copilot provides fix suggestions in PR comments
6. **Developer Applies Fixes**: Developer implements suggested changes
7. **CI Re-runs**: Updated PR triggers CI again, potentially passing

## Maintenance

### Regular Updates
- **Monitor GitHub API Changes**: GitHub may update webhook payloads or API endpoints
- **Update Log Processing**: Adjust size limits and processing logic as needed
- **Review Comment Templates**: Keep instructions clear and current for Copilot

### Performance Monitoring
- **Comment Frequency**: Track how often triage comments are posted
- **Log Size Distribution**: Monitor typical log sizes to optimize processing
- **Response Effectiveness**: Evaluate how well Copilot responds to triage comments

### Security Considerations
- **Token Permissions**: Regularly audit required permissions
- **Log Content**: Be aware that logs may contain sensitive information
- **Rate Limiting**: Implement additional throttling if needed for high-frequency failures

## Testing

### Validation Script
Run `./test_triage_logic.sh` to validate core workflow logic:

```bash
chmod +x test_triage_logic.sh
./test_triage_logic.sh
```

### Manual Testing
1. Create a PR with intentionally failing code
2. Wait for CI to fail
3. Verify triage comment appears
4. Check comment formatting and content
5. Confirm Copilot can respond appropriately

### Edge Case Testing
- Multiple simultaneous workflow failures
- Very large log files (>100MB)
- Workflows with no logs available
- External check system failures
- Network connectivity issues during log download

## Future Enhancements

### Potential Improvements
- **Smart Log Filtering**: Use AI to identify most relevant log sections
- **Failure Pattern Recognition**: Learn from common failure types
- **Integration Metrics**: Track resolution success rates
- **Multi-Repository Support**: Extend to monitor failures across related repositories
- **Custom Notification Channels**: Support Slack, Discord, or email notifications

### Advanced Features
- **Automated Fix Attempts**: Have Copilot automatically create fix PRs for common issues
- **Failure Categorization**: Classify failures by type (build, test, deployment, etc.)
- **Historical Analysis**: Track failure trends and prevention opportunities
- **Team Assignment**: Route specific failure types to appropriate team members
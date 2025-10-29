# Readium Update Strategy - Automated Tracking

**Status:** ✅ FULLY AUTOMATED  
**Date:** 2025-10-11

---

## 🤖 **AUTOMATED UPDATE SYSTEM**

We've implemented a comprehensive automated system to stay up-to-date with Readium Kotlin Toolkit releases.

---

## 📦 **1. DEPENDABOT (PRIMARY)**

**File:** `.github/dependabot.yml`

**What it does:**
- Automatically checks for Readium updates **every Monday**
- Creates PRs with version bumps
- Groups Readium dependencies together
- Adds descriptive labels

**Configuration:**
```yaml
groups:
  readium:
    patterns:
      - "org.readium.kotlin-toolkit:*"
    update-types:
      - "minor"
      - "patch"
```

**When a new Readium version is released:**
1. Dependabot detects it on Monday morning
2. Creates a PR: `chore: Bump Readium from 3.1.2 to 3.2.0`
3. PR includes:
   - Changelog
   - Release notes
   - Compatibility notes
4. You review and merge

**Benefits:**
- ✅ Fully automated PR creation
- ✅ Integrated with GitHub
- ✅ Groups related dependencies
- ✅ Semantic versioning aware
- ✅ Can auto-merge patch updates

---

## 🔍 **2. READIUM UPDATE CHECKER (SECONDARY)**

**File:** `.github/workflows/check-readium-updates.yml`

**What it does:**
- Monitors Readium GitHub releases
- Compares current version with latest
- **Creates GitHub issue** when new version found
- Includes release notes and testing checklist

**Schedule:**
- Runs **every Monday at 9 AM UTC**
- Can also trigger manually

**When triggered:**
```
Current version: 3.1.2
Latest version: 3.2.0

✅ Creates issue: "📦 Readium Kotlin Toolkit 3.2.0 Available"
```

**Issue includes:**
- Release notes from Readium GitHub
- Direct link to release
- Testing checklist
- Update instructions

**Benefits:**
- ✅ Visual notification via GitHub issue
- ✅ Complete testing checklist
- ✅ Includes migration notes
- ✅ Links to documentation
- ✅ Won't create duplicate issues

---

## 📚 **3. GRADLE VERSION CATALOG (FOUNDATION)**

**File:** `gradle/libs.versions.toml`

**What it is:**
Centralized dependency management system

**Configuration:**
```toml
[versions]
readium = "3.1.2"

[libraries]
readium-shared = { module = "org.readium.kotlin-toolkit:readium-shared", version.ref = "readium" }
readium-streamer = { module = "org.readium.kotlin-toolkit:readium-streamer", version.ref = "readium" }
readium-navigator = { module = "org.readium.kotlin-toolkit:readium-navigator", version.ref = "readium" }
readium-opds = { module = "org.readium.kotlin-toolkit:readium-opds", version.ref = "readium" }

[bundles]
readium = [
    "readium-shared",
    "readium-streamer",
    "readium-navigator",
    "readium-opds"
]
```

**To update Readium (manual):**
```kotlin
// OLD: CleverFerret/build.gradle.kts
val readiumVersion = "3.1.2"
implementation("org.readium.kotlin-toolkit:readium-shared:$readiumVersion")
// ... repeat for each module

// NEW: Using version catalog
implementation(libs.bundles.readium)
```

**Benefits:**
- ✅ Single version definition
- ✅ Type-safe accessors
- ✅ Easier to update (one place)
- ✅ Better IDE support
- ✅ Dependabot can update TOML file directly

---

## 🔄 **UPDATE WORKFLOW**

### **Automated Path (Recommended):**

```
Monday 9 AM UTC
    ↓
Dependabot checks Readium repo
    ↓
New version found? (e.g., 3.2.0)
    ↓
YES → Create PR
    ├── Title: "chore: Bump Readium to 3.2.0"
    ├── Label: "dependencies", "readium"
    └── Content: Changelog + Release notes
    ↓
GitHub Update Checker runs
    ↓
Creates issue with testing checklist
    ↓
Developer reviews PR
    ↓
Run tests (see checklist below)
    ↓
Merge PR
    ↓
✅ Done!
```

### **Manual Path (if needed):**

```
1. Check Readium releases manually
   → https://github.com/readium/kotlin-toolkit/releases

2. Update gradle/libs.versions.toml:
   readium = "3.2.0"

3. Sync Gradle

4. Run tests

5. Commit and push
```

---

## ✅ **TESTING CHECKLIST**

When a Readium update PR is created, test these features:

### **EPUB Reading:**
- [ ] Open EPUB 2 file
- [ ] Open EPUB 3 file
- [ ] Cover extraction works
- [ ] Metadata parsing works
- [ ] Table of contents loads
- [ ] No crashes

### **PDF Reading:**
- [ ] Open PDF file
- [ ] Thumbnail extraction works
- [ ] Metadata parsing works
- [ ] TOC extraction works (if embedded)
- [ ] No rendering issues

### **Audiobook Support:**
- [ ] Open .audiobook file
- [ ] Cover extraction works
- [ ] Chapter markers work
- [ ] Metadata correct

### **OPDS Catalogs:**
- [ ] Browse Project Gutenberg
- [ ] Search works
- [ ] Download EPUB from catalog
- [ ] Feed parsing correct

### **General:**
- [ ] No compilation errors
- [ ] No new warnings
- [ ] App starts successfully
- [ ] All file formats open correctly
- [ ] No crashes in logs

---

## 🚨 **BREAKING CHANGES**

### **How to Handle:**

1. **Check migration guide:**
   - https://readium.org/kotlin-toolkit/migration-guide

2. **Review release notes:**
   - Major version (3.x → 4.x): Likely breaking changes
   - Minor version (3.1 → 3.2): Usually backward compatible
   - Patch version (3.1.1 → 3.1.2): Bug fixes only

3. **Look for deprecations:**
   ```kotlin
   // If you see:
   @Deprecated("Use newMethod() instead")
   fun oldMethod() { }
   
   // Update our code:
   // OLD: readium.oldMethod()
   // NEW: readium.newMethod()
   ```

4. **Test thoroughly:**
   - Run all tests in checklist
   - Test edge cases
   - Check for new features we can use

---

## 📊 **MONITORING DASHBOARD**

### **GitHub Actions:**
- View: Repository → Actions → "Check Readium Updates"
- History: See when updates were checked
- Logs: Detailed version comparison

### **Dependabot:**
- View: Repository → Insights → Dependency graph → Dependabot
- Open PRs: Filter by label "readium"
- Settings: `.github/dependabot.yml`

### **Issues:**
- Filter: `label:readium-update`
- Shows: All Readium update notifications

---

## 🎯 **CUSTOMIZATION**

### **Change Update Frequency:**

Edit `.github/dependabot.yml`:
```yaml
schedule:
  interval: "daily"  # or "weekly" or "monthly"
  day: "monday"      # for weekly
  time: "09:00"
```

### **Auto-Merge Patch Updates:**

Add to `.github/dependabot.yml`:
```yaml
# Auto-approve patch updates
- package-ecosystem: "gradle"
  directory: "/"
  target-branch: "main"
  # ...
  
  # Enable auto-merge for patch updates only
  pull-request-branch-name:
    separator: "/"
  
  # This requires enabling "Allow auto-merge" in repo settings
```

### **Add Notifications:**

Edit `.github/workflows/check-readium-updates.yml`:

Add Slack notification:
```yaml
- name: Send Slack notification
  if: steps.compare.outputs.update_available == 'true'
  uses: slackapi/slack-github-action@v1
  with:
    payload: |
      {
        "text": "🔔 Readium ${{ steps.latest.outputs.version }} is available!"
      }
  env:
    SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK }}
```

Add Discord notification:
```yaml
- name: Send Discord notification
  if: steps.compare.outputs.update_available == 'true'
  uses: sarisia/actions-status-discord@v1
  with:
    webhook: ${{ secrets.DISCORD_WEBHOOK }}
    title: "Readium Update Available"
    description: "Version ${{ steps.latest.outputs.version }}"
```

---

## 📈 **UPDATE HISTORY**

Track updates in this table:

| Date | From | To | Breaking Changes | Notes |
|------|------|-----|------------------|-------|
| 2025-10-11 | - | 3.1.2 | No | Initial integration |
| TBD | 3.1.2 | 3.2.0 | TBD | Dependabot will notify |

---

## 🔐 **SECURITY UPDATES**

### **Priority Handling:**

If Readium releases a **security patch**:

1. Dependabot creates PR with "security" label
2. Review immediately
3. Test critical paths only
4. Merge ASAP
5. Deploy emergency update

**Dependabot will flag security issues automatically!**

---

## 🎓 **BEST PRACTICES**

### **1. Always Review PRs**
- Don't blindly merge
- Check release notes
- Run tests

### **2. Test Before Merging**
- Use testing checklist
- Test on real device
- Check for regressions

### **3. Read Release Notes**
- Look for new features we can use
- Check for deprecations
- Note breaking changes

### **4. Update Documentation**
- If Readium adds new features, document how we use them
- Update README if needed
- Add examples for new capabilities

### **5. Plan Major Updates**
- Major versions (3.x → 4.x) may require code changes
- Schedule time for migration
- Create feature branch for testing

---

## 🆘 **TROUBLESHOOTING**

### **Dependabot PR not appearing:**
1. Check `.github/dependabot.yml` syntax
2. Verify schedule is correct
3. Check Dependabot logs in GitHub
4. Ensure branch protection rules allow Dependabot

### **Update Checker not creating issues:**
1. Check workflow file syntax
2. Verify schedule cron expression
3. Check GitHub Actions permissions
4. Review workflow run logs

### **Version conflict after update:**
```
FAILURE: Build failed with an exception.

> Could not resolve org.readium.kotlin-toolkit:readium-shared:3.2.0
```

**Solution:**
1. Clear Gradle cache: `./gradlew clean`
2. Sync project: File → Sync Project with Gradle Files
3. Invalidate caches: File → Invalidate Caches → Restart

### **Compilation errors after update:**
1. Check migration guide
2. Look for deprecated APIs
3. Update our code to new APIs
4. If stuck, create issue or rollback

---

## 📞 **SUPPORT RESOURCES**

### **Readium:**
- Documentation: https://readium.org/kotlin-toolkit
- GitHub: https://github.com/readium/kotlin-toolkit
- Issues: https://github.com/readium/kotlin-toolkit/issues
- Discussions: https://github.com/readium/kotlin-toolkit/discussions

### **Dependabot:**
- Docs: https://docs.github.com/en/code-security/dependabot
- Configuration: https://docs.github.com/en/code-security/dependabot/dependabot-version-updates

### **GitHub Actions:**
- Docs: https://docs.github.com/en/actions
- Marketplace: https://github.com/marketplace?type=actions

---

## 🎉 **SUMMARY**

**What We Have:**
- ✅ Automatic weekly checks (Dependabot)
- ✅ Automatic PR creation
- ✅ GitHub issue notifications
- ✅ Centralized version management
- ✅ Testing checklist
- ✅ Zero manual monitoring needed

**What You Do:**
1. Receive Dependabot PR (automatic)
2. Review release notes
3. Run tests
4. Merge PR
5. Deploy!

**Time Investment:**
- Setup: ✅ Done (0 hours)
- Weekly monitoring: **0 minutes** (automated)
- PR review: **~15 minutes** (when updates available)
- Testing: **~30 minutes** (when updates available)

**Total:** ~45 minutes per update, only when needed!

---

## ✨ **BONUS: NEW READIUM FEATURES**

When new Readium features are released, we can:

### **3.2.0 Example:**
- "Added support for OPDS authentication"
- "Improved PDF text extraction"
- "Fixed EPUB fixed-layout rendering"

**What we do:**
1. ✅ Review new features
2. ✅ Determine if we can use them
3. ✅ Implement if beneficial
4. ✅ Update our documentation

---

## 🚀 **READY TO GO!**

Your automated update system is now active:

1. ✅ **Dependabot** - Monitors and creates PRs
2. ✅ **Update Checker** - Creates issues with checklists  
3. ✅ **Version Catalog** - Centralized management
4. ✅ **Documentation** - This guide!

**Next Readium update will be handled automatically!** 🎊

---

**End of Update Strategy**

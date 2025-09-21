# 🚀 CleverFerret GitHub Actions Auto-Build System

## 📋 Overview

CleverFerret automatically builds fresh APKs with every push using GitHub Actions. This solves the ARM64 compilation issues while ensuring you always get the latest features.

---

## ⚡ Auto-Build Triggers

### Automatic Triggers:
- **Every push** to `main`, `develop`, or `master` branches
- **Pull requests** to any of those branches  
- **Manual trigger** via "Run workflow" button

### Smart Filtering:
```yaml
paths-ignore:
  - 'README.md'
  - 'docs/**'  
  - '*.md'
```
Documentation-only changes won't trigger unnecessary builds.

---

## 🏗️ Build Process Flow

### Step 1: AI Code Review (Gemini 2.0 Flash)
- ✅ Analyzes all code changes
- ✅ Applies automatic fixes if needed  
- ✅ Commits fixes back to repository
- ✅ Only proceeds if code passes quality checks

### Step 2: Android Compilation (x86_64 Ubuntu)
- ✅ Uses Android SDK 34 + Build Tools 34.0.0
- ✅ Java 17 + Gradle 8.8 environment
- ✅ Compiles latest source code (v1.2-enhanced)
- ✅ Generates multi-architecture APK

### Step 3: Artifact Management
- ✅ **GitHub Artifacts**: APK available for 30 days
- ✅ **Repository Commit**: APK saved to `builds/` directory
- ✅ **Build Summary**: Rich details in GitHub Actions UI

---

## 📱 What You Get

### APK Features:
- **Latest Source Code**: Always builds from newest commits
- **Multi-Architecture**: ARM64, ARMv7, x86, x86_64 support
- **Modern Android**: SDK 34 compliance, latest APIs
- **Enhanced UI**: v1.2 features (vs old v1.0 APKs)
- **Fixed Menus**: All navigation and UI improvements
- **ARM64 Compatible**: Works on all Android devices

### Build Information:
- **Filename**: `CleverFerret-{branch}-{date}-{commit}.apk`
- **Size**: ~18-20MB (varies with features)
- **Signing**: Debug signed (for development/testing)
- **AI Review Score**: Quality assessment (0-100)

---

## 🎯 How to Use Auto-Build

### Method 1: Push Code (Recommended)
```bash
git add .
git commit -m "Add new feature"
git push origin main
```
→ **Result**: Fresh APK in ~5-10 minutes

### Method 2: Manual Trigger
1. Go to **Actions** tab in GitHub
2. Select **"AI Code Review & Auto-Build CleverFerret"**
3. Click **"Run workflow"**  
4. Choose branch and click **"Run workflow"**

### Method 3: Pull Request
- Create PR to main/develop/master
- APK built automatically for testing
- No repository changes until PR merged

---

## 📥 Downloading Built APKs

### Option 1: GitHub Artifacts (Recommended)
1. Go to **Actions** tab
2. Click on latest successful workflow run  
3. Scroll to **"Artifacts"** section
4. Download `CleverFerret-APK-{date}` ZIP file
5. Extract APK and install

### Option 2: Repository Builds Directory  
1. Navigate to `/builds/` folder in repository
2. Find latest APK file (sorted by date)
3. Click **"Download"** or **"View raw"**
4. Install APK on Android device

---

## 🔧 Build Configuration

### Current Settings:
```yaml
Environment:
  - Android SDK: 34
  - Build Tools: 34.0.0  
  - Java: OpenJDK 17
  - Gradle: 8.8
  - Runner: ubuntu-latest (x86_64)

Features:
  - AI Code Review: Gemini 2.0 Flash
  - Git Authentication: Fixed with GITHUB_TOKEN
  - Caching: Gradle + Android dependencies
  - Parallel Building: Optimized for speed
```

### Security:
- **GITHUB_TOKEN**: Automatic repository access
- **GEMINI_API_KEY**: Stored in GitHub Secrets
- **No hardcoded keys**: All secrets properly managed

---

## 📊 Build Status & Monitoring

### How to Check Build Status:
1. **GitHub Badge**: Shows latest build status
2. **Actions Tab**: Detailed build logs and history
3. **Commit Status**: Green checkmark = successful build
4. **Email Notifications**: GitHub can email on failures

### Build Summary Example:
```
## 🎉 CleverFerret Build Successful!

### 📱 APK Details:
- File: CleverFerret-main-20250921-1a2b3c4.apk
- Branch: main  
- Commit: 1a2b3c4
- AI Review Score: 95/100
- Build Date: 2025-09-21 15:30:42

### 🛠️ Build Features:
- ✅ ARM64 compatible via x86_64 GitHub runners
- ✅ Latest source code compiled (v1.2-enhanced)  
- ✅ Multi-architecture support
- ✅ AI code review passed with auto-fixes applied
- ✅ Modern Android API compliance (SDK 34)

### 📥 Download:
- Check Artifacts section of this workflow run
- APK also committed to builds/ directory
```

---

## 🚀 Benefits Over Local Building

### For ARM64 Systems:
- ❌ **Local Issue**: AAPT2 daemon startup fails
- ✅ **GitHub Solution**: x86_64 runners have no AAPT2 issues
- ✅ **Result**: Reliable builds every time

### For All Systems:
- ✅ **Latest Features**: Always builds newest source
- ✅ **No Setup**: No need for Android SDK installation
- ✅ **Consistent**: Same environment every build
- ✅ **Automated**: No manual compilation steps
- ✅ **Quality**: AI review ensures code quality

### Development Workflow:
```
Code Changes → Git Push → Auto Build → Download APK → Test → Repeat
```

---

## 🔧 Customization Options

### Branch Configuration:
Edit `.github/workflows/ai-review.yml`:
```yaml
on:
  push:
    branches: [ main, develop, master, feature/* ]  # Add more branches
```

### Build Variants:
```yaml
- name: Build Release APK
  run: ./gradlew CleverFerret:assembleRelease  # For production builds
```

### Notification Settings:
```yaml
- name: Notify on Success
  if: success()
  run: |
    curl -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
         -d "chat_id=$CHAT_ID&text=CleverFerret build successful!"
```

---

## ⚠️ Troubleshooting

### Common Issues:

**Build Fails with "Permission Denied"**
- **Cause**: GITHUB_TOKEN permissions  
- **Fix**: Check repository settings → Actions → General → Workflow permissions

**Build Fails with "Gemini API Error"**
- **Cause**: Missing or invalid GEMINI_API_KEY
- **Fix**: Settings → Secrets → Actions → Add/Update GEMINI_API_KEY

**Build Succeeds but No APK**
- **Cause**: APK generation failed silently
- **Fix**: Check build logs for Gradle compilation errors

**Old Features in APK**  
- **Cause**: Building from outdated commit
- **Fix**: Ensure latest commits are pushed to trigger branch

### Getting Help:
1. **Check Actions logs**: Detailed error information
2. **Review recent commits**: Ensure latest code is included
3. **Test locally**: Use ReVanced ARM64 tools for comparison
4. **Manual trigger**: Use workflow_dispatch to force rebuild

---

## 📈 Performance Metrics

### Typical Build Times:
- **AI Review**: 2-3 minutes
- **Android Compilation**: 3-5 minutes  
- **Total**: 5-10 minutes end-to-end

### Resource Usage:
- **Runner**: 2 CPU cores, 7GB RAM
- **Cache Hit Rate**: ~80% (Gradle dependencies)
- **Artifact Size**: ~18-20MB APK + logs

### Success Rate:
- **Target**: >95% successful builds
- **Current**: Monitored via Actions history
- **Failures**: Usually due to code issues, not infrastructure

---

## 🎯 Best Practices

### For Developers:
1. **Test locally** before pushing (optional but recommended)
2. **Write clear commit messages** for build tracking
3. **Use feature branches** for experimental changes
4. **Monitor build status** after pushing

### For Repository Maintenance:
1. **Keep secrets updated** (GEMINI_API_KEY, etc.)
2. **Monitor build success rate** via Actions dashboard
3. **Update Android SDK** versions periodically
4. **Review and clean old artifacts** (auto-deleted after 30 days)

---

**🚀 Result**: CleverFerret now has a **fully automated build pipeline** that produces fresh, feature-complete APKs with every code change, solving ARM64 compilation issues and ensuring developers always have access to the latest version!
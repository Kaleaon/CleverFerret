# 🤖 AI Assistant Quick Reference - CleverFerret Project

> **For Jules, Copilot, Gemini, Claude, and all future AI assistants working on CleverFerret**

## 🚨 CRITICAL KNOWLEDGE - READ FIRST

### The #1 Thing to Know:
**CleverFerret has ARM64 compilation issues solved by ReVanced tools. DO NOT delete `/app/revanced-integration/` without understanding the consequences.**

---

## 📋 QUICK DECISION TREE

### User says: "Build is failing with AAPT2 errors"
1. **Ask**: `uname -m` (check architecture)
2. **If `aarch64`**: Use ReVanced ARM64 tools → `/app/build-scripts/revanced-arm64-test.sh`
3. **If `x86_64`**: Use standard Gradle → `./gradlew assembleDebug`

### User says: "I want the latest APK with new features"  
1. **Check**: Compare source version (1.2-enhanced) vs existing APKs (v1.0)
2. **Recommend**: GitHub Actions for latest features + ARM64 compatibility
3. **Explain**: Local ARM64 can only enhance existing APKs, not compile from source

### User says: "Clean up unused files"
1. **WARNING**: Never auto-delete `revanced-integration/`
2. **Ask specifically**: "Do you want to keep ARM64 compilation support?"
3. **Explain impact**: Without these files, ARM64 systems cannot build CleverFerret

### User says: "GitHub Actions is failing"
1. **Check**: `.github/workflows/ai-review.yml` has Git auth fixes
2. **Verify**: `GEMINI_API_KEY` is set in GitHub Secrets
3. **Review**: Android setup parameters are correct (not api-level/build-tools)

---

## 🛠️ ESSENTIAL COMMANDS

### Test ARM64 Integration:
```bash
cd /app && ./build-scripts/revanced-arm64-test.sh
```

### Build with ARM64 Tools:
```bash
java -jar /app/revanced-integration/binaries/revanced-cli-5.0.1-all.jar patch \
  --custom-aapt2-binary=/app/revanced-integration/official-aapt2-arm64/aapt2 \
  --patches /app/revanced-integration/patches/patches-5.40.0.rvp \
  --out enhanced.apk source.apk
```

### Check System Architecture:
```bash
uname -m  # aarch64 = ARM64, x86_64 = Intel/AMD
```

### Verify ReVanced Files:
```bash
ls -la /app/revanced-integration/official-aapt2-arm64/aapt2  # Must exist
/app/revanced-integration/official-aapt2-arm64/aapt2 version  # Must work
```

---

## 📊 FILE IMPORTANCE MATRIX

| File/Directory | Importance | Can Delete? | Purpose |
|----------------|------------|-------------|---------|
| `/app/revanced-integration/` | 🚨 CRITICAL | ❌ NEVER | ARM64 compilation solution |
| `/app/revanced-integration/official-aapt2-arm64/aapt2` | 🚨 CRITICAL | ❌ NEVER | Only working ARM64 AAPT2 |
| `/app/.github/workflows/ai-review.yml` | 🔴 HIGH | ⚠️ CAREFUL | Fixed workflow with Git auth |
| `/app/build-scripts/arm64-build.sh` | 🟡 MEDIUM | ⚠️ ASK USER | ARM64 build automation |
| `/app/AI-PRESERVATION-GUIDE.md` | 🟡 MEDIUM | ⚠️ ASK USER | AI knowledge preservation |

---

## 🎯 COMMON USER GOALS & SOLUTIONS

### Goal: "I want to build CleverFerret locally"
**Solution depends on architecture:**
- **ARM64 System**: Use ReVanced CLI with existing APK OR GitHub Actions
- **x86_64 System**: Standard Gradle build works fine

### Goal: "I want the newest features in the APK"  
**Best Solution**: GitHub Actions workflow (auto-builds on every push)
- Compiles latest source (v1.2-enhanced) 
- Works on x86_64 runners (no ARM64 issues)
- Includes all UI fixes and menu improvements

### Goal: "I need ARM64 compatible APK"
**Current Status**: ✅ Solved via ReVanced integration
- Local: ReVanced CLI processing
- GitHub: x86_64 runners produce ARM64-compatible APKs

### Goal: "Fix the build system"
**Check First**: 
1. What architecture is the user on?
2. Are ReVanced files intact?
3. Is GitHub Actions an option?

---

## 🔄 WORKFLOW AUTO-BUILD STATUS

### Current Configuration:
- ✅ **Triggers**: Every push to main/develop/master (except docs)
- ✅ **Artifacts**: APKs uploaded with 30-day retention
- ✅ **Repository**: APKs committed to `builds/` directory  
- ✅ **Notifications**: Rich build summaries in GitHub Actions
- ✅ **Manual Trigger**: `workflow_dispatch` available

### What Users Get:
- **Latest source code** compiled automatically
- **ARM64 compatibility** via x86_64 GitHub runners
- **Multi-architecture APKs** (ARM64, ARMv7, x86, x86_64)
- **AI code review** with auto-fixes applied

---

## 🧠 REASONING PATTERNS FOR AI

### Pattern 1: Architecture-First Thinking
```
User reports build issue → Check architecture → Recommend appropriate solution
```

### Pattern 2: Preserve-Then-Improve  
```
User wants changes → Verify ReVanced files safe → Make improvements
```

### Pattern 3: Latest-Features-Via-GitHub
```
User wants newest APK → Recommend GitHub Actions → Explain ARM64 limitations
```

---

## ⚠️ RED FLAGS - STOP AND ASK

### If user says any of these, STOP and understand their goal first:
- "Delete old files"
- "Clean up the project"  
- "Remove unnecessary tools"
- "Simplify the build system"
- "Why are there so many Android files?"

### Ask these questions:
1. "Are you trying to compile on an ARM64 system?"
2. "Do you need the latest source code features?" 
3. "Is GitHub Actions an option for you?"
4. "Do you understand the ARM64 compilation context?"

---

## 🎯 SUCCESS METRICS

### How to know you're helping correctly:
- ✅ User can build CleverFerret on their system
- ✅ ReVanced ARM64 tools are preserved and functional
- ✅ User understands GitHub Actions auto-build capability
- ✅ User gets APK with latest features (v1.2-enhanced)

### Warning signs you're going wrong:
- ❌ User reports AAPT2 errors after your help
- ❌ ReVanced files were deleted or moved
- ❌ GitHub Actions workflow broken
- ❌ User doesn't understand architecture implications

---

## 📞 EMERGENCY RECOVERY

### If ReVanced files are accidentally deleted:
1. **Download ARM64 AAPT2**: From lzhiyong/android-sdk-tools release
2. **Download ReVanced CLI**: From ReVanced/revanced-cli releases  
3. **Download ReVanced Patches**: From ReVanced/revanced-patches releases
4. **Recreate structure**: Follow `/app/revanced-integration/` layout
5. **Test immediately**: Run `./build-scripts/revanced-arm64-test.sh`

### If GitHub Actions breaks:
1. **Check Git auth**: Ensure GITHUB_TOKEN usage is correct
2. **Check Gemini API**: Ensure GEMINI_API_KEY is set
3. **Check Android setup**: Verify action parameters (not api-level/build-tools)
4. **Reference working version**: Use git history to restore `.github/workflows/ai-review.yml`

---

**🤖 Remember**: CleverFerret is more complex than typical Android projects due to ARM64 compatibility requirements. When in doubt, preserve the ReVanced integration and recommend GitHub Actions for reliable builds with latest features.
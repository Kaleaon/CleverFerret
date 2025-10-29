# CleverFerret - Repair Quick Start Guide

**For developers ready to fix the compilation errors**

This guide provides a step-by-step process to begin repairing CleverFerret's compilation errors.

---

## Prerequisites

Before starting repairs:

- [ ] Read `ASSESSMENT_SUMMARY.md` for complete context
- [ ] Review `BROKEN_FEATURES_LIST.md` to understand error categories
- [ ] Check `APP_PUBLICATION_READINESS.md` for detailed analysis
- [ ] Set up development environment (Android Studio, JDK 17)
- [ ] Clone and open the repository

---

## Setup Steps

### 1. Verify Current State

```bash
# Navigate to project
cd /path/to/CleverFerret

# Clean build
./gradlew clean

# Attempt build (will fail - this is expected)
./gradlew assembleDebug 2>&1 | tee build_errors.log

# Count errors by file
grep "^e: file" build_errors.log | \
  grep -oP '(?<=CleverFerret/src/main/java/).*?\.kt(?=:)' | \
  sort -u | wc -l
```

**Expected Result**: ~85 files with errors

### 2. Set Up Branch Protection (Important!)

Before making any changes:

```bash
# Create a repair branch
git checkout -b fix/compilation-errors

# Configure git to require successful builds (in CI/CD)
```

---

## Repair Strategy

Fix errors in this order for maximum impact:

### Phase 1: Data Models (Quickest Wins)
### Phase 2: ViewModels (Core Infrastructure)
### Phase 3: Services (Backend Logic)
### Phase 4: UI Components (Frontend)

---

## Phase 1: Fix Data Models (Days 1-3)

### Priority 1A: WebFiction Data Model Issues

**Problem**: ViewModel tries to use properties that don't exist

**Files to Check**:
- `services/webfiction/WebFictionModels.kt` (data models)
- `ui/webfiction/WebFictionViewModel.kt` (usage)
- `ui/webfiction/WebFictionManagerScreen.kt` (UI)

**Analysis**:
```bash
# Get specific errors
./gradlew assembleDebug 2>&1 | grep WebFictionViewModel.kt | head -20
```

**Common Issues**:
- Missing `chapters` property on `WebFictionStory`
- Missing `site`, `totalChapters`, `coverUrl` properties
- Type mismatches (String vs Enum, String vs Long)

**Decision Required**:
1. **Option A**: Add missing properties to data model
2. **Option B**: Fix ViewModel to use existing properties
3. **Option C**: Remove/disable web fiction features entirely

**Recommendation**: Option C initially - comment out web fiction to get core working

### Priority 1B: Podcast Data Model Issues

**Files to Check**:
- `services/podcast/PodcastModels.kt`
- `ui/podcast/PodcastViewModel.kt`
- Related podcast screens

**Same approach**: Consider disabling podcast features temporarily

### Priority 1C: Other Data Models

Check for similar issues in:
- `services/analysis/AnalysisModels.kt`
- `ui/reader/components/ReaderModels.kt`
- `services/metadata/MetadataServiceModels.kt`

---

## Phase 2: Fix ViewModels (Days 4-7)

### Priority 2A: Create Missing SettingsViewModel

**Critical**: This ViewModel is completely missing but referenced everywhere

**Files Affected**:
- `ui/settings/SettingsScreen.kt`
- `ui/settings/SecurityAndAboutScreens.kt`
- `ui/settings/ReaderSettingsScreen.kt`
- `ui/settings/ApiSettingsScreen.kt`

**Create File**: `CleverFerret/src/main/java/com/universalmedialibrary/ui/settings/SettingsViewModel.kt`

**Template**:
```kotlin
package com.universalmedialibrary.ui.settings

import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject

@HiltViewModel
class SettingsViewModel @Inject constructor(
    // Inject repositories as needed
) : ViewModel() {

    data class UiState(
        val generalSettings: GeneralSettings = GeneralSettings(),
        val securitySettings: SecuritySettings = SecuritySettings(),
        val isLoading: Boolean = false,
        val error: String? = null
    )

    data class GeneralSettings(
        val crashReportingEnabled: Boolean = false,
        val notificationsEnabled: Boolean = true,
        val importOnStartup: Boolean = false
    )

    data class SecuritySettings(
        val passwordProtectionEnabled: Boolean = false,
        val passwordHash: String? = null,
        val biometricEnabled: Boolean = false
    )

    private val _uiState = MutableStateFlow(UiState())
    val uiState: StateFlow<UiState> = _uiState.asStateFlow()

    fun updateGeneralSettings(settings: GeneralSettings) {
        _uiState.value = _uiState.value.copy(generalSettings = settings)
    }

    fun updateSecuritySettings(settings: SecuritySettings) {
        _uiState.value = _uiState.value.copy(securitySettings = settings)
    }
}
```

### Priority 2B: Fix Existing ViewModels

Review and fix compilation errors in:
- `APISettingsViewModel.kt`
- `BookshelfViewModel.kt`
- `BookDetailsViewModel.kt`
- `LibraryDetailsViewModel.kt`
- `MetadataEditorViewModel.kt`
- All player ViewModels
- All reader ViewModels

**Approach**: Check each for missing properties, wrong types, unresolved references

---

## Phase 3: Fix Services (Days 8-12)

### Priority 3A: Fix AudioPlaybackManager (CRITICAL)

**File**: `services/audio/AudioPlaybackManager.kt`

**Error**: Type inference failure

**Location**: Line 87

**Analysis**:
```bash
./gradlew assembleDebug 2>&1 | grep AudioPlaybackManager.kt
```

**Common Cause**: Generic type not specified or incompatible types

**Example Fix Patterns**:
```kotlin
// Bad (type inference fails)
val result = someGenericMethod()

// Good (type specified)
val result = someGenericMethod<ExpectedType>()

// Or provide type hint
val result: ExpectedType = someGenericMethod()
```

### Priority 3B: Fix Core Services

Fix in this order:
1. `MediaScannerService.kt` - Needed for file system
2. `StorageAccessService.kt` - Needed for file system
3. `CalibreImportService.kt` - Needed for import

### Priority 3C: Consider Disabling Advanced Services

**Temporarily comment out or stub**:
- AI/ML services (GeminiService, GemmaLLMService, etc.)
- Content creation services (FanfictionConverter, NewsConverter, etc.)
- Integration services (PlexApi, IntegrationManager, etc.)

**Rationale**: Get core working first, add advanced features later

---

## Phase 4: Fix UI Components (Days 13-16)

### Priority 4A: Fix MainActivity

**File**: `MainActivity.kt`

**Critical**: App won't launch if MainActivity has errors

**Check**:
- Navigation routes defined correctly
- All screens properly imported
- ViewModel injection correct

### Priority 4B: Fix Core Screens

Fix in priority order:
1. Library management screens (essential)
2. Bookshelf/browsing screens (essential)
3. Reader screens (essential)
4. Player screens (important)
5. Settings screens (after ViewModel created)
6. Advanced feature screens (lower priority)

### Priority 4C: Property Delegate Issues

**Common Pattern**:
```kotlin
// Error: Cannot infer type
val uiState by viewModel.uiState.collectAsState()

// Fix: Provide type
val uiState by viewModel.uiState.collectAsState(initial = UiState())

// Or use different pattern
val uiState = viewModel.uiState.collectAsState()
```

---

## Testing After Each Phase

### After Each Fix:

```bash
# Attempt build
./gradlew assembleDebug

# Count remaining errors
./gradlew assembleDebug 2>&1 | grep "^e: file" | \
  grep -oP '(?<=CleverFerret/src/main/java/).*?\.kt(?=:)' | \
  sort -u | wc -l

# Commit progress
git add .
git commit -m "fix: [category] - fixed X files, Y remain"
git push
```

### After Phase 1:
- [ ] Data model errors resolved
- [ ] ~25 fewer errors
- [ ] ~60 errors remaining

### After Phase 2:
- [ ] ViewModel errors resolved
- [ ] ~40 fewer errors total
- [ ] ~45 errors remaining

### After Phase 3:
- [ ] Service errors resolved
- [ ] ~65 fewer errors total
- [ ] ~20 errors remaining

### After Phase 4:
- [ ] All compilation errors resolved
- [ ] **BUILD SUCCEEDS** ✅
- [ ] APK generated ✅

---

## First Successful Build Checklist

Once the build succeeds:

- [ ] Generate debug APK: `./gradlew assembleDebug`
- [ ] Locate APK: `CleverFerret/build/outputs/apk/debug/`
- [ ] Install on device: `adb install CleverFerret-debug.apk`
- [ ] Launch app
- [ ] Test basic functionality:
  - [ ] App launches without crashing
  - [ ] Main screen displays
  - [ ] Can navigate to library screen
  - [ ] Can navigate to settings
- [ ] Document what works vs what's broken
- [ ] Create issues for discovered bugs
- [ ] Celebrate first successful build! 🎉

---

## Common Pitfalls to Avoid

### 1. Fixing Symptoms Instead of Root Causes
- **Bad**: Add missing properties without understanding why
- **Good**: Understand data flow, fix architecture if needed

### 2. Quick Fixes That Break Other Things
- **Bad**: Change types to make one error go away
- **Good**: Check all usages, ensure consistency

### 3. Not Testing After Changes
- **Bad**: Fix 10 files then try to build
- **Good**: Fix 2-3 files, build, verify progress

### 4. Adding New Features Before Fixing Existing
- **Bad**: "Let me add this cool feature while I'm here"
- **Good**: Focus solely on fixing compilation until build succeeds

### 5. Not Documenting Decisions
- **Bad**: Silently remove/change features
- **Good**: Document what was removed and why

---

## Decision Log Template

Keep track of major decisions:

```markdown
## Decision: [Date]

### Context
What problem were you solving?

### Options Considered
1. Option A: ...
2. Option B: ...
3. Option C: ...

### Decision
Chose Option X because...

### Consequences
- Positive: ...
- Negative: ...
- Mitigation: ...
```

---

## Getting Help

### If You Get Stuck:

1. **Check existing documentation**:
   - `BROKEN_FEATURES_LIST.md` for error details
   - `APP_PUBLICATION_READINESS.md` for context

2. **Analyze the specific error**:
   ```bash
   # Get all errors for a specific file
   ./gradlew assembleDebug 2>&1 | grep "YourFile.kt"
   ```

3. **Look for similar patterns**:
   - How are similar features implemented?
   - What works vs what's broken?

4. **Consider simplification**:
   - Can the feature be disabled temporarily?
   - Can it be implemented more simply?

5. **Ask for help**:
   - Create a GitHub issue with details
   - Include error messages and attempted solutions

---

## Progress Tracking

Use this checklist to track repair progress:

### Data Models (Phase 1)
- [ ] WebFiction models fixed/disabled
- [ ] Podcast models fixed/disabled
- [ ] Analysis models fixed/disabled
- [ ] Reader models fixed/disabled
- [ ] Other data models fixed

### ViewModels (Phase 2)
- [ ] SettingsViewModel created
- [ ] APISettingsViewModel fixed
- [ ] WebFictionViewModel fixed/disabled
- [ ] PodcastViewModel fixed/disabled
- [ ] BookshelfViewModel fixed
- [ ] BookDetailsViewModel fixed
- [ ] LibraryViewModels fixed
- [ ] MetadataEditorViewModel fixed
- [ ] Player ViewModels fixed
- [ ] Reader ViewModels fixed

### Services (Phase 3)
- [ ] AudioPlaybackManager fixed (CRITICAL)
- [ ] MediaScannerService fixed
- [ ] StorageAccessService fixed
- [ ] CalibreImportService fixed
- [ ] Advanced services fixed/disabled

### UI Components (Phase 4)
- [ ] MainActivity fixed
- [ ] Library screens fixed
- [ ] Bookshelf screens fixed
- [ ] Reader screens fixed
- [ ] Player screens fixed
- [ ] Settings screens fixed
- [ ] Advanced feature screens fixed/disabled

### Final Verification
- [ ] Build succeeds
- [ ] APK generated
- [ ] APK installs
- [ ] App launches
- [ ] Core features testable

---

## Success Criteria

You'll know you're done with repairs when:

✅ `./gradlew assembleDebug` succeeds  
✅ No compilation errors  
✅ APK generated in build outputs  
✅ APK installs on device  
✅ App launches without immediate crash  

**At that point**, move on to testing and bug fixing (different phase).

---

## Estimated Timeline

**If working full-time**:
- Week 1: Data models + ViewModels
- Week 2: Services + UI components
- Week 3: Testing + bug fixes
- Week 4: Verification + documentation

**If working part-time (10-20 hrs/week)**:
- Weeks 1-2: Data models
- Weeks 3-4: ViewModels
- Weeks 5-6: Services
- Weeks 7-8: UI components
- Weeks 9-10: Testing + verification

---

## Next Steps After Compilation Fixed

Once the app compiles successfully:

1. **Test Core Functionality** - See what actually works
2. **Fix Critical Bugs** - Address crashes and blockers
3. **Complete MVP Features** - Implement missing essentials
4. **Document Status** - Update docs to reflect reality
5. **Plan Next Phase** - Enhancements and polish

**See**: `FEATURES_TO_IMPLEMENT.md` for post-compilation roadmap

---

## Quick Reference Commands

```bash
# Clean build
./gradlew clean

# Build debug
./gradlew assembleDebug

# Count remaining errors
./gradlew assembleDebug 2>&1 | grep "^e: file" | wc -l

# Errors by file
./gradlew assembleDebug 2>&1 | \
  grep "^e: file" | \
  grep -oP '(?<=CleverFerret/src/main/java/).*?\.kt(?=:)' | \
  sort -u

# Errors for specific file
./gradlew assembleDebug 2>&1 | grep "YourFile.kt"

# Install APK
adb install CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk

# View logs
adb logcat | grep CleverFerret
```

---

**Remember**: This is a marathon, not a sprint. Focus on systematic progress, test frequently, and celebrate small wins along the way.

Good luck! 🚀

# Critical Fixes Needed

## Issue 1: Theme Not Applied to New Screens ❌

### Problem
Both `MediaServerSettingsScreen` and `NetworkStorageSettingsScreen` do not wrap their content with `CleverFerretTheme`, which means:
- User-selected themes won't apply
- Dark/light mode won't work
- Screens will use default Material 3 theme instead of custom metallic themes

### Solution Required
Wrap the Scaffold content with CleverFerretTheme and access theme settings from ViewModel or Settings repository.

### Files to Fix
1. `MediaServerSettingsScreen.kt`
2. `NetworkStorageSettingsScreen.kt`

## Issue 2: Theme State Management

### Problem
The new screens need access to the current theme and dark mode settings to apply them correctly.

### Solution Options
1. Pass theme settings as parameters from MainActivity
2. Access SettingsViewModel to get current theme
3. Use a shared theme repository

### Recommended Approach
Access the theme settings through dependency injection or shared preferences.

## Issue 3: Potential Missing Features

### Areas to Verify
1. ✅ Navigation routes added
2. ✅ Menu items added
3. ❌ Theme application
4. ⚠️  Error handling in ViewModels
5. ⚠️  Data persistence verification
6. ⚠️  API timeout handling
7. ⚠️  Form validation
8. ⚠️  Connection testing reliability

## Priority Fixes

### High Priority (Must Fix)
1. **Theme Application** - Add CleverFerretTheme wrapper to both screens
2. **Theme State Access** - Ensure screens can access current theme settings

### Medium Priority (Should Fix)
3. Error handling improvements
4. Loading state management
5. Form validation enhancement

### Low Priority (Nice to Have)
6. Performance optimizations
7. Additional test coverage
8. UI polish

## Next Steps
1. Fix theme application immediately
2. Test theme switching
3. Verify all 12 theme palettes work
4. Test dark/light mode
5. Create comprehensive test scenarios
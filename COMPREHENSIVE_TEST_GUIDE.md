# Comprehensive Test Guide

## Overview
This guide provides detailed test scenarios for the media server and network storage integration, including theme testing, navigation testing, and feature testing.

## Test Environment Setup

### Prerequisites
1. Android device or emulator (API 36+)
2. CleverFerret app installed
3. Access to test media servers (Jellyfin/Plex/Emby) - optional
4. Access to test network storage (SMB/WebDAV) - optional

### Build and Install
```bash
cd CleverFerret
./gradlew :CleverFerret:assembleDebug
./gradlew :CleverFerret:installDebug
```

## Phase 1: Theme Testing

### Test 1.1: Theme Application on Media Server Screen
**Objective**: Verify all 12 themes apply correctly to MediaServerSettingsScreen

**Steps**:
1. Open CleverFerret app
2. Navigate to Settings
3. Change theme to each of the 12 available themes:
   - Navy Gold
   - Emerald Silver
   - Ruby Platinum
   - Sapphire Bronze
   - Amethyst Steel
   - Topaz Copper
   - Jade Iron
   - Opal Titanium
   - Garnet Zinc
   - Turquoise Aluminum
   - Coral Brass
   - Onyx Chrome
4. For each theme, navigate to Settings → Media Servers
5. Verify the screen uses the selected theme colors

**Expected Results**:
- ✅ Top app bar uses theme primary color
- ✅ Cards use theme surface colors
- ✅ Text uses theme text colors
- ✅ Buttons use theme accent colors
- ✅ Icons use theme icon colors

**Pass Criteria**: All 12 themes display correctly with proper colors

### Test 1.2: Theme Application on Network Storage Screen
**Objective**: Verify all 12 themes apply correctly to NetworkStorageSettingsScreen

**Steps**:
1. Repeat Test 1.1 steps but navigate to Settings → Network Storage instead
2. Verify theme application for all 12 themes

**Expected Results**: Same as Test 1.1

**Pass Criteria**: All 12 themes display correctly with proper colors

### Test 1.3: Dark/Light Mode Switching
**Objective**: Verify dark and light modes work correctly

**Steps**:
1. Open Settings
2. Enable Dark Mode
3. Navigate to Media Servers - verify dark theme
4. Navigate back to Settings
5. Navigate to Network Storage - verify dark theme
6. Navigate back to Settings
7. Disable Dark Mode
8. Navigate to Media Servers - verify light theme
9. Navigate back to Settings
10. Navigate to Network Storage - verify light theme

**Expected Results**:
- ✅ Dark mode applies dark colors throughout
- ✅ Light mode applies light colors throughout
- ✅ Text remains readable in both modes
- ✅ Contrast is appropriate in both modes

**Pass Criteria**: Both modes work correctly on all screens

### Test 1.4: Theme Persistence
**Objective**: Verify theme settings persist across app restarts

**Steps**:
1. Select a specific theme (e.g., Emerald Silver)
2. Enable Dark Mode
3. Navigate to Media Servers
4. Close the app completely
5. Reopen the app
6. Navigate to Settings → Media Servers

**Expected Results**:
- ✅ Selected theme is still applied
- ✅ Dark mode is still enabled
- ✅ Media Servers screen shows correct theme

**Pass Criteria**: Theme settings persist correctly

## Phase 2: Navigation Testing

### Test 2.1: Basic Navigation Flow
**Objective**: Verify navigation works correctly

**Steps**:
1. Open app
2. Navigate to Settings
3. Scroll to find "Media Servers" section
4. Tap "Media Servers" card
5. Verify MediaServerSettingsScreen opens
6. Tap back button
7. Verify return to Settings
8. Scroll to find "Network Storage" section
9. Tap "Network Storage" card
10. Verify NetworkStorageSettingsScreen opens
11. Tap back button
12. Verify return to Settings

**Expected Results**:
- ✅ Navigation is smooth and instant
- ✅ Back button works correctly
- ✅ No crashes or errors
- ✅ Screens load properly

**Pass Criteria**: All navigation works without issues

### Test 2.2: Navigation State Preservation
**Objective**: Verify navigation state is preserved

**Steps**:
1. Navigate to Settings → Media Servers
2. Scroll down in the list
3. Tap back button
4. Navigate to Settings → Media Servers again
5. Check scroll position

**Expected Results**:
- ✅ Scroll position may reset (expected behavior)
- ✅ No crashes
- ✅ Screen loads correctly

**Pass Criteria**: Navigation state handling is correct

### Test 2.3: Deep Navigation
**Objective**: Test navigation through multiple levels

**Steps**:
1. Navigate: Home → Settings → Media Servers
2. Tap back button three times
3. Verify return to home screen
4. Navigate: Home → Settings → Network Storage
5. Tap back button three times
6. Verify return to home screen

**Expected Results**:
- ✅ Back stack is maintained correctly
- ✅ Each back press goes to previous screen
- ✅ No navigation loops or stuck states

**Pass Criteria**: Deep navigation works correctly

## Phase 3: Media Server Feature Testing

### Test 3.1: Add Jellyfin Server
**Objective**: Test adding a Jellyfin server

**Steps**:
1. Navigate to Settings → Media Servers
2. Tap the "+" FAB button
3. Select "Jellyfin" from dropdown
4. Enter server details:
   - Name: "Test Jellyfin"
   - URL: "http://test.jellyfin.local:8096"
   - Username: "testuser"
   - Password: "testpass"
5. Tap "Test Connection"
6. Tap "Add" button

**Expected Results**:
- ✅ Dialog opens correctly
- ✅ All fields are editable
- ✅ Server type dropdown works
- ✅ Test connection provides feedback
- ✅ Server is added to list
- ✅ Server card displays correctly

**Pass Criteria**: Server can be added successfully

### Test 3.2: Add Plex Server
**Objective**: Test adding a Plex server

**Steps**:
1. Navigate to Settings → Media Servers
2. Tap the "+" FAB button
3. Select "Plex" from dropdown
4. Enter server details:
   - Name: "Test Plex"
   - URL: "http://test.plex.local:32400"
   - Token: "test-token-123"
5. Tap "Test Connection"
6. Tap "Add" button

**Expected Results**: Same as Test 3.1

**Pass Criteria**: Server can be added successfully

### Test 3.3: Add Emby Server
**Objective**: Test adding an Emby server

**Steps**:
1. Navigate to Settings → Media Servers
2. Tap the "+" FAB button
3. Select "Emby" from dropdown
4. Enter server details:
   - Name: "Test Emby"
   - URL: "http://test.emby.local:8096"
   - API Key: "test-api-key-123"
5. Tap "Test Connection"
6. Tap "Add" button

**Expected Results**: Same as Test 3.1

**Pass Criteria**: Server can be added successfully

### Test 3.4: Edit Server
**Objective**: Test editing an existing server

**Steps**:
1. Add a server (any type)
2. Tap the "Edit" button on the server card
3. Modify the server name
4. Tap "Save"

**Expected Results**:
- ✅ Edit dialog opens with current values
- ✅ Changes are saved
- ✅ Server card updates with new name

**Pass Criteria**: Server can be edited successfully

### Test 3.5: Delete Server
**Objective**: Test deleting a server

**Steps**:
1. Add a server (any type)
2. Tap the "Delete" button on the server card
3. Confirm deletion

**Expected Results**:
- ✅ Confirmation dialog appears
- ✅ Server is removed from list
- ✅ No crashes

**Pass Criteria**: Server can be deleted successfully

### Test 3.6: Test Connection - Success
**Objective**: Test connection testing with valid credentials

**Steps**:
1. Add a server with valid credentials
2. Tap "Test Connection"

**Expected Results**:
- ✅ Loading indicator appears
- ✅ Success message displays
- ✅ Connection status updates

**Pass Criteria**: Connection test works correctly

### Test 3.7: Test Connection - Failure
**Objective**: Test connection testing with invalid credentials

**Steps**:
1. Add a server with invalid URL or credentials
2. Tap "Test Connection"

**Expected Results**:
- ✅ Loading indicator appears
- ✅ Error message displays
- ✅ Error is descriptive

**Pass Criteria**: Connection test handles errors correctly

## Phase 4: Network Storage Feature Testing

### Test 4.1: Add SMB Storage
**Objective**: Test adding SMB/CIFS storage

**Steps**:
1. Navigate to Settings → Network Storage
2. Tap the "+" FAB button
3. Select "SMB/CIFS" from dropdown
4. Enter storage details:
   - Name: "Test NAS"
   - Host: "192.168.1.100"
   - Share: "media"
   - Username: "testuser"
   - Password: "testpass"
5. Tap "Test Connection"
6. Tap "Add" button

**Expected Results**:
- ✅ Dialog opens correctly
- ✅ All fields are editable
- ✅ Storage type dropdown works
- ✅ Test connection provides feedback
- ✅ Storage is added to list
- ✅ Storage card displays correctly

**Pass Criteria**: SMB storage can be added successfully

### Test 4.2: Add WebDAV Storage
**Objective**: Test adding WebDAV storage

**Steps**:
1. Navigate to Settings → Network Storage
2. Tap the "+" FAB button
3. Select "WebDAV" from dropdown
4. Enter storage details:
   - Name: "Test WebDAV"
   - URL: "https://webdav.example.com"
   - Username: "testuser"
   - Password: "testpass"
5. Tap "Test Connection"
6. Tap "Add" button

**Expected Results**: Same as Test 4.1

**Pass Criteria**: WebDAV storage can be added successfully

### Test 4.3: Edit Storage
**Objective**: Test editing existing storage

**Steps**:
1. Add a storage configuration
2. Tap the "Edit" button on the storage card
3. Modify the storage name
4. Tap "Save"

**Expected Results**:
- ✅ Edit dialog opens with current values
- ✅ Changes are saved
- ✅ Storage card updates with new name

**Pass Criteria**: Storage can be edited successfully

### Test 4.4: Delete Storage
**Objective**: Test deleting storage

**Steps**:
1. Add a storage configuration
2. Tap the "Delete" button on the storage card
3. Confirm deletion

**Expected Results**:
- ✅ Confirmation dialog appears
- ✅ Storage is removed from list
- ✅ No crashes

**Pass Criteria**: Storage can be deleted successfully

## Phase 5: Error Handling & Edge Cases

### Test 5.1: Empty Fields Validation
**Objective**: Test form validation

**Steps**:
1. Try to add a server with empty name
2. Try to add a server with empty URL
3. Try to add storage with empty host

**Expected Results**:
- ✅ Validation errors display
- ✅ Add button is disabled or shows error
- ✅ User is guided to fix errors

**Pass Criteria**: Form validation works correctly

### Test 5.2: Invalid URL Format
**Objective**: Test URL validation

**Steps**:
1. Try to add a server with invalid URL format
2. Examples: "not-a-url", "ftp://wrong-protocol"

**Expected Results**:
- ✅ Validation error displays
- ✅ Error message is clear
- ✅ User can correct the error

**Pass Criteria**: URL validation works correctly

### Test 5.3: Network Timeout
**Objective**: Test timeout handling

**Steps**:
1. Add a server with unreachable URL
2. Tap "Test Connection"
3. Wait for timeout

**Expected Results**:
- ✅ Loading indicator shows
- ✅ Timeout occurs within reasonable time (30s)
- ✅ Error message displays
- ✅ UI remains responsive

**Pass Criteria**: Timeout handling works correctly

### Test 5.4: Special Characters
**Objective**: Test special character handling

**Steps**:
1. Add a server with special characters in name: "Test@Server#1"
2. Add a server with special characters in password: "P@ssw0rd!#$"

**Expected Results**:
- ✅ Special characters are accepted
- ✅ Data is saved correctly
- ✅ No encoding issues

**Pass Criteria**: Special characters are handled correctly

### Test 5.5: Very Long Inputs
**Objective**: Test input length limits

**Steps**:
1. Try to enter very long server name (500+ characters)
2. Try to enter very long URL (1000+ characters)

**Expected Results**:
- ✅ Input is limited or handled gracefully
- ✅ UI doesn't break
- ✅ Error message if too long

**Pass Criteria**: Long inputs are handled correctly

### Test 5.6: Concurrent Operations
**Objective**: Test multiple simultaneous operations

**Steps**:
1. Add multiple servers quickly
2. Test connections on multiple servers simultaneously
3. Delete servers while testing connections

**Expected Results**:
- ✅ Operations queue correctly
- ✅ No race conditions
- ✅ No crashes
- ✅ UI remains responsive

**Pass Criteria**: Concurrent operations work correctly

## Phase 6: Data Persistence Testing

### Test 6.1: Server Persistence
**Objective**: Verify servers persist across app restarts

**Steps**:
1. Add 3 different servers (Jellyfin, Plex, Emby)
2. Close app completely
3. Reopen app
4. Navigate to Settings → Media Servers

**Expected Results**:
- ✅ All 3 servers are still present
- ✅ Server details are correct
- ✅ Server order is maintained

**Pass Criteria**: Servers persist correctly

### Test 6.2: Storage Persistence
**Objective**: Verify storage configs persist across app restarts

**Steps**:
1. Add 2 storage configs (SMB and WebDAV)
2. Close app completely
3. Reopen app
4. Navigate to Settings → Network Storage

**Expected Results**:
- ✅ Both storage configs are still present
- ✅ Storage details are correct
- ✅ Storage order is maintained

**Pass Criteria**: Storage configs persist correctly

### Test 6.3: Data Integrity After Updates
**Objective**: Verify data integrity after editing

**Steps**:
1. Add a server
2. Edit the server multiple times
3. Close and reopen app
4. Verify server details

**Expected Results**:
- ✅ Latest changes are saved
- ✅ No data corruption
- ✅ All fields are correct

**Pass Criteria**: Data integrity is maintained

## Phase 7: Performance Testing

### Test 7.1: Large Server List
**Objective**: Test performance with many servers

**Steps**:
1. Add 20+ servers
2. Scroll through the list
3. Test connections on multiple servers
4. Edit and delete servers

**Expected Results**:
- ✅ List scrolls smoothly
- ✅ No lag or stuttering
- ✅ Operations complete in reasonable time
- ✅ Memory usage is acceptable

**Pass Criteria**: Performance is acceptable with large lists

### Test 7.2: Rapid Navigation
**Objective**: Test performance with rapid navigation

**Steps**:
1. Rapidly navigate: Settings → Media Servers → Back → Media Servers → Back
2. Repeat 10 times
3. Check for memory leaks

**Expected Results**:
- ✅ Navigation remains smooth
- ✅ No crashes
- ✅ No memory leaks
- ✅ UI remains responsive

**Pass Criteria**: Rapid navigation works correctly

## Phase 8: UI/UX Testing

### Test 8.1: Loading States
**Objective**: Verify loading indicators work correctly

**Steps**:
1. Test connection on a server
2. Observe loading indicator
3. Add a server
4. Observe loading state

**Expected Results**:
- ✅ Loading indicators appear
- ✅ Indicators are visible and clear
- ✅ UI is disabled during loading
- ✅ Loading completes or times out

**Pass Criteria**: Loading states work correctly

### Test 8.2: Error Messages
**Objective**: Verify error messages are clear and helpful

**Steps**:
1. Trigger various errors (invalid URL, connection failure, etc.)
2. Read error messages

**Expected Results**:
- ✅ Error messages are clear
- ✅ Messages explain what went wrong
- ✅ Messages suggest how to fix
- ✅ Messages are user-friendly

**Pass Criteria**: Error messages are helpful

### Test 8.3: Empty States
**Objective**: Verify empty states are handled well

**Steps**:
1. Navigate to Media Servers with no servers added
2. Navigate to Network Storage with no storage added

**Expected Results**:
- ✅ Empty state message displays
- ✅ Message is encouraging
- ✅ Call-to-action is clear
- ✅ UI looks good

**Pass Criteria**: Empty states are handled well

## Test Results Template

### Test Execution Summary
- **Date**: [Date]
- **Tester**: [Name]
- **Build**: [Version]
- **Device**: [Device Model]
- **Android Version**: [Version]

### Results
| Test ID | Test Name | Status | Notes |
|---------|-----------|--------|-------|
| 1.1 | Theme Application - Media Server | ⬜ Pass / ⬜ Fail | |
| 1.2 | Theme Application - Network Storage | ⬜ Pass / ⬜ Fail | |
| 1.3 | Dark/Light Mode Switching | ⬜ Pass / ⬜ Fail | |
| ... | ... | ... | |

### Issues Found
1. [Issue description]
2. [Issue description]

### Overall Assessment
- **Total Tests**: [Number]
- **Passed**: [Number]
- **Failed**: [Number]
- **Pass Rate**: [Percentage]

### Recommendations
1. [Recommendation]
2. [Recommendation]

---

**Note**: This is a comprehensive test guide. Not all tests may be applicable depending on available test resources (servers, storage, etc.). Focus on critical path tests first, then expand to edge cases and performance tests.
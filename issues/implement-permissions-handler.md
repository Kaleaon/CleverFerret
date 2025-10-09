### Title
Implement Permissions Handler

### Body
**Parent Issue**: Phase 1: Make It Work - Core Infrastructure  
**Priority**: 🔴 CRITICAL  
**Estimate**: 1 day

## Description
The app currently has no permission requests, which means it cannot access any media files on the device. We need to implement proper permission handling for both Android 13+ and earlier versions.

## Technical Requirements

### Permissions Needed
**Android 13+ (API 33+):**
- READ_MEDIA_IMAGES
- READ_MEDIA_VIDEO
- READ_MEDIA_AUDIO

**Android 12 and below:**
- READ_EXTERNAL_STORAGE
- WRITE_EXTERNAL_STORAGE

### Implementation

```kotlin
@Composable
fun PermissionsHandler(
    onPermissionsGranted: () -> Unit
) {
    val permissionsToRequest = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
        listOf(
            Manifest.permission.READ_MEDIA_IMAGES,
            Manifest.permission.READ_MEDIA_VIDEO,
            Manifest.permission.READ_MEDIA_AUDIO
        )
    } else {
        listOf(
            Manifest.permission.READ_EXTERNAL_STORAGE,
            Manifest.permission.WRITE_EXTERNAL_STORAGE
        )
    }
    
    val launcher = rememberLauncherForActivityResult(
        ActivityResultContracts.RequestMultiplePermissions()
    ) { permissions ->
        if (permissions.all { it.value }) {
            onPermissionsGranted()
        }
    }
    
    LaunchedEffect(Unit) {
        launcher.launch(permissionsToRequest.toTypedArray())
    }
}
```

## Tasks
- [ ] Add permission declarations to AndroidManifest.xml
- [ ] Create PermissionsHandler composable
- [ ] Integrate with MainActivity
- [ ] Handle permission denial scenarios
- [ ] Add permission rationale UI
- [ ] Test on Android 13+ and earlier versions

## Success Criteria
- App requests appropriate permissions on first launch
- Permissions persist across app restarts
- Graceful handling of denied permissions
- Works on Android 8+ through Android 14+

## References
- See GAP_ANALYSIS.txt section 15
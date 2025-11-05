# Extended Screen Timeout Feature

## Overview

CleverFerret now includes an extended screen timeout feature inspired by [ProseReader](https://codeberg.org/timurmobi/prosereader-android.git). This feature allows readers to keep their screen on for extended periods while reading, overriding the system's default screen timeout setting.

## Features

### 1. Configurable Timeout Duration
- **Options**: System default, 1, 2, 5, 10, 15, 30, or 60 minutes
- **Default**: 5 minutes
- **Range**: 0 (system default) to 60 minutes

### 2. User Interaction Detection
- Automatically resets the timeout timer on any user interaction
- Prevents screen from turning off while actively reading

### 3. Per-Screen Management
- Each reader screen can independently manage screen timeout
- Automatically cleans up when leaving the reader

## User Configuration

### Accessing Settings

1. Open **Settings** from the navigation menu
2. Navigate to the **E-Reader** tab
3. Enable **Keep Screen On**
4. Select desired **Screen Timeout** duration from the dropdown

### Setting Options

| Option | Duration | Use Case |
|--------|----------|----------|
| System default | OS setting | Use device's configured timeout |
| 1 minute | 60 seconds | Quick reading sessions |
| 2 minutes | 120 seconds | Short articles |
| 5 minutes | 300 seconds | Standard reading (default) |
| 10 minutes | 600 seconds | Longer reading sessions |
| 15 minutes | 900 seconds | Extended reading |
| 30 minutes | 1800 seconds | Long-form content |
| 60 minutes | 3600 seconds | Maximum duration |

## Technical Implementation

### Architecture

The feature consists of three main components:

1. **ScreenTimeoutManager** (`utils/ScreenTimeoutManager.kt`)
   - Core utility class managing screen timeout behavior
   - Uses `WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON`
   - Handler-based timeout mechanism
   - User interaction tracking

2. **ReaderScreenTimeoutEffect** (`utils/ScreenTimeoutEffect.kt`)
   - Composable effect for Jetpack Compose integration
   - Automatic lifecycle management
   - DisposableEffect for cleanup

3. **Settings Integration**
   - DataStore persistence (`ReadiumPreferencesStore.kt`)
   - UI controls (`SettingsDialog.kt`)
   - Model updates (`AppSettingsModels.kt`)

### For Developers

#### Integrating with Reader Screens

Add the following to any reader screen composable:

```kotlin
import com.universalmedialibrary.utils.ReaderScreenTimeoutEffect
import com.universalmedialibrary.data.preferences.ReadiumPreferencesStore
import androidx.hilt.navigation.compose.hiltViewModel

@Composable
fun YourReaderScreen() {
    val preferencesStore: ReadiumPreferencesStore = // inject via Hilt
    val globalPrefs by preferencesStore.globalPreferences.collectAsState(
        initial = GlobalPreferences()
    )
    
    // Apply screen timeout settings
    ReaderScreenTimeoutEffect(
        enabled = globalPrefs.keepScreenOn,
        timeoutMinutes = globalPrefs.screenTimeoutMinutes
    )
    
    // Rest of your reader UI...
}
```

#### Manual Integration

For non-Compose screens or custom implementations:

```kotlin
class CustomReaderActivity : Activity() {
    private lateinit var screenTimeoutManager: ScreenTimeoutManager
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Initialize manager
        screenTimeoutManager = ScreenTimeoutManager(this)
        
        // Configure from preferences
        screenTimeoutManager.setEnabled(true)
        screenTimeoutManager.setTimeoutMinutes(10)
        screenTimeoutManager.setKeepScreenOn(true)
    }
    
    override fun onUserInteraction() {
        super.onUserInteraction()
        screenTimeoutManager.onUserInteraction()
    }
    
    override fun onDestroy() {
        super.onDestroy()
        screenTimeoutManager.cleanup()
    }
}
```

## Inspiration

This feature was inspired by the ProseReader Android app's screen timeout implementation:
- Repository: https://codeberg.org/timurmobi/prosereader-android.git
- Key inspiration: Extended screen timeout with user interaction detection
- Lines 109, 1231-1234, 1466-1488 in ProseActivity.java

## Future Enhancements

Potential improvements for future versions:

1. **Brightness Control**
   - Per-reader brightness override
   - Automatic brightness adjustment based on ambient light
   - Custom brightness profiles

2. **Smart Timeout**
   - Adjust timeout based on reading speed
   - Pause timeout when user stops scrolling
   - Different timeouts for different media types

3. **Battery Optimization**
   - Warn users about battery impact
   - Automatic disable on low battery
   - Integration with Android's battery saver mode

## Troubleshooting

### Screen Still Times Out

**Issue**: Screen turns off despite setting being enabled

**Solutions**:
1. Check that "Keep Screen On" is enabled in Settings > E-Reader
2. Verify the timeout duration is not set to "System default"
3. Ensure the app has not been put in the background
4. Check Android's battery optimization settings for CleverFerret

### Settings Not Persisting

**Issue**: Screen timeout settings reset after closing the app

**Solutions**:
1. Grant necessary storage permissions to the app
2. Check that app data is not being cleared automatically
3. Verify DataStore is working properly (check app logs)

## Contributing

To report issues or suggest improvements:
1. Open an issue on GitHub
2. Include device model and Android version
3. Describe expected vs. actual behavior
4. Provide logs if possible

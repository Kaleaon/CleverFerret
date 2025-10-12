# Navigation Integration Guide

This guide provides step-by-step instructions to complete the remaining 5% of the CleverFerret integration project by adding navigation support for the new settings screens.

## Overview

Two new settings screens have been created but are not yet accessible from the app:
1. **MediaServerSettingsScreen** - Configure Jellyfin, Plex, and Emby servers
2. **NetworkStorageSettingsScreen** - Configure SMB/CIFS and WebDAV storage

## Step 1: Locate Navigation Files

Find the navigation configuration file in your project. It's typically located at:
```
CleverFerret/src/main/java/com/universalmedialibrary/ui/navigation/Navigation.kt
```

Or it might be in:
```
CleverFerret/src/main/java/com/universalmedialibrary/MainActivity.kt
```

## Step 2: Add Navigation Routes

Add these two routes to your navigation graph:

```kotlin
// In your NavHost composable
composable("media_servers") {
    MediaServerSettingsScreen(
        onBack = { navController.popBackStack() }
    )
}

composable("network_storage") {
    NetworkStorageSettingsScreen(
        onBack = { navController.popBackStack() }
    )
}
```

## Step 3: Add Import Statements

Make sure to add these imports at the top of your navigation file:

```kotlin
import com.universalmedialibrary.ui.settings.MediaServerSettingsScreen
import com.universalmedialibrary.ui.settings.NetworkStorageSettingsScreen
```

## Step 4: Update Settings Screen

Locate your main settings screen file:
```
CleverFerret/src/main/java/com/universalmedialibrary/ui/settings/SettingsScreen.kt
```

Add menu items for the new features. Look for where other settings items are defined and add:

```kotlin
// Add these items in your settings list

// Media Servers Section
item {
    MetallicText(
        text = "Media Servers",
        style = MaterialTheme.typography.titleMedium,
        modifier = Modifier.padding(vertical = 8.dp)
    )
}

item {
    MetallicCard(
        onClick = { navController.navigate("media_servers") }
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = "Media Servers",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = "Configure Jellyfin, Plex, and Emby",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = "Navigate"
            )
        }
    }
}

// Network Storage Section
item {
    MetallicText(
        text = "Network Storage",
        style = MaterialTheme.typography.titleMedium,
        modifier = Modifier.padding(vertical = 8.dp)
    )
}

item {
    MetallicCard(
        onClick = { navController.navigate("network_storage") }
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = "Network Storage",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = "Configure SMB/CIFS and WebDAV",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = "Navigate"
            )
        }
    }
}
```

## Step 5: Add NavController Parameter

If your SettingsScreen doesn't already have a navController parameter, add it:

```kotlin
@Composable
fun SettingsScreen(
    onBack: () -> Unit,
    navController: NavController, // Add this if not present
    viewModel: SettingsViewModel = hiltViewModel()
) {
    // ... rest of the code
}
```

## Step 6: Update SettingsScreen Call Site

Find where SettingsScreen is called in your navigation and pass the navController:

```kotlin
composable("settings") {
    SettingsScreen(
        onBack = { navController.popBackStack() },
        navController = navController // Add this
    )
}
```

## Step 7: Verify Imports

Make sure your SettingsScreen.kt has these imports:

```kotlin
import androidx.navigation.NavController
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ChevronRight
```

## Step 8: Build and Test

1. Build the project:
```bash
./gradlew :CleverFerret:assembleDebug
```

2. Install on device/emulator:
```bash
./gradlew :CleverFerret:installDebug
```

3. Test the navigation:
   - Open the app
   - Navigate to Settings
   - Tap "Media Servers" - should open the media server configuration screen
   - Tap back - should return to settings
   - Tap "Network Storage" - should open the network storage configuration screen
   - Tap back - should return to settings

## Alternative: Simpler Integration

If you prefer a simpler approach without modifying the main settings screen, you can add the new screens to an "Advanced Settings" or "Integrations" submenu:

```kotlin
composable("advanced_settings") {
    AdvancedSettingsScreen(
        onBack = { navController.popBackStack() },
        onMediaServers = { navController.navigate("media_servers") },
        onNetworkStorage = { navController.navigate("network_storage") }
    )
}
```

## Troubleshooting

### Navigation Not Working
- Verify navController is passed correctly
- Check that route names match exactly ("media_servers", "network_storage")
- Ensure imports are correct

### Screens Not Displaying
- Check that ViewModels are properly injected with @HiltViewModel
- Verify Hilt is configured in your Application class
- Check logcat for any errors

### Back Button Not Working
- Ensure onBack parameter is passed correctly
- Verify navController.popBackStack() is called

## Testing Checklist

- [ ] Can navigate to Media Servers screen from Settings
- [ ] Can navigate back from Media Servers screen
- [ ] Can navigate to Network Storage screen from Settings
- [ ] Can navigate back from Network Storage screen
- [ ] Can add a Jellyfin server
- [ ] Can test Jellyfin connection
- [ ] Can add a Plex server
- [ ] Can test Plex connection
- [ ] Can add an Emby server
- [ ] Can test Emby connection
- [ ] Can add SMB/CIFS storage
- [ ] Can test SMB connection
- [ ] Can add WebDAV storage
- [ ] Can test WebDAV connection

## Estimated Time

- **Navigation Setup**: 10-15 minutes
- **Settings Menu Items**: 10-15 minutes
- **Testing**: 15-30 minutes
- **Total**: 35-60 minutes

## Need Help?

If you encounter any issues:
1. Check the INTEGRATION_GUIDE.md for API usage examples
2. Review the FEATURES_UPDATE.md for feature descriptions
3. Check the inline KDoc comments in the code
4. Review the pull request #259 for context

## Success Criteria

Once navigation is integrated, users should be able to:
1. Access media server settings from the main settings menu
2. Add and configure Jellyfin, Plex, and Emby servers
3. Test connections to media servers
4. Access network storage settings from the main settings menu
5. Add and configure SMB/CIFS and WebDAV storage
6. Test connections to network storage

---

**After completing these steps, the integration will be 100% complete and ready for production use!**
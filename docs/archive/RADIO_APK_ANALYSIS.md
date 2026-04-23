---
Status: Historical
Canonical replacement: docs/INDEX.md
---

# Radio APK Analysis

Analysis of `FMRadio.apk` extracted from the workspace.

## General Information
- **Package**: `com.android.fmradio`
- **Target SDK**: Android 13 (API 33) or similar (based on file version/resources)
- **Manufacturer Integration**: `com.mediatek.fmradio` references found, suggesting MediaTek chipset optimization.

## Key Features & Permissions

### Permissions
The APK requests the following permissions, which should be considered for the current project:
*   `android.permission.ACCESS_BROADCAST_RADIO` (Essential for FM)
*   `android.permission.RECORD_AUDIO` (For FM Recording)
*   `android.permission.CAPTURE_AUDIO_OUTPUT` (System permission for internal audio capture)
*   `android.permission.MODIFY_AUDIO_ROUTING`
*   `android.permission.WAKE_LOCK`

### Components
*   **Activities**:
    *   `FmMainActivity`: The primary radio interface.
    *   `FmRecordActivity`: A dedicated screen for recording FM broadcasts.
    *   `FmFavoriteActivity`: A list/grid of favorite stations.
*   **Services**:
    *   `FmService`: Background service to handle radio playback/tuning.

## Design & UI Structure

### Layouts
*   `main.xml`: Main dashboard.
*   `fm_record_activity.xml`: Layout for recording, includes a **Visualizer** (`com.android.fmradio.views.FmVisualizerView`).
*   `favorite_gridview.xml`: Grid layout for favorites.
*   `no_headset.xml`: Specific UI state for missing antenna (headset).

### Resources
*   **Icons**: Extensive set of icons for playback (`btn_fm_start`, `btn_fm_stop`), recording (`btn_fm_record_enabled`), and presets.
*   **Themes**: Uses standard Android themes but with custom drawable selectors (`btn_fm_favorite_on_selector.xml`).

## Recommendations for "Proper Radio Design"

Based on this APK, the `CleverFerret` radio implementation should ideally include:

1.  **FM Recording**: The presence of `FmRecordActivity` and `RECORD_AUDIO` permission highlights recording as a core feature.
    *   *Current Status*: Not implemented.
2.  **Visualizer**: The `FmVisualizerView` suggests real-time audio visualization is part of the experience.
    *   *Current Status*: `InternetRadioScreen` has `AudioVisualizerService` integration, but FM might need one too.
3.  **Favorites Management**: Dedicated activity for favorites.
    *   *Current Status*: Implemented via `RadioStationDao` and favorites toggle.
4.  **Headset Detection Handling**: Explicit UI for "No Headset".
    *   *Current Status*: `FMRadioService` checks availability but UI handling could be improved to prompt user.

## Technical Note
The reference to `com.mediatek.fmradio` implies that this APK is tailored for devices with MediaTek FM chips. Porting its low-level logic directly to a universal app requires using the standard Android `RadioManager` API (which we have stubbed due to environment limitations) rather than proprietary MediaTek intents/classes.

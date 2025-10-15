# ProjectM Audio Visualizer with Chromecast Integration

## Overview

CleverFerret now includes a powerful audio visualizer inspired by projectM, with full Chromecast casting support. This feature allows users to visualize audio from any audio source in the app and cast the visualizations along with audio to Chromecast devices.

## Features

### Audio Visualization

The visualizer captures real-time audio data from ExoPlayer and provides multiple visualization styles:

1. **Spectrum Bars** - Classic frequency bar visualization
2. **Waveform** - Time-domain waveform display
3. **Circular** - Radial spectrum visualization
4. **Particles** - Reactive particle-based visualization
5. **Frequency Rings** - Concentric reactive rings

### Technical Implementation

#### Audio Capture

The `AudioVisualizerService` uses Android's Visualizer API to capture:
- **Waveform data** - Time-domain audio samples
- **FFT data** - Frequency-domain analysis
- **Frequency bands** - Bass, mid, and treble levels

#### Visualization Rendering

The `ProjectMVisualizer` component renders visualizations using:
- Jetpack Compose Canvas API
- Real-time animation with infinite transitions
- Color gradients based on frequency bands
- Smooth 60 FPS rendering

### Chromecast Integration

#### Features

1. **Media Casting** - Cast audio/video content to Chromecast
2. **Visualizer Casting** - Cast live visualizations with audio
3. **Remote Control** - Control playback from casting device
4. **Custom Receiver** - Custom messages for visualizer data

#### Components

- `ChromecastManager` - Main Chromecast integration service
- `CastOptionsProvider` - Chromecast configuration
- `ExpandedControlsActivity` - Full-screen cast controls with visualizer

### Usage

#### Accessing the Visualizer

1. From the main home screen, tap the "Visualizer" card
2. Or navigate to the visualizer from any audio player

#### Visualizer Controls

- **Play/Pause button** - Enable/disable the visualizer
- **Style selector** - Choose between 5 visualization styles
- **Frequency meters** - Real-time bass, mid, and treble levels
- **Cast button** - Cast to Chromecast (when available)

#### Chromecast Casting

1. Tap the Cast button in the visualizer screen
2. Select your Chromecast device
3. The visualizer will be displayed on the TV along with audio
4. Use the expanded controls to manage playback and visualization

### Technical Architecture

```
AudioPlaybackManager (ExoPlayer)
    ↓
AudioVisualizerService (Visualizer API)
    ↓
ProjectMVisualizer (Compose UI)
    ↓
ChromecastManager (Google Cast SDK)
    ↓
Chromecast Device
```

### Audio Source Compatibility

The visualizer works with all audio sources in CleverFerret:

- ✅ Music Player
- ✅ Audiobook Player
- ✅ Podcast Player
- ✅ Radio Streams
- ✅ Video Audio Tracks
- ✅ Text-to-Speech

### Implementation Details

#### Dependencies Added

```kotlin
// Media3 Cast support
implementation("androidx.media3:media3-cast:1.8.0")

// Google Cast SDK
implementation("com.google.android.gms:play-services-cast-framework:21.5.0")
implementation("com.google.android.gms:play-services-cast:21.5.0")
```

#### Key Files

**Services:**
- `AudioVisualizerService.kt` - Audio capture and processing
- `ChromecastManager.kt` - Chromecast integration

**UI Components:**
- `ProjectMVisualizer.kt` - Main visualizer component
- `VisualizerScreen.kt` - Visualizer screen with controls
- `VisualizerButton.kt` - Reusable button for players
- `ExpandedControlsActivity.kt` - Cast controls

**Configuration:**
- `CastOptionsProvider.kt` - Chromecast setup
- AndroidManifest.xml - Cast metadata and activity

### Performance Considerations

- Visualizer updates at 20 FPS to balance smoothness and CPU usage
- FFT processing is optimized for real-time performance
- Cast messaging is throttled to prevent network overload
- Visualizer can be paused when not in view to save battery

### Future Enhancements

Potential improvements for future releases:

1. **Custom Presets** - Save favorite visualizer configurations
2. **Beat Detection** - More reactive visualizations based on beat detection
3. **Custom Color Schemes** - User-configurable color palettes
4. **Recording** - Record visualizer output as video
5. **VR Support** - 3D visualizations for VR headsets
6. **Custom Receiver App** - Dedicated Chromecast receiver with enhanced visualizations

### Troubleshooting

#### Visualizer Not Working

- Ensure app has RECORD_AUDIO permission
- Check that audio is playing through ExoPlayer
- Verify visualizer is enabled (play button in toolbar)

#### Chromecast Not Connecting

- Ensure device is on same network as Chromecast
- Check Google Play Services is up to date
- Verify Chromecast device is powered on and configured

#### Performance Issues

- Try reducing visualization complexity (use Spectrum Bars)
- Close other resource-intensive apps
- Check device meets minimum requirements (Android 8.0+)

## License

This feature uses:
- Android Visualizer API (Apache 2.0)
- Google Cast SDK (proprietary, free to use)
- Jetpack Compose (Apache 2.0)

## Credits

Inspired by [projectM](https://github.com/projectM-visualizer/projectm) - the awesome open-source music visualizer.

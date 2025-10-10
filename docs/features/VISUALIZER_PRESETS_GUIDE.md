# Visualizer Presets Guide

## Overview

CleverFerret's visualizer supports **downloadable and shareable presets** - similar to projectM's .milk files but using a simple JSON format. This allows you to:

- **Download** presets created by the community
- **Create** your own custom visualizations
- **Share** your presets with others
- **Import** presets from friends or online sources

---

## 📦 Built-in Presets

CleverFerret comes with **10 built-in presets**:

### Classic Presets
1. **Classic Spectrum** - Traditional frequency spectrum bars
2. **Smooth Waveform** - Flowing waveform visualization
3. **Spinning Spiral** - Rotating radial visualization
4. **Bass Pulse** - Heavy bass reactive particles
5. **Frequency Rings** - Concentric frequency-reactive rings

### Themed Presets
6. **Neon Spectrum** - Bright neon-style with glow effect
7. **Ocean Waves** - Calming blue waveform
8. **Fire Spectrum** - Hot fire-colored spectrum
9. **Mirror Dance** - Mirrored circular visualization
10. **Particle Storm** - Chaotic particle explosion

---

## 🎨 How to Use Presets

### Browse Presets

1. Open **Visualizer** screen
2. Tap **Dashboard icon** (📊) in top bar
3. Browse available presets
4. Tap **Use** on any preset
5. Visualizer applies preset settings

### Search Presets

1. In preset browser, use search bar
2. Search by:
   - Preset name
   - Author name
   - Description
   - Tags (e.g., "neon", "calm", "bass")

### Filter by Category

Presets are automatically categorized:
- **Classic** - Traditional visualizations
- **Energetic** - High-energy, reactive
- **Calm** - Smooth, relaxing
- **Colorful** - Vibrant, multi-colored
- **Minimal** - Simple, clean
- **Experimental** - Unique, creative
- **Custom** - User-created

---

## 📥 Import Presets

### From JSON String

1. Get preset JSON from:
   - Friend's export
   - Online community
   - Website/forum
   
2. In preset browser, tap **Download icon**
3. Paste JSON into dialog
4. Tap **Import**
5. Preset appears in your library!

### From File (Future)

Future versions will support:
- Import from `.cfpreset` files
- Download from online repository
- QR code sharing

---

## 📤 Export & Share Presets

### Export Your Preset

1. Browse to any preset
2. Tap **Export** button
3. JSON copied to clipboard
4. Share via:
   - Text message
   - Email
   - Discord/Reddit
   - Any messaging app

### Share Your Creation

Created a cool preset? Share it with the community!

**Share on:**
- r/CleverFerret subreddit
- Discord server
- GitHub discussions
- Social media (#CleverFerretPresets)

---

## 🔧 Create Custom Presets

### Preset File Format

Presets use **JSON format** with these fields:

```json
{
  "id": "my_custom_preset",
  "name": "My Awesome Visualizer",
  "author": "Your Name",
  "description": "A cool custom visualization",
  "version": 1,
  "baseStyle": "spectrum_bars",
  "parameters": {
    "sensitivity": 1.2,
    "smoothing": 0.5,
    "barCount": 96,
    "bassBoost": 1.5,
    "glowEffect": true
  },
  "colorScheme": {
    "primary": "#FF6B6B",
    "secondary": "#4ECDC4",
    "tertiary": "#FFE66D",
    "background": "#0A0A0A"
  },
  "tags": ["custom", "energetic", "colorful"]
}
```

### Base Styles

Choose from 5 base visualization types:

1. **spectrum_bars** - Frequency spectrum bars
2. **waveform** - Time-domain waveform
3. **circular** - Radial visualization
4. **particles** - Particle system
5. **frequency_rings** - Concentric rings

### Parameters

#### Common Parameters
```json
"sensitivity": 1.0,      // Audio sensitivity (0.5-2.0)
"smoothing": 0.5,        // Smoothing amount (0.0-1.0)
"speed": 1.0,            // Animation speed (0.5-2.0)
```

#### Spectrum Bars
```json
"barCount": 64,          // Number of bars (32-128)
"barSpacing": 0.1,       // Space between bars (0.0-0.5)
"barWidth": 0.9          // Bar width multiplier (0.5-1.0)
```

#### Waveform
```json
"waveformPoints": 128,   // Number of points (64-256)
"waveformThickness": 3.0,// Line thickness (1.0-10.0)
"waveformAmplitude": 0.8 // Wave height (0.3-1.5)
```

#### Circular
```json
"circularRadius": 0.2,   // Center radius (0.1-0.4)
"circularSpokes": 64,    // Number of spokes (32-128)
"circularRotationSpeed": 1.0 // Rotation speed (0.5-3.0)
```

#### Particles
```json
"particleCount": 8,      // Number of particles (4-32)
"particleSize": 1.0,     // Particle size multiplier (0.5-2.0)
"particleDistance": 150  // Distance from center (100-300)
```

#### Rings
```json
"ringCount": 3,          // Number of rings (2-5)
"ringThickness": 20.0,   // Ring line thickness (10.0-40.0)
"ringPulseAmount": 0.2   // Pulse strength (0.0-0.5)
```

#### Advanced Parameters
```json
"bassBoost": 1.0,        // Bass frequency boost (0.5-3.0)
"midBoost": 1.0,         // Mid frequency boost (0.5-3.0)
"trebleBoost": 1.0,      // Treble frequency boost (0.5-3.0)
"colorCycleSpeed": 1.0,  // Color cycling speed (0.0-5.0)
"blendMode": "normal",   // "normal", "additive", "multiply"
"glowEffect": false,     // Enable glow effect
"mirrorEffect": false,   // Mirror visualization
"pulseEffect": true      // Enable pulsing
```

### Color Schemes

#### Use Theme Colors (Default)
```json
"colorScheme": null
```
Visualizer uses your active CleverFerret theme colors.

#### Custom Colors
```json
"colorScheme": {
  "primary": "#FF0000",     // Main color (hex)
  "secondary": "#00FF00",   // Secondary color
  "tertiary": "#0000FF",    // Accent color
  "background": "#000000",  // Background color
  "gradientType": "linear"  // "linear", "radial", "angular"
}
```

### Tags

Add tags for easy searching:
```json
"tags": ["bass", "energetic", "neon", "custom"]
```

Common tags:
- Style: "classic", "modern", "retro"
- Energy: "calm", "energetic", "intense"
- Color: "neon", "pastel", "dark", "bright"
- Feature: "glow", "mirror", "pulse"
- Genre: "edm", "classical", "rock", "ambient"

---

## 🌟 Example Presets

### Example 1: Neon Bass Spectrum

```json
{
  "id": "neon_bass",
  "name": "Neon Bass Spectrum",
  "author": "CleverFerret",
  "description": "Bass-heavy neon spectrum for EDM",
  "version": 1,
  "baseStyle": "spectrum_bars",
  "parameters": {
    "sensitivity": 1.5,
    "smoothing": 0.3,
    "barCount": 96,
    "bassBoost": 2.5,
    "glowEffect": true,
    "colorCycleSpeed": 2.0
  },
  "colorScheme": {
    "primary": "#00FF00",
    "secondary": "#00FFFF",
    "tertiary": "#FF00FF",
    "background": "#000000"
  },
  "tags": ["edm", "bass", "neon", "energetic"]
}
```

### Example 2: Calm Ocean Waves

```json
{
  "id": "ocean_calm",
  "name": "Calm Ocean Waves",
  "author": "CleverFerret",
  "description": "Soothing blue waveform for relaxation",
  "version": 1,
  "baseStyle": "waveform",
  "parameters": {
    "sensitivity": 0.8,
    "smoothing": 0.9,
    "waveformPoints": 256,
    "waveformThickness": 4.0,
    "waveformAmplitude": 0.5,
    "speed": 0.6
  },
  "colorScheme": {
    "primary": "#0077BE",
    "secondary": "#00A8E8",
    "tertiary": "#00D4FF",
    "background": "#001529"
  },
  "tags": ["calm", "relaxing", "blue", "ambient"]
}
```

### Example 3: Fire Spiral

```json
{
  "id": "fire_spiral",
  "name": "Fire Spiral",
  "author": "Community",
  "description": "Spinning fire-colored visualization",
  "version": 1,
  "baseStyle": "circular",
  "parameters": {
    "sensitivity": 1.3,
    "circularSpokes": 96,
    "circularRotationSpeed": 2.5,
    "glowEffect": true,
    "bassBoost": 1.8
  },
  "colorScheme": {
    "primary": "#FF4500",
    "secondary": "#FF8C00",
    "tertiary": "#FFD700",
    "background": "#1A0500",
    "gradientType": "radial"
  },
  "tags": ["fire", "hot", "energetic", "spiral"]
}
```

---

## 📚 Community Resources

### Where to Find Presets

**Official Sources:**
- CleverFerret GitHub repository
- r/CleverFerret subreddit
- Discord server (#visualizer-presets)

**Community Sites:**
- User-submitted preset gallery (coming soon)
- Preset voting/rating system (planned)
- Weekly featured presets (planned)

### How to Contribute

1. **Create** amazing presets
2. **Test** with different music genres
3. **Export** to JSON
4. **Share** on community platforms
5. **Get feedback** from other users

### Preset Guidelines

**Good Presets:**
- Clear, descriptive name
- Accurate description
- Appropriate tags
- Tested with multiple songs
- Reasonable parameter values

**Avoid:**
- Extreme parameter values
- Missing metadata
- Offensive names/descriptions
- Duplicate existing presets

---

## 🔮 Future Features

### Coming Soon
- **Preset marketplace** - Browse community presets
- **Rating system** - Upvote favorite presets
- **Auto-sync** - Cloud backup of custom presets
- **QR sharing** - Share via QR code
- **Genre matching** - Auto-select presets by music genre
- **AI generation** - AI-powered preset creation

### Planned Features
- **Preset packs** - Themed preset collections
- **Animations** - Preset transition effects
- **Real-time editing** - Visual preset editor
- **Beat sync** - Advanced beat detection
- **3D visualizations** - WebGL-powered effects
- **VR support** - Immersive visualizations

---

## 💡 Tips & Tricks

### Creating Great Presets

1. **Start simple** - Use default parameters, tweak gradually
2. **Test variety** - Try with different music genres
3. **Balance sensitivity** - Not too reactive, not too static
4. **Match colors** - Consider color theory
5. **Add glow sparingly** - Can be overwhelming
6. **Tag accurately** - Helps others find your preset

### Performance Tips

- Lower `barCount` for better performance
- Reduce `particleCount` on slower devices
- Disable `glowEffect` if laggy
- Use `smoothing` to reduce jitter

### Creative Ideas

- **Genre-specific** - Create presets for specific music styles
- **Mood-based** - Design for emotions (calm, energetic, etc.)
- **Artist tribute** - Make presets inspired by artists
- **Holiday themed** - Seasonal color schemes
- **Meme presets** - Fun, experimental designs

---

## ❓ FAQ

**Q: Can I use presets offline?**  
A: Yes! Imported presets are stored locally.

**Q: How many presets can I have?**  
A: No limit! Store as many as you want.

**Q: Do presets work with all audio sources?**  
A: Yes! Works with music, podcasts, audiobooks, radio, etc.

**Q: Can I edit imported presets?**  
A: Currently read-only. Visual editor coming in future update.

**Q: Are presets compatible across devices?**  
A: Yes! Same JSON format works on all Android devices.

**Q: Can I back up my presets?**  
A: Export to JSON and save the files. Cloud sync coming soon.

**Q: How do I report bad presets?**  
A: Use community reporting on preset gallery (when available).

---

## 📞 Support

Need help with presets?

- **Documentation**: This guide
- **Discord**: #visualizer-help channel
- **Reddit**: r/CleverFerret
- **GitHub**: Open an issue

---

**Happy visualizing! Create, share, and enjoy! 🎨🎵**

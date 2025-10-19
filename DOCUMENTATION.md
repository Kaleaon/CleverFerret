# CleverFerret Documentation

**Universal Media Library Manager - Android & PWA**

## 📚 Quick Links

- [Getting Started](#getting-started)
- [Features](#features)
- [Widgets](#widgets)
- [Development](#development)
- [Architecture](#architecture)

---

## Getting Started

### Android App
```bash
./gradlew assembleDebug
```
**Requirements**: Android 8.0+ (API 26+)

### PWA
```bash
cd pwa-demo
npm install
npm run dev
```
**Access**: http://localhost:5173

---

## Features

### 📖 Reading
- **EPUB** - Full Readium support
- **PDF** - Advanced rendering with annotations
- **Comics** - CBZ/CBR with AI translation
- **Audiobooks** - Speed control, sleep timer, bookmarks

### 🎵 Audio
- **Music** - Gapless playback, visualizer, EQ
- **Podcasts** - Auto-download, playback queue
- **Radio** - Live streaming stations
- **TTS** - Multiple providers (Android, Gemini)

### 🎬 Video
- **Movies** - Hardware acceleration
- **TV Shows** - Auto-episode tracking
- **Streaming** - Plex, Jellyfin integration

### 📊 Organization
- **Smart Collections** - Auto-categorization
- **Reading Goals** - Track progress
- **Statistics** - Comprehensive analytics
- **Sync** - Cross-device support

---

## Widgets

**13 Home Screen Widgets** - Perfect for Nova Launcher

### Reading Widgets
1. **Currently Reading** - Active book with progress (2x1)
2. **Quick Access** - Recent books list (2x2)
3. **Reading Stats** - Weekly analytics (2x2)
4. **Reading Goal** - Annual progress (2x2)

### Media Widgets
5. **Media Playback** ⭐ - Universal controls, Jetpack Glance (4x2)
6. **Music Player** - Track controls (3x1)
7. **Audiobook Player** - Speed + skip controls (4x1)
8. **Podcast Player** - Episode controls (3x1)
9. **Video Player** - Video controls (3x2)
10. **Radio Player** - Station controls (3x1)

### Specialized
11. **Comic Reader** - Current comic (2x2)
12. **TTS Widget** - Voice controls (3x1)

**See**: [WIDGETS_DOCUMENTATION.md](WIDGETS_DOCUMENTATION.md) for details

---

## Development

### Project Structure
```
CleverFerret/           # Android app (Kotlin)
├── src/main/
│   ├── java/.../
│   │   ├── ui/         # Compose UI
│   │   ├── services/   # Media services
│   │   ├── data/       # Database & repos
│   │   └── widgets/    # Home widgets
│   └── res/            # Resources
│
pwa-demo/               # Progressive Web App
├── src/
│   ├── ui/             # React components
│   ├── services/       # Business logic
│   └── components/     # Shared components
```

### Tech Stack

**Android**
- Kotlin 1.9+
- Jetpack Compose
- Media3
- Room Database
- Dagger Hilt
- Coil (images)
- Readium SDK

**PWA**
- React 18
- TypeScript
- Material-UI
- Dexie (IndexedDB)
- Vite

### Building

**Android**
```bash
# Debug build
./gradlew assembleDebug

# Release build
./gradlew assembleRelease

# Run tests
./gradlew test
```

**PWA**
```bash
# Development
npm run dev

# Production build
npm run build

# Preview build
npm run preview
```

---

## Architecture

### Database Schema
```
Libraries → MediaItems → Metadata (by type)
          ↓
       Playlists → PlaylistItems
          ↓
    ReadingProgress / Bookmarks
```

### Services Layer
- **AudioPlaybackManager** - Music playback
- **UnifiedPlaybackQueueManager** - Queue management  
- **AudiobookService** - Audiobook features
- **EpubReaderEngine** - EPUB rendering
- **PdfReaderEngine** - PDF rendering
- **GeminiService** - AI features

### State Management
- **Android**: Compose StateFlow + ViewModel
- **PWA**: Zustand stores + React hooks

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

### Code Style
- Kotlin: Official style guide
- TypeScript: Prettier + ESLint
- Commits: Conventional commits

---

## License

See LICENSE file

---

## Support

- **Issues**: GitHub Issues
- **Docs**: This file + inline code docs
- **Todo**: [todo.md](todo.md)

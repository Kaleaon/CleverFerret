# 🗺️ CleverFerret Roadmap

## 🚀 High Priority (Next Release)

*   **Navigation Integration**:
    *   [x] Implement `OldTimeRadio` Series navigation (`MainActivity.kt` TODO).
    *   [x] Implement `OldTimeRadio` Episode navigation (`MainActivity.kt` TODO).
*   **Cloud Synchronization**:
    *   [ ] Implement `GoogleDriveSyncService` (Backend stub exists).
    *   [ ] Implement `DropboxSyncService`.
    *   [ ] Connect `EnhancedSyncService` to real cloud providers.
*   **AI Features**:
    *   [ ] Connect `ReadingAnalyticsService` to an actual LLM provider (OpenAI/Gemini/Ollama).
    *   [ ] Implement real "Mind Map" generation.

## 🛠️ Medium Priority (Planned)

*   **Search History**: Implement UI and persistence for search queries.
*   **Playlist Enhancements**:
    *   [ ] Duration calculation for Movie playlists.
    *   [ ] Play count tracking for Music playlists.
*   **Multi-Room Audio**:
    *   [ ] Implement Snapcast network protocol in `MultiRoomAudioService`.
*   **Web Fiction**:
    *   [ ] Fanfiction tag browsing UI.
    *   [ ] Improved "Book Source" scraping engine (XPath/Regex builder).

## 🧊 Low Priority (Future)

*   **Apache Tika**: Integrate for robust MIME type detection (currently disabled for APK size).
*   **Audio Fingerprinting**: Integrate ACRCloud or similar for automatic song identification.
*   **Smart Recommendations**: Expand genre-based and ML-based recommendation algorithms.

## ✅ Recently Completed

*   **UI/UX**:
    *   Added `BookSourceManager` screen.
    *   Added `MultiRoomAudio` screen.
    *   Unified "Now Playing" queue management.
    *   Added "Add to Playlist" dialog.
*   **Reader**:
    *   Expanded format support (PDF, CBZ, CBR, etc.).
    *   Implemented "Reddit Thread Continuation" for better HFY support.
*   **Core**:
    *   Database schema updates (`lastModified` fields).
    *   Navigation graph updates.
*   **Radio**:
    *   Integrated RadioDNS for FM metadata (Logos/Names via SRV lookup).
    *   Implemented Radio Browser Directory UI (Search & Add Stations).
    *   Simulated FM radio tuning with PI code support.

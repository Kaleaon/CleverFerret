# 🗺️ CleverFerret Roadmap

## Planning rules (required)

* Every roadmap task must include:
  * `Owner module(s)` (e.g., `feature/opds`, `core/network`, `core/auth`)
  * `Path hint(s)` that state whether implementation belongs in `CleverFerret/` or `CleverFerretV2/`.
* Reviewer requirement: reject feature tasks without module mapping.

## 🚀 High Priority (Next Release)

* **Owner module(s):** `feature/navigation`, `core/sync`, `feature/ai`
* **Path hint(s):** `CleverFerret/` (current roadmap items); flag `CleverFerretV2/` only for explicit V2 migration tasks.

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

* **Owner module(s):** `feature/search`, `feature/playlists`, `feature/audio`, `feature/webfiction`
* **Path hint(s):** default to `CleverFerret/`; add explicit `CleverFerretV2/` prefix for V2-specific work items.

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

* **Owner module(s):** `core/media-detection`, `feature/audio-id`, `feature/recommendations`
* **Path hint(s):** declare target root per ticket to avoid cross-branch path mistakes (`CleverFerret/` vs `CleverFerretV2/`).

*   **Apache Tika**: Integrate for robust MIME type detection (currently disabled for APK size).
*   **Audio Fingerprinting**: Integrate ACRCloud or similar for automatic song identification.
*   **Smart Recommendations**: Expand genre-based and ML-based recommendation algorithms.

## ✅ Recently Completed

* **Owner module(s):** `feature/ui`, `feature/readers`, `core/data`, `feature/radio`
* **Path hint(s):** completed items tracked under `CleverFerret/` unless otherwise noted in linked PR.

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

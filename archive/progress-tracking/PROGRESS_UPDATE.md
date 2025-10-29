## CleverFerret - Progress Update

Last updated: (auto)

### Theming and UI
- Implemented navy + metallic gold theme across Compose (`ui/theme/PlexTheme.kt` update)
- Beautified library list/details; hover/selection refined

### Reader stack
- EPUB Reader: `ui/reader/EPUBReaderScreen.kt` now stable with internal state and chapter controls
- Generic Reader: `ui/reader/EReaderScreen.kt` for simple text rendering
- Document Reader: `ui/reader/DocumentReaderScreen.kt` supports PDF (PdfRenderer), TXT, HTML, and DOCX (basic extractor)
- Comic Reader: `ui/reader/ComicReaderScreen.kt` with CBZ/CBR (zip/junrar) paging and prev/next controls
- Open Routing: `ui/open/MediaOpenScreen`, `MediaOpenViewModel` and `MainActivity` route `open/{itemId}` to proper reader

### Storage & organization
- SAF read/write + persist: `StorageAccessService` requests/persists both permissions
- Mixed-folder organizer: `organizeDirectory(...)` moves files into per-type subfolders using DocumentsContract or copy+delete fallback
- Settings entry: `StorageOrganizerScreen` with picker and progress

### API settings & integrations
- Added inline info icons + links where to obtain keys (Gemini, Fanart.tv, Last.fm, Musixmatch, Genius)
- Extended settings model with `ArtworkApiSettings` and `LyricsApiSettings`; repository seeds keys

### Audio / Playlists
- M3U import/export: `AudioPlaybackManager` can write current queue to M3U and import M3U to queue
- Playlist DB: Room entities `Playlist`, `PlaylistItem`; DAO `PlaylistDao`; registered in `AppDatabase` (v12)
- Playlist repository: add current track to "Liked", add to by name, create new
- Now Playing: Thumbs up and Add-to-Playlist buttons; ViewModel hooks to repository
- Playlist settings screen for import/export added to Settings

### Routing & Screens
- Added `editor/new` with `DocumentEditorScreen` (minimal writer tools)
- Settings updated to include Playlists and Organizer

### Next up
- Media3 MediaLibraryService + robust queue/session per TimberX patterns
- Persist/restore queues; device/media button mappings; audio focus/noisy
- Plex playlist sync stub + export/share links for playlists


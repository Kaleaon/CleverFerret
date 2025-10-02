## CleverFerret Reference Map – Sources, Flows, Controls, and Canonical References

This document is the master reference for how CleverFerret finds, imports, and plays content; which files own the work; and the canonical names and controls across modalities (books, music, video, documents).

### High-level overview
- **Discovery/Scanning**:
  - Device scan (MediaStore + filesystem): `services/MediaScannerService.kt`
  - Storage Access Framework (SAF) scan: `services/StorageAccessService.kt`
  - Calibre import (metadata.db): `services/CalibreImportService.kt`
- **Persistence** (Room):
  - Entities: `data/local/entity/*` (e.g., `MediaItem`, `MetadataCommon`, `MetadataBook`, `MetadataMovie`, `MetadataMusicTrack`, `People`, `ItemPersonRole`, `Series`, `Genre`, `ItemGenre`, `Library`)
  - DAOs: `data/local/dao/*` (e.g., `MediaItemDao`, `MetadataDao`, `LibraryDao`, ...)
- **Readers/Players** (Compose UI):
  - EPUB reader: `ui/reader/EPUBReaderScreen.kt` (minimal internal state); services in `services/epub/*`
  - Generic reader: `ui/reader/EReaderScreen.kt` (Compose-driven content render)
  - Document reader: `ui/reader/DocumentReaderScreen.kt` (PDF/TXT/HTML/DOCX)
  - Comic reader: `ui/reader/ComicReaderScreen.kt` (CBZ/CBR paging)
  - Audio: `ui/player/AudioPlayerScreen.kt` (+ `AudioPlayerViewModel.kt`)
  - Video: `ui/player/VideoPlayerScreen.kt`, `ui/player/UniversalVideoPlayerScreen.kt`
  - Metadata editor: `ui/metadata/MetadataEditorScreen.kt`
- **Settings**:
  - Reader settings UI: `ui/reader/ReaderSettingsScreen.kt` + `ReaderSettingsViewModel.kt`
  - App settings: `ui/settings/*` (e.g., `SettingsScreen.kt`, `SecurityAndAboutScreens.kt`, `SettingsViewModel.kt`)

---

### Source detection and import flows

#### 1) Device scan (MediaStore + filesystem)
- Owner: `services/MediaScannerService.kt`
- What it does:
  - Scans standard device directories and MediaStore for supported extensions.
  - Derives `mediaType` from extension and inserts a `MediaItem` with appropriate `MetadataCommon` and, if available, type-specific metadata (`MetadataMusicTrack`, `MetadataMovie`).
- Canonical extension sets:
  - Books: `epub`, `pdf`, `mobi`, `azw`, `azw3`, `fb2`, `txt`, `rtf`, `doc`, `docx`
  - Audio: `mp3`, `m4a`, `m4b`, `aac`, `ogg`, `opus`, `flac`, `wav`, `wma`
  - Video: `mp4`, `mkv`, `avi`, `mov`, `wmv`, `flv`, `webm`, `m4v`, `mpg`, `mpeg`
  - Images: `jpg`, `jpeg`, `png`, `gif`, `bmp`, `webp`, `svg`, `tiff`
  - Comics: `cbz`, `cbr`, `cb7`, `cbt`

Data path (happy path):
1) Determine `mediaType` from extension
2) Ensure (or create) a `Library` of that type
3) Insert `MediaItem` with `mediaType`
4) Insert `MetadataCommon` and optionally `MetadataMusicTrack`/`MetadataMovie`

#### 2) Storage Access Framework (SAF)
- Owner: `services/StorageAccessService.kt`
- What it does:
  - Recursively scans a user-granted `treeUri`.
  - Creates separate per-type libraries under the same root path (e.g., `BOOK`, `MOVIE`, `MUSIC`, `COMIC`).
  - Inserts `MediaItem` and `MetadataCommon` similarly to device scan.

Data path:
1) `scanDirectory(context, treeUri, name)` obtains root info
2) `scanDocumentFile(...)` recurses into folders
3) `determineMediaType(fileName)` maps by extension
4) `getOrCreateLibraryForType(rootName, rootPath, type)` ensures per-type library
5) Insert `MediaItem` and `MetadataCommon`

#### 3) Calibre import
- Owner: `services/CalibreImportService.kt`
- What it does:
  - Reads Calibre `metadata.db` to fetch books, resolves actual files, computes file hash, and inserts `MediaItem` + `MetadataCommon` + `MetadataBook`.
  - Maps authors to `People` and creates `ItemPersonRole` with role `AUTHOR`.
  - Populates `Series` and `Genre` as available.

Data path:
1) `CalibreDatabaseReader.readBooks()` → raw book records
2) `resolveFullPath(rootPath, relativePath)` picks preferred extensions
3) Insert `MediaItem`
4) Insert `MetadataCommon` + `MetadataBook`
5) Upsert `People`, `Series`, `Genre`; insert junctions

---

### Canonical data contracts (Room)

- `MediaItem` (Room): file location, size, hash, timestamps, `mediaType` (String), `mimeType`, status flags
- `MetadataCommon`: shared textual metadata (title, ratings, summary, language, images)
- `MetadataBook`/`MetadataMovie`/`MetadataMusicTrack`: type-specific metadata
- `Library`: grouping by `type` and `path`
- DAO highlights:
  - `MediaItemDao`: `insertMediaItem`, `getMediaItemsByLibrary`, `getMediaItemByPath`/`ByFilePath`
  - `MetadataDao`: `insertMetadataCommon`, `insertMetadataBook`, `insertMetadataMovie`, `insertMetadataMusicTrack`, and helpers for `People`/`Series`/`Genre`
  - `LibraryDao`: `insertLibrary`, `getLibraryByPath`, `getLibrariesByType`

Naming consistency:
- `mediaType` is stored as a string in `MediaItem`. Keep consistent canonical values: `BOOK`, `MOVIE`, `MUSIC`, `PODCAST`, `MAGAZINE`, `COMIC`, `DOCUMENT`, etc. Align UI branches and queries with these literal strings.

---

### Readers and controls

#### EPUB reader (WebView-based minimal)
- Entry: `ui/reader/EPUBReaderScreen.kt`
- Current state: Minimal internal state; placeholder chapter navigation, settings dialog (font size, line-height, theme), bookmark toggle stub.
- Planned service: `services/epub/EPUBReaderService.kt` and `services/epub/EpubReaderEngine.kt` for real EPUB parsing and pagination.

Controls (EPUB):
- Page/chapter navigation: Previous/Next chapter buttons with visual progress
- Reader settings: Font size, line height, theme (light/dark/sepia), dyslexia-friendly fonts (future)
- TOC: Table of contents dialog to jump chapters
- Bookmark: Toggle per chapter or per position (service integration pending)

#### Generic e-reader (Compose content)
- Entry: `ui/reader/EReaderScreen.kt`
- Renders chapter content in Compose; integrates with `EReaderViewModel` when enabled.

#### Document reader (PDF/TXT/HTML/DOCX)
- Entry: `ui/reader/DocumentReaderScreen.kt`
- PDF: `PdfRenderer` with page controls; TXT: stream to text; HTML: WebView; DOCX: unzip `word/document.xml` and extract `<w:t>`

#### Comic reader (CBZ/CBR)
- Entry: `ui/reader/ComicReaderScreen.kt`
- CBZ: unzip images; CBR: `junrar` extract; simple paging with prev/next

Common reader gestures and options (target)
- Tap zones for next/prev
- Scroll mode / pagination mode
- Brightness slider (optional)
- Auto-scroll speed
- Themes: WHITE/BLACK/SEPIA/E-INK (see `ui/reader/ReaderSettingsScreen.kt`)

---

### Audio/video players and controls

#### Audio
- Entry: `ui/player/AudioPlayerScreen.kt` + `AudioPlayerViewModel.kt`
- Service layer: ExoPlayer-based; queue management in `services/exoplayer/ExoPlayerService.kt` and helpers
- Controls:
  - Play/Pause, Next/Prev track
  - Seek bar; fast-forward/rewind (e.g., ±15s)
  - Volume; (future) Equalizer, Bass boost
  - Queue: add/remove/reorder

#### Video
- Entry: `ui/player/VideoPlayerScreen.kt`, `ui/player/UniversalVideoPlayerScreen.kt`
- Controls:
  - Play/Pause, Seek bar, Next/Prev (playlist)
  - Playback speed
  - Track selection (audio/subtitles) – future
  - Brightness/contrast overlays – future

Media session / notifications (minimal path)
- Owners: `services/media/MediaSessionManager.kt`, `services/media/MediaNotificationService.kt`
- Status: Stubbed in places; integrate ExoPlayer session properly for lockscreen/notification controls.

---

### Opening content – canonical flows

- Books (EPUB/PDF):
  - From UI list → navigate to reader: `EPUBReaderScreen` or `EReaderScreen` with file path/URI
  - Services resolve content and pass current chapter/page
- Music tracks:
  - From library → `AudioPlayerScreen` with track itemId → ExoPlayer queue
- Movies:
  - From library → `VideoPlayerScreen` with itemId/path → ExoPlayer

---

### Known broken/missing references (to avoid & fix)

- Legacy ViewModel calls in `EPUBReaderScreen.kt` are commented; use internal state until `EPUBReaderService` is ready
- Some `.disabled` files are intentionally disabled (advanced features)
- Batch DAO methods (e.g., `insertCommonMetadataBatch`) may be referenced in UI; prefer per-item DAO calls
- Ensure `MediaItem` constructor args match `data/local/entity/MediaItem.kt` (order and available fields)
- `MediaType` enum exists in `data/MediaType.kt`, but Room stores `mediaType` as string – don’t mix enum and string in Room entities

---

### Reference tables

Media type mapping by extension (canonical):
- BOOK: `epub`, `pdf`, `mobi`, `azw`, `azw3`, `fb2`, `txt`, `rtf`, `doc`, `docx`
- MUSIC: `mp3`, `m4a`, `m4b`, `aac`, `ogg`, `opus`, `flac`, `wav`, `wma`
- MOVIE: `mp4`, `mkv`, `avi`, `mov`, `wmv`, `flv`, `webm`, `m4v`, `mpg`, `mpeg`
- COMIC: `cbz`, `cbr`, `cb7`, `cbt`
- DOCUMENT: images over size threshold (used for artwork/docs)

Reader controls (target parity):
- Page turn: tap zones / dedicated buttons; keyboard arrows where applicable
- Scroll mode: continuous with adjustable speed (auto-scroll)
- Seek by chapter; search within book
- Themes: White, Black, Sepia, E‑ink; font stacks inc. dyslexia-friendly

Player controls (target parity):
- Transport: Play/Pause, Next/Prev, FF/RW (±15s configurable)
- Speed: 0.25×–2.0×
- Queue: add/remove/reorder; resume positions
- Notifications/Session: lockscreen controls

---

### How to use this document
- Use it to align naming, paths, and flows when fixing broken references.
- When adding new features or refactors, update this file to keep canonical references discoverable.


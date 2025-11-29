# Clever Ferret Architecture

## Overview

Clever Ferret is a comprehensive media library and reader application for Android. It is built using modern Android technologies:
- **Language:** Kotlin
- **UI Toolkit:** Jetpack Compose
- **Dependency Injection:** Hilt
- **Architecture Pattern:** MVVM (Model-View-ViewModel) + Clean Architecture principles

## Core Components

### 1. Unified Reader Service (`UnifiedReaderService`)

The `UnifiedReaderService` is the central orchestration layer for opening and reading media files. It serves as a single entry point for the UI, routing file requests to the appropriate specialized service or parser.

**Responsibilities:**
- Detecting file formats.
- Routing to specialized engines (Readium, ExoPlayer, Gemini).
- Delegating document parsing to `ParserFactory`.
- Extracting covers/thumbnails.

**Supported Engines:**
- **Readium:** For EPUB, PDF, and Audiobooks (LCPA/LCPDF).
- **Gemini Comic Service:** For comic formats (CBZ, CBR, CBT, CB7), leveraging AI for panel detection.
- **AudioPlaybackManager (ExoPlayer):** For standalone audio files (MP3, FLAC, etc.).
- **ParserFactory:** For document formats (DOCX, MOBI, RTF, etc.).

### 2. Parser Factory (`ParserFactory`)

The `ParserFactory` provides a unified interface for parsing various document formats into a common `ParsedDocument` model (text content, metadata, structure).

**Implementations:**
- **Apache POI:** DOCX, DOC.
- **Apache Tika:** Fallback for various formats.
- **Lib-mobi:** MOBI, AZW, AZW3.
- **Native/Pure Kotlin parsers:** RTF, FB2 (planned).

### 3. Unified Theme System

The application uses a sophisticated theming system that combines:
- **Material 3:** Base design system.
- **Metallic Themes:** 12 preset themes with metallic gradients (Gold, Silver, Bronze, etc.).
- **Ancient Architect:** Special themes with geometric patterns and "crystal glow" effects.

**Key Files:**
- `UnifiedThemeSystem.kt`: Entry point and composition locals.
- `Theme.kt`: Color definitions and metallic gradients.
- `AncientArchitectTheme.kt`: Implementation of special visual effects.

### 4. UI Layer

The UI is built entirely with Jetpack Compose.
- **Screens:** Located in `ui/`.
- **Reader:** `ui/reader/` contains the reading experience components (`EnhancedEReaderScreen`, `ReaderSettingsScreen`).
- **ViewModels:** Handle state management and interaction with services.

## Directory Structure

- `com.universalmedialibrary`
  - `ui/`: UI components, screens, and themes.
  - `services/`: Business logic, media handling, and background services.
    - `reader/`: Reader engines and `UnifiedReaderService`.
  - `parsers/`: Document parsing logic.
  - `data/`: Database entities (Room) and repositories.
  - `di/`: Hilt dependency injection modules.

## Key Flows

**Opening a Book:**
1. UI requests to open a file via `UnifiedReaderService.openPublication(path)`.
2. `UnifiedReaderService` determines the format.
3. If it's a specialized format (EPUB), it initializes `ReadiumEpubService`.
4. If it's a document (DOCX), it asks `ParserFactory` for a parser.
5. `UnifiedReaderService` returns a `ReaderType` sealed class instance.
6. The UI (`EnhancedEReaderScreen` or generic `ReaderScreen`) renders the content based on the `ReaderType`.

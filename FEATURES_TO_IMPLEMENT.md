# CleverFerret - Features To Implement

**Last Updated**: January 2025  
**Status**: Planning document for post-compilation-fix development

This document outlines features that need to be implemented to make CleverFerret a complete, publishable media library application.

---

## 🎯 PREREQUISITE: FIX COMPILATION ERRORS

**Before implementing ANY features, all 85 compilation errors must be fixed.**

Current status: ❌ **0 of 85 files fixed**

See: `BROKEN_FEATURES_LIST.md` for details.

---

## 📱 PHASE 1: MINIMUM VIABLE PRODUCT (MVP)

These features are essential for basic functionality and app store publication.

### 1.1 Core Application Functionality ⚠️ IN PROGRESS

**Status**: Partially implemented, needs completion and testing

#### Library Management ✅ MOSTLY DONE
- [x] Create new libraries
- [x] List libraries
- [x] Select library type (Books, Music, Movies)
- [ ] Delete libraries (needs implementation)
- [ ] Edit library properties (needs implementation)
- [ ] Library statistics/overview (needs implementation)

**Implementation Notes**:
- Basic UI exists
- Room database integration exists
- Needs testing after compilation fix
- Delete and edit features need to be added

#### File System Integration ⚠️ PARTIAL
- [x] Storage Access Framework integration (code exists)
- [ ] Initial permission request flow (needs verification)
- [ ] Folder selection UI (exists, needs testing)
- [ ] Media file scanning (service exists, needs testing)
- [ ] Background scanning service (exists, needs testing)
- [ ] Handle scoped storage (Android 10+) (needs verification)

**Implementation Notes**:
- StorageAccessService exists but has compilation errors
- MediaScannerService exists but has compilation errors
- End-to-end flow needs testing
- May need permission handling improvements

#### Media Browsing ⚠️ PARTIAL
- [x] Grid view of media items (exists)
- [x] List view of media items (exists)
- [ ] Sort options (title, date, author) (needs implementation)
- [ ] Filter options (needs implementation)
- [ ] Search within library (needs implementation)
- [ ] Media item details view (partial)

**Implementation Notes**:
- Basic UI exists
- Sort, filter, search need implementation
- Details view needs completion

### 1.2 Media Playback ⚠️ IN PROGRESS

#### Book Reading ⚠️ PARTIAL
- [x] EPUB reader integration (code exists)
- [ ] EPUB reader testing (blocked by compilation)
- [x] PDF reader integration (code exists)
- [ ] PDF reader testing (blocked by compilation)
- [ ] Basic reading controls (page turn, zoom) (needs verification)
- [ ] Reading progress tracking (needs implementation)
- [ ] Bookmark support (needs implementation)

**Implementation Notes**:
- EPUBReaderScreen exists but has errors
- PDF reader code exists
- Full feature set needs verification

#### Audio Playback ❌ BROKEN
- [ ] Audio player fix (CRITICAL - AudioPlaybackManager type inference)
- [ ] Play/pause controls (needs verification)
- [ ] Seek controls (needs verification)
- [ ] Queue management (needs implementation)
- [ ] Background playback (needs implementation)
- [ ] Media controls integration (needs implementation)
- [ ] Playback progress tracking (needs implementation)

**Implementation Notes**:
- AudioPlaybackManager has critical type inference error
- Must be fixed before audio features can work
- Media session integration code exists

#### Video Playback ⚠️ PARTIAL
- [x] Video player integration (code exists)
- [ ] Video player testing (blocked by compilation)
- [ ] Playback controls (needs verification)
- [ ] Fullscreen support (needs verification)
- [ ] Progress tracking (needs implementation)

**Implementation Notes**:
- Video player screens exist but have errors
- ExoPlayer integration likely exists
- Needs testing after compilation fix

### 1.3 Import/Export ⚠️ PARTIAL

#### Calibre Import ⚠️ PARTIAL
- [x] Import service implementation (exists)
- [ ] UI for selecting Calibre database (needs verification)
- [ ] Progress indicator during import (needs verification)
- [ ] Metadata import (implemented, needs testing)
- [ ] Cover image import (implemented, needs testing)
- [ ] Error handling (needs verification)

**Implementation Notes**:
- CalibreImportService exists but has errors
- Foreground service implementation exists
- Full workflow needs end-to-end testing

#### Basic Export ❌ NOT IMPLEMENTED
- [ ] Export library metadata (needs implementation)
- [ ] Export reading progress (needs implementation)
- [ ] Backup/restore functionality (needs implementation)

**Implementation Notes**:
- No export functionality currently exists
- Consider implementing for data portability

### 1.4 Essential Settings ❌ BROKEN

#### Application Settings ❌ BLOCKED
- [ ] Fix SettingsViewModel (CRITICAL - missing)
- [ ] Theme selection (Light/Dark/Auto) (needs implementation)
- [ ] Default library selection (needs implementation)
- [ ] Storage preferences (needs implementation)
- [ ] About screen (exists, needs fix)

**Implementation Notes**:
- SettingsViewModel doesn't exist - must be created
- Settings screens exist but are broken
- About screen exists but has errors

---

## 📚 PHASE 2: ENHANCED FEATURES

These features improve user experience and differentiate the app.

### 2.1 Reading Experience Enhancements

#### Visual Customization
- [ ] Font selection (Issue #13)
- [ ] Font size adjustment (Issue #13)
- [ ] Line spacing control (Issue #13)
- [ ] Margins adjustment (Issue #13)
- [ ] Day/Night mode toggle (Issue #14)
- [ ] Custom color themes (Issue #14)
- [ ] Page background options (Issue #17)

#### Navigation & Paging
- [ ] Continuous scroll mode (Issue #15)
- [ ] Single page mode (Issue #15)
- [ ] Double page mode (Issue #15)
- [ ] Auto-scroll with speed control (Issue #16)
- [ ] Page turn animations (Issue #18)
- [ ] Table of contents navigation (Issue #19)

#### Accessibility
- [ ] Blue light filter (Issue #17)
- [ ] Reading timer (Issue #17)
- [ ] Reading statistics (Issue #17)
- [ ] Text-to-speech (Issue #29)
- [ ] Reading ruler overlay (Issue #28)

### 2.2 Annotation & Note-Taking

#### Core Annotation Features (Issue #24)
- [ ] Text highlighting
- [ ] Multiple highlight colors
- [ ] Add notes to highlights
- [ ] Bookmarks
- [ ] View all annotations
- [ ] Export annotations
- [ ] Search annotations

### 2.3 Dictionary & Translation

#### Dictionary Integration (Issue #25)
- [ ] Built-in dictionary
- [ ] Word lookup on long-press
- [ ] Dictionary API integration
- [ ] Word history
- [ ] Favorite words

#### Translation (Issue #26)
- [ ] Inline translation
- [ ] Multiple translation services
- [ ] Translation history

### 2.4 Content Organization

#### Advanced Library Features (Issue #21)
- [ ] Collections/Tags
- [ ] Custom shelves
- [ ] Reading lists
- [ ] Recently read
- [ ] Reading statistics
- [ ] Reading goals

#### Home Screen Integration
- [ ] Continue reading widget (Issue #23)
- [ ] Library statistics widget (Issue #23)
- [ ] Book shortcuts to home screen (Issue #32)
- [ ] Quick actions

### 2.5 Sharing & Social

#### Sharing Features (Issue #27)
- [ ] Share quotes
- [ ] Share progress
- [ ] Share annotations
- [ ] Reading challenges
- [ ] Social media integration

### 2.6 Advanced Format Support

#### EPUB3 Support (Issue #20)
- [ ] Multimedia content (audio/video in EPUB)
- [ ] Interactive elements
- [ ] MathML support
- [ ] SVG support
- [ ] JavaScript support

#### PDF Enhancements (Issue #30)
- [ ] PDF annotations
- [ ] PDF form filling
- [ ] PDF text selection
- [ ] PDF search
- [ ] PDF bookmarks

### 2.7 Cloud & Sync

#### Cloud Synchronization (Issue #22)
- [ ] Cloud storage integration (Google Drive, Dropbox)
- [ ] Sync reading progress
- [ ] Sync annotations
- [ ] Sync library metadata
- [ ] Conflict resolution

### 2.8 Security & Privacy

#### Security Features (Issue #31)
- [ ] App password protection
- [ ] Biometric authentication
- [ ] Private libraries
- [ ] Encrypted storage
- [ ] Privacy policy

---

## 🚀 PHASE 3: ADVANCED FEATURES

These are specialized features for power users.

### 3.1 Content Creation ⚠️ PARTIALLY IMPLEMENTED

#### Web Fiction to EPUB ⚠️ EXISTS BUT BROKEN
- [x] Fanfiction scraper (code exists, broken)
- [x] Web fiction converter (code exists, broken)
- [ ] Fix compilation errors in converters
- [ ] Test end-to-end conversion
- [ ] Support multiple sites (AO3, FFN, etc.)
- [ ] Chapter update tracking
- [ ] Auto-download new chapters

**Implementation Notes**:
- Multiple converter services exist
- All have compilation errors
- Need to fix or remove

#### News to EPUB ⚠️ EXISTS BUT BROKEN
- [x] News scraper (code exists, broken)
- [x] News converter (code exists, broken)
- [ ] Fix compilation errors
- [ ] Test end-to-end conversion
- [ ] Support RSS feeds
- [ ] Daily news digest

### 3.2 Podcast Support ⚠️ PARTIALLY IMPLEMENTED

#### Podcast Management ⚠️ EXISTS BUT BROKEN
- [x] Podcast models (exist, broken)
- [x] Podcast service (exists, broken)
- [x] Podcast UI (exists, broken)
- [ ] Fix all podcast compilation errors
- [ ] Add podcast feeds
- [ ] Download episodes
- [ ] Playback with queue
- [ ] Auto-download new episodes
- [ ] Playback speed control

**Implementation Notes**:
- Significant podcast infrastructure exists
- All components have errors
- Decide: fix or remove?

### 3.3 Plex Integration ⚠️ PARTIALLY IMPLEMENTED

#### Plex Features ⚠️ EXISTS BUT BROKEN
- [x] Plex API integration (code exists, broken)
- [x] Plex service (exists, broken)
- [ ] Fix compilation errors
- [ ] Connect to Plex server
- [ ] Browse Plex libraries
- [ ] Sync metadata
- [ ] Play media from Plex

**Implementation Notes**:
- Extensive Plex code exists
- All components have errors
- Decide: fix or remove?
- May be out of scope for core app

### 3.4 AI/ML Features ⚠️ PARTIALLY IMPLEMENTED

#### Content Analysis ⚠️ EXISTS BUT BROKEN
- [x] Gemini integration (code exists, broken)
- [x] Gemma LLM (code exists, broken)
- [x] Smart analyzer (code exists, broken)
- [ ] Fix all AI/ML compilation errors
- [ ] Automated metadata extraction
- [ ] Content summarization
- [ ] Genre classification
- [ ] Similar book recommendations

**Implementation Notes**:
- Multiple AI services exist
- All have compilation errors
- Decide: fix or remove?
- May require API keys/costs

#### OCR Support ⚠️ EXISTS BUT BROKEN
- [x] OCR service (code exists, broken)
- [ ] Fix compilation errors
- [ ] Extract text from images
- [ ] PDF text extraction
- [ ] Searchable PDF creation

### 3.5 Music Library ⚠️ PARTIALLY IMPLEMENTED

#### Music Management ⚠️ EXISTS BUT BROKEN
- [x] Music metadata service (code exists, broken)
- [x] Music library UI (code exists, broken)
- [ ] Fix compilation errors
- [ ] Music library browsing
- [ ] Album/artist views
- [ ] Playlist management
- [ ] Audio playback (depends on AudioPlaybackManager fix)
- [ ] Lyrics support

**Implementation Notes**:
- Music infrastructure exists
- AudioPlaybackManager critical error blocks all audio
- Decide priority level for music features

### 3.6 Video Library ⚠️ PARTIALLY IMPLEMENTED

#### Video Management ⚠️ EXISTS BUT BROKEN
- [x] Video service (code exists, broken)
- [x] Video player (code exists, broken)
- [ ] Fix compilation errors
- [ ] Video library browsing
- [ ] Video metadata
- [ ] Subtitle support
- [ ] Hardware acceleration
- [ ] Casting support

### 3.7 Comics/Manga ⚠️ PARTIALLY IMPLEMENTED

#### Comic Reader ⚠️ EXISTS BUT BROKEN
- [x] Comic reader (code exists, broken)
- [ ] Fix compilation errors
- [ ] CBZ/CBR support
- [ ] Page-by-page navigation
- [ ] Zoom and pan
- [ ] Reading direction (LTR/RTL)
- [ ] Dual page mode

---

## 🎯 RECOMMENDED IMPLEMENTATION PRIORITY

### Priority 1: Get to MVP (Months 1-2)
Focus on making core book reading features work:
1. Fix all compilation errors
2. Test and fix library management
3. Test and fix EPUB reader
4. Test and fix file system access
5. Test and fix Calibre import
6. Basic settings implementation

**Goal**: Functional book library app

### Priority 2: Essential Enhancements (Month 3)
Make the app usable and pleasant:
1. Reading customization (fonts, colors)
2. Reading progress tracking
3. Bookmarks
4. Search and filter
5. Sort options
6. Basic statistics

**Goal**: Competitive book reading app

### Priority 3: User Requested Features (Months 4-5)
Based on user feedback:
1. Annotations and highlighting
2. Dictionary integration
3. Collections and tags
4. Cloud sync (if requested)
5. Widgets

**Goal**: Feature-rich reading app

### Priority 4: Advanced Features (Month 6+)
If time and resources allow:
1. Podcast support (if desired)
2. Music support (if desired)
3. Video support (if desired)
4. Content creation features
5. AI/ML features
6. Plex integration

**Goal**: Universal media library

---

## ⚠️ FEATURES TO CONSIDER REMOVING

Some implemented features may be out of scope or too complex:

### Candidates for Removal:
1. **Plex Integration** - Complex, maintenance burden, limited audience
2. **AI/ML Features** - Complex, API costs, may not be essential
3. **Web Fiction Scraping** - Legal concerns, maintenance burden
4. **News to EPUB** - Niche feature, limited use
5. **Video Library** - Very different from books, complex
6. **Music Library** - Very different from books, complex
7. **Podcast Management** - Very different from books, complex

### Recommendation:
**Focus on being an excellent book library app first.**

If the app succeeds as a book reader, consider adding other media types in future versions. Trying to support everything at once may result in nothing working well.

---

## 📊 FEATURE COMPLEXITY ESTIMATES

### Simple (1-2 weeks each)
- Font/size customization
- Theme selection
- Bookmarks
- Reading progress
- Sort/filter
- Basic search

### Medium (2-4 weeks each)
- Annotations/highlighting
- Dictionary integration
- Collections/tags
- Statistics
- Widgets
- Cloud sync basics

### Complex (4-8 weeks each)
- Advanced EPUB3 support
- PDF enhancements
- TTS integration
- Podcast management
- Music library
- Video library
- AI/ML features

### Very Complex (8+ weeks each)
- Content creation features
- Plex integration
- Full cloud sync with conflict resolution
- Advanced video features
- OCR implementation

---

## ✅ SUCCESS METRICS

### MVP Success:
- [ ] App compiles
- [ ] App installs and launches
- [ ] Can create library
- [ ] Can import Calibre library
- [ ] Can browse books
- [ ] Can read EPUB files
- [ ] Can read PDF files
- [ ] No crashes during basic use

### Publication Ready:
- [ ] All MVP features work
- [ ] Basic customization available
- [ ] Acceptable performance
- [ ] No critical bugs
- [ ] Complies with Play Store policies
- [ ] Privacy policy in place
- [ ] App store listing ready

### Competitive:
- [ ] All Phase 2 reading enhancements
- [ ] Annotations and highlighting
- [ ] Dictionary integration
- [ ] Collections and organization
- [ ] Good user reviews
- [ ] Active user base

---

## 📝 RECOMMENDATIONS

### Immediate Focus (Weeks 1-4):
1. **FIX COMPILATION ERRORS** (top priority)
2. Get MVP features working
3. Test end-to-end workflows
4. Fix critical bugs

### Short Term (Months 2-3):
1. Complete MVP feature set
2. Add essential enhancements
3. Polish user experience
4. Prepare for publication

### Medium Term (Months 4-6):
1. Add user-requested features
2. Improve based on feedback
3. Consider Phase 2 features selectively
4. Build user base

### Long Term (6+ months):
1. Evaluate success as book app
2. Consider expanding to other media types
3. Evaluate complex features (AI, cloud, etc.)
4. Plan next major version

---

## 🎓 LESSONS FOR IMPLEMENTATION

1. **Start Small**: Focus on core book reading first
2. **Test Early**: Test each feature as implemented
3. **User Feedback**: Let users guide feature priority
4. **Simplify**: Remove features that don't work or aren't needed
5. **Iterate**: Small, tested releases beat big broken ones
6. **Focus**: Being great at one thing beats being mediocre at many

---

**Document Created**: January 2025  
**To Be Updated**: After MVP achieved and user feedback received

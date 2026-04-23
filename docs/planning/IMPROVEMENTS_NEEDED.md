# CleverFerret PWA - Improvements Needed

## Planning metadata requirement

- Every planned feature task must include:
  - **Owner module(s):** e.g., `feature/opds`, `core/network`, `core/auth`
  - **Path hint(s):** explicitly call out `CleverFerret/` vs `CleverFerretV2/`
- **Reviewer rule:** reject feature tasks that omit module mapping.

## 🔴 Critical Issues

### 1. Error Handling & User Feedback
- **Owner module(s):** `core/ui-feedback`, `core/logging`, `core/error-boundary`
- **Path hint(s):** `CleverFerret/` (current PWA/React surfaces)
- **Replace `alert()` calls** with proper Material-UI Snackbars/Dialogs
  - `StorageBrowserScreen.tsx` - line 66
  - `WebFictionManagerScreen.tsx` - lines 70, 76, 81
  - `RadioScreen.tsx` - multiple alerts
  - `RadioDiscoveryScreen.tsx` - multiple alerts
- **Developer guidance:** See `docs/development/NOTIFICATION_PATTERNS.md` for Snackbar vs Dialog usage rules in recoverable vs destructive flows.
- **Add Error Boundaries** to catch React errors gracefully
- **Replace console.error** with proper error logging service
- **Improve 404 page** - Currently just a div, needs proper navigation help

### 2. Incomplete Core Features
- **Owner module(s):** `feature/readers`, `feature/file-open`, `core/media-metadata`
- **Path hint(s):** `CleverFerret/` for current app implementation; only assign to `CleverFerretV2/` when the issue is explicitly a V2 port.

#### Readers (Critical for app functionality)
- **EPUB Reader** (`EReaderScreen.tsx`) - Currently placeholder, needs epub.js integration
- **PDF Reader** (`PDFReaderScreen.tsx`, `EnhancedPDFReaderScreen.tsx`) - Needs pdf.js integration
- **Comic Reader** (`ComicReaderScreen.tsx`) - Needs actual comic file parsing (CBR/CBZ extraction)

#### File Opening
- **System file opening** - Partially implemented, needs File System Access API integration
- **URL opening** - Not implemented (MediaOpenScreen.tsx line 80)

#### Media Processing
- **Metadata fetching** - Placeholder in `MediaItemDetailScreen.tsx`
- **Thumbnail regeneration** - Not implemented (LibraryManagementScreen.tsx line 177)
- **Metadata refresh** - Not implemented (LibraryManagementScreen.tsx line 139)

### 3. Missing Service Implementations
- **Owner module(s):** `feature/webfiction`, `feature/opds`, `feature/plex`, `feature/podcasts`
- **Path hint(s):** primarily `CleverFerret/`; module-specific V2 tasks must be labeled as `CleverFerretV2/...`.

#### Web Fiction
- **Story URL parsing** - Not implemented (WebFictionManagerScreen.tsx)
- **Chapter downloading** - Not implemented
- **Update checking** - Not implemented

#### OPDS
- **OPDS parsing** - Placeholder (OPDSCatalogBrowserScreen.tsx line 115)
- **OPDS download** - Not implemented (line 144)

#### Plex Integration
- **Plex authentication** - Not implemented (PlexAuthScreen.tsx line 31)
- **Plex sync** - Not implemented (PlexIntegrationScreen.tsx line 100)

#### Podcasts
- **Feed parsing** - Placeholder (PodcastManagerScreen.tsx line 73)
- **Episode downloading** - Placeholder (PodcastService.ts line 76)

## 🟡 Important Improvements

### 4. UI/UX Enhancements
- **Owner module(s):** `feature/library-ui`, `core/design-system`
- **Path hint(s):** `CleverFerret/` UI components unless a V2-only UI ticket is filed.

#### Placeholder Images
- Replace all `/placeholder-*.png` references with:
  - Generated cover art (coverGenerator.ts exists but not used)
  - Fallback icons with proper theming
  - Loading skeletons

#### Loading States
- Add loading indicators to:
  - Library loading
  - Media item loading
  - Search operations
  - File operations

#### Offline Support
- Add offline indicators
- Show cached content when offline
- Better offline error messages

### 5. Code Quality
- **Owner module(s):** `core/quality`, `core/logging`, `core/types`
- **Path hint(s):** repository-wide; specify concrete root (`CleverFerret/` or `CleverFerretV2/`) per ticket.

#### Remove Debug Code
- Clean up `console.log` statements (keep only in development)
- Replace with proper logging service
- Remove commented-out code

#### Error Boundaries
- Add React Error Boundaries to:
  - App root
  - Route components
  - Reader components
  - Player components

#### Type Safety
- Fix any `any` types
- Add proper TypeScript types for file handles
- Type service responses

### 6. Performance
- **Owner module(s):** `core/performance`, `core/caching`, `feature/search`
- **Path hint(s):** `CleverFerret/` unless profiling report references V2 runtime.

#### Lazy Loading
- Implement code splitting for:
  - Readers (EPUB, PDF, Comic)
  - Players (Audio, Video)
  - Heavy components

#### Caching
- Implement proper caching for:
  - Metadata
  - Thumbnails
  - Parsed content

#### Optimization
- Optimize large data files (radioStationsAggregated.ts/json)
- Implement virtual scrolling for long lists
- Add pagination where needed

## 🟢 Nice-to-Have Features

### 7. Enhanced Functionality
- **Owner module(s):** `feature/search`, `feature/collections`, `feature/stats`
- **Path hint(s):** assign explicitly to `CleverFerret/` or `CleverFerretV2/` at ticket creation.

#### Search
- Implement full-text search
- Add search filters
- Add search history

#### Collections & Series
- Implement series grouping
- Add collection management
- Add smart collections

#### Statistics
- Complete reading statistics
- Add listening statistics
- Add viewing statistics
- Implement heatmaps and charts

### 8. Integration Improvements
- **Owner module(s):** `core/filesystem`, `core/sync`
- **Path hint(s):** legacy integration work in `CleverFerret/`; V2 integrations must be scoped to `CleverFerretV2/`.

#### File System
- Implement File System Access API
- Add drag-and-drop support
- Add file watching

#### Sync
- Implement cloud sync
- Add device sync
- Add backup/restore

### 9. Accessibility
- **Owner module(s):** `core/accessibility`, `core/ui-compose`
- **Path hint(s):** identify target app root before implementation (`CleverFerret/` vs `CleverFerretV2/`).

#### Screen Readers
- Add proper ARIA labels
- Improve keyboard navigation
- Add focus management

#### Visual
- Improve contrast ratios
- Add high contrast mode
- Support font scaling

## 📋 Priority Recommendations

### Immediate (This Week)
1. ✅ Replace all `alert()` with Snackbars
2. ✅ Add Error Boundary component
3. ✅ Improve 404 page
4. ✅ Add loading states to critical screens
5. ✅ Replace placeholder images with generated covers

### Short Term (This Month)
1. Implement EPUB reader with epub.js
2. Implement PDF reader with pdf.js
3. Implement comic reader (CBR/CBZ extraction)
4. Complete file opening from system
5. Implement metadata fetching

### Medium Term (Next Quarter)
1. Complete web fiction downloader
2. Implement OPDS parsing
3. Add Plex authentication
4. Implement podcast feed parsing
5. Add proper error logging service

### Long Term (Future)
1. Cloud sync
2. Advanced statistics
3. Full-text search
4. Smart collections
5. Advanced accessibility features

## 🔧 Technical Debt

### Dependencies
- Review and update all dependencies
- Remove unused dependencies
- Add missing dependencies for readers

### Architecture
- Refactor service layer for better error handling
- Implement proper state management
- Add service worker for background tasks

### Testing
- Add unit tests for services
- Add integration tests for readers
- Add E2E tests for critical flows

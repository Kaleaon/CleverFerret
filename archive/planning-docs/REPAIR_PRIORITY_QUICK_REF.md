# CleverFerret - Repair Priority Quick Reference

**Quick access guide to prioritize repair work**

---

## 🚨 IMMEDIATE ACTION REQUIRED (Fix These First)

### 1. CalibreImportService.kt - 13 ERRORS
**Time Estimate**: 2-4 hours  
**Impact**: CRITICAL - Calibre import is core feature  
**Difficulty**: ⭐ LOW (simple variable name fixes + add DAO methods)

**Errors**:
- Lines 43-44: `bookRecord` should be `rawBook`
- Lines 80-97: Missing DAO methods in MetadataDao

**Fix Steps**:
1. Replace `bookRecord` with `rawBook` (lines 43-44)
2. Add missing methods to MetadataDao interface:
   - `findPersonByName(name: String): Long?`
   - `insertPerson(person: Person): Long`
   - `insertItemPersonRole(role: ItemPersonRole)`
   - `findSeriesByName(name: String): Long?`
   - `insertSeries(series: Series): Long`
   - `updateBookWithSeries(itemId: Long, seriesId: Long)`
   - `findGenreByName(name: String): Long?`
   - `insertGenre(genre: Genre): Long`
   - `insertItemGenre(itemGenre: ItemGenre)`

---

### 2. MediaScannerService.kt - 40 ERRORS
**Time Estimate**: 4-8 hours  
**Impact**: CRITICAL - Media scanning is core feature  
**Difficulty**: ⭐⭐ MEDIUM (enum fixes + model updates)

**Error Categories**:
- MediaType enum not found (multiple lines)
- Type inference failures
- Missing parameters in MediaItem constructor
- Missing DAO methods for specialized metadata

**Fix Steps**:
1. Check MediaType enum import/definition
2. Update MediaItem model to include or remove: albumTitle, genre, releaseYear, director, cast, rating, subtitles
3. Add or stub out missing DAO methods:
   - `insertMusicTrackMetadata()`
   - `insertMovieMetadata()`

---

### 3. BookshelfViewModel.kt - 74 ERRORS
**Time Estimate**: 6-10 hours  
**Impact**: CRITICAL - Bookshelf is core UI  
**Difficulty**: ⭐⭐⭐ HIGH (complex state management)

**Priority**: Fix after CalibreImportService and MediaScannerService

---

### 4. BookshelfScreen.kt - 56 ERRORS
**Time Estimate**: 4-6 hours  
**Impact**: CRITICAL - Bookshelf UI is core  
**Difficulty**: ⭐⭐ MEDIUM (UI component fixes)

**Priority**: Fix after BookshelfViewModel

---

## ⏸️ DISABLE IMMEDIATELY (Reduce Error Count by ~750+)

### Files to Disable (Create .disabled versions):

1. **WebFictionService.kt** - 223 ERRORS
   - Not MVP critical
   - Too many errors
   - Can re-enable later

2. **FanfictionToEpubConverter.kt** - 59 ERRORS
   - Legal concerns
   - Incomplete implementation
   - Not MVP critical

3. **FanfictionToEPUBConverter.kt** - 57 ERRORS
   - Duplicate of above
   - Same concerns

4. **FanfictionToEpubConverterBasic.kt** - 55 ERRORS
   - Content creation not MVP
   - Legal concerns

5. **NewsToEpubConverter.kt** - 36 ERRORS
   - Content creation not MVP
   - Can use third-party tools

6. **PodcastService.kt** - 64 ERRORS
   - Podcast features not MVP critical
   - Can re-enable with PodcastDownloadManager

7. **PodcastViewModel.kt** - 81 ERRORS
   - Depends on PodcastService
   - Disable with service

8. **EnhancedEReaderScreen.kt** - 64 ERRORS
   - Enhanced features not MVP
   - Basic reader sufficient

9. **ComicReaderComponents.kt** - 38 ERRORS
   - Comic reader not MVP
   - Can add later

**Command to Disable**:
```bash
cd CleverFerret/src/main/java/com/universalmedialibrary
mv services/webfiction/WebFictionService.kt services/webfiction/WebFictionService.kt.disabled
mv services/contentcreation/FanfictionToEpubConverter.kt services/contentcreation/FanfictionToEpubConverter.kt.disabled
mv services/contentcreation/FanfictionToEPUBConverter.kt services/contentcreation/FanfictionToEPUBConverter.kt.disabled
mv services/contentcreation/FanfictionToEpubConverterBasic.kt services/contentcreation/FanfictionToEpubConverterBasic.kt.disabled
mv services/contentcreation/NewsToEpubConverter.kt services/contentcreation/NewsToEpubConverter.kt.disabled
mv services/podcast/PodcastService.kt services/podcast/PodcastService.kt.disabled
mv ui/podcast/PodcastViewModel.kt ui/podcast/PodcastViewModel.kt.disabled
mv ui/reader/EnhancedEReaderScreen.kt ui/reader/EnhancedEReaderScreen.kt.disabled
mv ui/reader/components/ComicReaderComponents.kt ui/reader/components/ComicReaderComponents.kt.disabled
```

**Impact**: Reduce errors by ~777 (44% of total 1,755 errors)

---

## 📊 ERROR COUNT BY FILE (Top 20)

| Rank | File | Errors | Action |
|------|------|--------|--------|
| 1 | WebFictionService.kt | 223 | ⏸️ DISABLE |
| 2 | PodcastViewModel.kt | 81 | ⏸️ DISABLE |
| 3 | MediaNotificationService.kt | 76 | 🔧 FIX (Phase 3) |
| 4 | BookshelfViewModel.kt | 74 | 🔧 FIX (Phase 1) |
| 5 | PodcastService.kt | 64 | ⏸️ DISABLE |
| 6 | EnhancedEReaderScreen.kt | 64 | ⏸️ DISABLE |
| 7 | FanfictionToEpubConverter.kt | 59 | ⏸️ DISABLE |
| 8 | UniversalMediaLibraryScreen.kt | 57 | 🔧 FIX (Phase 3) |
| 9 | FanfictionToEPUBConverter.kt | 57 | ⏸️ DISABLE |
| 10 | BookshelfScreen.kt | 56 | 🔧 FIX (Phase 1) |
| 11 | FanfictionToEpubConverterBasic.kt | 55 | ⏸️ DISABLE |
| 12 | DocumentReaderComponents.kt | 46 | 🔧 FIX (Phase 3) |
| 13 | RealMetadataService.kt | 41 | 🔧 FIX (Phase 4) |
| 14 | MediaScannerService.kt | 40 | 🔧 FIX (Phase 1) |
| 15 | EPUBReaderService.kt | 40 | 🔧 FIX (Phase 3) |
| 16 | BookshelfComponents.kt | 39 | 🔧 FIX (Phase 3) |
| 17 | ComicReaderComponents.kt | 38 | ⏸️ DISABLE |
| 18 | NewsToEpubConverter.kt | 36 | ⏸️ DISABLE |
| 19 | OCRService.kt | 32 | ✅ Already disabled |
| 20 | EPUBReaderScreen.kt | 30 | 🔧 FIX (Phase 3) |

---

## ⏱️ TIME ESTIMATES BY PHASE

### Phase 1: Critical Core Fixes (Week 1-2)
- **CalibreImportService.kt**: 2-4 hours
- **MediaScannerService.kt**: 4-8 hours  
- **BookshelfViewModel.kt**: 6-10 hours
- **BookshelfScreen.kt**: 4-6 hours
- **Total**: 16-28 hours (2-4 days)

### Phase 2: Disable Non-MVP Features (Week 2)
- **Disable 9 files**: 4-8 hours (1 day)
- **Error reduction**: ~750 errors eliminated

### Phase 3: Core Reader & Playback (Week 3-4)
- **EPUBReaderService.kt**: 6-8 hours
- **EPUBReaderScreen.kt**: 4-6 hours
- **DocumentReaderComponents.kt**: 6-8 hours
- **MediaNotificationService.kt**: 8-12 hours
- **Total**: 22-32 hours (3-4 days)

### Phase 4: Polish & Metadata (Week 5-6)
- **RealMetadataService.kt**: 6-10 hours
- **UniversalMediaLibraryScreen.kt**: 6-10 hours
- **BookshelfComponents.kt**: 4-8 hours
- **Polish & Testing**: 4-12 hours
- **Total**: 20-40 hours (3-5 days)

### Total Effort
**62-108 hours** (8-14 days of focused development)

---

## 🎯 SUCCESS METRICS

### After Phase 1:
- ✅ Errors reduced to < 1,000 (from 1,755)
- ✅ Calibre import working
- ✅ Media scanning working
- ✅ Bookshelf displaying items

### After Phase 2:
- ✅ Errors reduced to < 300 (from 1,000)
- ✅ Build compiles successfully
- ✅ APK can be generated

### After Phase 3:
- ✅ Errors reduced to < 100
- ✅ Basic e-reader working
- ✅ Media notifications working
- ✅ Core features functional

### MVP Complete:
- ✅ Zero compilation errors
- ✅ All core features working
- ✅ Unit tests passing
- ✅ Manual testing successful
- ✅ APK ready for beta testing

---

## 🔍 ALREADY CORRECTLY DISABLED (No Action Needed)

These files are intentionally disabled per AI/ML strategy:

1. ✅ GemmaLLMService.kt.disabled (11 KB)
2. ✅ SmartContentAnalyzer.kt.disabled (19 KB)
3. ✅ classification.disabled/ → ContentClassifier.kt (11 KB)
4. ✅ comparison.disabled/ → ArchiveComparator.kt (3.9 KB)
5. ✅ fingerprint.disabled/ → ContentFingerprinter.kt (17 KB)
6. ✅ nlp.disabled/ → MetadataExtractor.kt (6.5 KB)
7. ✅ ocr.disabled/ → OCRService.kt (15 KB)

**Total**: 7 files (~77 KB)  
**Status**: Keep disabled - use Gemini API for AI/ML features instead

---

## 📝 QUICK DECISION TREE

### "Should I fix or disable this file?"

```
Is it essential for MVP? (Library + Import + Basic Reading)
├─ YES → Fix it (Phase 1-3)
│   ├─ Is it < 50 errors? → Fix immediately (Phase 1)
│   └─ Is it > 50 errors? → Fix in Phase 3
│
└─ NO → Disable it (Phase 2)
    ├─ Content Creation? → Disable (legal concerns)
    ├─ Advanced UI? → Disable (basic version sufficient)
    ├─ Podcast/WebFiction? → Disable (not core)
    └─ AI/ML? → Already disabled ✅
```

---

## 🚀 GETTING STARTED (Today)

### Morning (2-4 hours):
1. Fix CalibreImportService.kt variable names
2. Add missing DAO methods to MetadataDao
3. Test Calibre import compiles

### Afternoon (4-6 hours):
1. Fix MediaType enum in MediaScannerService
2. Update MediaItem model
3. Test media scanning compiles

### Next Day:
1. Disable 9 non-MVP files
2. Verify error count reduced by ~750
3. Start on BookshelfViewModel

---

**Created**: January 2025  
**Purpose**: Quick reference for repair prioritization  
**Status**: Ready for immediate use  
**See Also**: CURRENT_DISABLED_BROKEN_CODE_ANALYSIS.md (comprehensive analysis)

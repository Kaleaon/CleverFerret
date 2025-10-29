# Most Useful Calibre Plugins for CleverFerret

**Research Date**: October 27, 2025  
**Source**: https://plugins.calibre-ebook.com/  
**Total Plugins Analyzed**: 189+

---

## Executive Summary

CleverFerret is a Universal Media Library for Android managing books, comics, music, movies, and podcasts. After analyzing 189+ Calibre plugins, I've identified **30 high-priority plugins** that would significantly enhance CleverFerret's functionality, particularly in:

1. **Metadata enrichment** from diverse sources
2. **Fanfiction downloading** and management
3. **Comic/manga** metadata and organization
4. **Audiobook** metadata extraction
5. **AI-powered features** (translation, analysis)
6. **Series management** and organization
7. **Format conversion** and optimization

---

## 🔥 TOP 10 MUST-HAVE PLUGINS

### 1. **FanFicFare** ⭐⭐⭐⭐⭐
- **Purpose**: Download fanfiction from 90+ sites
- **Why CleverFerret Needs It**: CleverFerret already has disabled fanfiction converters. FanFicFare is the gold standard with mature adapters for AO3, FFN, Wattpad, Royal Road, etc.
- **Key Features**:
  - 90+ site adapters (AO3, FFN, Wattpad, Royal Road, ScribbleHub, etc.)
  - Rich metadata extraction (tags, ratings, relationships, characters)
  - Update detection (download only new chapters)
  - EPUB generation with proper formatting
- **Implementation Priority**: **HIGHEST** - Core feature for CleverFerret
- **Android Adaptation**: Use site adapter pattern, Jsoup for parsing, OkHttp for networking
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=259221

### 2. **Goodreads** ⭐⭐⭐⭐⭐
- **Purpose**: Comprehensive book metadata from Goodreads
- **Why CleverFerret Needs It**: Goodreads has the most extensive book database with user reviews, ratings, and recommendations
- **Key Features**:
  - Book metadata (title, author, ISBN, description)
  - Cover images (high quality)
  - User ratings and reviews
  - Similar book recommendations
  - Series information
- **Implementation Priority**: **HIGHEST**
- **Android Adaptation**: Use Goodreads API (requires API key) or web scraping with Jsoup

### 3. **Comicvine** ⭐⭐⭐⭐⭐
- **Purpose**: Comic book metadata from Comicvine database
- **Why CleverFerret Needs It**: CleverFerret has comic reader features; Comicvine is the IMDB of comics
- **Key Features**:
  - Comic metadata (publisher, issue number, story arcs)
  - Character information
  - Creator credits (writers, artists)
  - High-quality cover images
  - Series and volume tracking
- **Implementation Priority**: **HIGH**
- **Android Adaptation**: Comicvine API available
- **Forum**: https://www.mobileread.com/forums/showthread.php?p=4237667

### 4. **Embed Comic Metadata** ⭐⭐⭐⭐
- **Purpose**: Embed/extract metadata in comic archives (CBZ/CBR)
- **Why CleverFerret Needs It**: Preserve metadata within comic files themselves
- **Key Features**:
  - Embed Calibre metadata into CBZ/CBR files
  - Import ComicInfo.xml from comics
  - Bidirectional sync
- **Implementation Priority**: **MEDIUM-HIGH**
- **Android Adaptation**: ZIP manipulation (built-in), XML parsing

### 5. **Import Audiobooks Metadata** ⭐⭐⭐⭐⭐
- **Purpose**: Extract metadata from audio files
- **Why CleverFerret Needs It**: CleverFerret handles music/audio; audiobook support would be natural extension
- **Key Features**:
  - Support for m4b, m4a, mp3, ogg, opus, flac, wma, mp4, aiff
  - Extract title, author, narrator, duration
  - Chapter information
  - Cover art extraction
- **Implementation Priority**: **HIGH**
- **Android Adaptation**: Use Android MediaMetadataRetriever, ID3 libraries
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=365850

### 6. **Ebook Translator** ⭐⭐⭐⭐
- **Purpose**: Translate ebooks to different languages using AI
- **Why CleverFerret Needs It**: Makes content accessible to international users
- **Key Features**:
  - Multiple translation engines (Google, DeepL, ChatGPT, etc.)
  - Preserve original text option
  - EPUB format support
  - Batch translation
- **Implementation Priority**: **MEDIUM**
- **Android Adaptation**: Use Google ML Kit Translation API
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=353052

### 7. **EpubMerge** ⭐⭐⭐⭐
- **Purpose**: Concatenate multiple EPUBs into one
- **Why CleverFerret Needs It**: Useful for series, multi-part stories, fanfiction compilations
- **Key Features**:
  - Merge multiple EPUBs
  - Preserve metadata
  - Combined TOC
  - Cover selection
- **Implementation Priority**: **MEDIUM**
- **Android Adaptation**: EPUB library manipulation
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=169744

### 8. **EpubSplit** ⭐⭐⭐⭐
- **Purpose**: Split large EPUBs into smaller books
- **Why CleverFerret Needs It**: Large fanfiction or web novels often need splitting
- **Key Features**:
  - Split by chapter
  - Split by size
  - Preserve formatting
- **Implementation Priority**: **MEDIUM**
- **Android Adaptation**: EPUB manipulation
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=178799

### 9. **Find Duplicates** ⭐⭐⭐⭐
- **Purpose**: Detect duplicate books based on metadata
- **Why CleverFerret Needs It**: Library management essential
- **Key Features**:
  - Fuzzy title matching
  - ISBN comparison
  - Author similarity
  - File size comparison
- **Implementation Priority**: **MEDIUM**
- **Android Adaptation**: Custom algorithm with Room database queries

### 10. **Count Pages** ⭐⭐⭐⭐
- **Purpose**: Calculate page/word count for EPUBs
- **Why CleverFerret Needs It**: Reading statistics and progress tracking
- **Key Features**:
  - Page count estimation
  - Word count
  - Character count
  - Store in custom columns
- **Implementation Priority**: **MEDIUM-LOW**
- **Android Adaptation**: HTML parsing, word counting algorithms

---

## 📚 METADATA SOURCE PLUGINS

### Books

#### **Google Books** ⭐⭐⭐⭐
- Comprehensive book database
- High-quality covers
- Preview content
- **Built into Calibre** - Easy to adapt

#### **Amazon (Multiple Countries)** ⭐⭐⭐⭐
- Download from multiple Amazon domains (.com, .co.uk, .de, etc.)
- Extensive book catalog
- Customer reviews
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=276521

#### **WorldCat** ⭐⭐⭐
- Library catalog network
- ISBN lookup
- Academic/rare books
- Authoritative metadata

#### **OpenLibrary** ⭐⭐⭐
- Open-source book database
- Free API access
- Historical books
- Multiple editions

#### **Fantastic Fiction** ⭐⭐⭐⭐
- Genre fiction specialist
- Series information
- Excellent for sci-fi/fantasy
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=132908

#### **Barnes & Noble** ⭐⭐⭐
- US book retailer
- Good cover images
- Book descriptions
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=132508

#### **Apple Books covers** ⭐⭐⭐⭐
- **NEW** - High-resolution covers
- Modern books
- Quality images
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=362859

### Comics

#### **MyAnimeList** (if available)
- Manga metadata
- User ratings
- Character info
- Series tracking

### Audiobooks

#### **Audiobookshelf Sync** ⭐⭐⭐⭐
- Sync with Audiobookshelf server
- Metadata sync
- Progress tracking
- **Forum**: https://www.mobileread.com/forums/showthread.php?p=4489158

#### **Audio M3U** ⭐⭐⭐
- M3U playlist support for audiobooks
- Chapter navigation
- Multi-file audiobooks
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=354707

#### **AudioBook_Duration** ⭐⭐⭐
- Calculate total duration
- Chapter durations
- Progress tracking
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=343035

---

## 📖 FANFICTION & WEB CONTENT

### **FanFicFare** ⭐⭐⭐⭐⭐ (Already covered above)

### **Similar Stories** ⭐⭐⭐
- Find similar books using full-text analysis
- Recommendation engine
- Natural language processing
- Store similarity scores
- **Implementation**: Would require significant ML infrastructure

---

## 🎨 COMIC/MANGA PLUGINS

### **Comicvine** ⭐⭐⭐⭐⭐ (Already covered)

### **Embed Comic Metadata** ⭐⭐⭐⭐ (Already covered)

### **PDFtoCBZ** ⭐⭐⭐
- Convert PDF comics to CBZ format
- Better for comic readers
- Compression options
- Format selection

---

## 🔧 FORMAT & CONVERSION TOOLS

### **EpubMerge** ⭐⭐⭐⭐ (Already covered)

### **EpubSplit** ⭐⭐⭐⭐ (Already covered)

### **EpubCheck** ⭐⭐⭐
- Validate EPUB files
- Find errors
- Standards compliance
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=282067

### **ACE** ⭐⭐⭐
- Accessibility checker for EPUBs
- WCAG compliance
- Screen reader compatibility
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=313848

### **Check Books** ⭐⭐⭐
- Run ACE and EPUBCheck together
- Comprehensive validation
- Quality assurance
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=345485

### **DeACSM** ⭐⭐⭐⭐
- Convert Adobe ACSM files to EPUB/PDF
- Remove DRM (legally owned books)
- Python reimplementation of libgourou
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=341975
- **Note**: DRM removal - legal gray area

---

## 🧹 ORGANIZATION & MANAGEMENT

### **Find Duplicates** ⭐⭐⭐⭐ (Already covered)

### **Manage Series** ⭐⭐⭐⭐
- GUI for series manipulation
- Reorder books
- Renumber series index
- Series metadata
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=164765

### **Clean Metadata** ⭐⭐⭐
- Clean up messy metadata
- Fix titles, authors, series
- Batch operations
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=249929

### **Category Tags** ⭐⭐⭐
- Tag authors, publishers, series
- Organizational system
- Custom taxonomies
- **Forum**: https://www.mobileread.com/forums/showthread.php?p=4142902

### **Extract ISBN** ⭐⭐⭐
- Extract ISBN from book content
- Automatic detection
- OCR support
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=126727

### **Annotations** ⭐⭐⭐
- Import annotations from devices
- Highlight management
- Notes and bookmarks
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=241206

---

## 🤖 AI & ADVANCED FEATURES

### **Ask Grok** ⭐⭐⭐⭐
- Ask questions about books using AI
- Content analysis
- Character analysis
- Theme exploration
- **Forum**: https://www.mobileread.com/forums/showthread.php?p=4503069
- **Note**: NEW plugin (Aug 2025), uses xAI's Grok

### **Ebook Translator** ⭐⭐⭐⭐ (Already covered)

### **EBook Metaguider (intellireading)** ⭐⭐⭐
- Bionic reading format
- Improve focus and speed
- Eye-tracking optimization
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=358615

### **Action Chains** ⭐⭐⭐
- Automate workflows
- Chain multiple actions
- Custom automation
- Event triggers
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=334974

---

## 💾 IMPORT/EXPORT/SYNC

### **BookFusion Plugin** ⭐⭐⭐⭐
- Sync to BookFusion reader (iOS/Android/Web)
- Cloud sync
- Cross-device reading
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=299911
- **Note**: Competes with CleverFerret but shows market demand

### **Backup Configuration Folder** ⭐⭐⭐
- Auto-backup Calibre config
- Settings preservation
- Disaster recovery
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=366033

---

## 📊 STATISTICS & ANALYSIS

### **Count Pages** ⭐⭐⭐⭐ (Already covered)

### **English Noun Frequency** ⭐⭐
- Word frequency analysis
- Tag generation from content
- Linguistic analysis
- **Forum**: https://www.mobileread.com/forums/showthread.php?t=263684

---

## 🌐 INTERNATIONAL/REGIONAL SOURCES

### Europe
- **BOL_NL** - Dutch books (bol.com)
- **DNB_DE** - German National Library
- **databazeknih.cz** - Czech books
- **Bokus** - Swedish books
- **Adlibris.se** - Swedish books
- **Babelio_db** - French books

### Other Languages
- **Douban Books** - Chinese books
- **Biblionet_gr** - Greek books
- **Evrit** - Hebrew books

---

## 🎯 IMPLEMENTATION RECOMMENDATIONS FOR CLEVERFERRET

### Phase 1: Core Functionality (Highest Priority)

1. **FanFicFare** - Implement site adapters for:
   - Archive of Our Own (AO3)
   - FanFiction.Net
   - Royal Road
   - Use existing CleverFerret code as foundation

2. **Goodreads API Integration**
   - Primary metadata source
   - Rich book information
   - User reviews and ratings

3. **Import Audiobooks Metadata**
   - Extend music capabilities to audiobooks
   - Extract metadata from audio files
   - Cover art extraction

4. **Find Duplicates**
   - Essential library management
   - Fuzzy matching algorithms
   - Room database integration

### Phase 2: Enhanced Features (High Priority)

5. **Comicvine Integration**
   - Comic metadata source
   - Complement existing comic reader

6. **Embed Comic Metadata**
   - CBZ/CBR metadata handling
   - ComicInfo.xml support

7. **EpubMerge/EpubSplit**
   - Fanfiction compilation
   - Large book management

8. **Manage Series**
   - Series organization UI
   - Reordering and renumbering

### Phase 3: Advanced Features (Medium Priority)

9. **Ebook Translator**
   - AI translation integration
   - Google ML Kit
   - Multi-language support

10. **Count Pages**
    - Reading statistics
    - Progress tracking enhancement

11. **Extract ISBN**
    - Automatic metadata lookup
    - OCR integration (already have Gemini OCR)

12. **Annotations Import**
    - If supporting external e-readers
    - Sync highlights/notes

### Phase 4: Power User Features (Lower Priority)

13. **Ask Grok** or similar AI
    - Book analysis
    - Question answering
    - Content exploration

14. **EBook Metaguider**
    - Bionic reading
    - Reading speed optimization

15. **Action Chains**
    - Workflow automation
    - Power user features

---

## 🔑 KEY TECHNICAL CONSIDERATIONS

### Android/Kotlin Adaptations

| Calibre (Python) | Android/Kotlin Alternative |
|------------------|----------------------------|
| BeautifulSoup4 | Jsoup (already used) |
| requests | OkHttp/Retrofit (already used) |
| ebooklib | nl.siegmann.epublib or custom |
| Pillow | Android Bitmap APIs |
| calibre DB | Room database (already used) |
| PyQt GUI | Jetpack Compose (already used) |

### Architecture Pattern

```kotlin
// Site Adapter Pattern (from FanFicFare)
interface ContentAdapter {
    val siteName: String
    val baseUrl: String
    
    fun canHandle(url: String): Boolean
    suspend fun extractMetadata(url: String): ContentMetadata
    suspend fun downloadContent(url: String): ByteArray
}

// Implementations
class AO3Adapter : ContentAdapter { ... }
class FFNAdapter : ContentAdapter { ... }
class ComicvineAdapter : ContentAdapter { ... }
class GoodreadsAdapter : ContentAdapter { ... }
```

### API Requirements

**Need API Keys**:
- Goodreads API (currently limited/deprecated - may need web scraping)
- Comicvine API (free tier available)
- Google Books API (free tier)
- Translation APIs (Google ML Kit - on-device)
- xAI Grok API (for Ask Grok feature)

**No API Keys**:
- FanFicFare sites (web scraping)
- Most metadata sources (web scraping)

---

## 📈 PRIORITY MATRIX

### Must-Have (Do First)
1. FanFicFare (AO3, FFN, Royal Road adapters)
2. Goodreads integration
3. Import Audiobooks Metadata
4. Find Duplicates

### Should-Have (Do Soon)
5. Comicvine
6. Embed Comic Metadata
7. EpubMerge
8. EpubSplit
9. Manage Series
10. Count Pages

### Nice-to-Have (Do Later)
11. Ebook Translator
12. Extract ISBN
13. Clean Metadata
14. Category Tags
15. EpubCheck

### Advanced Features (Do Eventually)
16. Ask Grok/AI features
17. EBook Metaguider
18. Action Chains
19. Similar Stories
20. Annotations Import

---

## 🚀 NEXT STEPS FOR CLEVERFERRET

### Immediate Actions (Week 1-2)

1. **Re-enable existing fanfiction code**:
   ```bash
   # Files to restore:
   - FanfictionToEpubConverterBasic.kt
   - SimpleEpubCreator.kt
   - StoryUpdateManager.kt
   ```

2. **Implement FanFicFare-inspired architecture**:
   - Create `ContentAdapter` interface
   - Implement `AO3Adapter` (easiest to start)
   - Test with simple story download

3. **Add Goodreads API integration**:
   - Register for API key (or web scraping fallback)
   - Create metadata source
   - Test metadata enrichment

### Short Term (Month 1)

4. **Audiobook metadata extraction**:
   - Use Android MediaMetadataRetriever
   - Support m4b, mp3, m4a
   - Create audiobook library section

5. **Duplicate detection**:
   - Implement fuzzy matching
   - Room database queries
   - UI for duplicate management

### Medium Term (Month 2-3)

6. **Comic enhancements**:
   - Comicvine API integration
   - ComicInfo.xml support
   - Comic metadata editor

7. **EPUB tools**:
   - Merge functionality
   - Split functionality
   - Validation tools

### Long Term (Month 4+)

8. **AI features**:
   - Translation (Google ML Kit)
   - Content analysis
   - Smart recommendations

9. **Advanced organization**:
   - Series management UI
   - Tag automation
   - Metadata cleanup tools

---

## 📚 RESOURCES

### Calibre Plugin Index
- **Main site**: https://plugins.calibre-ebook.com/
- **MobileRead Forums**: https://www.mobileread.com/forums/forumdisplay.php?f=237
- **Calibre Manual**: https://manual.calibre-ebook.com/

### Key Plugin Repositories
- **FanFicFare**: https://github.com/JimmXinu/FanFicFare
- **Calibre Plugins**: https://github.com/kovidgoyal/calibre/tree/master/src/calibre/customize
- **Community Plugins**: https://github.com/MobileRead

### Android Development
- **Jsoup**: https://jsoup.org/
- **OkHttp**: https://square.github.io/okhttp/
- **Epub Library**: https://github.com/psiegman/epublib
- **Room**: https://developer.android.com/training/data-storage/room

---

## 💡 CONCLUSION

Out of 189+ Calibre plugins analyzed, **30 plugins** are highly relevant for CleverFerret:

**Top 10 Priority**:
1. FanFicFare ⭐⭐⭐⭐⭐
2. Goodreads ⭐⭐⭐⭐⭐
3. Comicvine ⭐⭐⭐⭐⭐
4. Embed Comic Metadata ⭐⭐⭐⭐
5. Import Audiobooks Metadata ⭐⭐⭐⭐⭐
6. Ebook Translator ⭐⭐⭐⭐
7. EpubMerge ⭐⭐⭐⭐
8. EpubSplit ⭐⭐⭐⭐
9. Find Duplicates ⭐⭐⭐⭐
10. Count Pages ⭐⭐⭐⭐

**Implementation Strategy**:
- Start with **FanFicFare** (CleverFerret already has foundation code)
- Add **Goodreads** for rich metadata
- Extend to **audiobooks** (natural fit with music features)
- Build out **comic support** (already has comic reader)
- Add **AI features** (translation, analysis)

The plugins provide proven architectures and approaches that can be adapted to CleverFerret's modern Android/Kotlin stack.

---

**Document Created**: October 27, 2025  
**Research Complete**: ✅  
**Ready for Implementation**: ✅  
**Next Action**: Re-enable fanfiction code and start FanFicFare adapter implementation

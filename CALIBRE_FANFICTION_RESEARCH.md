# Calibre Fanfiction & News Fetching - Research & Implementation

**Research Date**: January 2025  
**Purpose**: Understand how Calibre handles fanfiction downloading and news fetching for CleverFerret integration

---

## Overview

Calibre has two main systems for content fetching:
1. **FanFicFare Plugin** - For fanfiction from multiple sites
2. **News Recipe System** - For automated news fetching from various sources

---

## 1. FanFicFare (Fanfiction Downloader)

### What is FanFicFare?

FanFicFare is a Calibre plugin (formerly known as "fanficdownloader") that downloads fanfiction from various sites and converts them to EPUB/MOBI formats.

**Official Repository**: https://github.com/JimmXinu/FanFicFare

### Supported Sites (90+)

**Major Sites**:
- **Archive of Our Own (AO3)** - archiveofourown.org
- **FanFiction.Net** - fanfiction.net  
- **Wattpad** - wattpad.com
- **FictionPress** - fictionpress.com
- **SpaceBattles** - forums.spacebattles.com
- **Sufficient Velocity** - forums.sufficientvelocity.com
- **QuestionableQuesting** - forum.questionablequesting.com
- **Royal Road** - royalroad.com
- **ScribbleHub** - scribblehub.com
- **Webnovel** - webnovel.com

**And 80+ more sites**: See full list at https://github.com/JimmXinu/FanFicFare/blob/main/fanficfare/sites.py

### How FanFicFare Works

#### Architecture

1. **Site Adapters** - Each supported site has a custom adapter
2. **Configuration System** - Highly configurable per-site and per-story
3. **Metadata Extraction** - Pulls title, author, summary, tags, characters, relationships
4. **Chapter Fetching** - Downloads all chapters (or specific ranges)
5. **EPUB Generation** - Creates well-formatted EPUB files
6. **Update Detection** - Can detect and download only new chapters

#### Key Features

**Metadata Handling**:
- Story title, author, summary
- Publication date, update date, completion status
- Word count, chapter count
- Ratings (Mature, Teen, General)
- Warnings (Violence, Sexual Content, etc.)
- Categories/Genres
- Characters and relationships
- Fandom/Crossover information
- Series information

**Download Options**:
- Download complete stories
- Download specific chapter ranges
- Update existing stories (download only new chapters)
- Automatically mark as read/unread

**Format Options**:
- EPUB (default)
- MOBI (for Kindle)
- HTML
- TXT

**Quality Features**:
- Properly formatted chapters
- Chapter titles and numbering
- Inline images (when available)
- Author notes
- Table of contents
- Cover images (when available)

### FanFicFare Configuration

**personal.ini** - Per-user configuration:
```ini
[archiveofourown.org]
# Include author notes
include:authorId

[fanfiction.net]
# Login credentials if needed
username:myuser
password:mypass

[defaults]
# Default format
output_format:epub

# Include metadata
add_genre_tags:true
add_character_tags:true
```

### Site-Specific Adapters

Each site has a Python adapter that:
1. Parses the site's HTML structure
2. Extracts story metadata
3. Downloads chapter content
4. Handles site-specific quirks (login, rate limiting, etc.)

**Example: AO3 Adapter Features**:
- Handles "view entire work" page
- Extracts all AO3-specific metadata (kudos, bookmarks, etc.)
- Respects rate limiting
- Handles restricted works (if logged in)
- Downloads images from chapters

**Example: FFN Adapter Features**:
- Navigates chapter-by-chapter structure
- Extracts FFN-specific metadata
- Handles JavaScript-protected content
- Respects FFN's terms of service

---

## 2. Calibre News Recipe System

### What are News Recipes?

Calibre's built-in system for fetching news articles from websites and converting them to ebook format (typically EPUB).

**Built-in Recipes**: 1000+ news sources
**Custom Recipes**: Users can create their own

### Supported News Sources

**Major News Outlets**:
- **General News**: BBC, CNN, New York Times, Washington Post, Guardian, Reuters
- **Tech News**: Ars Technica, The Verge, Wired, TechCrunch, Hacker News
- **Science**: Nature, Scientific American, New Scientist
- **Business**: Wall Street Journal, Financial Times, Bloomberg, Economist
- **International**: Al Jazeera, Deutsche Welle, France24
- **Magazines**: The Atlantic, New Yorker, Time, Newsweek

**See full list**: In Calibre → Fetch News → choose from dropdown (1000+ sources)

### How News Recipes Work

#### Recipe Structure

```python
from calibre.web.feeds.news import BasicNewsRecipe

class MyNewsSite(BasicNewsRecipe):
    title = 'My News Site'
    description = 'Latest news from...'
    
    # RSS feeds to fetch
    feeds = [
        ('Top Stories', 'https://example.com/rss/top'),
        ('Technology', 'https://example.com/rss/tech'),
    ]
    
    # What to keep/remove
    keep_only_tags = [{'class': 'article-content'}]
    remove_tags = [{'class': 'advertisement'}]
    
    # Fetch settings
    max_articles_per_feed = 25
    oldest_article = 7  # days
```

#### Key Features

**Automatic Fetching**:
- Schedule-based (daily, weekly, etc.)
- RSS/Atom feed parsing
- Article extraction and cleanup
- Image downloading
- EPUB generation

**Content Cleanup**:
- Remove ads
- Remove navigation elements
- Extract main article content
- Format for reading

**Metadata**:
- Article title and author
- Publication date
- Source publication
- Categories/sections

### Popular News APIs Used by Calibre

**RSS/Atom Feeds**:
- Most sites provide RSS feeds
- Standard XML format
- Easy to parse

**NewsAPI** (optional):
- Aggregates 70,000+ sources
- RESTful API
- Requires API key
- https://newsapi.org/

**Common Patterns**:
1. Parse RSS feed for article URLs
2. Download each article page
3. Extract content using CSS selectors
4. Clean HTML (remove ads, etc.)
5. Generate EPUB with all articles

---

## 3. Essential Tools & Dependencies

### Python Libraries Used by Calibre

**Core**:
- **BeautifulSoup4** - HTML/XML parsing
- **lxml** - Fast XML/HTML processing
- **requests** - HTTP client
- **Pillow** - Image processing

**EPUB Generation**:
- **ebooklib** - EPUB creation/editing
- **Jinja2** - Template engine for EPUB structure

**Network**:
- **urllib3** - Advanced HTTP features
- **cloudscraper** - Bypass Cloudflare protection
- **fake-useragent** - Rotate user agents

**Optional**:
- **Selenium** - For JavaScript-heavy sites
- **PyQt5** - GUI components
- **regex** - Advanced pattern matching

### Android/Kotlin Equivalents

For CleverFerret implementation:

| Calibre (Python) | Android/Kotlin Equivalent |
|------------------|---------------------------|
| BeautifulSoup4 | Jsoup |
| requests | OkHttp, Retrofit |
| ebooklib | nl.siegmann.epublib, custom |
| Pillow | Android Bitmap APIs |
| cloudscraper | OkHttp with custom interceptors |
| Selenium | WebView (limited) |

---

## 4. CleverFerret Implementation Strategy

### What Exists Already ✅

**Fanfiction Converters** (Disabled):
- `FanfictionToEpubConverterBasic.kt` - Basic AO3, FFN, Wattpad support
- `FanfictionToEPUBConverter.kt` - Enhanced version
- `SimpleEpubCreator.kt` - EPUB generation

**News Converters** (Disabled):
- `NewsToEpubConverter.kt` - News article fetching
- RSS feed parsing capability

### What Needs to Be Done

#### Phase 1: Re-enable & Fix Fanfiction Service

**Files to Re-enable**:
1. `FanfictionToEpubConverterBasic.kt`
2. `SimpleEpubCreator.kt`
3. `StoryUpdateManager.kt` (for tracking updates)

**Enhancements Needed**:
- Fix compilation errors
- Add more site adapters (use FanFicFare as reference)
- Improve metadata extraction
- Add update detection
- Add progress tracking

#### Phase 2: News Fetching Service

**Files to Re-enable**:
1. `NewsToEpubConverter.kt`

**Enhancements Needed**:
- Add popular news sources (RSS-based)
- Content cleanup logic
- Schedule system
- Image handling

#### Phase 3: Integration

**UI Components**:
- Fanfiction URL input
- Site selection
- Progress display
- Library integration

**Settings**:
- Default output format
- Metadata preferences
- Update frequency
- Storage location

---

## 5. Site-Specific Implementation Details

### Archive of Our Own (AO3)

**Base URL**: `https://archiveofourown.org`

**URL Pattern**: 
- Single work: `https://archiveofourown.org/works/{work_id}`
- Entire work view: `https://archiveofourown.org/works/{work_id}?view_entire_work=true`
- Series: `https://archiveofourown.org/series/{series_id}`

**Metadata Selectors** (CSS):
```css
Title: h2.title
Author: h3.byline a
Summary: .summary .userstuff
Fandom: .fandom .tag
Rating: .rating .tag
Warnings: .warning .tag
Relationships: .relationship .tag
Characters: .character .tag
Tags: .freeform .tag
Kudos: dd.kudos
Bookmarks: dd.bookmarks
Chapters: #chapters .chapter
```

**Features**:
- "View Entire Work" option (easier scraping)
- Rich metadata
- Explicit content warnings
- Series support
- Multi-chapter works

### FanFiction.Net

**Base URL**: `https://www.fanfiction.net`

**URL Pattern**:
- Story: `https://www.fanfiction.net/s/{story_id}/chapter_num/story_title`

**Metadata Selectors**:
```css
Title: #profile_top .xcontrast_txt
Author: #profile_top a.xcontrast_txt
Summary: #profile_top .xcontrast_txt (second one)
Stats: .xgray (parse for word count, chapters, etc.)
```

**Challenges**:
- Multi-page stories (need to iterate chapters)
- Rate limiting
- Some JavaScript protection
- Less structured metadata

### Wattpad

**Base URL**: `https://www.wattpad.com`

**URL Pattern**:
- Story: `https://www.wattpad.com/story/{story_id}-story_title`

**Challenges**:
- Heavy JavaScript usage
- Login may be required for mature content
- API access limited
- More complex scraping

---

## 6. Implementation Recommendations for CleverFerret

### Keep It Simple

**Priority Sites** (Start with these):
1. **Archive of Our Own** - Easy to scrape, great metadata
2. **FanFiction.Net** - Largest library
3. **Royal Road** - Growing web novel site

**Future Sites**:
4. Wattpad
5. SpaceBattles forums
6. ScribbleHub

### Architecture

```
FanfictionDownloadService
├── SiteAdapter (interface)
│   ├── AO3Adapter
│   ├── FFNAdapter
│   └── RoyalRoadAdapter
├── MetadataExtractor
├── ChapterFetcher
├── EpubGenerator
└── UpdateChecker
```

### Modern Kotlin Implementation

**Use**:
- Kotlin Coroutines for async operations
- StateFlow for progress updates
- Result types for error handling
- Dependency injection (Hilt)
- Room database for tracking

**Libraries**:
- **Jsoup** - HTML parsing (already used)
- **OkHttp** - HTTP client (already used)
- **nl.siegmann.epublib** or custom EPUB creator
- **Retrofit** - For API-based sources

### News Sources Strategy

**Start Simple**:
1. **RSS-based sources** (easiest)
   - BBC News RSS
   - Reuters RSS
   - Tech news (Ars Technica, The Verge)

2. **Aggregate via NewsAPI** (if needed)
   - Single API for multiple sources
   - Clean, structured data

**Implementation**:
```kotlin
@Singleton
class NewsDownloadService @Inject constructor(
    private val httpClient: OkHttpClient,
    private val epubCreator: EpubCreator
) {
    suspend fun fetchNews(source: NewsSource): Result<String> {
        // 1. Fetch RSS feed
        // 2. Parse articles
        // 3. Download article content
        // 4. Generate EPUB
        // 5. Return file path
    }
}
```

---

## 7. Legal & Ethical Considerations

### Fanfiction

**Legal Status**:
- Most fanfiction sites allow downloading for personal use
- **AO3** - Explicitly allows downloading (has download buttons)
- **FFN** - Terms of Service allow personal offline reading
- **Wattpad** - More restrictive, check ToS

**Best Practices**:
- Respect robots.txt
- Implement rate limiting
- Don't bypass paywalls
- Credit original authors
- Personal use only (no redistribution)

### News Content

**Legal Status**:
- RSS feeds are meant to be consumed
- Check each source's terms of service
- Some sites may block automated access

**Best Practices**:
- Use official RSS feeds
- Respect rate limits
- Include source attribution
- Don't bypass paywalls
- Personal use only

---

## 8. Implementation Priority

### Immediate (Week 1-2)

1. ✅ Research Calibre systems (this document)
2. Re-enable FanfictionToEpubConverterBasic.kt
3. Fix compilation errors
4. Test with AO3 (easiest site)

### Short Term (Week 3-4)

1. Add FFN support
2. Implement update detection
3. Add progress tracking UI
4. Test end-to-end workflow

### Medium Term (Month 2)

1. Add more site adapters
2. Implement news fetching
3. Add scheduling system
4. Polish UI/UX

---

## 9. Code Examples

### Site Adapter Interface

```kotlin
interface FanfictionSiteAdapter {
    val siteName: String
    val baseUrl: String
    
    fun canHandle(url: String): Boolean
    suspend fun extractMetadata(url: String): StoryMetadata
    suspend fun downloadChapters(url: String): List<Chapter>
    suspend fun checkForUpdates(storyId: String, lastChapter: Int): Boolean
}
```

### AO3 Adapter Example

```kotlin
class AO3Adapter @Inject constructor(
    private val httpClient: OkHttpClient
) : FanfictionSiteAdapter {
    
    override val siteName = "Archive of Our Own"
    override val baseUrl = "https://archiveofourown.org"
    
    override fun canHandle(url: String) = url.contains("archiveofourown.org")
    
    override suspend fun extractMetadata(url: String): StoryMetadata {
        val workId = extractWorkId(url)
        val doc = fetchDocument("$baseUrl/works/$workId?view_entire_work=true")
        
        return StoryMetadata(
            title = doc.select("h2.title").text(),
            author = doc.select("h3.byline a").text(),
            summary = doc.select(".summary .userstuff").html(),
            fandom = doc.select(".fandom .tag").map { it.text() },
            rating = doc.select(".rating .tag").text(),
            // ... more metadata
        )
    }
    
    override suspend fun downloadChapters(url: String): List<Chapter> {
        val doc = fetchDocument("$url?view_entire_work=true")
        val chapters = mutableListOf<Chapter>()
        
        doc.select("#chapters .chapter").forEachIndexed { index, element ->
            chapters.add(Chapter(
                number = index + 1,
                title = element.select(".title").text(),
                content = element.select(".userstuff").html()
            ))
        }
        
        return chapters
    }
}
```

---

## 10. Resources

### FanFicFare

- **GitHub**: https://github.com/JimmXinu/FanFicFare
- **Documentation**: https://github.com/JimmXinu/FanFicFare/wiki
- **Site List**: https://github.com/JimmXinu/FanFicFare/blob/main/fanficfare/sites.py
- **Configuration**: https://github.com/JimmXinu/FanFicFare/wiki/ConfiguringOutput

### Calibre News

- **Recipe Guide**: https://manual.calibre-ebook.com/news.html
- **Built-in Recipes**: https://github.com/kovidgoyal/calibre/tree/master/recipes
- **Custom Recipes**: https://manual.calibre-ebook.com/news_recipe.html

### Libraries

- **Jsoup** (Java/Kotlin HTML parsing): https://jsoup.org/
- **OkHttp**: https://square.github.io/okhttp/
- **Epub Library** (Kotlin): https://github.com/psiegman/epublib
- **NewsAPI**: https://newsapi.org/

---

## 11. Next Steps for CleverFerret

### Immediate Actions

1. **Re-enable fanfiction converters**:
   ```bash
   # Rename .disabled files back to .kt
   mv FanfictionToEpubConverterBasic.kt.disabled FanfictionToEpubConverterBasic.kt
   mv SimpleEpubCreator.kt.disabled SimpleEpubCreator.kt
   ```

2. **Fix compilation errors** in re-enabled files

3. **Test with AO3** (simplest site to start with)

4. **Create UI for fanfiction download**:
   - URL input field
   - Download button
   - Progress indicator
   - Success/error messages

5. **Integrate with library**:
   - Save downloaded EPUBs to library
   - Extract metadata
   - Create library entries

### Future Enhancements

1. Multiple site support (FFN, Royal Road, etc.)
2. Update checking for existing stories
3. Batch downloads
4. Series support
5. News fetching system
6. Scheduling and automation

---

## Conclusion

Calibre's fanfiction and news systems are:
- **Mature and well-tested** (10+ years of development)
- **Highly configurable** (90+ fanfiction sites, 1000+ news sources)
- **Well-documented** (extensive wikis and examples)

For CleverFerret:
- Start with **FanFicFare's approach** for fanfiction (site adapters)
- Use **Calibre's recipe system** as inspiration for news
- Implement in **modern Kotlin** with coroutines and proper error handling
- Focus on **top 3-5 sites** initially
- Ensure **legal compliance** and ethical scraping

The existing code in CleverFerret already has a good foundation - it just needs to be re-enabled, fixed, and enhanced with learnings from Calibre's implementations.

---

**Document Created**: January 2025  
**Research Complete**: Yes  
**Ready for Implementation**: Yes  
**Next Action**: Re-enable and fix fanfiction converters

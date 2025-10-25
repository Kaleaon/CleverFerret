# 📻 Radio Dramas & Old Time Radio - Proper Organization

## The Problem

**Radio Dramas/Soap Operas from the 1950s** don't fit well in existing categories:
- ❌ **Not Music** - They're narrative audio
- ❌ **Not Audiobooks** - They're not books
- ❌ **Not Podcasts** - They're historical radio shows
- ❌ **Not Videos** - Audio-only content

## The Solution: Create "Old Time Radio" Category

### Recommended Organization:

```
📚 Universal Media Library
├─ 🎵 Music
├─ 📖 Books
├─ 🎬 Videos
├─ 📻 Radio
│   ├─ 📡 Internet Radio Stations
│   ├─ 📶 FM Radio (if device supports)
│   └─ 🎭 Old Time Radio / Audio Dramas  ← NEW!
├─ 🎙️ Podcasts
└─ 🗂️ Collections
```

---

## Old Time Radio Category Structure

### Main Categories:

#### 1. **Radio Dramas** 🎭
```
Genre-based organization:
- Mystery/Thriller
  - The Shadow
  - Inner Sanctum Mysteries
  - Suspense
  
- Science Fiction
  - X Minus One
  - Dimension X
  
- Western
  - Gunsmoke
  - The Lone Ranger
  
- Comedy
  - The Jack Benny Program
  - Fibber McGee and Molly
  
- Adventure
  - The Adventures of Superman
  - Flash Gordon
```

#### 2. **Radio Soap Operas** 🧼
```
- The Guiding Light
- Ma Perkins
- Our Gal Sunday
- The Romance of Helen Trent
- Young Doctor Malone
```

#### 3. **Anthology Series** 📚
```
- Theater Guild on the Air
- Lux Radio Theater
- Mercury Theater on the Air
```

#### 4. **News & Documentary** 📰
```
- Historical broadcasts
- War-time reports
- Notable speeches
```

---

## Database Schema for Old Time Radio

### Suggested Structure:

```kotlin
@Entity(tableName = "old_time_radio")
data class OldTimeRadioEpisode(
    @PrimaryKey val id: Long,
    
    // Series Info
    val seriesTitle: String,        // e.g., "The Shadow"
    val episodeTitle: String?,      // e.g., "The Death House Rescue"
    val episodeNumber: Int?,        // Episode in series
    val seasonNumber: Int?,         // If applicable
    
    // Metadata
    val originalAirDate: String?,   // "1938-11-05"
    val broadcastNetwork: String?,  // "CBS", "NBC", "Mutual"
    val duration: Long,             // Milliseconds
    
    // Categorization
    val category: OTRCategory,      // Drama, Soap Opera, Comedy, etc.
    val genre: String?,             // Mystery, Western, Sci-Fi, etc.
    
    // Production Info
    val cast: String?,              // JSON array of actors
    val director: String?,
    val writer: String?,
    val sponsor: String?,           // Historical sponsor
    
    // File Info
    val uri: Uri,
    val filePath: String,
    val fileSize: Long,
    val quality: String?,           // "Excellent", "Good", "Fair"
    
    // User Data
    val lastPlayed: Long?,
    val playbackPosition: Long,
    val isComplete: Boolean,
    val isFavorite: Boolean,
    
    // Tags
    val tags: String?,              // Comma-separated
    
    val addedDate: Long
)

enum class OTRCategory {
    DRAMA,           // General drama
    MYSTERY,         // Mystery/Detective
    THRILLER,        // Suspense/Thriller
    SCI_FI,          // Science Fiction
    HORROR,          // Horror
    WESTERN,         // Western
    COMEDY,          // Comedy
    SOAP_OPERA,      // Soap Opera
    ADVENTURE,       // Adventure
    ANTHOLOGY,       // Anthology series
    NEWS,            // News/Documentary
    VARIETY,         // Variety shows
    CHILDREN,        // Children's programs
    OTHER            // Other
}
```

---

## UI Organization

### Main Radio Section:

```
┌─────────────────────────────────────┐
│ 📻 Radio                            │
├─────────────────────────────────────┤
│                                     │
│ [📡 Internet Radio]                 │
│   Your saved radio stations         │
│   Stream live radio                 │
│                                     │
│ [📶 FM Radio]                       │
│   Tune to local FM stations         │
│   (if device supports)              │
│                                     │
│ [🎭 Old Time Radio]                 │
│   Classic radio dramas & shows      │
│   1930s-1960s golden age           │
│                                     │
│ [🎙️ Podcasts]                       │
│   Modern podcast episodes           │
│   (or separate section)             │
│                                     │
└─────────────────────────────────────┘
```

### Old Time Radio Library:

```
┌─────────────────────────────────────┐
│ 🎭 Old Time Radio                   │
├─────────────────────────────────────┤
│ [Series] [Episodes] [Favorites]     │ ← Tabs
├─────────────────────────────────────┤
│ Search: [___________________] 🔍    │
│ Sort: [Date ▾] Category: [All ▾]    │
├─────────────────────────────────────┤
│                                     │
│ 📻 The Shadow (142 episodes)        │
│    Mystery • 1937-1954 • CBS        │
│    [Play Series] [▶]                │
│                                     │
│ 📻 Suspense (945 episodes)          │
│    Thriller • 1942-1962 • CBS       │
│    [Play Series] [▶]                │
│                                     │
│ 📻 Gunsmoke (480 episodes)          │
│    Western • 1952-1961 • CBS        │
│    [Play Series] [▶]                │
│                                     │
└─────────────────────────────────────┘
```

### Episode Detail:

```
┌─────────────────────────────────────┐
│ [<] Episode Detail                  │
├─────────────────────────────────────┤
│                                     │
│         📻 The Shadow               │
│                                     │
│ "The Death House Rescue"            │
│ Episode 1 • November 5, 1938        │
│                                     │
│ Network: CBS Radio                  │
│ Category: Mystery/Thriller          │
│ Duration: 29:45                     │
│                                     │
│ Cast:                               │
│ • Orson Welles as The Shadow        │
│ • Agnes Moorehead                   │
│                                     │
│ Sponsor: Blue Coal                  │
│                                     │
│ ━━━━━━━●━━━━━━━━━━  15:30          │
│                                     │
│    [◄◄]   [▶️]   [►►]              │
│                                     │
│ [Add to Favorites] [Share]          │
│                                     │
└─────────────────────────────────────┘
```

---

## Import & Organization

### Automatic Detection:

```kotlin
fun detectOldTimeRadio(file: File): Boolean {
    // Check file metadata or folder structure
    val indicators = listOf(
        "otr", "old time radio", "radio drama",
        "1930s", "1940s", "1950s", "1960s",
        "the shadow", "suspense", "gunsmoke",
        "soap opera", "radio serial"
    )
    
    val pathLower = file.path.lowercase()
    return indicators.any { pathLower.contains(it) }
}
```

### Metadata Extraction:

```kotlin
fun extractOTRMetadata(file: File): OldTimeRadioEpisode {
    // Parse filename patterns:
    // "The Shadow - 1938-11-05 - Death House Rescue.mp3"
    // "Suspense_1942-06-16_KillerInTheCrowd.mp3"
    // "Gunsmoke_52-11-15_FirstKillings.mp3"
    
    // Extract:
    // - Series name
    // - Air date
    // - Episode title
    // - Episode number (if present)
}
```

---

## Comparison with Similar Content

### Old Time Radio vs Audiobooks:
| Aspect | OTR | Audiobooks |
|--------|-----|------------|
| **Format** | Radio broadcast | Book narration |
| **Length** | 15-60 min/episode | Hours |
| **Structure** | Episodic | Continuous |
| **Production** | Full cast, SFX | Single narrator |
| **Era** | 1930s-1960s | Modern |
| **Organization** | By series/episode | By book/chapter |

### Old Time Radio vs Podcasts:
| Aspect | OTR | Podcasts |
|--------|-----|----------|
| **Era** | 1930s-1960s | 2000s-present |
| **Distribution** | Radio broadcast | Internet |
| **Format** | Professional production | Varies |
| **Episodic** | Yes | Yes |
| **Historical** | Yes | Current |
| **Rights** | Public domain | Copyrighted |

---

## File Organization Recommendations

### Folder Structure:

```
/storage/emulated/0/OldTimeRadio/
├─ Mystery/
│   ├─ The Shadow/
│   │   ├─ Season 1/
│   │   │   ├─ 1937-07-31 - The Shadow.mp3
│   │   │   ├─ 1937-08-07 - Death on the Bridge.mp3
│   │   └─ Season 2/
│   ├─ Inner Sanctum/
│   └─ Suspense/
├─ Science Fiction/
│   ├─ X Minus One/
│   └─ Dimension X/
├─ Western/
│   ├─ Gunsmoke/
│   └─ The Lone Ranger/
├─ Comedy/
│   ├─ Jack Benny/
│   └─ Fibber McGee/
└─ Soap Opera/
    ├─ The Guiding Light/
    └─ Ma Perkins/
```

---

## Implementation Plan

### Phase 1: Basic Support
1. ✅ Create OTRCategory enum
2. ✅ Create OldTimeRadioEpisode entity
3. ✅ Add "Old Time Radio" tab to Radio section
4. ✅ Basic file scanning
5. ✅ Simple list view

### Phase 2: Enhanced Features
1. ✅ Series grouping
2. ✅ Episode progress tracking
3. ✅ Metadata extraction
4. ✅ Cover art support
5. ✅ Favorite episodes

### Phase 3: Advanced Features
1. ✅ AI-powered metadata enrichment (Gemini)
2. ✅ Automatic episode ordering
3. ✅ Continue listening feature
4. ✅ Playlist creation
5. ✅ Cast information display

---

## Why This Approach?

### Advantages:
1. **Clear Categorization** - OTR is distinct from music/audiobooks/podcasts
2. **Historical Context** - Preserves the era and format
3. **Proper Metadata** - Tracks series, episodes, air dates
4. **User Experience** - Episodic playback like TV shows
5. **Scalable** - Can handle large collections
6. **Searchable** - By series, date, genre, cast

### User Benefits:
- 📺 **TV Show Experience** - Binge-watch radio shows!
- 📚 **Collection Management** - Track progress through series
- 🎭 **Discover Classics** - Explore golden age of radio
- 📅 **Historical Context** - Know when it aired
- ⭐ **Favorite Episodes** - Mark favorites
- 📊 **Statistics** - See listening history

---

## Recommended Sources for OTR

### Archive.org
- Largest free collection
- Public domain content
- Downloadable MP3s
- Metadata included

### Old Time Radio Downloads
- Organized by series
- High quality files
- Episode guides

### Internet Archive
- Historical broadcasts
- News archives
- Speeches

---

## Summary

**Best Solution**: Create a dedicated **"Old Time Radio"** section within Radio, with:

✅ **Series-based organization** (like TV shows)
✅ **Episode tracking** (progress, completion)
✅ **Historical metadata** (air date, network, cast)
✅ **Genre categorization** (Mystery, Western, Sci-Fi, etc.)
✅ **Separate from music** (different use case)
✅ **Separate from audiobooks** (episodic vs continuous)
✅ **Integrated with Radio** (makes sense thematically)

**Navigation Path**: 
```
App → Radio → Old Time Radio → Series → Episodes
```

This keeps it organized, discoverable, and properly categorized! 🎭📻

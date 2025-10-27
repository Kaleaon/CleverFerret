# Multi-Story Reddit EPUB Manager - Complete Guide

## 🎯 Overview

This system allows you to:
- ✅ Track **multiple Reddit stories** from any subreddit
- ✅ **Automatically download** new chapters
- ✅ **Generate EPUBs** natively (both Python and Android)
- ✅ **Add to library** automatically
- ✅ **Auto-update** all tracked stories on a schedule
- ✅ Manage everything from **command-line** or **Android app**

## 🚀 Quick Start

### 1. List Currently Tracked Stories

```bash
cd /workspace/scripts
python multi_story_updater.py --list
```

### 2. Add a New Story

```bash
python multi_story_updater.py --add
```

You'll be prompted for:
- **Story ID**: Unique identifier (e.g., `out_of_cruel_space`)
- **Series Name**: Title to search for (e.g., `Out of Cruel Space`)
- **Author**: Reddit username (e.g., `KyleKKent`)
- **Subreddit**: Where to search (default: `HFY`)
- **Auto-update**: Whether to check for updates automatically

### 3. Download/Update a Story

```bash
# Download a specific story
python multi_story_updater.py --update out_of_cruel_space

# Update all stories
python multi_story_updater.py --update-all
```

### 4. Set Up Automatic Updates

```bash
# Edit crontab
crontab -e

# Add this line to run daily at 2 AM
0 2 * * * cd /workspace/scripts && bash auto_update_all.sh
```

## 📱 Android App Integration

### Download a Story

```kotlin
// In your ViewModel or Activity
val redditStoryManager = // inject via Hilt

viewModelScope.launch {
    val config = RedditStoryManager.RedditSeriesConfig(
        seriesName = "Out of Cruel Space",
        author = "KyleKKent",
        subreddit = "HFY",
        autoUpdate = true
    )
    
    val result = redditStoryManager.downloadAndAddToLibrary(config)
    if (result.success) {
        // Story downloaded and added to library!
        println("Downloaded ${result.chapters} chapters!")
        println("Media Item ID: ${result.mediaItemId}")
    }
}
```

### Update All Stories

```kotlin
viewModelScope.launch {
    val results = redditStoryManager.updateAllStories()
    results.forEach { result ->
        println("${result.totalChapters} chapters (${result.newChapters} new)")
    }
}
```

### Get Tracked Stories

```kotlin
redditStoryManager.getAllTrackedStories()
    .collect { stories ->
        stories.forEach { story ->
            println("${story.title}: ${story.totalChapters} chapters")
        }
    }
```

## 📋 Configuration File

**Location**: `/workspace/scripts/reddit_stories_config.json`

### Structure

```json
{
  "stories": [
    {
      "id": "out_of_cruel_space",
      "series_name": "Out of Cruel Space",
      "author": "KyleKKent",
      "subreddit": "HFY",
      "auto_update": true,
      "enabled": true,
      "description": "Main series by KyleKKent",
      "last_checked": "2025-10-27T12:00:00",
      "last_updated": "2025-10-27T12:00:00",
      "chapter_count": 523
    }
  ],
  "settings": {
    "update_interval_hours": 24,
    "max_chapters_per_story": 2000,
    "rate_limit_seconds": 2,
    "auto_convert_to_epub": true,
    "add_to_library": true
  }
}
```

### Adding Stories Manually

Edit the config file and add to the `stories` array:

```json
{
  "id": "unique_id",
  "series_name": "Series Title",
  "author": "RedditUsername",
  "subreddit": "HFY",
  "auto_update": true,
  "enabled": true,
  "description": "Description here",
  "last_checked": null,
  "last_updated": null,
  "chapter_count": 0
}
```

## 🛠️ Command Reference

### Multi-Story Updater

```bash
python multi_story_updater.py [OPTIONS]

Options:
  --list              List all tracked stories
  --add               Add a new story interactively
  --remove STORY_ID   Remove a story by ID
  --update STORY_ID   Update a specific story
  --update-all        Update all stories
  --force             Force update even if not due
  --config FILE       Use custom config file
```

### Auto-Update Script

```bash
bash auto_update_all.sh [OPTIONS]

Options:
  --cleanup           Remove files older than 30 days
  -h, --help          Show help message
```

## 📊 Story Management

### Add Popular Stories

Here are some popular HFY series you can add:

#### Out of Cruel Space
```bash
python multi_story_updater.py --add
# Enter when prompted:
# ID: out_of_cruel_space
# Name: Out of Cruel Space
# Author: KyleKKent
# Subreddit: HFY
```

#### Add Your Own
```bash
python multi_story_updater.py --add
# Follow prompts to add any Reddit story
```

### Remove a Story

```bash
python multi_story_updater.py --remove out_of_cruel_space
```

This removes tracking but **does not delete** the EPUB file.

### Disable Auto-Update

Edit `reddit_stories_config.json` and set `"auto_update": false` for the story.

## 🔄 Auto-Update Behavior

### When Does Update Happen?

Stories are checked for updates when:
1. `update_interval_hours` has passed since `last_checked`
2. You run `--update-all` or `--force`
3. The story is `enabled` and `auto_update` is true

### What Gets Updated?

1. **New chapters** are downloaded from Reddit
2. A **new EPUB** is generated with ALL chapters
3. The **old EPUB is replaced** with the new one
4. **Library entry** is updated with new file
5. **Metadata** is updated (chapter count, timestamps)

### Rate Limiting

- 2 seconds between stories (configurable)
- Respects Reddit's API limits
- Uses public JSON API (no authentication needed for reading)

## 📁 File Structure

```
workspace/scripts/
├── multi_story_updater.py          # Main multi-story manager
├── out_of_cruel_space_updater.py   # Core Reddit downloader
├── auto_update_all.sh              # Automated update script
├── update_oocs.sh                  # Single-story updater
├── reddit_stories_config.json      # Configuration file
├── requirements-reddit.txt         # Python dependencies
└── epub_output/
    ├── out_of_cruel_space_*.html   # Generated HTML
    ├── out_of_cruel_space_*.epub   # Generated EPUBs
    ├── *.json                      # Cache files
    └── *.log                       # Update logs
```

## 🎨 Advanced Features

### Custom Update Intervals

Edit `reddit_stories_config.json`:

```json
"settings": {
  "update_interval_hours": 12  // Check every 12 hours
}
```

### Filtering Chapter Ranges

Edit the Python script to filter specific chapters:

```python
# In multi_story_updater.py, download_story method:
valid_chapters = [ch for ch in chapters 
                  if 100 <= ch.chapter_number <= 200]
```

### Custom Output Directory

```python
# In multi_story_updater.py, change:
OUTPUT_DIR = Path("/custom/path/to/epubs")
```

### Backup Configuration

```bash
# Backup your config
cp reddit_stories_config.json reddit_stories_config.backup.json

# Restore from backup
cp reddit_stories_config.backup.json reddit_stories_config.json
```

## 🤖 Automation Examples

### Daily Updates at 2 AM

```bash
crontab -e
# Add:
0 2 * * * cd /workspace/scripts && bash auto_update_all.sh
```

### Weekly Updates on Sunday

```bash
crontab -e
# Add:
0 2 * * 0 cd /workspace/scripts && bash auto_update_all.sh
```

### Update Every 6 Hours

```bash
crontab -e
# Add:
0 */6 * * * cd /workspace/scripts && bash auto_update_all.sh
```

### With Email Notifications

```bash
crontab -e
# Add:
0 2 * * * cd /workspace/scripts && bash auto_update_all.sh | mail -s "Reddit Stories Updated" your@email.com
```

## 📈 Monitoring

### View Update Log

```bash
tail -f epub_output/auto_update_$(date +%Y%m%d).log
```

### Check Last Update Times

```bash
python3 -c "
import json
data = json.load(open('reddit_stories_config.json'))
for s in data['stories']:
    print(f\"{s['series_name']}: {s.get('last_updated', 'Never')}\")
"
```

### Count Total Chapters

```bash
python3 -c "
import json
data = json.load(open('reddit_stories_config.json'))
total = sum(s.get('chapter_count', 0) for s in data['stories'])
print(f'Total chapters: {total}')
"
```

## 🐛 Troubleshooting

### Story Not Updating

**Check if enabled:**
```bash
python multi_story_updater.py --list
```

**Force update:**
```bash
python multi_story_updater.py --update STORY_ID --force
```

### No Chapters Found

- Verify the series name matches Reddit posts exactly
- Check if the author username is correct
- Try searching Reddit manually to confirm posts exist

### EPUB Generation Fails

**Check for errors:**
```bash
tail -50 epub_output/auto_update_*.log
```

**Test manually:**
```bash
python multi_story_updater.py --update STORY_ID --force
```

### Library Not Updated

The Android app automatically adds stories to the "Reddit Stories" library. If missing:

```kotlin
// Force library refresh
viewModelScope.launch {
    libraryRepository.updateLastScanned(libraryId)
}
```

## 🔑 API Configuration

### Reddit API Key

Already configured in all scripts:
- **Client ID**: `EvU-yXXa66v0qe94RLorQw`
- **User Agent**: `CleverFerret:OutOfCruelSpaceDownloader:v1.0`

No additional setup needed!

## 📚 Example Stories to Track

### Popular HFY Series

1. **Out of Cruel Space** by KyleKKent
2. **Deathworlders** by Hambone3110
3. **First Contact** by Ralts_Bloodthorne
4. **Billy-Bob Space Trucker** by RegalLegalEagle

### How to Add Any Series

1. Find the series on Reddit (e.g., r/HFY)
2. Note the exact title used in posts
3. Note the author's username
4. Add using: `python multi_story_updater.py --add`

## 🎯 Best Practices

1. **Check weekly** - Most series update 1-3 times per week
2. **Backup configs** - Save `reddit_stories_config.json` regularly
3. **Monitor logs** - Check logs occasionally for errors
4. **Rate limiting** - Don't set interval below 6 hours
5. **Test first** - Try manual update before enabling auto-update

## 💡 Tips

1. Use unique, descriptive story IDs (e.g., `oocs` instead of `story1`)
2. Set `auto_update: false` for completed series
3. Use `--force` when adding a story for the first time
4. Keep the config file in version control
5. EPUBs are automatically versioned with timestamps

## 🎉 Summary

You now have a complete system that:

✅ **Tracks multiple Reddit stories**
✅ **Downloads chapters automatically**
✅ **Generates EPUBs natively**
✅ **Adds to library automatically**
✅ **Updates on schedule**
✅ **Works in Android app and Python**

**Next Steps:**
1. Add your favorite stories: `python multi_story_updater.py --add`
2. Set up automation: `crontab -e`
3. Enjoy reading! 📖

---

**Files Created:**
- `/workspace/scripts/multi_story_updater.py` - Main manager
- `/workspace/scripts/reddit_stories_config.json` - Configuration
- `/workspace/scripts/auto_update_all.sh` - Automation script
- `/workspace/CleverFerret/.../RedditStoryManager.kt` - Android service

**Documentation:**
- This guide: `/workspace/MULTI_STORY_REDDIT_GUIDE.md`
- Original guide: `/workspace/OUT_OF_CRUEL_SPACE_AUTOMATION.md`
- Quick start: `/workspace/QUICK_START_OUT_OF_CRUEL_SPACE.md`

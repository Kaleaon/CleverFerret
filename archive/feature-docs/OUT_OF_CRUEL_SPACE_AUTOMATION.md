# Out of Cruel Space - Reddit to EPUB Automation

This guide explains how to automatically retrieve chapters from "Out of Cruel Space" on Reddit and generate/update EPUB files.

## Overview

"Out of Cruel Space" is a popular HFY (Humanity, Fuck Yeah!) web serial posted on Reddit's r/HFY by u/KyleKKent. This automation system retrieves chapters and creates EPUB files for easier reading.

## Features

- ✅ **Automatic Chapter Discovery**: Searches r/HFY for all "Out of Cruel Space" chapters
- ✅ **Chapter Numbering**: Automatically detects and orders chapters
- ✅ **Incremental Updates**: Only downloads new chapters when updating
- ✅ **Caching System**: Remembers previously downloaded chapters
- ✅ **HTML & EPUB Output**: Creates readable HTML that can be converted to EPUB
- ✅ **Reddit API Integration**: Uses your Reddit API key for reliable access

## Quick Start

### 1. Install Dependencies

```bash
cd /workspace/scripts
pip install -r requirements-reddit.txt
```

### 2. Run the Script

**First-time download (all chapters):**
```bash
python out_of_cruel_space_updater.py
```

**Update with only new chapters:**
```bash
python out_of_cruel_space_updater.py --update
```

**Rebuild from scratch:**
```bash
python out_of_cruel_space_updater.py --rebuild
```

### 3. Convert to EPUB

The script creates an HTML file that can be converted to EPUB using several tools:

**Option A: Using Pandoc (recommended)**
```bash
pandoc epub_output/Out_Of_Cruel_Space_*.html -o Out_Of_Cruel_Space.epub
```

**Option B: Using Calibre**
```bash
ebook-convert epub_output/Out_Of_Cruel_Space_*.html Out_Of_Cruel_Space.epub
```

**Option C: Using the Android App**
The Kotlin code in the CleverFerret app already has EPUB creation built-in and can be used directly.

## Android App Integration

The CleverFerret Android app already has Reddit integration for "Out of Cruel Space":

### Using the App

1. Open the CleverFerret app
2. Navigate to "Web Fiction Manager" 
3. Click "Download Reddit Series"
4. Select "Out of Cruel Space" from r/HFY
5. The app will automatically download all chapters and create an EPUB

### Kotlin Code Location

The relevant code is in:
- `RedditFanficDownloader.kt` - Downloads chapters from Reddit
- `FanfictionToEpubConverterBasic.kt` - Converts to EPUB
- `WebFictionViewModel.kt` - Manages the download process

## Configuration

### Reddit API Key

The script uses the Reddit API key: `EvU-yXXa66v0qe94RLorQw`

This is already configured in the script. If you need to change it:

```python
# In out_of_cruel_space_updater.py
REDDIT_CLIENT_ID = "your_new_key_here"
```

### Customize Settings

You can modify these constants in the script:

```python
SERIES_NAME = "Out of Cruel Space"  # Search query
SUBREDDIT = "HFY"                   # Subreddit to search
AUTHOR = "KyleKKent"                # Filter by author
OUTPUT_DIR = Path("./epub_output")  # Output directory
```

## Command Line Options

```
usage: out_of_cruel_space_updater.py [-h] [--update] [--max-chapters N] [--rebuild]

Options:
  -h, --help          Show help message
  --update            Check for new chapters and update existing EPUB
  --max-chapters N    Maximum number of chapters to download (default: 1000)
  --rebuild           Rebuild EPUB from scratch, ignoring cache
```

## How It Works

### 1. Chapter Discovery

The script searches Reddit using the public JSON API:
```
https://www.reddit.com/r/HFY/search.json?q=Out+of+Cruel+Space+author:KyleKKent
```

### 2. Chapter Extraction

For each post found:
1. Extracts chapter number from the title using regex patterns
2. Downloads the post content (selftext)
3. Converts markdown to HTML
4. Stores metadata (author, date, URL)

### 3. Chapter Organization

- Sorts chapters by chapter number
- Detects and reports missing chapters
- Maintains chronological order for posts without chapter numbers

### 4. EPUB Creation

- Generates a complete HTML document with:
  - Table of contents
  - Chapter navigation
  - Metadata for each chapter
  - Source links back to Reddit
- Can be converted to EPUB using standard tools

### 5. Caching & Updates

- Stores chapter data in `epub_output/oocs_cache.json`
- On update: only downloads new chapters
- Prevents duplicate downloads
- Maintains update history

## Output Structure

```
workspace/
├── scripts/
│   ├── out_of_cruel_space_updater.py   # Main script
│   └── requirements-reddit.txt          # Dependencies
└── epub_output/
    ├── Out_Of_Cruel_Space_*.html       # HTML book
    ├── Out_Of_Cruel_Space_*.epub       # EPUB (after conversion)
    └── oocs_cache.json                 # Chapter cache
```

## Troubleshooting

### No Chapters Found

**Problem**: Script reports "No chapters found"

**Solutions**:
1. Check internet connection
2. Verify the series is still being posted to r/HFY
3. Try increasing `--max-chapters` limit
4. Check if Reddit is accessible from your network

### Rate Limiting

**Problem**: Script is slow or times out

**Solutions**:
1. The script includes automatic rate limiting (2 second delays)
2. Reddit allows ~60 requests per minute for unauthenticated access
3. For full OAuth authentication (higher limits), you'll need a client_secret

### Missing Chapters

**Problem**: Script reports missing chapter numbers

**Solutions**:
1. Some chapters may have non-standard numbering
2. Author may have skipped numbers
3. Posts may have been deleted or removed
4. Try searching Reddit directly to verify

### Chapter Order Wrong

**Problem**: Chapters appear in wrong order

**Solutions**:
1. The script uses multiple regex patterns to extract chapter numbers
2. If a post doesn't match patterns, it gets chapter number 0
3. You can manually edit the cache file to fix chapter numbers
4. Use `--rebuild` after editing the cache

## Advanced Usage

### Filtering Specific Chapter Ranges

Edit the script to filter chapters:

```python
# In the main() function, after downloading chapters:
valid_chapters = [ch for ch in chapters 
                  if 100 <= ch.chapter_number <= 200]
```

### Custom EPUB Metadata

Modify the EPUB metadata in `_create_html_book()`:

```python
html_content = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="KyleKKent">
    <meta name="description" content="Out of Cruel Space - HFY Web Serial">
    <title>{SERIES_NAME}</title>
```

### Automation with Cron

Set up automatic daily updates:

```bash
# Add to crontab (crontab -e):
0 2 * * * cd /workspace/scripts && python out_of_cruel_space_updater.py --update
```

### Integration with Calibre Library

Automatically add to Calibre:

```bash
python out_of_cruel_space_updater.py --update
calibredb add epub_output/Out_Of_Cruel_Space_*.epub --library-path ~/Calibre\ Library/
```

## API Reference

### RedditChapter Class

```python
chapter = RedditChapter(post_data)

# Attributes:
chapter.id              # Reddit post ID
chapter.title           # Post title
chapter.chapter_number  # Extracted chapter number
chapter.selftext        # Raw markdown content
chapter.selftext_html   # HTML content
chapter.url             # Reddit URL
chapter.author          # Post author
chapter.created_utc     # Timestamp
```

### OutOfCruelSpaceDownloader Class

```python
downloader = OutOfCruelSpaceDownloader(client_id, user_agent)

# Methods:
chapters = downloader.search_series(subreddit, query, limit)
chapter = downloader.get_post_by_id(post_id, subreddit)
```

### EPUBManager Class

```python
manager = EPUBManager(output_dir)

# Methods:
epub_path = manager.create_epub(chapters, filename)
```

### ChapterCache Class

```python
cache = ChapterCache(cache_file)

# Methods:
cache.add_chapters(chapters)
new_chapters = cache.get_new_chapters(all_chapters)
count = cache.get_chapter_count()
```

## Future Enhancements

Potential improvements:

1. **Full OAuth**: Implement complete OAuth flow for higher rate limits
2. **Parallel Downloads**: Download chapters concurrently
3. **Direct EPUB**: Use `ebooklib` to create EPUB directly without HTML intermediate
4. **Cover Art**: Extract and add cover art from Reddit posts
5. **Metadata Enhancement**: Extract more metadata (tags, ratings, etc.)
6. **Multi-Series**: Support multiple series simultaneously
7. **Web Interface**: Create a web UI for easier management
8. **Mobile App**: Full integration with CleverFerret Android app

## Related Files

- **Python Script**: `/workspace/scripts/out_of_cruel_space_updater.py`
- **Kotlin Downloader**: `/workspace/CleverFerret/src/main/java/com/universalmedialibrary/services/webfiction/RedditFanficDownloader.kt`
- **Kotlin Converter**: `/workspace/CleverFerret/src/main/java/com/universalmedialibrary/services/contentcreation/FanfictionToEpubConverterBasic.kt`
- **EPUB Creator**: `/workspace/CleverFerret/src/main/java/com/universalmedialibrary/services/contentcreation/SimpleEpubCreator.kt`

## Support

For issues or questions:

1. Check the troubleshooting section above
2. Review the script output for specific error messages
3. Check Reddit's API status: https://www.redditstatus.com/
4. Verify "Out of Cruel Space" is still being posted to r/HFY

## License

This automation script is part of the CleverFerret project. Use responsibly and respect Reddit's API usage guidelines.

## Acknowledgments

- **Author**: KyleKKent (u/KyleKKent on Reddit)
- **Series**: Out of Cruel Space
- **Community**: r/HFY (Humanity, Fuck Yeah!)
- **Platform**: Reddit

---

**Note**: This tool is for personal use. Always respect the original author's rights and Reddit's Terms of Service.

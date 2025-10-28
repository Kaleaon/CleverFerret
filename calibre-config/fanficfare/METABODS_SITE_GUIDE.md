# Metabods.com Site Configuration Guide

Complete guide for downloading stories from metabods.com using FanFicFare/CleverFerret.

## About Metabods.com

**Metabods** is a community site for transformation fiction, featuring stories about:
- Body transformation
- Muscle growth
- Size change
- Physical enhancement
- Body modification themes

**Content Rating**: Adult/Mature (18+)  
**Primary Genre**: Transformation Fiction  
**Language**: English

## Site Features

### Story Categories
- Muscle Growth
- Height Growth
- Body Transformation
- Size Change
- Superhero
- Fantasy
- Sci-Fi

### Story Formats
- **Single Chapter**: Complete stories in one chapter
- **Multi-Chapter**: Serialized stories with multiple parts
- **Series**: Connected stories in same universe

### Metadata Available
- Title
- Author
- Description/Summary
- Tags/Categories
- Chapter count
- Publish date (when available)
- Views/Statistics (when available)

## URL Formats

### Story URLs
```
https://metabods.com/stories/12345
https://metabods.com/story/story-title-here
https://www.metabods.com/s/12345
```

### Chapter URLs
```
https://metabods.com/stories/12345/chapter/1
https://metabods.com/stories/12345/chapter/2
```

### Author URLs
```
https://metabods.com/author/author-name
https://metabods.com/authors/12345
```

## Download Instructions

### Using FanFicFare (Calibre Plugin)

1. **Open Calibre**

2. **Click "Download from URL"**
   - Button location: Toolbar (FanFicFare icon)

3. **Paste Metabods URL**
   ```
   https://metabods.com/stories/12345
   ```

4. **Click OK**
   - Story will download automatically
   - EPUB file created in Calibre library

5. **View Story**
   - Double-click to read
   - Metadata automatically extracted
   - Tags applied: "Adult", "Transformation Fiction", "Metabods"

### Using CleverFerret Android App

1. **Open App** → **Menu** → **Content Creation** → **Fanfiction Downloader**

2. **Enter URL**
   ```
   Paste: https://metabods.com/stories/12345
   ```

3. **Tap "Download as EPUB"**
   - Progress indicator shows download status
   - Status: "Downloading chapters..."

4. **Read Downloaded Story**
   - Automatically added to library
   - Tap "Read" button
   - Or find in Library → Books

### Batch Download Multiple Stories

**Create URL list** (`metabods-stories.txt`):
```
https://metabods.com/stories/12345
https://metabods.com/stories/12346
https://metabods.com/stories/12347
https://metabods.com/stories/12348
```

**Run batch download**:
```bash
calibre-debug -r FanFicFare -- --input metabods-stories.txt
```

## HTML Selectors (Technical)

### Current Site Structure

Based on metabods.com HTML structure (may need updates):

```ini
[metabods.com]
# Story metadata selectors
story_title_selector: h1.story-title, h1
author_selector: span.author, a.author, div.author-name
description_selector: div.story-description, div.description, p.description
tags_selector: a.tag, span.tag

# Content selectors
content_selector: div.story-content, div.chapter-content, article
chapter_selector: a[href*=/chapter], div.chapter-list a

# Status and info
status_selector: span.status, div.status
date_selector: time, span.date, div.publish-date
```

### If Site Structure Changes

**Check HTML structure**:
1. Visit story page in browser
2. Right-click → Inspect Element
3. Find story title, author, content elements
4. Note CSS classes/IDs
5. Update selectors in `personal.ini`

**Example**:
If title moved to `<h1 class="new-title">`:
```ini
story_title_selector: h1.new-title
```

## Story Metadata

### What Gets Extracted

**Always Included**:
- ✅ Title
- ✅ Author
- ✅ Description/Summary
- ✅ Content (all chapters)
- ✅ Genre (Transformation)
- ✅ Rating (Mature)

**When Available**:
- ✅ Tags/Categories
- ✅ Chapter titles
- ✅ Publish date
- ✅ Chapter count
- ✅ Views/statistics
- ✅ Author notes

**Added Automatically**:
- ✅ Source: "Metabods"
- ✅ Language: "English"
- ✅ Calibre tags: "Adult, Transformation Fiction, Metabods"
- ✅ Download date
- ✅ URL reference

### Metadata in EPUB

**Calibre Metadata Fields**:
- **Title**: Story title
- **Author**: Story author
- **Publisher**: "Metabods"
- **Tags**: Genre + site tags
- **Description**: Story summary
- **Comments**: Full description
- **Rating**: "Mature" or "Adult"
- **Identifiers**: metabods:story_id

**Custom Metadata** (if configured):
- Source URL
- Original site
- Download date
- Story status
- Chapter count

## Content Handling

### Single-Chapter Stories

**Structure**:
```
Story Title
  └── Chapter 1: [Story Title or Chapter Title]
       └── [Full content]
```

**Download Process**:
1. Fetch story page
2. Extract metadata
3. Extract content
4. Create EPUB with single chapter

### Multi-Chapter Stories

**Structure**:
```
Story Title
  ├── Chapter 1: Introduction
  ├── Chapter 2: Development
  ├── Chapter 3: Transformation
  └── Chapter 4: Resolution
```

**Download Process**:
1. Fetch story page
2. Extract metadata
3. Find chapter list
4. Download each chapter sequentially
5. Create EPUB with all chapters

### Chapter Title Format

**Options in `personal.ini`**:
```ini
# Option 1: Numbered with title
chapter_title_format:Chapter %d: %t

# Option 2: Just number
chapter_title_format:Chapter %d

# Option 3: Just title
chapter_title_format:%t

# Option 4: Custom
chapter_title_format:Part %d - %t
```

## Adult Content Configuration

### Content Warnings

**Automatic Tags** (added by config):
- Adult Content
- Transformation
- Body Modification
- Mature Themes

**Site-Specific Warnings** (when available):
- Sexual Content
- Explicit Language
- Violence
- Other (from site)

### Rating System

**Metabods Stories**:
- **Default**: Mature (M)
- **Explicit Content**: Adult (A) or Explicit (E)
- **All stories assumed**: 18+

**In Calibre**:
- Rating shown in metadata
- Filterable by rating
- Can hide in main view if desired

### Privacy & Safety

**Privacy Features**:
- ✅ Anonymous downloads (no account needed)
- ✅ No tracking cookies
- ✅ Local storage only
- ✅ Private library

**Safety**:
- ✅ Content warnings in metadata
- ✅ Adult tags applied automatically
- ✅ Can filter/hide in Calibre
- ✅ Password protect library (optional)

## Troubleshooting

### Story Won't Download

**Error**: "Failed to fetch story"

**Solutions**:
1. **Check URL**: Make sure it's a valid metabods.com story URL
2. **Check site**: Visit URL in browser to verify story exists
3. **Check internet**: Ensure stable connection
4. **Try again**: May be temporary site issue
5. **Update selectors**: Site HTML may have changed

**Test URL**:
```bash
# Test if site is accessible
curl -I https://metabods.com/
```

### Empty Content

**Error**: Story downloads but chapters are empty

**Cause**: Content selector may not match site HTML

**Solution**:
1. Open story in browser
2. Right-click on story text → Inspect
3. Find containing div class/id
4. Update `content_selector` in config:
   ```ini
   content_selector: div.new-content-class
   ```

### Missing Chapters

**Error**: Only some chapters download

**Causes**:
1. Chapter selector doesn't match all chapters
2. Site uses pagination
3. Some chapters restricted

**Solutions**:
1. Check chapter list on site
2. Update `chapter_selector`
3. Try downloading individual chapters
4. Report issue if persistent

### Wrong Metadata

**Error**: Wrong author, title, or description

**Causes**:
1. Selectors don't match site structure
2. Story has unusual format
3. Missing metadata on site

**Solutions**:
1. Update relevant selectors
2. Manually edit metadata in Calibre after download
3. Report issue for future fix

### Site Changes

**If metabods.com redesigns**:

1. **Test current config**:
   - Try downloading a story
   - Check what works/breaks

2. **Inspect new HTML**:
   - View page source
   - Identify new selectors

3. **Update config**:
   ```ini
   [metabods.com]
   # Update selectors to match new site structure
   story_title_selector: [new selector]
   author_selector: [new selector]
   content_selector: [new selector]
   ```

4. **Test thoroughly**:
   - Single-chapter stories
   - Multi-chapter stories
   - Different authors

## Advanced Usage

### Custom Metadata Extraction

**Extract custom fields**:
```ini
[metabods.com]
# Extract view count
include:views
views_selector: span.view-count

# Extract rating score
include:rating_score  
rating_selector: span.story-rating

# Extract favorite count
include:favorites
favorites_selector: span.favorite-count
```

### Filtering by Tags

**Download only specific tags**:
```ini
[metabods.com]
# Only download muscle growth stories
required_tags:muscle growth

# Exclude certain tags
excluded_tags:extreme content
```

### Author Collections

**Download all stories by author**:

1. Get author page URL: `https://metabods.com/author/author-name`
2. Extract story URLs
3. Create URL list
4. Batch download

**Script** (example):
```python
# metabods_author_scraper.py
import requests
from bs4 import BeautifulSoup

author_url = "https://metabods.com/author/author-name"
response = requests.get(author_url)
soup = BeautifulSoup(response.text, 'html.parser')

story_links = soup.select('a.story-link')
for link in story_links:
    print(link['href'])
```

### Series Handling

**For connected stories**:
```ini
[metabods.com]
# Extract series information
include:series
series_selector: div.series-name

# Add to Calibre series
add_to_series:true
series_index_auto:true
```

## Site-Specific Tips

### Best Practices

1. **Rate Limiting**: Wait 1-2 seconds between downloads
2. **Error Handling**: If download fails, try again later
3. **Metadata**: Review and clean up after bulk downloads
4. **Tags**: Use consistent tagging in Calibre
5. **Backup**: Keep backup of library

### Recommended Tags

**In Calibre** (for organization):
- Source: Metabods
- Genre: Transformation
- Status: Complete / In-Progress
- Rating: Mature / Adult
- Read Status: Unread / Reading / Read

### Finding Stories

**Popular on Metabods**:
- Browse by category
- Check featured stories
- Search by tag
- Follow favorite authors

**External Resources**:
- Transformation fiction communities
- Reddit: r/transformation
- Fiction recommendation forums

## Support

### FanFicFare Issues
- Report to: https://github.com/JimmXinu/FanFicFare/issues
- Tag: metabods.com site adapter

### CleverFerret Issues
- Check app documentation
- Report Android-specific bugs
- Feature requests welcome

### Site Issues
- Contact metabods.com directly
- Check site status page
- Community forums

## Updates

### Config Version
- **Current**: v1.0 (2025-10-27)
- **Last Updated**: 2025-10-27
- **Compatibility**: Metabods.com as of Oct 2025

### Change Log
- **v1.0** (2025-10-27): Initial metabods.com support
  - Basic story extraction
  - Multi-chapter support
  - Metadata extraction
  - Adult content configuration
  - CleverFerret integration

### Future Enhancements
- [ ] Author profile support
- [ ] Series detection
- [ ] Advanced tag filtering  
- [ ] Comment/review extraction
- [ ] Image downloading
- [ ] Update detection

---

**📖 Enjoy your transformation fiction collection!**

For questions or issues, please refer to the main README or open an issue.

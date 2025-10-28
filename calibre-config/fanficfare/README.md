# FanFicFare Configuration for Adult Fanfiction

This configuration enables FanFicFare (Calibre plugin) to download adult fanfiction from various sites including metabods.com.

## Installation

### For Calibre Desktop

1. **Install FanFicFare Plugin**:
   - Open Calibre
   - Go to: Preferences → Plugins → Get new plugins
   - Search for "FanFicFare"
   - Click "Install"

2. **Install Configuration**:
   - Copy `personal.ini` to your FanFicFare config directory:
     - **Linux/Mac**: `~/.fanficfare/personal.ini`
     - **Windows**: `%APPDATA%\fanficfare\personal.ini`

3. **Configure Plugin**:
   - In Calibre: Preferences → Plugins → FanFicFare → Customize plugin
   - Enable "Include adult/mature content"
   - Set "Rating filter" to "Include all ratings"

### For CleverFerret Android App

The Android app includes built-in support for these sites:
- Archive of Our Own (AO3)
- FanFiction.Net
- Wattpad
- Royal Road
- **Metabods** (adult transformation fiction) ✨ NEW
- **Literotica** (adult erotica) ✨ NEW
- ScribbleHub
- SpaceBattles
- Sufficient Velocity
- Questionable Questing
- FimFiction

## Supported Adult Fiction Sites

### Metabods.com
**Genre**: Transformation fiction (body modification, muscle growth, etc.)
**Rating**: Mature/Adult
**Features**:
- Multi-chapter support
- Author profiles
- Tag system
- Story metadata

**Example URLs**:
```
https://metabods.com/stories/12345
https://metabods.com/story/story-title
```

### Literotica.com
**Genre**: Adult erotic fiction
**Rating**: Explicit
**Features**:
- Category system
- Author profiles
- Series support

### Questionable Questing
**Genre**: Forum-based adult fiction
**Rating**: Mature/Adult
**Features**:
- Thread-based stories
- NSFW content
- User discussion

## Usage

### Using FanFicFare in Calibre

1. **Download Single Story**:
   - Click "Download from URL" button
   - Paste story URL (e.g., `https://metabods.com/stories/12345`)
   - Click "OK"

2. **Bulk Download**:
   - Create a text file with one URL per line
   - Use "Download from URLs" feature

3. **Update Stories**:
   - Select books in library
   - Right-click → FanFicFare → Check for Updates

### Using CleverFerret Android App

1. **Open Fanfiction Downloader**:
   - Go to: Menu → Content Creation → Fanfiction Downloader

2. **Enter URL**:
   - Paste story URL
   - Tap "Download as EPUB"

3. **View Downloaded Story**:
   - Story is automatically added to your library
   - Tap "Read" to open in reader

## Adult Content Settings

### Age Verification
The configuration assumes you are 18+ years old. Some sites may require:
- Account creation
- Age verification
- Terms of service acceptance

### Content Warnings
Stories downloaded with this configuration will include:
- Content rating tags
- Content warnings (if provided by site)
- Adult content indicators in metadata

### Privacy
- Downloads are anonymous by default
- No personal information is shared with sites
- Stories are for personal use only

## Site-Specific Notes

### Metabods.com

**Site Structure** (as of 2025):
- Stories may be single-chapter or multi-chapter
- HTML selectors configured for current site layout
- May need updates if site redesigns

**Common Issues**:
- **404 errors**: Story may have been removed
- **Empty content**: Site structure may have changed
- **Missing metadata**: Some stories lack complete information

**Solutions**:
- Verify URL is correct
- Check if story is still available on site
- Try downloading again after a few minutes

### Literotica.com

**Authentication**:
- Most stories are publicly accessible
- Some categories may require login
- Configure username/password in `personal.ini` if needed

### Questionable Questing

**Forum-Based Content**:
- Stories are in forum threads
- May require account for NSFW sections
- Username/password required for restricted content

## Troubleshooting

### Story Won't Download

1. **Check URL format**: Make sure URL is complete
2. **Check site availability**: Visit site in browser
3. **Check adult content settings**: Ensure `is_adult:true` in config
4. **Update plugin**: Make sure FanFicFare is latest version

### Missing Chapters

1. **Check chapter count**: Verify story has multiple chapters
2. **Check site structure**: Site may have changed HTML layout
3. **Manual download**: Try downloading individual chapters

### Metadata Issues

1. **Missing author**: Story may not have author listed
2. **Missing tags**: Site may not expose tags in HTML
3. **Wrong genre**: Default genre applied if none found

## Legal & Ethical Considerations

### Copyright
- Stories are copyrighted by their authors
- Download for **personal use only**
- **Do not redistribute** downloaded stories
- Respect author's wishes and terms

### Site Terms of Service
- Respect each site's ToS
- Don't abuse download limits
- Rate limiting is enabled (1 second between requests)
- Consider supporting sites/authors if possible

### Adult Content
- **Age requirement**: Must be 18+ to access adult content
- **Content warnings**: Stories may contain explicit content
- **Responsibility**: User is responsible for complying with local laws

## Configuration Options

### Key Settings in personal.ini

```ini
[defaults]
output_format:epub              # Output format (epub/mobi/html/txt)
is_adult:true                   # Enable adult content downloads
include_adult_content:true      # Include explicit content

[metabods.com]
is_adult:true                   # Mark as adult site
rating:Mature                   # Default rating
genre:Transformation            # Default genre
```

### Customization

**Change default genre**:
```ini
[metabods.com]
genre:Your Custom Genre
```

**Add custom tags**:
```ini
[metabods.com]
calibre_tags:Custom Tag 1, Custom Tag 2
```

**Adjust timeouts**:
```ini
[advanced]
connect_timeout:60             # Connection timeout (seconds)
read_timeout:120               # Read timeout (seconds)
```

## Support

### FanFicFare Plugin
- **GitHub**: https://github.com/JimmXinu/FanFicFare
- **Documentation**: https://github.com/JimmXinu/FanFicFare/wiki
- **Issues**: Report to FanFicFare GitHub Issues

### CleverFerret App
- See app documentation for Android-specific features
- Fanfiction downloader is built into the app
- No additional configuration needed

## Advanced Usage

### Custom Site Adapters

To add support for a new adult fiction site:

1. **Add to site_patterns**:
```ini
[site_patterns]
yoursite:yoursite\.com
```

2. **Configure site**:
```ini
[yoursite.com]
is_adult:true
rating:Mature
story_title_selector:h1.title
author_selector:.author
content_selector:.story-content
```

3. **Test thoroughly** before using in production

### Automation

**Auto-update tracked stories** (Linux/Mac):
```bash
#!/bin/bash
# Add to crontab: 0 2 * * * /path/to/update-stories.sh

calibre-debug -r FanFicFare -- --update-all --library ~/Calibre\ Library
```

**Batch download** (all platforms):
```bash
# Create urls.txt with one URL per line
calibre-debug -r FanFicFare -- --input urls.txt --library ~/Calibre\ Library
```

## Version History

- **v1.0** (2025-10-27): Initial configuration with metabods.com support
  - Added metabods.com site adapter
  - Added literotica.com support
  - Configured adult content settings
  - Added CleverFerret Android integration

## Changelog

### 2025-10-27
- ✨ Added metabods.com support
- ✨ Added literotica.com support  
- ✨ Enabled adult content downloads
- ✨ Added content warning tags
- ✨ Integrated with CleverFerret Android app
- 📝 Created comprehensive configuration guide

---

**⚠️ Adult Content Warning**: This configuration is designed for downloading adult fanfiction. Ensure you are of legal age (18+) in your jurisdiction before using.

**📚 Happy Reading!**

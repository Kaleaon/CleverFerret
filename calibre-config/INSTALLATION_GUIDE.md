# Calibre Adult Fanfic Downloader Installation Guide

Complete installation guide for configuring Calibre with FanFicFare plugin to download adult fanfiction including stories from metabods.com.

## Quick Start

**5-Minute Setup**:
1. Install Calibre
2. Install FanFicFare plugin
3. Copy configuration files
4. Start downloading stories

## Prerequisites

- **Calibre** 5.0 or higher
- **Age**: Must be 18+ for adult content
- **OS**: Windows, Mac, or Linux

## Installation Steps

### Step 1: Install Calibre

**Option A: Download Installer**
1. Visit: https://calibre-ebook.com/download
2. Download for your operating system
3. Run installer
4. Launch Calibre

**Option B: Package Manager**

**Linux**:
```bash
# Ubuntu/Debian
sudo apt install calibre

# Fedora
sudo dnf install calibre

# Arch
sudo pacman -S calibre
```

**Mac (Homebrew)**:
```bash
brew install --cask calibre
```

### Step 2: Install FanFicFare Plugin

**Method 1: Through Calibre GUI** (Recommended)

1. Open Calibre
2. Click **Preferences** (gear icon)
3. Under "Advanced", click **Plugins**
4. Click **Get new plugins** button
5. Search for "**FanFicFare**"
6. Select it and click **Install**
7. Click **Yes** to restart Calibre

**Method 2: Manual Installation**

1. Download plugin from: https://github.com/JimmXinu/FanFicFare/releases
2. In Calibre: Preferences → Plugins → Load plugin from file
3. Select downloaded ZIP file
4. Restart Calibre

### Step 3: Configure FanFicFare

**Locate Config Directory**:

- **Linux**: `~/.fanficfare/`
- **Mac**: `~/.fanficfare/`
- **Windows**: `%APPDATA%\fanficfare\`

**Copy Configuration Files**:

```bash
# Linux/Mac
mkdir -p ~/.fanficfare
cp calibre-config/fanficfare/personal.ini ~/.fanficfare/

# Windows (PowerShell)
mkdir $env:APPDATA\fanficfare -Force
copy calibre-config\fanficfare\personal.ini $env:APPDATA\fanficfare\
```

**Verify Installation**:
```bash
# Linux/Mac
ls -la ~/.fanficfare/personal.ini

# Windows
dir %APPDATA%\fanficfare\personal.ini
```

### Step 4: Configure Plugin Settings

1. **Open Plugin Configuration**:
   - Calibre → Preferences → Plugins
   - Find "FanFicFare" in list
   - Click "**Customize plugin**"

2. **Enable Adult Content**:
   - Tab: **Personal.ini** tab
   - Find: `is_adult:true`
   - Ensure it's present and set to `true`

3. **Configure Basic Settings**:
   - **Format Settings** tab:
     - Output format: EPUB
     - Include metadata: ✅ Enable
   
   - **Metadata** tab:
     - Add genre tags: ✅ Enable
     - Add character tags: ✅ Enable
     - Rating tags: ✅ Enable
   
   - **Other** tab:
     - Include adult content: ✅ Enable
     - Check for updates: ✅ Enable

4. **Click OK** to save

### Step 5: Test Configuration

**Download Test Story**:

1. Find a public test story on Archive of Our Own (allows downloading)
2. In Calibre, click **Download from URL**
3. Paste URL: `https://archiveofourown.org/works/[story_id]`
4. Click **OK**
5. Story should download and appear in library

**Test Adult Site**:

1. Find a story on metabods.com (if accessible)
2. Copy story URL
3. In Calibre, click **Download from URL**
4. Paste URL: `https://metabods.com/stories/[story_id]`
5. Click **OK**
6. Story downloads with adult content tags

## Usage

### Download Single Story

**From URL**:
1. Copy story URL from supported site
2. In Calibre: Click **FanFicFare → Download from URL** (or Ctrl+Shift+D)
3. Paste URL
4. Click **OK**
5. Wait for download to complete

**Supported Sites**:
- Archive of Our Own (archiveofourown.org)
- FanFiction.Net (fanfiction.net)
- Wattpad (wattpad.com)
- Royal Road (royalroad.com)
- Metabods (metabods.com) ✨ Adult
- Literotica (literotica.com) ✨ Adult
- Questionable Questing (questionablequesting.com) ✨ Adult
- 80+ more sites

### Batch Download

**Create URL List** (`stories.txt`):
```
https://archiveofourown.org/works/12345
https://metabods.com/stories/67890
https://fanfiction.net/s/11111
```

**Import in Calibre**:
1. FanFicFare → **Download from URLs**
2. Select `stories.txt` file
3. Click **Open**
4. All stories download automatically

### Update Existing Stories

**Check for New Chapters**:
1. Select books in library
2. Right-click → FanFicFare → **Check for Updates**
3. Stories with new chapters will update
4. Notification shows update count

**Auto-Update Schedule**:
- Preferences → Plugins → FanFicFare → Customize
- Tab: **Update Settings**
- Enable: Check for updates automatically
- Set frequency: Daily/Weekly

## Android (CleverFerret) Setup

The CleverFerret Android app has **built-in support** for fanfiction downloading - no additional configuration needed!

### Using CleverFerret

1. **Open App**
2. **Menu** → **Content Creation** → **Fanfiction Downloader**
3. **Enter URL** of story
4. **Tap "Download as EPUB"**
5. Story automatically added to library

**Supported Sites** (Same as Calibre):
- Archive of Our Own
- FanFiction.Net
- Wattpad
- Royal Road
- **Metabods** ✨
- **Literotica** ✨
- And more...

### Sync with Calibre

**Option 1: Calibre Content Server**
1. In Calibre: Connect/share → Start Content Server
2. In CleverFerret: Settings → Calibre Integration
3. Enter server URL
4. Sync libraries

**Option 2: Export/Import**
1. In Calibre: Right-click books → Save to disk
2. Copy EPUB files to Android
3. In CleverFerret: Library → Import → Select files

## Troubleshooting

### Plugin Won't Install

**Error**: "Failed to install plugin"

**Solutions**:
1. Update Calibre to latest version
2. Download plugin ZIP manually
3. Use "Load plugin from file" method
4. Check antivirus isn't blocking

### Configuration Not Working

**Error**: Settings don't apply

**Solutions**:
1. Verify `personal.ini` location is correct
2. Check file permissions (should be readable)
3. Restart Calibre after copying config
4. Check for syntax errors in INI file

### Downloads Fail

**Error**: "Failed to download story"

**Solutions**:
1. **Check URL**: Make sure it's valid and complete
2. **Check site**: Visit URL in browser
3. **Check internet**: Ensure stable connection
4. **Update plugin**: Make sure FanFicFare is latest version
5. **Check rate limiting**: Wait a few minutes between downloads

### Adult Content Not Downloading

**Error**: "Adult content blocked"

**Solutions**:
1. Check `is_adult:true` in `personal.ini`
2. Enable "Include adult content" in plugin settings
3. Verify you're 18+ (required for adult content)
4. Some sites may require account login

### Site Not Supported

**Error**: "Unknown site" or "Generic adapter"

**Solutions**:
1. Check if site is in supported list
2. Update FanFicFare plugin to latest version
3. Check site spelling in URL
4. Some sites may need custom configuration

## Advanced Configuration

### Custom Site Adapter

**Add support for new site**:

1. Edit `~/.fanficfare/personal.ini`
2. Add section for site:
   ```ini
   [newsite.com]
   is_adult:true
   story_title_selector:h1.title
   author_selector:.author
   content_selector:.story-content
   ```
3. Test with sample story
4. Adjust selectors as needed

### Metadata Customization

**Add custom metadata fields**:
```ini
[defaults]
# Add custom fields
include:download_date
include:source_site
include:original_url

# Custom tags
calibre_tags:Web Fiction, Downloaded
```

### Automation

**Linux/Mac Script** (update-stories.sh):
```bash
#!/bin/bash
# Update all stories in Calibre library
calibre-debug -r FanFicFare -- \
  --update-all \
  --library ~/Documents/"Calibre Library"
```

**Add to crontab** (daily at 2 AM):
```bash
0 2 * * * /path/to/update-stories.sh
```

**Windows Task Scheduler**:
1. Create batch file: `update-stories.bat`
   ```batch
   calibre-debug -r FanFicFare -- --update-all --library "C:\Users\Name\Calibre Library"
   ```
2. Task Scheduler → Create Basic Task
3. Trigger: Daily
4. Action: Start Program → select batch file

## Security & Privacy

### Age Verification
- Adult content requires age 18+
- Configuration assumes legal age
- Comply with local laws

### Privacy
- Downloads are private and local
- No data shared with third parties
- Stories for personal use only
- Consider password-protecting Calibre library

### Content Warnings
- Adult content tags applied automatically
- Rating shown in metadata
- Can filter/hide by tags
- Parental controls available in Calibre

## Support Resources

### FanFicFare Plugin
- **GitHub**: https://github.com/JimmXinu/FanFicFare
- **Wiki**: https://github.com/JimmXinu/FanFicFare/wiki
- **Issues**: https://github.com/JimmXinu/FanFicFare/issues

### Calibre
- **Manual**: https://manual.calibre-ebook.com/
- **Forums**: https://www.mobileread.com/forums/forumdisplay.php?f=166
- **Email**: support@calibre-ebook.com

### CleverFerret
- **Documentation**: See app help section
- **GitHub**: (if available)

## FAQ

### Q: Is this legal?
**A**: Downloading fanfiction for personal use is generally allowed by most sites. Always check site Terms of Service. Do not redistribute.

### Q: Do I need an account?
**A**: Most sites allow anonymous downloading. Some (like Questionable Questing) may require login for adult content.

### Q: How many stories can I download?
**A**: Unlimited, but respect rate limiting. Wait 1-2 seconds between downloads to avoid being blocked.

### Q: Can I download from multiple sites at once?
**A**: Yes, batch download supports mixed URLs from different sites.

### Q: What format should I use?
**A**: EPUB is recommended. Universal format, works everywhere including CleverFerret.

### Q: Can I update stories automatically?
**A**: Yes, use FanFicFare's update checker or set up automated script.

### Q: What if a site changes its layout?
**A**: Update the site selectors in `personal.ini`. Check FanFicFare GitHub for updates.

### Q: Can I customize the EPUB format?
**A**: Yes, extensive customization available in `personal.ini`. See FanFicFare documentation.

### Q: Is my download history tracked?
**A**: No, downloads are anonymous. Sites may log IP address (normal web traffic).

### Q: Can I download images?
**A**: Yes, if enabled in configuration. Some sites don't have story images.

## Next Steps

✅ **Installation Complete!**

**Now you can**:
1. Download stories from 90+ sites
2. Automatically extract metadata
3. Update stories with new chapters
4. Organize with tags and collections
5. Read on any device
6. Sync with CleverFerret Android app

**Recommended**:
- ⭐ Star FanFicFare on GitHub
- 📖 Read the documentation
- 🔖 Save favorite story URLs
- 🏷️ Set up custom tags
- 📱 Install CleverFerret app

---

**🎉 Happy Reading!**

Enjoy your fanfiction collection across all your devices!

---

**Last Updated**: 2025-10-27  
**Version**: 1.0  
**Compatibility**: Calibre 5.0+, FanFicFare 4.0+

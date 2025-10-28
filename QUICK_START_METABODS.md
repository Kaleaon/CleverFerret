# Quick Start: Metabods.com Adult Fanfic Downloader

## TL;DR - Get Started in 5 Minutes

### Option 1: CleverFerret Android App (Easiest)

1. **Open App** → **Menu** → **Fanfiction Downloader**
2. **Paste URL**: `https://metabods.com/stories/[story-id]`
3. **Tap**: "Download as EPUB"
4. **Done!** Story in your library

✅ **Already working** - Metabods support built-in!

### Option 2: Calibre Desktop

**One-Time Setup**:
```bash
# 1. Install Calibre (if not installed)
# Download from: https://calibre-ebook.com/download

# 2. Install FanFicFare plugin
# Calibre → Preferences → Plugins → Get new plugins → Search "FanFicFare"

# 3. Copy configuration
cp calibre-config/fanficfare/personal.ini ~/.fanficfare/
# Windows: copy to %APPDATA%\fanficfare\

# 4. Restart Calibre
```

**Download Stories**:
1. Click **Download from URL**
2. Paste: `https://metabods.com/stories/[story-id]`
3. Click **OK**
4. Done!

## What's Included

### Supported Adult Sites

✅ **Metabods.com** - Transformation fiction (NEW!)  
✅ **Literotica.com** - Adult erotica  
✅ **Questionable Questing** - Adult forum fiction  
✅ **Archive of Our Own** - Multi-genre (adult tags)  
✅ **90+ other sites**

### Features

- ✅ Single and multi-chapter stories
- ✅ Automatic metadata extraction
- ✅ Adult content ratings
- ✅ Content warning tags
- ✅ EPUB format (universal)
- ✅ Offline reading
- ✅ Privacy protected (local storage)

## Example URLs

### Metabods.com
```
https://metabods.com/stories/12345
https://metabods.com/story/story-title-here
```

### Other Supported Sites
```
https://archiveofourown.org/works/12345
https://www.literotica.com/s/story-name
https://forum.questionablequesting.com/threads/story.12345/
```

## Configuration Files

All configuration files are in: `/workspace/calibre-config/`

### For Calibre Users

**Copy this file**:
```
calibre-config/fanficfare/personal.ini
→ ~/.fanficfare/personal.ini (Linux/Mac)
→ %APPDATA%\fanficfare\personal.ini (Windows)
```

### For CleverFerret Users

**No configuration needed!** Metabods support is built into the app.

## Documentation

📖 **Full guides available**:

- **INSTALLATION_GUIDE.md** - Complete setup instructions
- **README.md** - User guide for all features
- **METABODS_SITE_GUIDE.md** - Metabods-specific details
- **CALIBRE_ADULT_FANFIC_IMPLEMENTATION.md** - Technical details

## Important Notes

### Age Requirement
⚠️ **18+ Only** - Adult content. Must be of legal age.

### Legal
- ✅ Download for **personal use only**
- ❌ Do **not redistribute** stories
- ✅ Respect author copyrights
- ✅ Check site Terms of Service

### Privacy
- ✅ Anonymous downloads
- ✅ Local storage only
- ✅ No tracking
- ✅ Private library

## Troubleshooting

### Story Won't Download

1. **Check URL** - Make sure it's valid
2. **Check site** - Visit URL in browser
3. **Wait & retry** - May be temporary issue
4. **Check config** - Ensure `is_adult:true`

### Empty Content

- Site structure may have changed
- See **METABODS_SITE_GUIDE.md** for selector updates

### Need Help?

- Check **INSTALLATION_GUIDE.md** for detailed troubleshooting
- See **README.md** for FAQ
- Check FanFicFare GitHub for updates

## What Was Changed

### Code Changes (CleverFerret Android)

**Modified Files**:
- `WebFictionService.kt` - Added Metabods & Literotica support
- `FanfictionDownloaderScreen.kt` - Updated UI
- `WebFictionManagerScreen.kt` - Added site mappings

### Configuration Files (Calibre)

**Created**:
- `personal.ini` - Main FanFicFare configuration
- `README.md` - User documentation
- `METABODS_SITE_GUIDE.md` - Site-specific guide
- `INSTALLATION_GUIDE.md` - Setup instructions

## Quick Commands

### Download Single Story
```bash
# Calibre command line
calibre-debug -r FanFicFare -- "https://metabods.com/stories/12345"
```

### Batch Download
```bash
# Create URL list
cat > stories.txt <<EOF
https://metabods.com/stories/12345
https://metabods.com/stories/67890
EOF

# Download all
calibre-debug -r FanFicFare -- --input stories.txt
```

## Next Steps

1. ✅ **Try it out** - Download a test story
2. 📖 **Read docs** - Check INSTALLATION_GUIDE.md for advanced features
3. 🏷️ **Organize** - Set up tags and collections in Calibre
4. 📱 **Sync** - Connect CleverFerret to Calibre library (optional)
5. ⭐ **Enjoy** - Read your fanfiction collection!

## Success Indicators

You'll know it's working when:
- ✅ Stories download successfully
- ✅ Metadata is extracted (title, author, etc.)
- ✅ Tags include "Adult", "Metabods", genre tags
- ✅ EPUB opens in reader
- ✅ All chapters are present

## Support

**Documentation**:
- All guides in `/workspace/calibre-config/`
- Check README.md for detailed information

**External Resources**:
- FanFicFare: https://github.com/JimmXinu/FanFicFare
- Calibre: https://calibre-ebook.com

---

**🎉 You're all set! Happy reading!**

**Last Updated**: 2025-10-27  
**Version**: 1.0

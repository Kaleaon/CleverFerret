# Out of Cruel Space - Reddit to EPUB Scripts

This directory contains automation scripts for downloading "Out of Cruel Space" chapters from Reddit and converting them to EPUB format.

## 🎯 Reddit API Key

**Your API Key**: `EvU-yXXa66v0qe94RLorQw`

This key is already configured in all scripts.

## 📁 Files in This Directory

### Main Scripts

1. **`out_of_cruel_space_updater.py`** - Main Python automation script
   - Downloads chapters from r/HFY
   - Creates HTML and prepares for EPUB conversion
   - Supports incremental updates
   - Includes caching system

2. **`update_oocs.sh`** - Shell wrapper script
   - One-command automation
   - Auto-installs dependencies
   - Handles HTML to EPUB conversion
   - Logging and error handling

3. **`requirements-reddit.txt`** - Python dependencies
   - `requests>=2.31.0`

## 🚀 Quick Start

### First Time Setup

```bash
# Install dependencies
pip install -r requirements-reddit.txt

# Download all chapters (creates HTML)
python out_of_cruel_space_updater.py

# OR use the automated script
bash update_oocs.sh
```

### Regular Updates

```bash
# Check for new chapters only
python out_of_cruel_space_updater.py --update

# OR
bash update_oocs.sh
```

## 📖 Output

Files are created in `epub_output/`:
- `Out_Of_Cruel_Space_TIMESTAMP.html` - HTML version of the book
- `oocs_cache.json` - Chapter cache for updates
- `update_log.txt` - Log file

## 🔧 Convert HTML to EPUB

### Using Pandoc (Recommended)
```bash
pandoc epub_output/Out_Of_Cruel_Space_*.html -o OutOfCruelSpace.epub
```

### Using Calibre
```bash
ebook-convert epub_output/Out_Of_Cruel_Space_*.html OutOfCruelSpace.epub
```

## 📚 Documentation

- **Quick Start**: `/workspace/QUICK_START_OUT_OF_CRUEL_SPACE.md`
- **Full Documentation**: `/workspace/OUT_OF_CRUEL_SPACE_AUTOMATION.md`
- **Integration Summary**: `/workspace/REDDIT_API_INTEGRATION_SUMMARY.md`

## 🔄 Automation

### Daily Auto-Update (Cron)

```bash
# Edit crontab
crontab -e

# Add this line (runs daily at 2 AM)
0 2 * * * cd /workspace/scripts && bash update_oocs.sh >> epub_output/cron.log 2>&1
```

## 🎛️ Command Options

### Python Script

```bash
python out_of_cruel_space_updater.py [OPTIONS]

Options:
  --update              Check for new chapters only
  --max-chapters N      Limit to N chapters (default: 1000)
  --rebuild             Rebuild from scratch, ignore cache
  --help                Show help message
```

### Shell Script

```bash
bash update_oocs.sh [OPTIONS]

Options:
  -h, --help           Show help message
  -f, --full          Full rebuild instead of update
```

## 🐛 Troubleshooting

### No chapters found
- Check internet connection
- Increase `--max-chapters` limit
- Verify the series is still on r/HFY

### Script fails
- Install dependencies: `pip install -r requirements-reddit.txt`
- Check Python version: `python3 --version` (needs 3.7+)

### Can't convert to EPUB
- Install pandoc: `sudo apt install pandoc`
- Or Calibre: `sudo apt install calibre`
- Or read the HTML file directly (it's beautiful!)

## 📊 How It Works

1. **Search Reddit** - Uses public JSON API to search r/HFY
2. **Filter Posts** - Looks for "Out of Cruel Space" by KyleKKent
3. **Extract Chapters** - Downloads text content from each post
4. **Number Detection** - Automatically detects chapter numbers
5. **Sort & Organize** - Orders chapters correctly
6. **Generate HTML** - Creates a styled HTML book
7. **Cache** - Saves chapter data for future updates
8. **Convert** - Can be converted to EPUB with standard tools

## 🎯 Test It Now

Quick test with just 10 chapters:

```bash
python out_of_cruel_space_updater.py --max-chapters 10
```

This will download 10 chapters in about 30 seconds.

## 📞 Support

For questions or issues:
1. Check the troubleshooting section above
2. Review the full documentation
3. Check Reddit's status: https://www.redditstatus.com/

---

**Status**: ✅ Ready to use!
**API Key**: ✅ Configured
**Dependencies**: Run `pip install -r requirements-reddit.txt`

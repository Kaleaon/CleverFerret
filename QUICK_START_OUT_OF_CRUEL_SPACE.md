# Quick Start: Out of Cruel Space EPUB Automation

This guide will get you started with automated "Out of Cruel Space" EPUB generation in under 5 minutes.

## 🚀 Fastest Way to Get Started

### Option 1: Automated Script (Recommended)

```bash
cd /workspace/scripts
bash update_oocs.sh
```

That's it! The script will:
- Install dependencies automatically
- Download all chapters from Reddit
- Create an EPUB file
- Save everything to `epub_output/`

### Option 2: Python Script Directly

```bash
cd /workspace/scripts
pip install -r requirements-reddit.txt
python out_of_cruel_space_updater.py
```

### Option 3: Android App

1. Open CleverFerret app
2. Go to **Web Fiction Manager**
3. Click **Download Reddit Series**
4. Select **"Out of Cruel Space"**
5. Wait for download and EPUB creation

## 📱 What Gets Created

After running, you'll have:

```
workspace/scripts/epub_output/
├── Out_Of_Cruel_Space_YYYYMMDD_HHMMSS.html    # HTML version
├── Out_Of_Cruel_Space_YYYYMMDD_HHMMSS.epub    # EPUB (if converter available)
└── oocs_cache.json                             # Chapter cache for updates
```

## 🔄 Updating with New Chapters

When new chapters are posted:

```bash
cd /workspace/scripts
bash update_oocs.sh
```

Or:

```bash
python out_of_cruel_space_updater.py --update
```

The script will:
- Only download new chapters (fast!)
- Update the EPUB with all chapters
- Keep your cache up to date

## 🤖 Set Up Daily Automatic Updates

### Using Cron (Linux/Mac)

```bash
crontab -e
```

Add this line to check for updates daily at 2 AM:

```
0 2 * * * cd /workspace/scripts && bash update_oocs.sh >> epub_output/cron.log 2>&1
```

### Using systemd Timer (Linux)

Create `/etc/systemd/system/oocs-update.service`:

```ini
[Unit]
Description=Out of Cruel Space EPUB Update

[Service]
Type=oneshot
ExecStart=/workspace/scripts/update_oocs.sh
WorkingDirectory=/workspace/scripts
```

Create `/etc/systemd/system/oocs-update.timer`:

```ini
[Unit]
Description=Daily Out of Cruel Space update

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
```

Enable it:

```bash
sudo systemctl enable oocs-update.timer
sudo systemctl start oocs-update.timer
```

### Using Windows Task Scheduler

1. Open Task Scheduler
2. Create Basic Task
3. Name: "Out of Cruel Space Update"
4. Trigger: Daily at 2:00 AM
5. Action: Start a program
   - Program: `C:\Python\python.exe`
   - Arguments: `out_of_cruel_space_updater.py --update`
   - Start in: `C:\workspace\scripts`

## 📖 Reading the EPUB

### On Computer

**Calibre (Recommended)**
```bash
sudo apt install calibre  # Linux
brew install calibre      # Mac
# Windows: Download from calibre-ebook.com

calibre Out_Of_Cruel_Space_*.epub
```

**Other Options**
- Adobe Digital Editions
- Apple Books (Mac)
- Microsoft Edge (Windows)
- Firefox with EPUBReader extension

### On Mobile

**Android**
- Google Play Books
- Moon+ Reader
- FBReader
- CleverFerret app (this project!)

**iOS**
- Apple Books
- Marvin
- KyBook

### On E-Reader

**Kindle**
```bash
# Convert to MOBI format
ebook-convert Out_Of_Cruel_Space.epub Out_Of_Cruel_Space.mobi

# Or email to your Kindle email address
```

**Kobo/Nook**
- Copy EPUB directly via USB

## 🔧 Advanced Usage

### Download Specific Chapter Range

Edit the Python script to filter chapters:

```python
# In main() function, after downloading:
valid_chapters = [ch for ch in chapters 
                  if 100 <= ch.chapter_number <= 200]
```

### Change Output Format

The script creates HTML first. Convert to any format:

```bash
# EPUB
pandoc output.html -o output.epub

# PDF
pandoc output.html -o output.pdf

# MOBI (Kindle)
ebook-convert output.html output.mobi

# AZW3 (Kindle)
ebook-convert output.html output.azw3
```

### Customize EPUB Appearance

Edit the CSS in the Python script:

```python
# In _create_html_book() method, modify the style section:
<style>
    body {
        font-family: 'Your Preferred Font', serif;
        font-size: 16px;
        /* Add your styles */
    }
</style>
```

### Multiple Series

Create a copy of the script for other series:

```bash
cp out_of_cruel_space_updater.py another_series_updater.py
```

Edit the constants:

```python
SERIES_NAME = "Your Series Name"
AUTHOR = "AuthorName"
SUBREDDIT = "HFY"
```

## 📊 Monitoring Updates

### Check Last Update Time

```bash
cat epub_output/oocs_cache.json | grep last_update
```

### View Update Log

```bash
tail -f epub_output/update_log.txt
```

### Count Chapters

```bash
python3 -c "import json; print('Chapters:', len(json.load(open('epub_output/oocs_cache.json'))['chapters']))"
```

## 🐛 Troubleshooting

### Script Says "No chapters found"

**Check internet connection:**
```bash
curl -s "https://www.reddit.com/r/HFY/.json" | head -n 5
```

**Increase max chapters:**
```bash
python out_of_cruel_space_updater.py --max-chapters 2000
```

**Verify series name:**
Go to https://www.reddit.com/r/HFY/ and search for "Out of Cruel Space"

### Rate Limited by Reddit

**Solution 1:** Wait a few minutes and try again

**Solution 2:** The script includes automatic delays

**Solution 3:** For frequent updates, get a Reddit API client secret for full OAuth

### Missing Chapters

Some chapters may have non-standard titles. Check the cache:

```bash
cat epub_output/oocs_cache.json | python3 -m json.tool | less
```

Look for chapters with `chapter_number: 0` - these didn't match the regex patterns.

### Conversion Fails

**Install a converter:**

```bash
# Pandoc (recommended)
sudo apt install pandoc  # Linux
brew install pandoc      # Mac

# Or Calibre
sudo apt install calibre  # Linux
brew install calibre      # Mac
```

## 📚 Resources

- **Documentation**: `/workspace/OUT_OF_CRUEL_SPACE_AUTOMATION.md`
- **Reddit Series**: https://www.reddit.com/r/HFY/search?q=Out+of+Cruel+Space+author%3AKyleKKent
- **Author Page**: https://www.reddit.com/user/KyleKKent
- **Subreddit**: https://www.reddit.com/r/HFY

## 💡 Tips

1. **First download is slow** - It fetches all chapters. Future updates are much faster.

2. **Check for updates weekly** - KyleKKent posts regularly, usually 2-3 times per week.

3. **Keep the cache** - The `oocs_cache.json` file tracks what you've downloaded.

4. **Backup your EPUBs** - Save copies before running `--rebuild`.

5. **Read HTML directly** - If EPUB conversion fails, the HTML version is very readable.

## 🎯 One-Line Commands

**First time download:**
```bash
cd /workspace/scripts && pip install -r requirements-reddit.txt && python out_of_cruel_space_updater.py
```

**Check for updates:**
```bash
cd /workspace/scripts && python out_of_cruel_space_updater.py --update
```

**Full rebuild:**
```bash
cd /workspace/scripts && python out_of_cruel_space_updater.py --rebuild
```

**Update and convert to EPUB:**
```bash
cd /workspace/scripts && python out_of_cruel_space_updater.py --update && pandoc epub_output/Out_Of_Cruel_Space_*.html -o OOCS.epub
```

## ✅ Verify Installation

Run this to check everything is working:

```bash
cd /workspace/scripts
python3 out_of_cruel_space_updater.py --max-chapters 10
```

This will download just 10 chapters to test the system.

---

**Need Help?** Check the full documentation at `/workspace/OUT_OF_CRUEL_SPACE_AUTOMATION.md`

**Reddit API Key**: Already configured as `EvU-yXXa66v0qe94RLorQw`

**Enjoy reading!** 📖

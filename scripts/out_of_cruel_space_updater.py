#!/usr/bin/env python3
"""
Out of Cruel Space - Reddit to EPUB Automation Script

This script retrieves chapters from the "Out of Cruel Space" series on Reddit's r/HFY
and automates the creation and updating of EPUB files.

Usage:
    python out_of_cruel_space_updater.py [--update] [--max-chapters N]
"""

import os
import sys
import json
import time
import re
import argparse
from datetime import datetime
from typing import List, Dict, Optional
import requests
from pathlib import Path

# Reddit API Configuration
REDDIT_CLIENT_ID = "EvU-yXXa66v0qe94RLorQw"
REDDIT_USER_AGENT = "CleverFerret:OutOfCruelSpaceDownloader:v1.0 (by /u/cleverferret)"

# Story Configuration
SERIES_NAME = "Out of Cruel Space"
SUBREDDIT = "HFY"
AUTHOR = "KyleKKent"  # Primary author
OUTPUT_DIR = Path("./epub_output")
CACHE_FILE = OUTPUT_DIR / "oocs_cache.json"


class RedditChapter:
    """Represents a single chapter from Reddit"""
    
    def __init__(self, post_data: dict):
        self.id = post_data.get('id', '')
        self.title = post_data.get('title', '')
        self.selftext = post_data.get('selftext', '')
        self.selftext_html = post_data.get('selftext_html', '')
        self.url = f"https://www.reddit.com{post_data.get('permalink', '')}"
        self.created_utc = post_data.get('created_utc', 0)
        self.author = post_data.get('author', 'Unknown')
        self.score = post_data.get('score', 0)
        
        # Extract chapter number
        self.chapter_number = self._extract_chapter_number()
        
    def _extract_chapter_number(self) -> int:
        """Extract chapter number from title"""
        # Try different patterns
        patterns = [
            r'Out Of Cruel Space.*?[Cc]hapter\s*(\d+)',
            r'Out Of Cruel Space.*?[Pp]art\s*(\d+)',
            r'[Cc]h\.?\s*(\d+)',
            r'Chapter\s*(\d+)',
            r'Part\s*(\d+)',
            r'#\s*(\d+)',
        ]
        
        for pattern in patterns:
            match = re.search(pattern, self.title, re.IGNORECASE)
            if match:
                return int(match.group(1))
        
        return 0
    
    def to_html(self) -> str:
        """Convert chapter content to HTML"""
        # Use selftext_html if available, otherwise convert selftext
        if self.selftext_html:
            # Reddit's HTML is HTML-escaped, need to decode it
            import html
            content = html.unescape(self.selftext_html)
            # Remove the surrounding <div> tags that Reddit adds
            content = re.sub(r'^<div class="md">|</div>$', '', content.strip())
        else:
            # Convert markdown-style text to HTML
            content = self.selftext
            # Basic markdown conversion
            content = content.replace('\n\n', '</p><p>')
            content = f'<p>{content}</p>'
        
        return f"""
        <div class="chapter">
            <div class="chapter-meta">
                <p><strong>Source:</strong> <a href="{self.url}">{self.url}</a></p>
                <p><strong>Author:</strong> {self.author}</p>
                <p><strong>Posted:</strong> {datetime.fromtimestamp(self.created_utc).strftime('%Y-%m-%d %H:%M:%S')}</p>
            </div>
            <div class="chapter-content">
                {content}
            </div>
        </div>
        """
    
    def to_dict(self) -> dict:
        """Convert to dictionary for caching"""
        return {
            'id': self.id,
            'title': self.title,
            'selftext': self.selftext,
            'selftext_html': self.selftext_html,
            'url': self.url,
            'created_utc': self.created_utc,
            'author': self.author,
            'score': self.score,
            'chapter_number': self.chapter_number
        }


class OutOfCruelSpaceDownloader:
    """Downloads Out of Cruel Space chapters from Reddit"""
    
    def __init__(self, client_id: str, user_agent: str):
        self.client_id = client_id
        self.user_agent = user_agent
        self.session = requests.Session()
        self.session.headers.update({'User-Agent': user_agent})
        self.access_token = None
        
    def authenticate(self) -> bool:
        """
        Authenticate with Reddit API
        Note: For read-only access to public posts, we can use the public JSON API
        without full OAuth, but with the client ID in the user agent.
        """
        # For now, we'll use the public JSON API which doesn't require full OAuth
        # If you have a client_secret, we can implement full OAuth
        print("Using Reddit public JSON API...")
        return True
    
    def search_series(self, subreddit: str, query: str, limit: int = 100) -> List[RedditChapter]:
        """Search for series chapters in a subreddit"""
        print(f"Searching r/{subreddit} for '{query}'...")
        
        chapters = []
        after = None
        
        while len(chapters) < limit:
            # Use Reddit's JSON API
            url = f"https://www.reddit.com/r/{subreddit}/search.json"
            params = {
                'q': f'{query} author:{AUTHOR}',
                'restrict_sr': '1',
                'sort': 'new',
                'limit': 100,
                't': 'all'
            }
            
            if after:
                params['after'] = after
            
            try:
                response = self.session.get(url, params=params, timeout=30)
                response.raise_for_status()
                data = response.json()
                
                posts = data.get('data', {}).get('children', [])
                if not posts:
                    break
                
                for post in posts:
                    post_data = post.get('data', {})
                    # Filter for self-posts (text posts, not links)
                    if post_data.get('is_self', False):
                        chapter = RedditChapter(post_data)
                        chapters.append(chapter)
                
                # Get pagination token
                after = data.get('data', {}).get('after')
                if not after:
                    break
                
                # Rate limiting
                time.sleep(2)
                
            except Exception as e:
                print(f"Error searching Reddit: {e}")
                break
        
        print(f"Found {len(chapters)} posts")
        return chapters
    
    def get_post_by_id(self, post_id: str, subreddit: str = SUBREDDIT) -> Optional[RedditChapter]:
        """Get a specific post by ID"""
        url = f"https://www.reddit.com/r/{subreddit}/comments/{post_id}.json"
        
        try:
            response = self.session.get(url, timeout=30)
            response.raise_for_status()
            data = response.json()
            
            # The post is in the first listing
            if data and len(data) > 0:
                post_data = data[0]['data']['children'][0]['data']
                return RedditChapter(post_data)
        except Exception as e:
            print(f"Error getting post {post_id}: {e}")
        
        return None


class EPUBManager:
    """Manages EPUB creation and updates"""
    
    def __init__(self, output_dir: Path):
        self.output_dir = output_dir
        self.output_dir.mkdir(parents=True, exist_ok=True)
    
    def create_epub(self, chapters: List[RedditChapter], filename: str = None) -> str:
        """Create an EPUB file from chapters"""
        if not filename:
            timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
            filename = f"Out_Of_Cruel_Space_{timestamp}.epub"
        
        epub_path = self.output_dir / filename
        
        # Sort chapters by chapter number
        sorted_chapters = sorted(chapters, key=lambda c: (c.chapter_number, c.created_utc))
        
        print(f"Creating EPUB with {len(sorted_chapters)} chapters...")
        print(f"Output: {epub_path}")
        
        # For now, create a simple HTML version that can be converted to EPUB
        # In production, you'd want to use a library like ebooklib
        self._create_html_book(sorted_chapters, epub_path.with_suffix('.html'))
        
        print(f"✓ Created HTML version: {epub_path.with_suffix('.html')}")
        print("\nTo convert to EPUB, you can use:")
        print(f"  pandoc {epub_path.with_suffix('.html')} -o {epub_path}")
        print("  or use Calibre's ebook-convert tool")
        
        return str(epub_path)
    
    def _create_html_book(self, chapters: List[RedditChapter], output_path: Path):
        """Create an HTML version of the book"""
        html_content = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{SERIES_NAME}</title>
    <style>
        body {{
            font-family: 'Georgia', serif;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            color: #333;
        }}
        h1 {{
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }}
        h2 {{
            color: #34495e;
            margin-top: 40px;
            border-bottom: 1px solid #bdc3c7;
            padding-bottom: 5px;
        }}
        .toc {{
            background: #ecf0f1;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }}
        .toc ol {{
            column-count: 2;
            column-gap: 20px;
        }}
        .chapter {{
            page-break-before: always;
            margin-top: 50px;
        }}
        .chapter-meta {{
            font-size: 0.9em;
            color: #7f8c8d;
            font-style: italic;
            margin-bottom: 20px;
            padding: 10px;
            background: #f8f9fa;
            border-left: 3px solid #3498db;
        }}
        .chapter-content {{
            text-align: justify;
        }}
        a {{
            color: #3498db;
            text-decoration: none;
        }}
        a:hover {{
            text-decoration: underline;
        }}
    </style>
</head>
<body>
    <h1>{SERIES_NAME}</h1>
    <div class="toc">
        <h2>Table of Contents</h2>
        <ol>
"""
        
        # Add table of contents
        for chapter in chapters:
            chapter_id = f"chapter_{chapter.chapter_number}_{chapter.id}"
            html_content += f'            <li><a href="#{chapter_id}">{chapter.title}</a></li>\n'
        
        html_content += """        </ol>
    </div>
    
"""
        
        # Add chapters
        for chapter in chapters:
            chapter_id = f"chapter_{chapter.chapter_number}_{chapter.id}"
            html_content += f'    <div class="chapter" id="{chapter_id}">\n'
            html_content += f'        <h2>{chapter.title}</h2>\n'
            html_content += chapter.to_html()
            html_content += '    </div>\n\n'
        
        html_content += """</body>
</html>"""
        
        output_path.write_text(html_content, encoding='utf-8')


class ChapterCache:
    """Manages chapter caching for incremental updates"""
    
    def __init__(self, cache_file: Path):
        self.cache_file = cache_file
        self.cache_file.parent.mkdir(parents=True, exist_ok=True)
        self.cache = self._load_cache()
    
    def _load_cache(self) -> dict:
        """Load cache from file"""
        if self.cache_file.exists():
            try:
                with open(self.cache_file, 'r') as f:
                    return json.load(f)
            except Exception as e:
                print(f"Warning: Could not load cache: {e}")
        return {'chapters': {}, 'last_update': None}
    
    def _save_cache(self):
        """Save cache to file"""
        try:
            with open(self.cache_file, 'w') as f:
                json.dump(self.cache, f, indent=2)
        except Exception as e:
            print(f"Warning: Could not save cache: {e}")
    
    def add_chapters(self, chapters: List[RedditChapter]):
        """Add chapters to cache"""
        for chapter in chapters:
            self.cache['chapters'][chapter.id] = chapter.to_dict()
        self.cache['last_update'] = datetime.now().isoformat()
        self._save_cache()
    
    def get_new_chapters(self, all_chapters: List[RedditChapter]) -> List[RedditChapter]:
        """Get chapters that aren't in the cache"""
        cached_ids = set(self.cache['chapters'].keys())
        return [ch for ch in all_chapters if ch.id not in cached_ids]
    
    def get_all_cached_chapters(self) -> List[Dict]:
        """Get all cached chapters"""
        return list(self.cache['chapters'].values())
    
    def get_chapter_count(self) -> int:
        """Get number of cached chapters"""
        return len(self.cache['chapters'])


def main():
    """Main automation script"""
    parser = argparse.ArgumentParser(
        description='Download and manage Out of Cruel Space chapters from Reddit'
    )
    parser.add_argument(
        '--update',
        action='store_true',
        help='Check for new chapters and update existing EPUB'
    )
    parser.add_argument(
        '--max-chapters',
        type=int,
        default=1000,
        help='Maximum number of chapters to download (default: 1000)'
    )
    parser.add_argument(
        '--rebuild',
        action='store_true',
        help='Rebuild EPUB from scratch, ignoring cache'
    )
    
    args = parser.parse_args()
    
    print("=" * 70)
    print(f"Out of Cruel Space - Reddit to EPUB Automation")
    print("=" * 70)
    print()
    
    # Initialize components
    downloader = OutOfCruelSpaceDownloader(REDDIT_CLIENT_ID, REDDIT_USER_AGENT)
    epub_manager = EPUBManager(OUTPUT_DIR)
    cache = ChapterCache(CACHE_FILE)
    
    # Authenticate
    if not downloader.authenticate():
        print("❌ Failed to authenticate with Reddit API")
        return 1
    
    # Download chapters
    print(f"\nSearching for chapters (max: {args.max_chapters})...")
    chapters = downloader.search_series(SUBREDDIT, SERIES_NAME, limit=args.max_chapters)
    
    if not chapters:
        print("❌ No chapters found!")
        return 1
    
    print(f"✓ Found {len(chapters)} total posts")
    
    # Filter valid chapters (those with chapter numbers)
    valid_chapters = [ch for ch in chapters if ch.chapter_number > 0]
    print(f"✓ Identified {len(valid_chapters)} valid chapters")
    
    if args.update:
        # Update mode: only process new chapters
        new_chapters = cache.get_new_chapters(valid_chapters)
        
        if not new_chapters:
            print("\n✓ No new chapters found. Everything is up to date!")
            return 0
        
        print(f"\n📚 Found {len(new_chapters)} new chapters:")
        for ch in sorted(new_chapters, key=lambda c: c.chapter_number):
            print(f"  - Chapter {ch.chapter_number}: {ch.title}")
        
        # Add to cache
        cache.add_chapters(new_chapters)
        
        # Rebuild EPUB with all chapters
        all_chapters_data = cache.get_all_cached_chapters()
        all_chapters_objs = []
        for ch_data in all_chapters_data:
            # Reconstruct chapter objects
            ch = RedditChapter(ch_data)
            all_chapters_objs.append(ch)
        
        epub_path = epub_manager.create_epub(all_chapters_objs)
        print(f"\n✓ Updated EPUB with {len(all_chapters_objs)} total chapters")
        
    else:
        # Full download mode
        if args.rebuild:
            print("\n🔄 Rebuilding from scratch...")
        else:
            cached_count = cache.get_chapter_count()
            if cached_count > 0:
                print(f"\n📚 Cache contains {cached_count} chapters")
                print("   Use --update to only download new chapters")
                print("   Use --rebuild to ignore cache and rebuild from scratch")
        
        # Add to cache
        cache.add_chapters(valid_chapters)
        
        # Create EPUB
        epub_path = epub_manager.create_epub(valid_chapters)
        print(f"\n✓ Created EPUB with {len(valid_chapters)} chapters")
    
    # Show statistics
    chapter_numbers = sorted([ch.chapter_number for ch in valid_chapters if ch.chapter_number > 0])
    if chapter_numbers:
        print(f"\n📊 Statistics:")
        print(f"   Chapters: {chapter_numbers[0]} - {chapter_numbers[-1]}")
        print(f"   Total: {len(chapter_numbers)} chapters")
        
        # Check for gaps
        expected = set(range(chapter_numbers[0], chapter_numbers[-1] + 1))
        found = set(chapter_numbers)
        missing = sorted(expected - found)
        
        if missing:
            print(f"   ⚠️  Missing chapters: {', '.join(map(str, missing[:10]))}")
            if len(missing) > 10:
                print(f"      ... and {len(missing) - 10} more")
    
    print(f"\n✓ Done! Output directory: {OUTPUT_DIR}")
    print()
    
    return 0


if __name__ == '__main__':
    try:
        sys.exit(main())
    except KeyboardInterrupt:
        print("\n\n❌ Cancelled by user")
        sys.exit(1)
    except Exception as e:
        print(f"\n❌ Error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

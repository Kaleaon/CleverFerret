#!/usr/bin/env python3
"""
Multi-Story Reddit EPUB Updater

Tracks and automatically updates multiple Reddit stories from a configuration file.
Generates EPUBs and optionally adds them to your library.

Usage:
    python multi_story_updater.py [--config CONFIG] [--add SERIES] [--update-all]
"""

import os
import sys
import json
import argparse
from datetime import datetime, timedelta
from pathlib import Path
from typing import List, Dict, Optional

# Import from the existing out_of_cruel_space_updater
sys.path.append(os.path.dirname(__file__))
from out_of_cruel_space_updater import (
    OutOfCruelSpaceDownloader,
    EPUBManager,
    ChapterCache,
    REDDIT_CLIENT_ID,
    REDDIT_USER_AGENT
)

# Configuration
DEFAULT_CONFIG_FILE = Path(__file__).parent / "reddit_stories_config.json"
OUTPUT_DIR = Path(__file__).parent / "epub_output"


class StoryConfig:
    """Configuration for a single story"""
    
    def __init__(self, data: dict):
        self.id = data.get('id', '')
        self.series_name = data.get('series_name', '')
        self.author = data.get('author', '')
        self.subreddit = data.get('subreddit', 'HFY')
        self.auto_update = data.get('auto_update', True)
        self.enabled = data.get('enabled', True)
        self.description = data.get('description', '')
        self.last_checked = data.get('last_checked')
        self.last_updated = data.get('last_updated')
        self.chapter_count = data.get('chapter_count', 0)
    
    def to_dict(self) -> dict:
        return {
            'id': self.id,
            'series_name': self.series_name,
            'author': self.author,
            'subreddit': self.subreddit,
            'auto_update': self.auto_update,
            'enabled': self.enabled,
            'description': self.description,
            'last_checked': self.last_checked,
            'last_updated': self.last_updated,
            'chapter_count': self.chapter_count
        }


class MultiStoryManager:
    """Manages multiple Reddit story configurations"""
    
    def __init__(self, config_file: Path):
        self.config_file = config_file
        self.config = self._load_config()
        self.downloader = OutOfCruelSpaceDownloader(REDDIT_CLIENT_ID, REDDIT_USER_AGENT)
        self.epub_manager = EPUBManager(OUTPUT_DIR)
    
    def _load_config(self) -> dict:
        """Load configuration from file"""
        if not self.config_file.exists():
            # Create default config
            default_config = {
                "stories": [],
                "settings": {
                    "update_interval_hours": 24,
                    "max_chapters_per_story": 2000,
                    "rate_limit_seconds": 2,
                    "auto_convert_to_epub": True,
                    "add_to_library": True
                }
            }
            self._save_config(default_config)
            return default_config
        
        try:
            with open(self.config_file, 'r') as f:
                return json.load(f)
        except Exception as e:
            print(f"Error loading config: {e}")
            return {"stories": [], "settings": {}}
    
    def _save_config(self, config: dict = None):
        """Save configuration to file"""
        if config is None:
            config = self.config
        
        try:
            with open(self.config_file, 'w') as f:
                json.dump(config, f, indent=2)
        except Exception as e:
            print(f"Error saving config: {e}")
    
    def get_stories(self) -> List[StoryConfig]:
        """Get all story configurations"""
        return [StoryConfig(story) for story in self.config.get('stories', [])]
    
    def add_story(self, story: StoryConfig) -> bool:
        """Add a new story to track"""
        stories = self.config.get('stories', [])
        
        # Check if story already exists
        if any(s['id'] == story.id for s in stories):
            print(f"Story '{story.series_name}' already exists!")
            return False
        
        stories.append(story.to_dict())
        self.config['stories'] = stories
        self._save_config()
        print(f"✓ Added story: {story.series_name}")
        return True
    
    def remove_story(self, story_id: str) -> bool:
        """Remove a story from tracking"""
        stories = [s for s in self.config.get('stories', []) if s['id'] != story_id]
        if len(stories) == len(self.config.get('stories', [])):
            print(f"Story '{story_id}' not found!")
            return False
        
        self.config['stories'] = stories
        self._save_config()
        print(f"✓ Removed story: {story_id}")
        return True
    
    def update_story_metadata(self, story_id: str, **kwargs):
        """Update story metadata"""
        stories = self.config.get('stories', [])
        for story in stories:
            if story['id'] == story_id:
                story.update(kwargs)
                self._save_config()
                return True
        return False
    
    def needs_update(self, story: StoryConfig) -> bool:
        """Check if a story needs to be updated"""
        if not story.auto_update or not story.enabled:
            return False
        
        if story.last_checked is None:
            return True
        
        interval_hours = self.config.get('settings', {}).get('update_interval_hours', 24)
        last_checked = datetime.fromisoformat(story.last_checked)
        next_check = last_checked + timedelta(hours=interval_hours)
        
        return datetime.now() >= next_check
    
    def download_story(self, story: StoryConfig, force: bool = False) -> dict:
        """Download a story and generate EPUB"""
        print(f"\n{'='*70}")
        print(f"Processing: {story.series_name}")
        print(f"{'='*70}")
        
        if not story.enabled and not force:
            print(f"⏭️  Story is disabled, skipping...")
            return {"success": False, "skipped": True}
        
        try:
            # Download chapters
            max_chapters = self.config.get('settings', {}).get('max_chapters_per_story', 2000)
            print(f"Downloading from r/{story.subreddit}...")
            
            chapters = self.downloader.search_series(
                story.subreddit,
                story.series_name,
                limit=max_chapters
            )
            
            if not chapters:
                print("❌ No chapters found!")
                return {"success": False, "error": "No chapters found"}
            
            print(f"✓ Found {len(chapters)} posts")
            
            # Filter valid chapters
            valid_chapters = [ch for ch in chapters if ch.chapter_number > 0]
            print(f"✓ Identified {len(valid_chapters)} valid chapters")
            
            # Check if there are new chapters
            old_count = story.chapter_count
            new_count = len(valid_chapters)
            new_chapter_count = new_count - old_count
            
            if new_chapter_count <= 0 and not force:
                print(f"✓ Already up to date ({new_count} chapters)")
                self.update_story_metadata(
                    story.id,
                    last_checked=datetime.now().isoformat()
                )
                return {
                    "success": True,
                    "chapters": new_count,
                    "new_chapters": 0,
                    "skipped": True
                }
            
            # Generate EPUB
            print(f"\nGenerating EPUB...")
            epub_filename = f"{story.id}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.epub"
            epub_path = self.epub_manager.create_epub(valid_chapters, epub_filename)
            
            # Update metadata
            self.update_story_metadata(
                story.id,
                chapter_count=new_count,
                last_checked=datetime.now().isoformat(),
                last_updated=datetime.now().isoformat()
            )
            
            print(f"\n✅ Success!")
            print(f"   Chapters: {new_count} (added {new_chapter_count} new)")
            print(f"   EPUB: {epub_path}")
            
            return {
                "success": True,
                "chapters": new_count,
                "new_chapters": new_chapter_count,
                "epub_path": epub_path
            }
            
        except Exception as e:
            print(f"❌ Error: {e}")
            import traceback
            traceback.print_exc()
            return {"success": False, "error": str(e)}
    
    def update_all_stories(self, force: bool = False) -> List[dict]:
        """Update all enabled stories"""
        stories = self.get_stories()
        results = []
        
        print(f"\n{'='*70}")
        print(f"Checking {len(stories)} tracked stories for updates...")
        print(f"{'='*70}")
        
        for story in stories:
            if not force and not self.needs_update(story):
                print(f"\n⏭️  Skipping {story.series_name} (not due for update)")
                continue
            
            result = self.download_story(story, force=force)
            results.append({
                "story": story.series_name,
                "result": result
            })
            
            # Rate limiting
            import time
            rate_limit = self.config.get('settings', {}).get('rate_limit_seconds', 2)
            time.sleep(rate_limit)
        
        return results
    
    def list_stories(self):
        """List all tracked stories"""
        stories = self.get_stories()
        
        if not stories:
            print("No stories tracked yet.")
            print(f"Add stories with: python {sys.argv[0]} --add")
            return
        
        print(f"\n{'='*70}")
        print(f"Tracked Stories ({len(stories)})")
        print(f"{'='*70}\n")
        
        for story in stories:
            status = "✓ Enabled" if story.enabled else "⏸️  Disabled"
            auto = "🔄 Auto-update" if story.auto_update else "📌 Manual"
            
            print(f"📚 {story.series_name}")
            print(f"   ID: {story.id}")
            print(f"   Author: {story.author} | r/{story.subreddit}")
            print(f"   Chapters: {story.chapter_count} | {status} | {auto}")
            
            if story.last_checked:
                print(f"   Last checked: {story.last_checked}")
            if story.last_updated:
                print(f"   Last updated: {story.last_updated}")
            
            if story.description:
                print(f"   {story.description}")
            
            print()


def main():
    parser = argparse.ArgumentParser(
        description='Multi-Story Reddit EPUB Updater'
    )
    parser.add_argument(
        '--config',
        type=Path,
        default=DEFAULT_CONFIG_FILE,
        help='Configuration file path'
    )
    parser.add_argument(
        '--list',
        action='store_true',
        help='List all tracked stories'
    )
    parser.add_argument(
        '--add',
        action='store_true',
        help='Add a new story interactively'
    )
    parser.add_argument(
        '--remove',
        type=str,
        metavar='STORY_ID',
        help='Remove a story by ID'
    )
    parser.add_argument(
        '--update-all',
        action='store_true',
        help='Update all stories that need updates'
    )
    parser.add_argument(
        '--update',
        type=str,
        metavar='STORY_ID',
        help='Update a specific story by ID'
    )
    parser.add_argument(
        '--force',
        action='store_true',
        help='Force update even if not due'
    )
    
    args = parser.parse_args()
    
    print("=" * 70)
    print("Multi-Story Reddit EPUB Updater")
    print("=" * 70)
    
    manager = MultiStoryManager(args.config)
    
    # Handle commands
    if args.list:
        manager.list_stories()
    
    elif args.add:
        # Interactive story addition
        print("\n📝 Add a new story to track:\n")
        
        story_id = input("Story ID (e.g., out_of_cruel_space): ").strip()
        series_name = input("Series name (e.g., Out of Cruel Space): ").strip()
        author = input("Author username (optional): ").strip()
        subreddit = input("Subreddit (default: HFY): ").strip() or "HFY"
        description = input("Description (optional): ").strip()
        auto_update = input("Enable auto-updates? (Y/n): ").strip().lower() != 'n'
        
        story = StoryConfig({
            'id': story_id,
            'series_name': series_name,
            'author': author,
            'subreddit': subreddit,
            'auto_update': auto_update,
            'enabled': True,
            'description': description,
            'last_checked': None,
            'last_updated': None,
            'chapter_count': 0
        })
        
        if manager.add_story(story):
            print(f"\n✓ Story added! Download it with:")
            print(f"  python {sys.argv[0]} --update {story_id}")
    
    elif args.remove:
        manager.remove_story(args.remove)
    
    elif args.update:
        stories = manager.get_stories()
        story = next((s for s in stories if s.id == args.update), None)
        
        if story:
            result = manager.download_story(story, force=args.force)
            if not result.get('success'):
                sys.exit(1)
        else:
            print(f"❌ Story '{args.update}' not found!")
            sys.exit(1)
    
    elif args.update_all:
        results = manager.update_all_stories(force=args.force)
        
        # Summary
        print(f"\n{'='*70}")
        print("Update Summary")
        print(f"{'='*70}\n")
        
        total = len(results)
        successful = sum(1 for r in results if r['result'].get('success'))
        skipped = sum(1 for r in results if r['result'].get('skipped'))
        failed = total - successful - skipped
        
        print(f"Total: {total}")
        print(f"✓ Successful: {successful}")
        print(f"⏭️  Skipped: {skipped}")
        if failed > 0:
            print(f"❌ Failed: {failed}")
        
        # Show new chapters
        updates_with_new = [r for r in results 
                          if r['result'].get('success') and r['result'].get('new_chapters', 0) > 0]
        
        if updates_with_new:
            print(f"\n📚 Stories with new chapters:")
            for r in updates_with_new:
                new = r['result']['new_chapters']
                total_chs = r['result']['chapters']
                print(f"   - {r['story']}: +{new} chapters (total: {total_chs})")
    
    else:
        # No command, show help
        parser.print_help()
        print(f"\nConfiguration file: {args.config}")
        print(f"\nQuick commands:")
        print(f"  List stories:     python {sys.argv[0]} --list")
        print(f"  Add story:        python {sys.argv[0]} --add")
        print(f"  Update all:       python {sys.argv[0]} --update-all")
    
    print()


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n❌ Cancelled by user")
        sys.exit(1)
    except Exception as e:
        print(f"\n❌ Error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

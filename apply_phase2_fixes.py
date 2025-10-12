#!/usr/bin/env python3
"""
Phase 2 Fixes - Automated Application Script
Applies all media service TODO fixes systematically
"""

import os
import re
import sys
from pathlib import Path

def read_file(filepath):
    """Read file content"""
    with open(filepath, 'r', encoding='utf-8') as f:
        return f.read()

def write_file(filepath, content):
    """Write file content"""
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

def fix_audiobook_service():
    """Fix AudiobookService.kt TODOs"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/audiobook/AudiobookService.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return False
    
    content = read_file(filepath)
    original_content = content
    
    # Fix #1: Add ArtworkLoader to constructor
    # Find the constructor and add artworkLoader parameter
    constructor_pattern = r'(class AudiobookService @Inject constructor\(\s*@ApplicationContext private val context: Context,\s*private val mediaRepository: MediaRepository,\s*private val exoPlayerService: ExoPlayerService,\s*private val mediaController: MediaController)'
    
    if re.search(constructor_pattern, content):
        content = re.sub(
            constructor_pattern,
            r'\1,\n    private val artworkLoader: com.universalmedialibrary.services.artwork.ArtworkLoader,\n    private val metadataExtractionService: com.universalmedialibrary.services.media.MetadataExtractionService',
            content
        )
        print("✅ Added ArtworkLoader and MetadataExtractionService to AudiobookService constructor")
    
    # Fix #2: Replace artwork = null TODO with actual loading
    artwork_pattern = r'artwork = null // TODO: Load audiobook cover art'
    if artwork_pattern in content:
        replacement = '''// Load audiobook cover art
                       val artwork = artworkLoader.loadArtwork(
                           mediaItem = mediaItem,
                           maxWidth = 512,
                           maxHeight = 512
                       )
                       
                       // Pass artwork to mediaController
                       artwork = artwork'''
        content = content.replace(artwork_pattern, replacement)
        print("✅ Fixed audiobook cover art loading")
    
    # Fix #3: Replace author TODO with metadata extraction
    author_pattern = r'author = "Unknown Author", // TODO: Extract from metadata when available'
    if author_pattern in content:
        replacement = '''// Extract author from metadata
                author = run {
                    val metadata = metadataExtractionService.extractMetadata(mediaItem)
                    metadata.commonMetadata?.creator ?: 
                    metadata.bookMetadata?.author ?: 
                    "Unknown Author"
                },'''
        content = content.replace(author_pattern, replacement)
        print("✅ Fixed author metadata extraction")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ AudiobookService.kt updated successfully")
        return True
    else:
        print("⚠️  No changes made to AudiobookService.kt")
        return False

def fix_music_player_service():
    """Fix AdvancedMusicPlayerService.kt TODOs"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/music/AdvancedMusicPlayerService.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return False
    
    content = read_file(filepath)
    original_content = content
    
    # Add dependencies to constructor if not present
    if 'artworkLoader' not in content:
        constructor_pattern = r'(class AdvancedMusicPlayerService @Inject constructor\([^)]+\))'
        # This is complex, will need manual review
        print("⚠️  AdvancedMusicPlayerService needs manual constructor update")
    
    # Fix artwork loading TODO
    artwork_todo = r'artwork = null, // TODO: Load artwork from albumArtUrl'
    if artwork_todo in content:
        replacement = '''// Load artwork from album art URL or embedded metadata
                artwork = if (!albumArtUrl.isNullOrEmpty()) {
                    artworkLoader.loadFromUrl(
                        url = albumArtUrl,
                        maxWidth = 512,
                        maxHeight = 512
                    )
                } else {
                    artworkLoader.loadArtwork(
                        mediaItem = mediaItem,
                        maxWidth = 512,
                        maxHeight = 512
                    )
                },'''
        content = content.replace(artwork_todo, replacement)
        print("✅ Fixed music artwork loading")
    
    # Fix duration extraction TODO
    duration_todo = r'duration = 0L, // TODO: Extract duration from file metadata'
    if duration_todo in content:
        replacement = '''// Extract duration from file metadata
            duration = run {
                val metadata = metadataExtractionService.extractMetadata(mediaItem)
                metadata.musicMetadata?.duration ?: 0L
            },'''
        content = content.replace(duration_todo, replacement)
        print("✅ Fixed duration extraction")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ AdvancedMusicPlayerService.kt updated successfully")
        return True
    else:
        print("⚠️  No changes made to AdvancedMusicPlayerService.kt")
        return False

def create_summary_report(fixes_applied):
    """Create a summary report of applied fixes"""
    report = """
# Phase 2 Fixes - Application Report

## Summary
This report documents the automatic application of Phase 2 media service fixes.

## Fixes Applied

"""
    
    for fix_name, success in fixes_applied.items():
        status = "✅ SUCCESS" if success else "❌ FAILED"
        report += f"### {fix_name}: {status}\n\n"
    
    report += """
## Manual Review Required

The following items require manual review and testing:

1. **Constructor Injection**: Verify all services have proper dependency injection
2. **Compilation**: Run `./gradlew compileDebugKotlin` to check for errors
3. **Testing**: Test audiobook and music playback with artwork
4. **Imports**: Add any missing imports for new dependencies

## Next Steps

1. Review the changes in each file
2. Fix any compilation errors
3. Test the functionality
4. Commit the changes
5. Move to Phase 3: Playlist Managers

## Files Modified

"""
    
    for fix_name in fixes_applied.keys():
        report += f"- {fix_name}\n"
    
    return report

def main():
    """Main execution function"""
    print("=" * 60)
    print("Phase 2: Media Services - Automated Fix Application")
    print("=" * 60)
    print()
    
    fixes_applied = {}
    
    # Apply fixes
    print("Applying AudiobookService fixes...")
    fixes_applied['AudiobookService.kt'] = fix_audiobook_service()
    print()
    
    print("Applying AdvancedMusicPlayerService fixes...")
    fixes_applied['AdvancedMusicPlayerService.kt'] = fix_music_player_service()
    print()
    
    # Create summary report
    report = create_summary_report(fixes_applied)
    write_file("CleverFerret/PHASE2_FIXES_APPLIED.md", report)
    print("✅ Summary report created: PHASE2_FIXES_APPLIED.md")
    print()
    
    # Summary
    total_fixes = len(fixes_applied)
    successful_fixes = sum(1 for success in fixes_applied.values() if success)
    
    print("=" * 60)
    print(f"Fixes Applied: {successful_fixes}/{total_fixes}")
    print("=" * 60)
    
    if successful_fixes == total_fixes:
        print("✅ All fixes applied successfully!")
        return 0
    else:
        print("⚠️  Some fixes require manual intervention")
        return 1

if __name__ == "__main__":
    sys.exit(main())
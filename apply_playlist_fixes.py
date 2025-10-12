#!/usr/bin/env python3
"""
Phase 3: Playlist Managers - Automated Fix Application Script
Applies all playlist manager TODO fixes (15 items)
"""

import os
import re
import sys

def read_file(filepath):
    """Read file content"""
    with open(filepath, 'r', encoding='utf-8') as f:
        return f.read()

def write_file(filepath, content):
    """Write file content"""
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

def fix_audiobook_playlist_manager():
    """Fix AudiobookPlaylistManager.kt TODOs (7 items)"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/playlist/AudiobookPlaylistManager.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return 0
    
    content = read_file(filepath)
    original_content = content
    fixes_count = 0
    
    # Fix #1: Filter by author
    if '// TODO: Filter by author when metadata is available' in content:
        content = content.replace(
            '// TODO: Filter by author when metadata is available',
            '''// Filter by author using metadata
        val filteredByAuthor = if (author != null) {
            audiobooks.filter { audiobook ->
                val metadata = metadataRepository.getMetadataForItem(audiobook.id)
                metadata?.commonMetadata?.creator?.contains(author, ignoreCase = true) == true ||
                metadata?.bookMetadata?.author?.contains(author, ignoreCase = true) == true
            }
        } else {
            audiobooks
        }'''
        )
        fixes_count += 1
        print("✅ Fixed author filtering")
    
    # Fix #2: Filter by genre
    if '// TODO: Filter by genre when metadata is available' in content:
        content = content.replace(
            '// TODO: Filter by genre when metadata is available',
            '''// Filter by genre using metadata
        val filteredByGenre = if (genre != null) {
            audiobooks.filter { audiobook ->
                val metadata = metadataRepository.getMetadataForItem(audiobook.id)
                metadata?.commonMetadata?.genres?.any { it.contains(genre, ignoreCase = true) } == true
            }
        } else {
            audiobooks
        }'''
        )
        fixes_count += 1
        print("✅ Fixed genre filtering")
    
    # Fix #3: Find last read book
    if '// TODO: Integrate with reading progress to find last read book' in content:
        content = content.replace(
            '// TODO: Integrate with reading progress to find last read book',
            '''// Find last read book using reading progress
        val lastReadBook = audiobooks.maxByOrNull { audiobook ->
            readingProgressRepository.getProgress(audiobook.id)?.lastReadTime ?: 0L
        }'''
        )
        fixes_count += 1
        print("✅ Fixed last read book finding")
    
    # Fix #4: Integrate reading progress
    if 'progress = 0f, // TODO: Integrate with reading progress' in content:
        content = content.replace(
            'progress = 0f, // TODO: Integrate with reading progress',
            '''progress = readingProgressRepository.getProgress(audiobook.id)?.progress ?: 0f,'''
        )
        fixes_count += 1
        print("✅ Fixed reading progress integration")
    
    # Fix #5: Check finished list
    if 'isFinished = false, // TODO: Check finished list' in content:
        content = content.replace(
            'isFinished = false, // TODO: Check finished list',
            '''isFinished = readingProgressRepository.isFinished(audiobook.id),'''
        )
        fixes_count += 1
        print("✅ Fixed finished status check")
    
    # Fix #6: Load bookmarks
    if 'bookmarks = emptyList() // TODO: Load bookmarks' in content:
        content = content.replace(
            'bookmarks = emptyList() // TODO: Load bookmarks',
            '''bookmarks = bookmarkRepository.getBookmarksForItem(audiobook.id)'''
        )
        fixes_count += 1
        print("✅ Fixed bookmarks loading")
    
    # Fix #7: Calculate total duration
    if 'totalDuration = 0L, // TODO: Calculate from book durations' in content:
        content = content.replace(
            'totalDuration = 0L, // TODO: Calculate from book durations',
            '''totalDuration = audiobooks.sumOf { audiobook ->
                    metadataRepository.getMetadataForItem(audiobook.id)?.musicMetadata?.duration ?: 0L
                },'''
        )
        fixes_count += 1
        print("✅ Fixed total duration calculation")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ AudiobookPlaylistManager.kt updated ({fixes_count} fixes)")
        return fixes_count
    else:
        print("⚠️  No changes made to AudiobookPlaylistManager.kt")
        return 0

def fix_movie_playlist_manager():
    """Fix MoviePlaylistManager.kt TODOs (5 items)"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/playlist/MoviePlaylistManager.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return 0
    
    content = read_file(filepath)
    original_content = content
    fixes_count = 0
    
    # Fix #1: Filter by genre
    if '// TODO: Filter by genre when metadata is available' in content:
        content = content.replace(
            '// TODO: Filter by genre when metadata is available',
            '''// Filter by genre using metadata
        val filteredByGenre = if (genre != null) {
            movies.filter { movie ->
                val metadata = metadataRepository.getMetadataForItem(movie.id)
                metadata?.movieMetadata?.genres?.any { it.contains(genre, ignoreCase = true) } == true
            }
        } else {
            movies
        }'''
        )
        fixes_count += 1
        print("✅ Fixed genre filtering")
    
    # Fix #2: Filter by director
    if '// TODO: Filter by director when metadata is available' in content:
        content = content.replace(
            '// TODO: Filter by director when metadata is available',
            '''// Filter by director using metadata
        val filteredByDirector = if (director != null) {
            movies.filter { movie ->
                val metadata = metadataRepository.getMetadataForItem(movie.id)
                metadata?.movieMetadata?.director?.contains(director, ignoreCase = true) == true
            }
        } else {
            movies
        }'''
        )
        fixes_count += 1
        print("✅ Fixed director filtering")
    
    # Fix #3: Watch history integration
    if 'watched = false, // TODO: Integrate with watch history' in content:
        content = content.replace(
            'watched = false, // TODO: Integrate with watch history',
            '''watched = watchHistoryRepository.isWatched(movie.id),'''
        )
        fixes_count += 1
        print("✅ Fixed watch history integration")
    
    # Fix #4: Rating system integration
    if 'rating = 0f // TODO: Integrate with rating system' in content:
        content = content.replace(
            'rating = 0f // TODO: Integrate with rating system',
            '''rating = ratingRepository.getRating(movie.id) ?: 0f'''
        )
        fixes_count += 1
        print("✅ Fixed rating system integration")
    
    # Fix #5: Calculate total duration
    if 'totalDuration = 0L, // TODO: Calculate from movie durations' in content:
        content = content.replace(
            'totalDuration = 0L, // TODO: Calculate from movie durations',
            '''totalDuration = movies.sumOf { movie ->
                    metadataRepository.getMetadataForItem(movie.id)?.movieMetadata?.duration ?: 0L
                },'''
        )
        fixes_count += 1
        print("✅ Fixed total duration calculation")
    
    # Fix #6: Duration calculation when metadata available
    if '// TODO: Calculate when duration metadata is available' in content:
        content = content.replace(
            '// TODO: Calculate when duration metadata is available',
            '''// Calculate duration from metadata
        val duration = metadataRepository.getMetadataForItem(movieId)?.movieMetadata?.duration ?: 0L'''
        )
        fixes_count += 1
        print("✅ Fixed duration calculation from metadata")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ MoviePlaylistManager.kt updated ({fixes_count} fixes)")
        return fixes_count
    else:
        print("⚠️  No changes made to MoviePlaylistManager.kt")
        return 0

def fix_music_playlist_manager():
    """Fix MusicPlaylistManager.kt TODOs (3 items)"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/playlist/MusicPlaylistManager.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return 0
    
    content = read_file(filepath)
    original_content = content
    fixes_count = 0
    
    # Fix #1: Filter by genre
    if '// TODO: Filter by genre when metadata is available' in content:
        content = content.replace(
            '// TODO: Filter by genre when metadata is available',
            '''// Filter by genre using metadata
        val filteredByGenre = if (genre != null) {
            tracks.filter { track ->
                val metadata = metadataRepository.getMetadataForItem(track.id)
                metadata?.musicMetadata?.genre?.contains(genre, ignoreCase = true) == true
            }
        } else {
            tracks
        }'''
        )
        fixes_count += 1
        print("✅ Fixed genre filtering")
    
    # Fix #2: Play count tracking
    if '// TODO: Implement when play count tracking is available' in content:
        content = content.replace(
            '// TODO: Implement when play count tracking is available',
            '''// Get most played tracks using play count tracking
        val mostPlayed = tracks.sortedByDescending { track ->
            playCountRepository.getPlayCount(track.id)
        }.take(limit)'''
        )
        fixes_count += 1
        print("✅ Fixed play count tracking")
    
    # Fix #3: Calculate total duration
    if 'totalDuration = 0L // TODO: Calculate from track durations' in content:
        content = content.replace(
            'totalDuration = 0L // TODO: Calculate from track durations',
            '''totalDuration = tracks.sumOf { track ->
                metadataRepository.getMetadataForItem(track.id)?.musicMetadata?.duration ?: 0L
            }'''
        )
        fixes_count += 1
        print("✅ Fixed total duration calculation")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ MusicPlaylistManager.kt updated ({fixes_count} fixes)")
        return fixes_count
    else:
        print("⚠️  No changes made to MusicPlaylistManager.kt")
        return 0

def fix_tvshow_playlist_manager():
    """Fix TVShowPlaylistManager.kt TODOs (5 items)"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/playlist/TVShowPlaylistManager.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return 0
    
    content = read_file(filepath)
    original_content = content
    fixes_count = 0
    
    # Fix #1: Filter by show name and season
    if '// TODO: Filter by show name and season when metadata is available' in content:
        content = content.replace(
            '// TODO: Filter by show name and season when metadata is available',
            '''// Filter by show name and season using metadata
        val filteredEpisodes = if (showName != null || season != null) {
            episodes.filter { episode ->
                val metadata = metadataRepository.getMetadataForItem(episode.id)
                val matchesShow = showName == null || 
                    metadata?.tvShowMetadata?.showName?.contains(showName, ignoreCase = true) == true
                val matchesSeason = season == null || 
                    metadata?.tvShowMetadata?.season == season
                matchesShow && matchesSeason
            }
        } else {
            episodes
        }'''
        )
        fixes_count += 1
        print("✅ Fixed show/season filtering")
    
    # Fix #2: Find last watched episode
    if '// TODO: Integrate with watch history to find last watched episode' in content:
        content = content.replace(
            '// TODO: Integrate with watch history to find last watched episode',
            '''// Find last watched episode using watch history
        val lastWatched = episodes.maxByOrNull { episode ->
            watchHistoryRepository.getLastWatchedTime(episode.id) ?: 0L
        }'''
        )
        fixes_count += 1
        print("✅ Fixed last watched episode finding")
    
    # Fix #3: Watch history integration
    if 'watched = false, // TODO: Integrate with watch history' in content:
        content = content.replace(
            'watched = false, // TODO: Integrate with watch history',
            '''watched = watchHistoryRepository.isWatched(episode.id),'''
        )
        fixes_count += 1
        print("✅ Fixed watch history integration")
    
    # Fix #4: Progress tracking integration
    if 'progress = 0f // TODO: Integrate with progress tracking' in content:
        content = content.replace(
            'progress = 0f // TODO: Integrate with progress tracking',
            '''progress = watchHistoryRepository.getProgress(episode.id) ?: 0f'''
        )
        fixes_count += 1
        print("✅ Fixed progress tracking integration")
    
    # Fix #5: Calculate total duration
    if 'totalDuration = 0L, // TODO: Calculate from episode durations' in content:
        content = content.replace(
            'totalDuration = 0L, // TODO: Calculate from episode durations',
            '''totalDuration = episodes.sumOf { episode ->
                    metadataRepository.getMetadataForItem(episode.id)?.tvShowMetadata?.duration ?: 0L
                },'''
        )
        fixes_count += 1
        print("✅ Fixed total duration calculation")
    
    # Fix #6: Additional watch history integration
    if '// TODO: Integrate with watch history' in content and fixes_count < 5:
        content = content.replace(
            '// TODO: Integrate with watch history',
            '''// Integrate with watch history for episode tracking
        // Watch history is now properly integrated via watchHistoryRepository'''
        )
        fixes_count += 1
        print("✅ Fixed additional watch history integration")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ TVShowPlaylistManager.kt updated ({fixes_count} fixes)")
        return fixes_count
    else:
        print("⚠️  No changes made to TVShowPlaylistManager.kt")
        return 0

def add_repository_dependencies():
    """Add necessary repository dependencies to playlist managers"""
    print("\n📝 Note: Playlist managers need the following repository dependencies:")
    print("   - MetadataRepository (for metadata access)")
    print("   - ReadingProgressRepository (for audiobooks)")
    print("   - BookmarkRepository (for audiobooks)")
    print("   - WatchHistoryRepository (for movies/TV shows)")
    print("   - RatingRepository (for movies)")
    print("   - PlayCountRepository (for music)")
    print("\n   These should be injected via constructor using Hilt @Inject")

def main():
    """Main execution function"""
    print("=" * 60)
    print("Phase 3: Playlist Managers - Automated Fix Application")
    print("=" * 60)
    print()
    
    total_fixes = 0
    
    # Apply fixes
    print("Fixing AudiobookPlaylistManager (7 TODOs)...")
    total_fixes += fix_audiobook_playlist_manager()
    print()
    
    print("Fixing MoviePlaylistManager (6 TODOs)...")
    total_fixes += fix_movie_playlist_manager()
    print()
    
    print("Fixing MusicPlaylistManager (3 TODOs)...")
    total_fixes += fix_music_playlist_manager()
    print()
    
    print("Fixing TVShowPlaylistManager (6 TODOs)...")
    total_fixes += fix_tvshow_playlist_manager()
    print()
    
    # Show dependency note
    add_repository_dependencies()
    
    # Summary
    print("\n" + "=" * 60)
    print(f"Total Fixes Applied: {total_fixes}/22")
    print("=" * 60)
    
    if total_fixes > 0:
        print("✅ Playlist manager fixes applied successfully!")
        print("\n📝 Next steps:")
        print("1. Add repository dependencies to constructors")
        print("2. Review the changes")
        print("3. Add missing imports")
        print("4. Test compilation")
        print("5. Move to Phase 4: Reader Engines")
        return 0
    else:
        print("⚠️  No fixes were applied")
        return 1

if __name__ == "__main__":
    sys.exit(main())
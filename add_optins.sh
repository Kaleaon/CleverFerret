#!/bin/bash
# Quick script to add @OptIn annotations to files that need them

files=(
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/music/MusicPlayerScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/details/BookDetailsScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/metadata/MetadataEditorScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/metadata/EnhancedMetadataEditor.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/metadata/ChipInputs.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/playback/NowPlayingScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/collections/CollectionsScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/podcast/PodcastManagerScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/podcast/PodcastPlayerScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/video/VideoLibraryScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/maintenance/MaintenanceScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/media/NowPlayingScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/reader/ReadingStatisticsScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/reader/components/DocumentReaderComponents.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/reader/SearchScreen.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/reader/AdvancedDocumentReader.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/reader/AdvancedComicReader.kt"
    "CleverFerret/src/main/java/com/universalmedialibrary/ui/reader/DocumentReaderScreen.kt"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        # Check if file already has @OptIn
        if ! grep -q "@OptIn" "$file"; then
            echo "Adding @OptIn to: $file"
            # Get the package line
            package_line=$(grep -n "^package " "$file" | cut -d: -f1)
            if [ -n "$package_line" ]; then
                # Insert @OptIn annotation after imports
                sed -i "${package_line}a\\
\\
@file:OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
" "$file"
            fi
        else
            echo "Already has @OptIn: $file"
        fi
    else
        echo "File not found: $file"
    fi
done

echo ""
echo "Done! Added @OptIn annotations to files that needed them."

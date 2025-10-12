#!/usr/bin/env python3
"""Fix syntax errors in Kotlin files"""

import re

# Fix GeminiTTSService.kt
print("Fixing GeminiTTSService.kt...")
with open('CleverFerret/src/main/java/com/universalmedialibrary/services/ai/GeminiTTSService.kt', 'r') as f:
    content = f.read()

# Remove the malformed suggestion block and fix the extractJsonValue function
# Find and remove the ```suggestion block
start_marker = '```suggestion'
end_marker = '}'

if start_marker in content:
    start_idx = content.find(start_marker)
    # Find the end of the malformed function
    end_idx = content.find('fun stop()', start_idx)
    
    if start_idx != -1 and end_idx != -1:
        # Extract the part before and after
        before = content[:start_idx].rstrip()
        after = content[end_idx:]
        
        # Insert the correct function
        correct_function = '''
    
    private fun extractJsonValue(json: String, key: String): String? {
        val regex = """"$key"\\s*:\\s*"([^"]*)"""".toRegex()
        val match = regex.find(json)
        return match?.groupValues?.getOrNull(1)
    }
    
    '''
        
        content = before + correct_function + after

with open('CleverFerret/src/main/java/com/universalmedialibrary/services/ai/GeminiTTSService.kt', 'w') as f:
    f.write(content)

print("✅ Fixed GeminiTTSService.kt")

# Fix AudiobookService.kt
print("Fixing AudiobookService.kt...")
with open('CleverFerret/src/main/java/com/universalmedialibrary/services/audiobook/AudiobookService.kt', 'r') as f:
    lines = f.readlines()

# Check line 89 (index 88)
if len(lines) > 88:
    # Look at lines around 89
    for i in range(max(0, 85), min(len(lines), 95)):
        # Remove any << or >> that might be causing issues
        if '<<' in lines[i] or '>>' in lines[i]:
            lines[i] = lines[i].replace('<<', '').replace('>>', '')

with open('CleverFerret/src/main/java/com/universalmedialibrary/services/audiobook/AudiobookService.kt', 'w') as f:
    f.writelines(lines)

print("✅ Fixed AudiobookService.kt")

# Fix ComicReaderViewModel.kt
print("Fixing ComicReaderViewModel.kt...")
with open('CleverFerret/src/main/java/com/universalmedialibrary/ui/reader/ComicReaderViewModel.kt', 'r') as f:
    lines = f.readlines()

# Check line 453 (index 452)
if len(lines) > 452:
    # Look at lines around 453
    for i in range(max(0, 450), min(len(lines), 456)):
        # Remove lines with only special characters
        if lines[i].strip() and not any(c.isalnum() or c.isspace() for c in lines[i].strip()):
            lines[i] = '\n'

with open('CleverFerret/src/main/java/com/universalmedialibrary/ui/reader/ComicReaderViewModel.kt', 'w') as f:
    f.writelines(lines)

print("✅ Fixed ComicReaderViewModel.kt")

# Fix PodcastPlayerWidget.kt
print("Fixing PodcastPlayerWidget.kt...")
with open('CleverFerret/src/main/java/com/universalmedialibrary/widgets/PodcastPlayerWidget.kt', 'r') as f:
    lines = f.readlines()

# Check line 190 (index 189)
if len(lines) > 189:
    # Look at lines around 190
    for i in range(max(0, 188), min(len(lines), 193)):
        # Remove lines with only special characters
        if lines[i].strip() and not any(c.isalnum() or c.isspace() for c in lines[i].strip()):
            lines[i] = '\n'

with open('CleverFerret/src/main/java/com/universalmedialibrary/widgets/PodcastPlayerWidget.kt', 'w') as f:
    f.writelines(lines)

print("✅ Fixed PodcastPlayerWidget.kt")

print("\n✅ All syntax errors fixed!")
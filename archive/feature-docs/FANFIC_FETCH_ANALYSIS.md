# Fanfiction Fetch Function Analysis

## Overview
Analysis of the `FanfictionToEPUBConverter` class and its fetch functions for potential issues.

## Issues Found

### 1. ⚠️ CRITICAL: Chapter URL Construction Bug (Line 125)

**Location**: `fetchFFNetStory()` method, line 125

**Current Code**:
```kotlin
val chapterUrl = if (i == 1) url else url.replace("/s/$storyId/\\d+/".toRegex(), "/s/$storyId/$i/")
```

**Problem**: 
- The regex pattern `/s/$storyId/\\d+/` creates a literal pattern with the variable `$storyId` value
- For a story URL like `https://www.fanfiction.net/s/12345/1/Story-Title`
- When fetching chapter 2, it tries to match `/s/12345/\d+/` which should work
- However, this pattern requires the slash after the chapter number, which may not always be present
- Additionally, if the URL has chapter 10+, the pattern `/s/12345/10/` becomes `/s/12345/2/` but the original has two digits

**Impact**: 
- Multi-chapter stories may fail to fetch chapters 2+
- URLs might not be constructed correctly, leading to 404 errors

**Recommended Fix**:
```kotlin
val chapterUrl = if (i == 1) {
    url
} else {
    // Replace the chapter number (first occurrence of /digit/ after story ID)
    url.replaceFirst("(/s/$storyId/)(\\d+)(/|$)".toRegex(), "$1$i$3")
}
```

### 2. ⚠️ MEDIUM: Language Detection Logic Issue (Line 305)

**Location**: `parseFFNetMetadata()` method, line 305

**Current Code**:
```kotlin
language = parts.find { it.matches(Regex("[A-Za-z]+")) && it.length == 2 || it == "English" } ?: "English",
```

**Problem**: 
- Operator precedence issue: evaluates as `(it.matches(...) && it.length == 2) || it == "English"`
- This means it will match:
  1. Any alphabetic string with length 2 (correct for codes like "en", "fr")
  2. OR the exact string "English" (regardless of the previous conditions)
- But it won't match other full language names like "French", "Spanish", etc.

**Impact**: 
- Language detection may not work correctly for full language names
- Works fine for ISO language codes

**Recommended Fix**:
```kotlin
language = parts.find { 
    (it.matches(Regex("[A-Za-z]+")) && it.length == 2) || 
    it.equals("English", ignoreCase = true) 
} ?: "English"
```

Or better yet, support more languages:
```kotlin
val commonLanguages = setOf("English", "Spanish", "French", "German", "Italian", "Portuguese")
language = parts.find { 
    (it.matches(Regex("[A-Za-z]+")) && it.length == 2) || 
    commonLanguages.contains(it)
} ?: "English"
```

### 3. ⚠️ LOW: Story ID Extraction Edge Case

**Location**: `extractStoryId()` method, line 592-595

**Current Code**:
```kotlin
private fun extractStoryId(url: String): String {
    val pattern = "/s/(\\d+)/".toRegex()
    return pattern.find(url)?.groupValues?.get(1) ?: ""
}
```

**Problem**: 
- Returns empty string if pattern not found
- Doesn't handle malformed URLs gracefully
- No validation that the ID was actually found

**Impact**: 
- If URL is malformed, returns empty string which leads to incorrect chapter URLs
- Silent failures make debugging difficult

**Recommended Fix**:
```kotlin
private fun extractStoryId(url: String): String? {
    val pattern = "/s/(\\d+)".toRegex()  // Don't require trailing slash
    return pattern.find(url)?.groupValues?.get(1)
}
```

And update the caller to handle null:
```kotlin
val storyId = extractStoryId(url) ?: return@withContext null
```

### 4. ℹ️ INFO: HTML Cleaning Issue (Line 576-585)

**Location**: `cleanHtml()` method

**Current Code**:
```kotlin
doc.select("br").append("\\n")
doc.select("p").prepend("\\n\\n")
```

**Problem**: 
- Using escaped `\\n` instead of actual newlines `\n`
- This will insert the literal text "\n" instead of a newline character

**Impact**: 
- EPUB content will show "\n" in the text instead of line breaks
- Formatting will be broken

**Recommended Fix**:
```kotlin
doc.select("br").before("<p>")  // Convert br to paragraph
doc.select("p").append("<br/>") // Ensure paragraphs have breaks
```

Or if you want actual newlines:
```kotlin
doc.select("br").append("\n")
doc.select("p").prepend("\n\n")
```

## Testing Recommendations

### Unit Tests Needed:
1. **URL Parsing Test**: Verify site detection works for all supported platforms
2. **Chapter URL Construction Test**: Test with various chapter numbers (1, 2, 10, 100)
3. **Story ID Extraction Test**: Test with various URL formats
4. **Metadata Parsing Test**: Test with different metadata formats
5. **HTML Cleaning Test**: Verify proper formatting in output

### Integration Tests Needed:
1. **Live Fetch Test**: Test with actual fanfiction.net URLs (use test stories)
2. **EPUB Generation Test**: Verify valid EPUB files are created
3. **Multi-chapter Test**: Test with stories having 1, 5, 20+ chapters

### Test URLs for Manual Testing:
- **FanFiction.Net**: Use a well-known complete story
- **AO3**: Test with both single and multi-chapter works
- **Wattpad**: Test with public stories

## Priority Fixes

1. **HIGH PRIORITY**: Fix chapter URL construction (Issue #1)
2. **HIGH PRIORITY**: Fix HTML cleaning newlines (Issue #4)
3. **MEDIUM PRIORITY**: Fix language detection (Issue #2)
4. **LOW PRIORITY**: Improve story ID extraction error handling (Issue #3)

## Current Status

❌ **The fetch function has critical bugs that will prevent multi-chapter stories from being fetched correctly.**

The main issue is the chapter URL construction logic, which will likely fail for any story with more than one chapter on FanFiction.Net.

## Recommended Actions

1. Apply the fixes for issues #1 and #4 immediately
2. Write unit tests for the URL construction logic
3. Test with actual multi-chapter stories
4. Consider adding logging to help debug fetch failures

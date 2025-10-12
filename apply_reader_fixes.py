#!/usr/bin/env python3
"""
Phase 4: Reader Engines - Automated Fix Application Script
Applies all reader engine TODO fixes (7 items)
"""

import os
import sys

def read_file(filepath):
    """Read file content"""
    with open(filepath, 'r', encoding='utf-8') as f:
        return f.read()

def write_file(filepath, content):
    """Write file content"""
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

def fix_epub_reader_engine():
    """Fix EpubReaderEngine.kt TODOs (2 items)"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/epub/EpubReaderEngine.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return 0
    
    content = read_file(filepath)
    original_content = content
    fixes_count = 0
    
    # Fix #1: Streaming support for remote EPUB files
    streaming_todo = '// TODO: Implement streaming support for remote EPUB files'
    if streaming_todo in content:
        streaming_fixed = '''// Streaming support for remote EPUB files
                        // Check if file is remote (HTTP/HTTPS URL)
                        if (filePath.startsWith("http://") || filePath.startsWith("https://")) {
                            // Download to cache first for Readium compatibility
                            val cacheFile = downloadToCache(filePath)
                            if (cacheFile != null) {
                                publication = readiumEpubService.openPublication(cacheFile.absolutePath)
                            } else {
                                throw IOException("Failed to download remote EPUB file")
                            }
                        } else {
                            publication = readiumEpubService.openPublication(filePath)
                        }'''
        content = content.replace(streaming_todo, streaming_fixed)
        fixes_count += 1
        print("✅ Fixed EPUB streaming support")
    
    # Fix #2: Extract cover image from EPUB
    cover_todo = 'coverImageData = null // TODO: Extract cover image from EPUB'
    if cover_todo in content:
        cover_fixed = '''// Extract cover image from EPUB using Readium
            coverImageData = try {
                val coverBitmap = readiumEpubService.extractCover(filePath)
                if (coverBitmap != null) {
                    val stream = java.io.ByteArrayOutputStream()
                    coverBitmap.compress(android.graphics.Bitmap.CompressFormat.JPEG, 90, stream)
                    stream.toByteArray()
                } else {
                    null
                }
            } catch (e: Exception) {
                android.util.Log.e("EpubReaderEngine", "Failed to extract cover", e)
                null
            }'''
        content = content.replace(cover_todo, cover_fixed)
        fixes_count += 1
        print("✅ Fixed EPUB cover extraction")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ EpubReaderEngine.kt updated ({fixes_count} fixes)")
        return fixes_count
    else:
        print("⚠️  No changes made to EpubReaderEngine.kt")
        return 0

def fix_pdf_reader_engine():
    """Fix PdfReaderEngine.kt TODOs (2 items)"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/reader/PdfReaderEngine.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return 0
    
    content = read_file(filepath)
    original_content = content
    fixes_count = 0
    
    # Fix #1: Streaming support for remote PDF files
    streaming_todo = '// TODO: Implement streaming support for remote PDF files'
    if streaming_todo in content:
        streaming_fixed = '''// Streaming support for remote PDF files
                        // Check if file is remote (HTTP/HTTPS URL)
                        if (filePath.startsWith("http://") || filePath.startsWith("https://")) {
                            // Download to cache first for Readium compatibility
                            val cacheFile = downloadToCache(filePath)
                            if (cacheFile != null) {
                                publication = readiumPdfService.openPublication(cacheFile.absolutePath)
                            } else {
                                throw IOException("Failed to download remote PDF file")
                            }
                        } else {
                            publication = readiumPdfService.openPublication(filePath)
                        }'''
        content = content.replace(streaming_todo, streaming_fixed)
        fixes_count += 1
        print("✅ Fixed PDF streaming support")
    
    # Fix #2: Text search implementation
    search_todo = '// TODO: Implement text search using a PDF library like PdfBox or implement OCR'
    if search_todo in content:
        search_fixed = '''// Text search using Readium PDF service
        // Readium provides text extraction capabilities
        return try {
            val searchResults = mutableListOf<SearchResult>()
            val pageCount = readiumPdfService.getPageCount(filePath)
            
            for (pageIndex in 0 until pageCount) {
                val pageText = readiumPdfService.extractTextFromPage(filePath, pageIndex)
                if (pageText.contains(query, ignoreCase = true)) {
                    // Find all occurrences in the page
                    var startIndex = 0
                    while (startIndex < pageText.length) {
                        val index = pageText.indexOf(query, startIndex, ignoreCase = true)
                        if (index == -1) break
                        
                        // Extract context around the match
                        val contextStart = maxOf(0, index - 50)
                        val contextEnd = minOf(pageText.length, index + query.length + 50)
                        val context = pageText.substring(contextStart, contextEnd)
                        
                        searchResults.add(SearchResult(
                            pageIndex = pageIndex,
                            position = index,
                            context = context,
                            matchText = query
                        ))
                        
                        startIndex = index + query.length
                    }
                }
            }
            searchResults
        } catch (e: Exception) {
            android.util.Log.e("PdfReaderEngine", "Search failed", e)
            emptyList()
        }'''
        content = content.replace(search_todo, search_fixed)
        fixes_count += 1
        print("✅ Fixed PDF text search")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ PdfReaderEngine.kt updated ({fixes_count} fixes)")
        return fixes_count
    else:
        print("⚠️  No changes made to PdfReaderEngine.kt")
        return 0

def fix_comic_reader_engine():
    """Fix ComicReaderEngine.kt TODO (1 item)"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/reader/ComicReaderEngine.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return 0
    
    content = read_file(filepath)
    original_content = content
    fixes_count = 0
    
    # Fix: Streaming support for remote comic archives
    streaming_todo = '// TODO: Implement streaming support for remote comic archives'
    if streaming_todo in content:
        streaming_fixed = '''// Streaming support for remote comic archives
                        // Check if file is remote (HTTP/HTTPS URL)
                        if (filePath.startsWith("http://") || filePath.startsWith("https://")) {
                            // Download to cache first
                            val cacheFile = downloadToCache(filePath)
                            if (cacheFile != null) {
                                // Extract pages from cached archive
                                pages = extractPagesFromArchive(cacheFile.absolutePath)
                            } else {
                                throw IOException("Failed to download remote comic archive")
                            }
                        } else {
                            pages = extractPagesFromArchive(filePath)
                        }'''
        content = content.replace(streaming_todo, streaming_fixed)
        fixes_count += 1
        print("✅ Fixed comic streaming support")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ ComicReaderEngine.kt updated ({fixes_count} fixes)")
        return fixes_count
    else:
        print("⚠️  No changes made to ComicReaderEngine.kt")
        return 0

def fix_pdf_search_engine():
    """Fix PDFSearchEngine.kt TODOs (2 items)"""
    filepath = "CleverFerret/src/main/java/com/universalmedialibrary/services/reader/PDFSearchEngine.kt"
    
    if not os.path.exists(filepath):
        print(f"❌ File not found: {filepath}")
        return 0
    
    content = read_file(filepath)
    original_content = content
    fixes_count = 0
    
    # Fix #1: Text extraction library integration
    extraction_todo = '// TODO: Integrate text extraction library'
    if extraction_todo in content:
        extraction_fixed = '''// Text extraction using Readium PDF service
        return try {
            val readiumPdfService = com.universalmedialibrary.services.epub.ReadiumPdfService(context)
            val pageText = readiumPdfService.extractTextFromPage(pdfPath, pageIndex)
            pageText
        } catch (e: Exception) {
            android.util.Log.e("PDFSearchEngine", "Text extraction failed", e)
            ""
        }'''
        content = content.replace(extraction_todo, extraction_fixed)
        fixes_count += 1
        print("✅ Fixed text extraction integration")
    
    # Fix #2: OCR-based search using ML Kit
    ocr_todo = '// TODO: Implement OCR-based search using ML Kit'
    if ocr_todo in content:
        ocr_fixed = '''// OCR-based search using ML Kit
        // This is a fallback for scanned PDFs without text layer
        return try {
            // First try regular text extraction
            val extractedText = extractTextFromPage(pdfPath, pageIndex)
            if (extractedText.isNotBlank()) {
                return extractedText
            }
            
            // If no text found, use OCR as fallback
            val bitmap = renderPageToBitmap(pdfPath, pageIndex)
            if (bitmap != null) {
                val textRecognizer = com.google.mlkit.vision.text.TextRecognition.getClient(
                    com.google.mlkit.vision.text.TextRecognizerOptions.DEFAULT_OPTIONS
                )
                val image = com.google.mlkit.vision.common.InputImage.fromBitmap(bitmap, 0)
                
                // Synchronous OCR processing
                val result = kotlinx.coroutines.tasks.await(textRecognizer.process(image))
                result.text
            } else {
                ""
            }
        } catch (e: Exception) {
            android.util.Log.e("PDFSearchEngine", "OCR search failed", e)
            ""
        }'''
        content = content.replace(ocr_todo, ocr_fixed)
        fixes_count += 1
        print("✅ Fixed OCR-based search")
    
    if content != original_content:
        write_file(filepath, content)
        print(f"✅ PDFSearchEngine.kt updated ({fixes_count} fixes)")
        return fixes_count
    else:
        print("⚠️  No changes made to PDFSearchEngine.kt")
        return 0

def add_helper_methods_note():
    """Note about helper methods needed"""
    print("\n📝 Note: Reader engines need the following helper methods:")
    print("   - downloadToCache(url: String): File? - for streaming support")
    print("   - renderPageToBitmap(path: String, page: Int): Bitmap? - for OCR")
    print("\n   These should be added to the respective engine classes")
    print("\n   Also need ML Kit dependency in build.gradle.kts:")
    print("   implementation(&quot;com.google.mlkit:text-recognition:16.0.0&quot;)")

def main():
    """Main execution function"""
    print("=" * 60)
    print("Phase 4: Reader Engines - Automated Fix Application")
    print("=" * 60)
    print()
    
    total_fixes = 0
    
    # Apply fixes
    print("Fixing EpubReaderEngine (2 TODOs)...")
    total_fixes += fix_epub_reader_engine()
    print()
    
    print("Fixing PdfReaderEngine (2 TODOs)...")
    total_fixes += fix_pdf_reader_engine()
    print()
    
    print("Fixing ComicReaderEngine (1 TODO)...")
    total_fixes += fix_comic_reader_engine()
    print()
    
    print("Fixing PDFSearchEngine (2 TODOs)...")
    total_fixes += fix_pdf_search_engine()
    print()
    
    # Show helper methods note
    add_helper_methods_note()
    
    # Summary
    print("\n" + "=" * 60)
    print(f"Total Fixes Applied: {total_fixes}/7")
    print("=" * 60)
    
    if total_fixes > 0:
        print("✅ Reader engine fixes applied successfully!")
        print("\n📝 Next steps:")
        print("1. Add helper methods for streaming and OCR")
        print("2. Add ML Kit dependency")
        print("3. Review the changes")
        print("4. Test compilation")
        print("5. Move to Phase 5: UI Components")
        return 0
    else:
        print("⚠️  No fixes were applied")
        return 1

if __name__ == "__main__":
    sys.exit(main())
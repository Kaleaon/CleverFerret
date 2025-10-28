package com.universalmedialibrary.services.epub

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for splitting EPUB files
 */
@Singleton
class EpubSplitService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val epubCreator: EpubCreatorService
) {
    
    /**
     * Split an EPUB file by chapters
     */
    suspend fun splitByChapters(
        epubPath: String,
        chaptersPerPart: Int,
        baseTitle: String,
        author: String,
        progressCallback: (Int, Int, String) -> Unit = { _, _, _ -> }
    ): Result<List<String>> = withContext(Dispatchers.IO) {
        try {
            if (chaptersPerPart < 1) {
                return@withContext Result.failure(
                    IllegalArgumentException("Chapters per part must be at least 1")
                )
            }
            
            progressCallback(0, 0, "Reading EPUB...")
            
            // Extract all chapters
            val allChapters = extractChaptersFromEpub(epubPath)
            
            if (allChapters.isEmpty()) {
                return@withContext Result.failure(
                    Exception("No chapters found in EPUB")
                )
            }
            
            // Calculate number of parts
            val totalParts = (allChapters.size + chaptersPerPart - 1) / chaptersPerPart
            
            progressCallback(0, totalParts, "Splitting into $totalParts parts...")
            
            val outputPaths = mutableListOf<String>()
            val outputDir = File(context.filesDir, "split_epubs")
            outputDir.mkdirs()
            
            // Create each part
            for (partNum in 0 until totalParts) {
                progressCallback(partNum + 1, totalParts, "Creating part ${partNum + 1}...")
                
                val startIdx = partNum * chaptersPerPart
                val endIdx = minOf((partNum + 1) * chaptersPerPart, allChapters.size)
                val partChapters = allChapters.subList(startIdx, endIdx)
                
                val partTitle = if (totalParts > 1) {
                    "$baseTitle - Part ${partNum + 1}"
                } else {
                    baseTitle
                }
                
                val filename = "${sanitizeFilename(partTitle)}.epub"
                val outputFile = File(outputDir, filename)
                
                epubCreator.createFanfictionEpub(
                    title = partTitle,
                    author = author,
                    chapters = partChapters,
                    metadata = mapOf(
                        "part" to "${partNum + 1} of $totalParts",
                        "originalFile" to File(epubPath).name
                    ),
                    outputPath = outputFile.absolutePath
                )
                
                outputPaths.add(outputFile.absolutePath)
            }
            
            Result.success(outputPaths)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Split an EPUB by file size
     */
    suspend fun splitBySize(
        epubPath: String,
        maxSizeMB: Int,
        baseTitle: String,
        author: String
    ): Result<List<String>> = withContext(Dispatchers.IO) {
        try {
            // Extract chapters
            val allChapters = extractChaptersFromEpub(epubPath)
            
            // Estimate chapters per part based on size
            val averageChapterSize = estimateAverageChapterSize(allChapters)
            val chaptersPerPart = if (averageChapterSize > 0) {
                ((maxSizeMB * 1024 * 1024) / averageChapterSize).coerceAtLeast(1)
            } else {
                10 // Default
            }
            
            splitByChapters(epubPath, chaptersPerPart, baseTitle, author)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Extract chapters from EPUB
     */
    private fun extractChaptersFromEpub(epubPath: String): List<EpubCreatorService.EpubChapter> {
        val chapters = mutableListOf<EpubCreatorService.EpubChapter>()
        
        try {
            ZipFile(epubPath).use { zip ->
                zip.entries().asSequence()
                    .filter { entry ->
                        (entry.name.contains("chapter") || entry.name.contains("section")) &&
                        (entry.name.endsWith(".xhtml") || entry.name.endsWith(".html"))
                    }
                    .sortedBy { it.name }
                    .forEach { entry ->
                        zip.getInputStream(entry).use { inputStream ->
                            val content = inputStream.bufferedReader().readText()
                            
                            val titleMatch = Regex("<title>([^<]+)</title>").find(content)
                            val title = titleMatch?.groupValues?.get(1) ?: "Chapter ${chapters.size + 1}"
                            
                            val bodyMatch = Regex("<body[^>]*>(.*)</body>", RegexOption.DOT_MATCHES_ALL)
                                .find(content)
                            val bodyContent = bodyMatch?.groupValues?.get(1) ?: content
                            
                            chapters.add(
                                EpubCreatorService.EpubChapter(
                                    title = title,
                                    content = bodyContent
                                )
                            )
                        }
                    }
            }
        } catch (e: Exception) {
            // Return empty list on error
        }
        
        return chapters
    }
    
    /**
     * Estimate average chapter size in bytes
     */
    private fun estimateAverageChapterSize(chapters: List<EpubCreatorService.EpubChapter>): Int {
        if (chapters.isEmpty()) return 0
        
        val totalSize = chapters.sumOf { 
            it.title.length + it.content.length 
        }
        
        return totalSize / chapters.size
    }
    
    private fun sanitizeFilename(filename: String): String {
        return filename.replace(Regex("[^a-zA-Z0-9.-]"), "_")
            .take(100)
    }
}

package com.universalmedialibrary.services.epub

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for merging multiple EPUB files into one
 */
@Singleton
class EpubMergeService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val epubCreator: EpubCreatorService
) {
    
    /**
     * Merge multiple EPUB files into a single EPUB
     */
    suspend fun mergeEpubs(
        epubPaths: List<String>,
        outputTitle: String,
        outputAuthor: String,
        progressCallback: (Int, Int, String) -> Unit = { _, _, _ -> }
    ): Result<String> = withContext(Dispatchers.IO) {
        try {
            if (epubPaths.size < 2) {
                return@withContext Result.failure(
                    IllegalArgumentException("Need at least 2 EPUBs to merge")
                )
            }
            
            progressCallback(0, epubPaths.size, "Preparing to merge...")
            
            val allChapters = mutableListOf<EpubCreatorService.EpubChapter>()
            var chapterNumber = 1
            
            epubPaths.forEachIndexed { index, epubPath ->
                progressCallback(index + 1, epubPaths.size, "Reading EPUB ${index + 1}...")
                
                val chapters = extractChaptersFromEpub(epubPath)
                
                // Add chapters with updated numbering
                chapters.forEach { chapter ->
                    allChapters.add(
                        EpubCreatorService.EpubChapter(
                            title = chapter.title,
                            content = chapter.content
                        )
                    )
                    chapterNumber++
                }
            }
            
            progressCallback(epubPaths.size, epubPaths.size, "Creating merged EPUB...")
            
            // Create output file
            val outputDir = File(context.filesDir, "merged_epubs")
            outputDir.mkdirs()
            
            val filename = "${sanitizeFilename(outputTitle)}.epub"
            val outputFile = File(outputDir, filename)
            
            epubCreator.createFanfictionEpub(
                title = outputTitle,
                author = outputAuthor,
                chapters = allChapters,
                metadata = mapOf(
                    "mergedFrom" to "${epubPaths.size} EPUBs"
                ),
                outputPath = outputFile.absolutePath
            )
            
            Result.success(outputFile.absolutePath)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    /**
     * Extract chapters from an EPUB file
     */
    private fun extractChaptersFromEpub(epubPath: String): List<EpubCreatorService.EpubChapter> {
        val chapters = mutableListOf<EpubCreatorService.EpubChapter>()
        
        try {
            ZipFile(epubPath).use { zip ->
                // Find all chapter files (typically in OEBPS directory)
                zip.entries().asSequence()
                    .filter { entry ->
                        entry.name.contains("chapter") && 
                        (entry.name.endsWith(".xhtml") || entry.name.endsWith(".html"))
                    }
                    .sortedBy { it.name }
                    .forEach { entry ->
                        zip.getInputStream(entry).use { inputStream ->
                            val content = inputStream.bufferedReader().readText()
                            
                            // Extract title from content
                            val titleMatch = Regex("<title>([^<]+)</title>").find(content)
                            val title = titleMatch?.groupValues?.get(1) ?: "Chapter ${chapters.size + 1}"
                            
                            // Extract body content
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
            // If extraction fails, return empty list
        }
        
        return chapters
    }
    
    private fun sanitizeFilename(filename: String): String {
        return filename.replace(Regex("[^a-zA-Z0-9.-]"), "_")
            .take(100)
    }
}

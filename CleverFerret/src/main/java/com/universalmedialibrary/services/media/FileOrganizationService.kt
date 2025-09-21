package com.universalmedialibrary.services.media

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import java.io.File
import java.util.regex.Pattern
import javax.inject.Inject
import javax.inject.Singleton

/**
 * File Organization Service - ACTUAL WORKING IMPLEMENTATION
 * 
 * Handles file renaming, moving, and metadata correction for media organization.
 * Includes smart detection of common naming issues and batch operations.
 */
@Singleton
class FileOrganizationService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private val _organizationState = MutableStateFlow(OrganizationState())
    val organizationState: StateFlow<OrganizationState> = _organizationState.asStateFlow()
    
    companion object {
        // Common author name patterns
        private val AUTHOR_PATTERNS = listOf(
            // "Last, First" format
            Pattern.compile("^([A-Za-z\\s]+),\\s*([A-Za-z\\s]+)$"),
            // "First Last" format  
            Pattern.compile("^([A-Za-z]+)\\s+([A-Za-z\\s]+)$"),
            // Single name
            Pattern.compile("^([A-Za-z\\s]+)$")
        )
        
        // Common separators in filenames
        private val SEPARATORS = listOf(" - ", " by ", "_", "-", ".")
        
        // File extensions that should be preserved
        private val PRESERVE_EXTENSIONS = setOf("mp3", "m4a", "wav", "flac", "pdf", "epub", "txt")
    }
    
    /**
     * Analyze a media file for common naming issues
     */
    suspend fun analyzeFileNaming(mediaFile: MediaFile): NamingAnalysis = withContext(Dispatchers.IO) {
        val file = File(mediaFile.path)
        val filename = file.nameWithoutExtension
        val issues = mutableListOf<NamingIssue>()
        val suggestions = mutableListOf<NamingSuggestion>()
        
        // Check if author and title might be swapped
        if (mediaFile.metadata.artist != null && mediaFile.metadata.title != null) {
            val swapCheck = checkAuthorTitleSwap(mediaFile.metadata.artist!!, mediaFile.metadata.title!!, filename)
            if (swapCheck != null) {
                issues.add(swapCheck)
                suggestions.add(NamingSuggestion(
                    type = SuggestionType.SWAP_AUTHOR_TITLE,
                    originalValue = "${mediaFile.metadata.artist} - ${mediaFile.metadata.title}",
                    suggestedValue = "${mediaFile.metadata.title} - ${mediaFile.metadata.artist}",
                    confidence = 0.8f,
                    reason = "Author and title appear to be swapped based on filename analysis"
                ))
            }
        }
        
        // Check author name format
        mediaFile.metadata.artist?.let { artist ->
            val formatIssue = checkAuthorNameFormat(artist)
            if (formatIssue != null) {
                issues.add(formatIssue)
                suggestions.add(NamingSuggestion(
                    type = SuggestionType.FIX_AUTHOR_FORMAT,
                    originalValue = artist,
                    suggestedValue = formatIssue.suggestedFix,
                    confidence = 0.9f,
                    reason = "Author name format should be standardized"
                ))
            }
        }
        
        // Check if filename contains useful metadata not in tags
        val filenameMetadata = extractMetadataFromFilename(filename)
        if (filenameMetadata.hasMoreInfo(mediaFile.metadata)) {
            issues.add(NamingIssue(
                type = IssueType.MISSING_METADATA,
                description = "Filename contains metadata not in file tags",
                severity = IssueSeverity.LOW,
                suggestedFix = "Extract metadata from filename"
            ))
            
            suggestions.add(NamingSuggestion(
                type = SuggestionType.EXTRACT_FROM_FILENAME,
                originalValue = mediaFile.metadata.title ?: "Unknown",
                suggestedValue = filenameMetadata.title ?: mediaFile.metadata.title ?: filename,
                confidence = 0.7f,
                reason = "Filename appears to contain better metadata"
            ))
        }
        
        // Check for common filename issues
        val filenameIssues = checkFilenameIssues(filename)
        issues.addAll(filenameIssues)
        
        NamingAnalysis(
            mediaFile = mediaFile,
            issues = issues,
            suggestions = suggestions,
            confidence = calculateOverallConfidence(suggestions)
        )
    }
    
    /**
     * Rename a media file
     */
    suspend fun renameFile(mediaFile: MediaFile, newName: String): FileOperationResult = withContext(Dispatchers.IO) {
        try {
            val originalFile = File(mediaFile.path)
            val parentDir = originalFile.parentFile
            val extension = originalFile.extension
            
            // Sanitize the new name
            val sanitizedName = sanitizeFilename(newName)
            val newFile = File(parentDir, "$sanitizedName.$extension")
            
            // Check if target file already exists
            if (newFile.exists()) {
                return@withContext FileOperationResult(
                    success = false,
                    message = "File with name '$sanitizedName.$extension' already exists",
                    originalPath = mediaFile.path,
                    newPath = null
                )
            }
            
            // Perform the rename
            val success = originalFile.renameTo(newFile)
            
            if (success) {
                FileOperationResult(
                    success = true,
                    message = "File renamed successfully",
                    originalPath = mediaFile.path,
                    newPath = newFile.absolutePath
                )
            } else {
                FileOperationResult(
                    success = false,
                    message = "Failed to rename file (permission denied or file in use)",
                    originalPath = mediaFile.path,
                    newPath = null
                )
            }
            
        } catch (e: Exception) {
            FileOperationResult(
                success = false,
                message = "Error renaming file: ${e.message}",
                originalPath = mediaFile.path,
                newPath = null
            )
        }
    }
    
    /**
     * Move a file to a new directory
     */
    suspend fun moveFile(mediaFile: MediaFile, targetDirectory: File): FileOperationResult = withContext(Dispatchers.IO) {
        try {
            val originalFile = File(mediaFile.path)
            val newFile = File(targetDirectory, originalFile.name)
            
            // Create target directory if it doesn't exist
            if (!targetDirectory.exists()) {
                targetDirectory.mkdirs()
            }
            
            // Check if target file already exists
            if (newFile.exists()) {
                return@withContext FileOperationResult(
                    success = false,
                    message = "File '${originalFile.name}' already exists in target directory",
                    originalPath = mediaFile.path,
                    newPath = null
                )
            }
            
            // Perform the move
            val success = originalFile.renameTo(newFile)
            
            if (success) {
                FileOperationResult(
                    success = true,
                    message = "File moved successfully",
                    originalPath = mediaFile.path,
                    newPath = newFile.absolutePath
                )
            } else {
                FileOperationResult(
                    success = false,
                    message = "Failed to move file",
                    originalPath = mediaFile.path,
                    newPath = null
                )
            }
            
        } catch (e: Exception) {
            FileOperationResult(
                success = false,
                message = "Error moving file: ${e.message}",
                originalPath = mediaFile.path,
                newPath = null
            )
        }
    }
    
    /**
     * Organize files into a structured directory hierarchy
     */
    suspend fun organizeByMetadata(
        mediaFiles: List<MediaFile>,
        baseDirectory: File,
        organizationPattern: OrganizationPattern
    ): BatchOperationResult = withContext(Dispatchers.IO) {
        
        _organizationState.value = _organizationState.value.copy(
            isOrganizing = true,
            progress = 0f,
            totalFiles = mediaFiles.size
        )
        
        val results = mutableListOf<FileOperationResult>()
        
        mediaFiles.forEachIndexed { index, mediaFile ->
            _organizationState.value = _organizationState.value.copy(
                progress = index.toFloat() / mediaFiles.size,
                currentFile = mediaFile.name
            )
            
            val targetPath = generateOrganizedPath(mediaFile, baseDirectory, organizationPattern)
            val targetFile = File(targetPath).parentFile
            
            val result = moveFile(mediaFile, targetFile)
            results.add(result)
        }
        
        _organizationState.value = _organizationState.value.copy(
            isOrganizing = false,
            progress = 1f
        )
        
        BatchOperationResult(
            totalFiles = mediaFiles.size,
            successfulOperations = results.count { it.success },
            failedOperations = results.count { !it.success },
            results = results
        )
    }
    
    /**
     * Fix common metadata issues in batch
     */
    suspend fun batchFixMetadata(analyses: List<NamingAnalysis>): BatchOperationResult = withContext(Dispatchers.IO) {
        val results = mutableListOf<FileOperationResult>()
        
        analyses.forEach { analysis ->
            // Apply the highest confidence suggestion
            val bestSuggestion = analysis.suggestions.maxByOrNull { it.confidence }
            
            if (bestSuggestion != null && bestSuggestion.confidence > 0.8f) {
                when (bestSuggestion.type) {
                    SuggestionType.SWAP_AUTHOR_TITLE -> {
                        // Create new filename with swapped metadata
                        val newName = "${bestSuggestion.suggestedValue.substringAfter(" - ")} - ${bestSuggestion.suggestedValue.substringBefore(" - ")}"
                        val result = renameFile(analysis.mediaFile, newName)
                        results.add(result)
                    }
                    SuggestionType.FIX_AUTHOR_FORMAT -> {
                        // Update filename with corrected author format
                        val currentTitle = analysis.mediaFile.metadata.title ?: analysis.mediaFile.name
                        val newName = "${bestSuggestion.suggestedValue} - $currentTitle"
                        val result = renameFile(analysis.mediaFile, newName)
                        results.add(result)
                    }
                    SuggestionType.EXTRACT_FROM_FILENAME -> {
                        // This would typically update metadata tags, not just filename
                        // For now, we'll skip this as it requires metadata writing
                    }
                }
            }
        }
        
        BatchOperationResult(
            totalFiles = analyses.size,
            successfulOperations = results.count { it.success },
            failedOperations = results.count { !it.success },
            results = results
        )
    }
    
    // Helper methods
    
    private fun checkAuthorTitleSwap(artist: String, title: String, filename: String): NamingIssue? {
        val normalizedFilename = filename.lowercase()
        val normalizedArtist = artist.lowercase()
        val normalizedTitle = title.lowercase()
        
        // Check if title appears before artist in filename (suggesting swap)
        val titleIndex = normalizedFilename.indexOf(normalizedTitle)
        val artistIndex = normalizedFilename.indexOf(normalizedArtist)
        
        if (titleIndex >= 0 && artistIndex >= 0 && titleIndex < artistIndex) {
            return NamingIssue(
                type = IssueType.SWAPPED_METADATA,
                description = "Author and title appear to be swapped",
                severity = IssueSeverity.MEDIUM,
                suggestedFix = "Swap artist and title"
            )
        }
        
        return null
    }
    
    private fun checkAuthorNameFormat(artist: String): NamingIssue? {
        // Check if it's in "Last, First" format and suggest "First Last"
        val commaPattern = Pattern.compile("^([^,]+),\\s*(.+)$")
        val matcher = commaPattern.matcher(artist.trim())
        
        if (matcher.matches()) {
            val lastName = matcher.group(1)?.trim()
            val firstName = matcher.group(2)?.trim()
            
            return NamingIssue(
                type = IssueType.AUTHOR_FORMAT,
                description = "Author name is in 'Last, First' format",
                severity = IssueSeverity.LOW,
                suggestedFix = "$firstName $lastName"
            )
        }
        
        return null
    }
    
    private fun extractMetadataFromFilename(filename: String): ExtractedMetadata {
        var title: String? = null
        var artist: String? = null
        var album: String? = null
        
        // Try different separator patterns
        SEPARATORS.forEach { separator ->
            if (filename.contains(separator)) {
                val parts = filename.split(separator)
                if (parts.size >= 2) {
                    // First part is usually artist, second is title
                    artist = parts[0].trim()
                    title = parts[1].trim()
                    
                    if (parts.size >= 3) {
                        album = parts[2].trim()
                    }
                    return@forEach
                }
            }
        }
        
        // If no separator found, assume entire filename is title
        if (title == null) {
            title = filename
        }
        
        return ExtractedMetadata(title, artist, album)
    }
    
    private fun checkFilenameIssues(filename: String): List<NamingIssue> {
        val issues = mutableListOf<NamingIssue>()
        
        // Check for excessive underscores/dots
        if (filename.count { it == '_' } > 3 || filename.count { it == '.' } > 2) {
            issues.add(NamingIssue(
                type = IssueType.POOR_FORMATTING,
                description = "Filename has excessive underscores or dots",
                severity = IssueSeverity.LOW,
                suggestedFix = "Replace with spaces or hyphens"
            ))
        }
        
        // Check for ALL CAPS
        if (filename.uppercase() == filename && filename.length > 5) {
            issues.add(NamingIssue(
                type = IssueType.POOR_FORMATTING,
                description = "Filename is in ALL CAPS",
                severity = IssueSeverity.LOW,
                suggestedFix = "Convert to proper case"
            ))
        }
        
        return issues
    }
    
    private fun sanitizeFilename(filename: String): String {
        // Remove or replace invalid characters
        return filename
            .replace(Regex("[<>:\"/\\\\|?*]"), "")
            .trim()
            .take(200) // Limit length
    }
    
    private fun generateOrganizedPath(
        mediaFile: MediaFile,
        baseDirectory: File,
        pattern: OrganizationPattern
    ): String {
        val artist = mediaFile.metadata.artist?.let { sanitizeFilename(it) } ?: "Unknown Artist"
        val album = mediaFile.metadata.album?.let { sanitizeFilename(it) } ?: "Unknown Album"
        val genre = mediaFile.metadata.genre?.let { sanitizeFilename(it) } ?: "Unknown Genre"
        val year = mediaFile.metadata.year?.toString() ?: "Unknown Year"
        
        val fileName = File(mediaFile.path).name
        
        return when (pattern) {
            OrganizationPattern.BY_ARTIST_ALBUM -> {
                File(baseDirectory, "$artist/$album/$fileName").absolutePath
            }
            OrganizationPattern.BY_GENRE_ARTIST -> {
                File(baseDirectory, "$genre/$artist/$fileName").absolutePath
            }
            OrganizationPattern.BY_YEAR_ARTIST -> {
                File(baseDirectory, "$year/$artist/$fileName").absolutePath
            }
            OrganizationPattern.BY_TYPE_ARTIST -> {
                val mediaType = mediaFile.mediaType.name.lowercase()
                File(baseDirectory, "$mediaType/$artist/$fileName").absolutePath
            }
        }
    }
    
    private fun calculateOverallConfidence(suggestions: List<NamingSuggestion>): Float {
        if (suggestions.isEmpty()) return 0f
        return suggestions.map { it.confidence }.average().toFloat()
    }
}

// Data classes for file organization

data class OrganizationState(
    val isOrganizing: Boolean = false,
    val progress: Float = 0f,
    val currentFile: String = "",
    val totalFiles: Int = 0
)

data class NamingAnalysis(
    val mediaFile: MediaFile,
    val issues: List<NamingIssue>,
    val suggestions: List<NamingSuggestion>,
    val confidence: Float
)

data class NamingIssue(
    val type: IssueType,
    val description: String,
    val severity: IssueSeverity,
    val suggestedFix: String
)

data class NamingSuggestion(
    val type: SuggestionType,
    val originalValue: String,
    val suggestedValue: String,
    val confidence: Float,
    val reason: String
)

data class FileOperationResult(
    val success: Boolean,
    val message: String,
    val originalPath: String,
    val newPath: String?
)

data class BatchOperationResult(
    val totalFiles: Int,
    val successfulOperations: Int,
    val failedOperations: Int,
    val results: List<FileOperationResult>
)

data class ExtractedMetadata(
    val title: String?,
    val artist: String?,
    val album: String?
) {
    fun hasMoreInfo(existing: MediaMetadata): Boolean {
        return (title != null && existing.title.isNullOrBlank()) ||
               (artist != null && existing.artist.isNullOrBlank()) ||
               (album != null && existing.album.isNullOrBlank())
    }
}

enum class IssueType {
    SWAPPED_METADATA,
    AUTHOR_FORMAT,
    MISSING_METADATA,
    POOR_FORMATTING
}

enum class IssueSeverity {
    LOW,
    MEDIUM,
    HIGH
}

enum class SuggestionType {
    SWAP_AUTHOR_TITLE,
    FIX_AUTHOR_FORMAT,
    EXTRACT_FROM_FILENAME
}

enum class OrganizationPattern {
    BY_ARTIST_ALBUM,
    BY_GENRE_ARTIST,
    BY_YEAR_ARTIST,
    BY_TYPE_ARTIST
}
package com.universalmedialibrary.services.epub

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for validating EPUB files
 */
@Singleton
class EpubValidationService @Inject constructor() {
    
    /**
     * Validate an EPUB file
     */
    suspend fun validateEpub(epubPath: String): Result<ValidationReport> = 
        withContext(Dispatchers.IO) {
            try {
                val file = File(epubPath)
                
                if (!file.exists()) {
                    return@withContext Result.failure(
                        Exception("File not found: $epubPath")
                    )
                }
                
                val errors = mutableListOf<ValidationError>()
                val warnings = mutableListOf<ValidationWarning>()
                
                ZipFile(file).use { zip ->
                    // Check mimetype file
                    val mimetypeEntry = zip.getEntry("mimetype")
                    if (mimetypeEntry == null) {
                        errors.add(
                            ValidationError(
                                "Missing mimetype file",
                                "EPUB must contain a mimetype file as the first entry"
                            )
                        )
                    } else {
                        val mimetype = zip.getInputStream(mimetypeEntry)
                            .bufferedReader().readText()
                        if (mimetype != "application/epub+zip") {
                            errors.add(
                                ValidationError(
                                    "Invalid mimetype",
                                    "Expected 'application/epub+zip', got '$mimetype'"
                                )
                            )
                        }
                    }
                    
                    // Check container.xml
                    val containerEntry = zip.getEntry("META-INF/container.xml")
                    if (containerEntry == null) {
                        errors.add(
                            ValidationError(
                                "Missing container.xml",
                                "EPUB must contain META-INF/container.xml"
                            )
                        )
                    }
                    
                    // Check for content.opf
                    val hasOpf = zip.entries().asSequence()
                        .any { it.name.endsWith(".opf") }
                    if (!hasOpf) {
                        errors.add(
                            ValidationError(
                                "Missing content.opf",
                                "EPUB must contain a content.opf file"
                            )
                        )
                    }
                    
                    // Check for navigation document (EPUB 3) or NCX (EPUB 2)
                    val hasNav = zip.entries().asSequence()
                        .any { it.name.contains("nav") && it.name.endsWith(".xhtml") }
                    val hasNcx = zip.entries().asSequence()
                        .any { it.name.endsWith(".ncx") }
                    
                    if (!hasNav && !hasNcx) {
                        warnings.add(
                            ValidationWarning(
                                "Missing navigation",
                                "EPUB should contain either nav.xhtml (EPUB 3) or toc.ncx (EPUB 2)"
                            )
                        )
                    }
                    
                    // Check for content files
                    val contentFiles = zip.entries().asSequence()
                        .filter { it.name.endsWith(".xhtml") || it.name.endsWith(".html") }
                        .count()
                    
                    if (contentFiles == 0) {
                        errors.add(
                            ValidationError(
                                "No content files",
                                "EPUB must contain at least one HTML/XHTML content file"
                            )
                        )
                    }
                    
                    // Check file sizes
                    val largeFiles = zip.entries().asSequence()
                        .filter { !it.isDirectory && it.size > 10 * 1024 * 1024 } // 10MB
                        .map { it.name }
                        .toList()
                    
                    if (largeFiles.isNotEmpty()) {
                        warnings.add(
                            ValidationWarning(
                                "Large files detected",
                                "Files larger than 10MB may cause performance issues: ${largeFiles.joinToString()}"
                            )
                        )
                    }
                }
                
                val report = ValidationReport(
                    isValid = errors.isEmpty(),
                    errors = errors,
                    warnings = warnings,
                    filePath = epubPath,
                    fileSize = file.length()
                )
                
                Result.success(report)
            } catch (e: Exception) {
                Result.failure(e)
            }
        }
    
    /**
     * Quick check if file is a valid EPUB
     */
    suspend fun isValidEpub(filePath: String): Boolean {
        return validateEpub(filePath).getOrNull()?.isValid ?: false
    }
}

/**
 * Validation report for an EPUB file
 */
data class ValidationReport(
    val isValid: Boolean,
    val errors: List<ValidationError>,
    val warnings: List<ValidationWarning>,
    val filePath: String,
    val fileSize: Long
) {
    val errorCount: Int get() = errors.size
    val warningCount: Int get() = warnings.size
    
    val summary: String get() = buildString {
        if (isValid) {
            append("✓ Valid EPUB")
        } else {
            append("✗ Invalid EPUB - ${errorCount} error(s)")
        }
        if (warningCount > 0) {
            append(" with ${warningCount} warning(s)")
        }
    }
}

/**
 * Validation error
 */
data class ValidationError(
    val title: String,
    val message: String
)

/**
 * Validation warning
 */
data class ValidationWarning(
    val title: String,
    val message: String
)

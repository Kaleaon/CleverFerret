package com.universalmedialibrary.services.epub

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.io.File
import java.nio.charset.CodingErrorAction
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

                    // Check for DRM/encryption
                    val encryptionEntry = zip.getEntry("META-INF/encryption.xml")
                    val rightsEntry = zip.getEntry("META-INF/rights.xml")
                    if (encryptionEntry != null || rightsEntry != null) {
                        val detectedFiles = listOfNotNull(
                            if (encryptionEntry != null) "encryption.xml" else null,
                            if (rightsEntry != null) "rights.xml" else null
                        )
                        warnings.add(
                            ValidationWarning(
                                "DRM/encryption detected",
                                "This EPUB may be DRM-protected (found ${detectedFiles.joinToString()}). Content extraction may be limited."
                            )
                        )
                    }

                    // Check content encoding (UTF-8 validation)
                    val contentEntries = zip.entries().asSequence()
                        .filter { !it.isDirectory && (it.name.endsWith(".xhtml") || it.name.endsWith(".html")) }
                        .toList()

                    val encodingIssueFiles = mutableListOf<String>()
                    for (entry in contentEntries) {
                        try {
                            val decoder = Charsets.UTF_8.newDecoder()
                                .onMalformedInput(CodingErrorAction.REPORT)
                                .onUnmappableCharacter(CodingErrorAction.REPORT)
                            zip.getInputStream(entry).use { inputStream ->
                                val bytes = inputStream.readBytes()
                                decoder.decode(java.nio.ByteBuffer.wrap(bytes))
                            }
                        } catch (e: java.nio.charset.MalformedInputException) {
                            encodingIssueFiles.add(entry.name)
                        } catch (e: java.nio.charset.UnmappableCharacterException) {
                            encodingIssueFiles.add(entry.name)
                        }
                    }

                    if (encodingIssueFiles.isNotEmpty()) {
                        warnings.add(
                            ValidationWarning(
                                "Content encoding issues",
                                "The following files may have encoding issues (EPUB spec requires UTF-8 or UTF-16): ${encodingIssueFiles.joinToString()}"
                            )
                        )
                    }

                    // Check for broken references and spine validity using content.opf
                    val opfEntry = zip.entries().asSequence()
                        .firstOrNull { it.name.endsWith(".opf") }

                    if (opfEntry != null) {
                        val opfContent = zip.getInputStream(opfEntry).bufferedReader().readText()
                        val opfDoc = Jsoup.parse(opfContent)

                        // Determine the base directory of the OPF file
                        val opfDir = if (opfEntry.name.contains("/")) {
                            opfEntry.name.substringBeforeLast("/") + "/"
                        } else {
                            ""
                        }

                        // Collect all ZIP entry names for lookup
                        val zipEntryNames = zip.entries().asSequence()
                            .map { it.name }
                            .toSet()

                        // Build manifest map: id -> href
                        val manifestItems = opfDoc.select("manifest item")
                        val manifestMap = mutableMapOf<String, String>()
                        val missingFiles = mutableListOf<String>()

                        for (item in manifestItems) {
                            val id = item.attr("id")
                            val href = item.attr("href")
                            if (id.isNotEmpty() && href.isNotEmpty()) {
                                manifestMap[id] = href

                                // Resolve href relative to OPF directory
                                val resolvedPath = opfDir + href
                                // Decode percent-encoded characters for comparison
                                val decodedPath = try {
                                    java.net.URLDecoder.decode(resolvedPath, "UTF-8")
                                } catch (e: Exception) {
                                    resolvedPath
                                }

                                if (decodedPath !in zipEntryNames && resolvedPath !in zipEntryNames) {
                                    missingFiles.add(href)
                                }
                            }
                        }

                        if (missingFiles.isNotEmpty()) {
                            errors.add(
                                ValidationError(
                                    "Broken references in manifest",
                                    "The following files are referenced in the manifest but missing from the archive: ${missingFiles.joinToString()}"
                                )
                            )
                        }

                        // Spine validation: check that itemrefs reference existing manifest items
                        val spineItemrefs = opfDoc.select("spine itemref")
                        val invalidSpineRefs = mutableListOf<String>()

                        for (itemref in spineItemrefs) {
                            val idref = itemref.attr("idref")
                            if (idref.isNotEmpty() && idref !in manifestMap) {
                                invalidSpineRefs.add(idref)
                            }
                        }

                        if (invalidSpineRefs.isNotEmpty()) {
                            errors.add(
                                ValidationError(
                                    "Invalid spine references",
                                    "The following spine itemrefs do not reference existing manifest items: ${invalidSpineRefs.joinToString()}"
                                )
                            )
                        }
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

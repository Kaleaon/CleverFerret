package com.universalmedialibrary.services.analysis.ocr

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.pdf.PdfRenderer
import android.net.Uri
import android.os.ParcelFileDescriptor
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import kotlinx.coroutines.Dispatchers
//import kotlinx.coroutines.tasks.await
import kotlinx.coroutines.withContext
import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream
import java.io.File
import java.io.FileOutputStream
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

/**
 * OCR Service for extracting text from various document formats
 * Uses Google ML Kit for on-device text recognition
 */
@Singleton
class OCRService @Inject constructor() {

    private val textRecognizer = TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS)

    /**
     * Extract text from PDF document (first few pages)
     */
    suspend fun extractTextFromPDF(
        context: Context, 
        uri: Uri, 
        maxPages: Int = 5
    ): String = withContext(Dispatchers.IO) {
        try {
            val inputStream = context.contentResolver.openInputStream(uri)
            val tempFile = File.createTempFile("pdf_temp", ".pdf", context.cacheDir)
            
            inputStream?.use { input ->
                FileOutputStream(tempFile).use { output ->
                    input.copyTo(output)
                }
            }

            val fileDescriptor = ParcelFileDescriptor.open(tempFile, ParcelFileDescriptor.MODE_READ_ONLY)
            val pdfRenderer = PdfRenderer(fileDescriptor)
            
            val extractedText = StringBuilder()
            val pagesToProcess = minOf(maxPages, pdfRenderer.pageCount)
            
            for (pageIndex in 0 until pagesToProcess) {
                val page = pdfRenderer.openPage(pageIndex)
                
                // Create bitmap for the page
                val bitmap = Bitmap.createBitmap(
                    page.width * 2, // Higher resolution for better OCR
                    page.height * 2,
                    Bitmap.Config.ARGB_8888
                )
                
                page.render(bitmap, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY)
                
                // Extract text using OCR
                val pageText = extractTextFromBitmap(bitmap)
                extractedText.append("--- Page ${pageIndex + 1} ---\n")
                extractedText.append(pageText)
                extractedText.append("\n\n")
                
                page.close()
                bitmap.recycle()
            }
            
            pdfRenderer.close()
            fileDescriptor.close()
            tempFile.delete()
            
            extractedText.toString()
            
        } catch (e: Exception) {
            "Error extracting text from PDF: ${e.message}"
        }
    }

    /**
     * Extract text from EPUB document
     */
    suspend fun extractTextFromEPUB(context: Context, uri: Uri): String = withContext(Dispatchers.IO) {
        try {
            val inputStream = context.contentResolver.openInputStream(uri)
            val extractedText = StringBuilder()
            
            inputStream?.use { stream ->
                ZipArchiveInputStream(stream).use { zipStream ->
                    var entry = zipStream.nextZipEntry
                    var textFilesProcessed = 0
                    
                    while (entry != null && textFilesProcessed < 10) { // Process first 10 text files
                        if (entry.name.endsWith(".html") || 
                            entry.name.endsWith(".xhtml") || 
                            entry.name.endsWith(".xml")) {
                            
                            val content = zipStream.readBytes().toString(Charsets.UTF_8)
                            val plainText = stripHtmlTags(content)
                            
                            extractedText.append("--- ${entry.name} ---\n")
                            extractedText.append(plainText.take(2000)) // First 2000 chars per file
                            extractedText.append("\n\n")
                            
                            textFilesProcessed++
                        }
                        entry = zipStream.nextZipEntry
                    }
                }
            }
            
            extractedText.toString()
            
        } catch (e: Exception) {
            "Error extracting text from EPUB: ${e.message}"
        }
    }

    /**
     * Extract text from generic document
     */
    suspend fun extractTextFromDocument(context: Context, uri: Uri): String = withContext(Dispatchers.IO) {
        try {
            val inputStream = context.contentResolver.openInputStream(uri)
            val content = inputStream?.bufferedReader()?.use { it.readText() } ?: ""
            
            // For HTML documents, strip tags
            if (uri.toString().contains(".html", ignoreCase = true) || 
                uri.toString().contains(".htm", ignoreCase = true)) {
                stripHtmlTags(content)
            } else {
                content.take(10000) // First 10,000 characters
            }
            
        } catch (e: Exception) {
            "Error extracting text from document: ${e.message}"
        }
    }

    /**
     * Extract text from bitmap using ML Kit OCR
     */
    suspend fun extractTextFromBitmap(bitmap: Bitmap): String = withContext(Dispatchers.IO) {
        try {
            val image = InputImage.fromBitmap(bitmap, 0)
            val result = textRecognizer.process(image).await()
            
            val extractedText = StringBuilder()
            
            for (block in result.textBlocks) {
                extractedText.append(block.text)
                extractedText.append("\n")
            }
            
            extractedText.toString()
            
        } catch (e: Exception) {
            "Error during OCR: ${e.message}"
        }
    }

    /**
     * Extract text from image file
     */
    suspend fun extractTextFromImage(context: Context, uri: Uri): String = withContext(Dispatchers.IO) {
        try {
            val inputStream = context.contentResolver.openInputStream(uri)
            val bitmap = BitmapFactory.decodeStream(inputStream)
            
            if (bitmap != null) {
                val text = extractTextFromBitmap(bitmap)
                bitmap.recycle()
                text
            } else {
                "Unable to decode image"
            }
            
        } catch (e: Exception) {
            "Error extracting text from image: ${e.message}"
        }
    }

    /**
     * Extract text content from comic archive (first few pages)
     */
    suspend fun extractTextFromComic(
        context: Context, 
        uri: Uri, 
        maxPages: Int = 3
    ): String = withContext(Dispatchers.IO) {
        try {
            val inputStream = context.contentResolver.openInputStream(uri)
            val extractedText = StringBuilder()
            val tempDir = File(context.cacheDir, "comic_ocr_${UUID.randomUUID()}")
            tempDir.mkdirs()
            
            inputStream?.use { stream ->
                ZipArchiveInputStream(stream).use { zipStream ->
                    var entry = zipStream.nextZipEntry
                    val imageFiles = mutableListOf<String>()
                    
                    // Extract image files
                    while (entry != null && imageFiles.size < maxPages) {
                        if (!entry.isDirectory && isImageFile(entry.name)) {
                            val file = File(tempDir, entry.name)
                            FileOutputStream(file).use { output ->
                                zipStream.copyTo(output)
                            }
                            imageFiles.add(file.absolutePath)
                        }
                        entry = zipStream.nextZipEntry
                    }
                    
                    // Sort files naturally and process
                    imageFiles.sortWith(compareBy { naturalSort(it) })
                    
                    for ((index, imagePath) in imageFiles.withIndex()) {
                        val bitmap = BitmapFactory.decodeFile(imagePath)
                        if (bitmap != null) {
                            val pageText = extractTextFromBitmap(bitmap)
                            if (pageText.trim().isNotEmpty()) {
                                extractedText.append("--- Page ${index + 1} ---\n")
                                extractedText.append(pageText)
                                extractedText.append("\n\n")
                            }
                            bitmap.recycle()
                        }
                    }
                }
            }
            
            // Cleanup temp files
            tempDir.deleteRecursively()
            
            extractedText.toString()
            
        } catch (e: Exception) {
            "Error extracting text from comic: ${e.message}"
        }
    }

    /**
     * Analyze first page/cover for title and author extraction
     */
    suspend fun analyzeFirstPage(context: Context, uri: Uri, pageIndex: Int = 0): FirstPageAnalysis {
        return withContext(Dispatchers.IO) {
            try {
                val bitmap = when {
                    uri.toString().contains(".pdf", ignoreCase = true) -> {
                        extractPDFPageAsBitmap(context, uri, pageIndex)
                    }
                    isImageFile(uri.toString()) -> {
                        val inputStream = context.contentResolver.openInputStream(uri)
                        BitmapFactory.decodeStream(inputStream)
                    }
                    else -> null
                }
                
                if (bitmap != null) {
                    val text = extractTextFromBitmap(bitmap)
                    val analysis = analyzeFirstPageText(text)
                    bitmap.recycle()
                    analysis
                } else {
                    FirstPageAnalysis.empty()
                }
                
            } catch (e: Exception) {
                FirstPageAnalysis.error(e.message ?: "Analysis failed")
            }
        }
    }

    private suspend fun extractPDFPageAsBitmap(
        context: Context, 
        uri: Uri, 
        pageIndex: Int
    ): Bitmap? {
        return try {
            val inputStream = context.contentResolver.openInputStream(uri)
            val tempFile = File.createTempFile("pdf_page", ".pdf", context.cacheDir)
            
            inputStream?.use { input ->
                FileOutputStream(tempFile).use { output ->
                    input.copyTo(output)
                }
            }

            val fileDescriptor = ParcelFileDescriptor.open(tempFile, ParcelFileDescriptor.MODE_READ_ONLY)
            val pdfRenderer = PdfRenderer(fileDescriptor)
            
            if (pageIndex < pdfRenderer.pageCount) {
                val page = pdfRenderer.openPage(pageIndex)
                val bitmap = Bitmap.createBitmap(
                    page.width * 2,
                    page.height * 2,
                    Bitmap.Config.ARGB_8888
                )
                page.render(bitmap, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY)
                page.close()
                
                pdfRenderer.close()
                fileDescriptor.close()
                tempFile.delete()
                
                bitmap
            } else {
                pdfRenderer.close()
                fileDescriptor.close()
                tempFile.delete()
                null
            }
            
        } catch (e: Exception) {
            null
        }
    }

    private fun analyzeFirstPageText(text: String): FirstPageAnalysis {
        val lines = text.lines().map { it.trim() }.filter { it.isNotEmpty() }
        
        var title = ""
        var author = ""
        var publisher = ""
        var isbn = ""
        
        // Look for patterns in the first few lines
        for ((index, line) in lines.take(20).withIndex()) {
            // Title is often in the first few lines, larger text
            if (title.isEmpty() && line.length > 5 && !line.contains("©") && 
                !line.contains("ISBN", ignoreCase = true)) {
                title = line
            }
            
            // Author patterns
            if (author.isEmpty() && (line.contains("by ", ignoreCase = true) || 
                line.matches(Regex("^[A-Z][a-z]+ [A-Z][a-z]+$")))) {
                author = line.replace("by ", "", ignoreCase = true).trim()
            }
            
            // Publisher patterns
            if (publisher.isEmpty() && index > 2 && line.length > 3 && 
                !line.contains("ISBN", ignoreCase = true)) {
                if (line.matches(Regex("^[A-Z][a-zA-Z\\s]+$"))) {
                    publisher = line
                }
            }
            
            // ISBN extraction
            if (isbn.isEmpty()) {
                val isbnPattern = Regex("ISBN[:\\s-]*([0-9X-]{10,17})", RegexOption.IGNORE_CASE)
                val match = isbnPattern.find(line)
                if (match != null) {
                    isbn = match.groupValues[1].replace("-", "")
                }
            }
        }
        
        return FirstPageAnalysis(
            title = title,
            author = author,
            publisher = publisher,
            isbn = isbn.takeIf { it.isNotEmpty() },
            confidence = calculateFirstPageConfidence(title, author, publisher, isbn),
            fullText = text.take(1000)
        )
    }

    private fun calculateFirstPageConfidence(
        title: String, 
        author: String, 
        publisher: String, 
        isbn: String
    ): Float {
        var confidence = 0.0f
        
        if (title.isNotEmpty()) confidence += 0.4f
        if (author.isNotEmpty()) confidence += 0.3f
        if (publisher.isNotEmpty()) confidence += 0.2f
        if (isbn.isNotEmpty()) confidence += 0.1f
        
        return confidence
    }

    private fun stripHtmlTags(html: String): String {
        return html
            .replace(Regex("<script[^>]*>.*?</script>", RegexOption.IGNORE_CASE), "")
            .replace(Regex("<style[^>]*>.*?</style>", RegexOption.IGNORE_CASE), "")
            .replace(Regex("<[^>]*>"), "")
            .replace("&nbsp;", " ")
            .replace("&", "&")
            .replace("<", "<")
            .replace(">", ">")
            .replace("&quot;", "\"")
            .replace(Regex("\\s+"), " ")
            .trim()
    }

    private fun isImageFile(filename: String): Boolean {
        val extension = filename.substringAfterLast('.', "").lowercase()
        return extension in listOf("jpg", "jpeg", "png", "gif", "bmp", "webp")
    }

    private fun naturalSort(path: String): String {
        val filename = File(path).nameWithoutExtension
        return filename.replace(Regex("\\d+")) { match ->
            match.value.padStart(10, '0')
        }
    }
}

/**
 * Result of first page analysis
 */
data class FirstPageAnalysis(
    val title: String = "",
    val author: String = "",
    val publisher: String = "",
    val isbn: String? = null,
    val confidence: Float = 0.0f,
    val fullText: String = "",
    val error: String? = null
) {
    companion object {
        fun empty() = FirstPageAnalysis()
        fun error(message: String) = FirstPageAnalysis(error = message)
    }
}
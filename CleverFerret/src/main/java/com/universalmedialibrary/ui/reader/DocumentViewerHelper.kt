package com.universalmedialibrary.ui.reader

import android.content.ActivityNotFoundException
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.webkit.MimeTypeMap
import android.widget.Toast
import androidx.core.content.FileProvider
import java.io.File

/**
 * Helper to dispatch document viewing intents to external applications via system chooser.
 */
object DocumentViewerHelper {

    const val DEFAULT_MIME_TYPE = "application/octet-stream"

    /**
     * Resolves the normalized file extension from a fileName or Uri.
     */
    fun getFileExtension(uri: Uri, fileName: String = ""): String {
        val trimmedFileName = fileName.trim()
        val extFromFileName = trimmedFileName.substringAfterLast('.', "")
        if (extFromFileName.isNotEmpty() && extFromFileName != trimmedFileName) {
            return extFromFileName.lowercase()
        }

        val uriString = uri.toString().substringBefore('?').substringBefore('#')
        val extFromUri = uriString.substringAfterLast('.', "")
        if (extFromUri.isNotEmpty() && extFromUri != uriString) {
            return extFromUri.lowercase()
        }

        return ""
    }

    /**
     * Resolves the MIME type for a given URI and file name with robust fallbacks:
     * 1. Query ContentResolver if the URI is a content URI.
     * 2. Query MimeTypeMap based on the file extension.
     * 3. Fall back to curated mapping for common document and ebook formats.
     * 4. Fall back to application/octet-stream.
     */
    fun resolveMimeType(context: Context, uri: Uri, fileName: String = ""): String {
        val contentResolverType = try {
            if (uri.scheme == "content") {
                context.contentResolver.getType(uri)
            } else {
                null
            }
        } catch (_: Exception) {
            null
        }

        if (!contentResolverType.isNullOrBlank() && contentResolverType != DEFAULT_MIME_TYPE) {
            return contentResolverType
        }

        val extension = getFileExtension(uri, fileName)
        if (extension.isNotEmpty()) {
            val mimeFromMap = try {
                MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension)
            } catch (_: Exception) {
                null
            }

            if (!mimeFromMap.isNullOrBlank()) {
                return mimeFromMap
            }

            val fallback = when (extension) {
                "epub" -> "application/epub+zip"
                "pdf" -> "application/pdf"
                "txt", "text", "log" -> "text/plain"
                "html", "htm" -> "text/html"
                "docx" -> "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
                "doc" -> "application/msword"
                "xlsx" -> "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                "xls" -> "application/vnd.ms-excel"
                "pptx" -> "application/vnd.openxmlformats-officedocument.presentationml.presentation"
                "ppt" -> "application/vnd.ms-powerpoint"
                "mobi" -> "application/x-mobipocket-ebook"
                "azw", "azw3" -> "application/vnd.amazon.ebook"
                "fb2" -> "application/x-fictionbook+xml"
                "cbz" -> "application/x-cbz"
                "cbr" -> "application/x-cbr"
                "djvu", "djv" -> "image/vnd.djvu"
                "rtf" -> "application/rtf"
                "odt" -> "application/vnd.oasis.opendocument.text"
                "json" -> "application/json"
                "xml" -> "application/xml"
                "csv" -> "text/csv"
                "md" -> "text/markdown"
                else -> null
            }

            if (fallback != null) {
                return fallback
            }
        }

        return contentResolverType ?: DEFAULT_MIME_TYPE
    }

    /**
     * Converts file:// scheme URIs to content URIs using FileProvider to avoid FileUriExposedException.
     */
    fun resolveContentUri(context: Context, uri: Uri): Uri {
        if (uri.scheme == "file") {
            val path = uri.path
            if (path != null) {
                return try {
                    val file = File(path)
                    FileProvider.getUriForFile(
                        context,
                        "${context.packageName}.fileprovider",
                        file
                    )
                } catch (e: Exception) {
                    android.util.Log.w("DocumentViewerHelper", "FileProvider resolution failed for $uri", e)
                    uri
                }
            }
        }
        return uri
    }

    /**
     * Builds the underlying ACTION_VIEW intent with read permissions and new task flags.
     */
    fun createViewIntent(context: Context, uri: Uri, fileName: String = ""): Intent {
        val contentUri = resolveContentUri(context, uri)
        val mimeType = resolveMimeType(context, uri, fileName)

        return Intent(Intent.ACTION_VIEW).apply {
            setDataAndType(contentUri, mimeType)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
    }

    /**
     * Builds a system chooser intent wrapping the ACTION_VIEW intent.
     */
    fun createChooserIntent(
        context: Context,
        uri: Uri,
        fileName: String = "",
        chooserTitle: CharSequence = "Open with"
    ): Intent {
        val viewIntent = createViewIntent(context, uri, fileName)
        return Intent.createChooser(viewIntent, chooserTitle).apply {
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
    }

    /**
     * Launches the system viewer chooser with error handling.
     */
    fun launchSystemViewer(context: Context, uri: Uri, fileName: String = "") {
        try {
            val chooserIntent = createChooserIntent(context, uri, fileName)
            context.startActivity(chooserIntent)
        } catch (_: ActivityNotFoundException) {
            Toast.makeText(
                context,
                "No app found to open this document",
                Toast.LENGTH_SHORT
            ).show()
        } catch (e: Exception) {
            Toast.makeText(
                context,
                "Failed to open document: ${e.message}",
                Toast.LENGTH_SHORT
            ).show()
        }
    }
}

/**
 * Top-level delegation function for convenient invocation from composables.
 */
fun launchSystemViewer(context: Context, uri: Uri, fileName: String = "") {
    DocumentViewerHelper.launchSystemViewer(context, uri, fileName)
}

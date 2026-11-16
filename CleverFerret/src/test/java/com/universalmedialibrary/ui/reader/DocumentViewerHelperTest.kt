package com.universalmedialibrary.ui.reader

import android.content.ActivityNotFoundException
import android.content.ContentProvider
import android.content.ContentValues
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.database.Cursor
import android.net.Uri
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import org.robolectric.shadows.ShadowToast
import java.io.File

@RunWith(RobolectricTestRunner::class)
@Config(application = android.app.Application::class, sdk = [34])
class DocumentViewerHelperTest {

    class TestPdfProvider : ContentProvider() {
        override fun onCreate(): Boolean = true
        override fun getType(uri: Uri): String = "application/pdf"
        override fun query(
            uri: Uri,
            projection: Array<out String>?,
            selection: String?,
            selectionArgs: Array<out String>?,
            sortOrder: String?
        ): Cursor? = null
        override fun insert(uri: Uri, values: ContentValues?): Uri? = null
        override fun delete(uri: Uri, selection: String?, selectionArgs: Array<out String>?): Int = 0
        override fun update(uri: Uri, values: ContentValues?, selection: String?, selectionArgs: Array<out String>?): Int = 0
    }

    private lateinit var context: Context

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        ShadowToast.reset()
    }

    @Test
    fun resolveMimeType_whenContentResolverProvidesType_returnsResolverType() {
        Robolectric.setupContentProvider(TestPdfProvider::class.java, "com.universalmedialibrary.test")
        val testUri = Uri.parse("content://com.universalmedialibrary.test/document")

        val mimeType = DocumentViewerHelper.resolveMimeType(context, testUri, "fallback.txt")
        assertEquals("application/pdf", mimeType)
    }

    @Test
    fun resolveMimeType_whenContentResolverReturnsNull_resolvesFromFileNameExtension() {
        val testUri = Uri.parse("content://com.universalmedialibrary.test/unknown")

        assertEquals(
            "application/pdf",
            DocumentViewerHelper.resolveMimeType(context, testUri, "sample.pdf")
        )
        assertEquals(
            "text/plain",
            DocumentViewerHelper.resolveMimeType(context, testUri, "notes.txt")
        )
        assertEquals(
            "application/epub+zip",
            DocumentViewerHelper.resolveMimeType(context, testUri, "book.epub")
        )
        assertEquals(
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            DocumentViewerHelper.resolveMimeType(context, testUri, "report.docx")
        )
        assertEquals(
            "application/x-mobipocket-ebook",
            DocumentViewerHelper.resolveMimeType(context, testUri, "novel.mobi")
        )
        assertEquals(
            "text/html",
            DocumentViewerHelper.resolveMimeType(context, testUri, "index.html")
        )
    }

    @Test
    fun resolveMimeType_whenFileNameLacksExtension_resolvesFromUriPath() {
        val fileUri = Uri.parse("file:///storage/emulated/0/Download/great_book.epub")
        val mimeType = DocumentViewerHelper.resolveMimeType(context, fileUri, "great_book")

        assertEquals("application/epub+zip", mimeType)
    }

    @Test
    fun resolveMimeType_whenExtensionIsUnknown_fallsBackToOctetStream() {
        val testUri = Uri.parse("content://com.universalmedialibrary.test/unknown_file")
        val mimeType = DocumentViewerHelper.resolveMimeType(context, testUri, "mystery.xyz123")

        assertEquals("application/octet-stream", mimeType)
    }

    @Test
    fun createViewIntent_configuresActionViewAndGrantFlags() {
        val testUri = Uri.parse("content://com.universalmedialibrary.test/document.pdf")
        val intent = DocumentViewerHelper.createViewIntent(context, testUri, "document.pdf")

        assertEquals(Intent.ACTION_VIEW, intent.action)
        assertEquals(testUri, intent.data)
        assertEquals("application/pdf", intent.type)
        assertTrue(
            "FLAG_GRANT_READ_URI_PERMISSION must be set",
            (intent.flags and Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0
        )
        assertTrue(
            "FLAG_ACTIVITY_NEW_TASK must be set",
            (intent.flags and Intent.FLAG_ACTIVITY_NEW_TASK) != 0
        )
    }

    @Test
    fun createChooserIntent_wrapsViewIntentWithGrantFlags() {
        val testUri = Uri.parse("content://com.universalmedialibrary.test/document.epub")
        val chooser = DocumentViewerHelper.createChooserIntent(context, testUri, "document.epub")

        assertEquals(Intent.ACTION_CHOOSER, chooser.action)
        assertTrue(
            "FLAG_GRANT_READ_URI_PERMISSION must be set on chooser",
            (chooser.flags and Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0
        )
        assertTrue(
            "FLAG_ACTIVITY_NEW_TASK must be set on chooser",
            (chooser.flags and Intent.FLAG_ACTIVITY_NEW_TASK) != 0
        )

        @Suppress("DEPRECATION")
        val targetIntent = chooser.getParcelableExtra<Intent>(Intent.EXTRA_INTENT)
        assertNotNull(targetIntent)
        assertEquals(Intent.ACTION_VIEW, targetIntent?.action)
        assertEquals("application/epub+zip", targetIntent?.type)
        assertEquals(testUri, targetIntent?.data)
    }

    @Test
    fun resolveContentUri_convertsFileUriUsingFileProvider() {
        val cacheFile = File(context.cacheDir, "sample_reader.pdf").apply {
            writeText("sample content")
        }
        val fileUri = Uri.fromFile(cacheFile)

        val resolvedUri = DocumentViewerHelper.resolveContentUri(context, fileUri)

        assertEquals("content", resolvedUri.scheme)
        assertEquals("${context.packageName}.fileprovider", resolvedUri.authority)
    }

    @Test
    fun resolveContentUri_leavesContentUriUnchanged() {
        val contentUri = Uri.parse("content://media/external/files/100")
        val resolvedUri = DocumentViewerHelper.resolveContentUri(context, contentUri)

        assertEquals(contentUri, resolvedUri)
    }

    @Test
    fun launchSystemViewer_whenActivityNotFound_showsToastWithoutCrashing() {
        val failingContext = object : ContextWrapper(context) {
            override fun startActivity(intent: Intent?) {
                throw ActivityNotFoundException("No activity found to handle intent")
            }
        }

        val testUri = Uri.parse("content://com.universalmedialibrary.test/missing.epub")

        // Should catch ActivityNotFoundException and display user-friendly Toast
        DocumentViewerHelper.launchSystemViewer(failingContext, testUri, "missing.epub")

        val latestToast = ShadowToast.getTextOfLatestToast()
        assertEquals("No app found to open this document", latestToast)
    }
}

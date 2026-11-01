package com.universalmedialibrary.workers

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

class MediaDownloadWorkerTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @Test
    fun `isXmlOrHtmlContentType correctly flags XML and HTML content types`() {
        assertTrue(MediaDownloadWorker.isXmlOrHtmlContentType("text/xml"))
        assertTrue(MediaDownloadWorker.isXmlOrHtmlContentType("text/xml; charset=utf-8"))
        assertTrue(MediaDownloadWorker.isXmlOrHtmlContentType("application/xml"))
        assertTrue(MediaDownloadWorker.isXmlOrHtmlContentType("application/xml; charset=utf-8"))
        assertTrue(MediaDownloadWorker.isXmlOrHtmlContentType("text/html"))
        assertTrue(MediaDownloadWorker.isXmlOrHtmlContentType("text/html; charset=iso-8859-1"))
        assertTrue(MediaDownloadWorker.isXmlOrHtmlContentType("application/xhtml+xml"))

        assertFalse(MediaDownloadWorker.isXmlOrHtmlContentType("video/mp4"))
        assertFalse(MediaDownloadWorker.isXmlOrHtmlContentType("audio/mpeg"))
        assertFalse(MediaDownloadWorker.isXmlOrHtmlContentType("audio/flac"))
        assertFalse(MediaDownloadWorker.isXmlOrHtmlContentType("video/x-matroska"))
        assertFalse(MediaDownloadWorker.isXmlOrHtmlContentType("application/octet-stream"))
        assertFalse(MediaDownloadWorker.isXmlOrHtmlContentType("image/jpeg"))
        assertFalse(MediaDownloadWorker.isXmlOrHtmlContentType(""))
    }

    @Test
    fun `isNonMediaPayload detects XML and HTML document signatures`() {
        val xmlFile = tempFolder.newFile("sample_metadata.xml").apply {
            writeText("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<MediaContainer size=\"1\"></MediaContainer>")
        }
        assertTrue(MediaDownloadWorker.isNonMediaPayload(xmlFile))

        val mediaContainerFile = tempFolder.newFile("container.xml").apply {
            writeText("<MediaContainer identifier=\"com.plexapp.plugins.library\">\n</MediaContainer>")
        }
        assertTrue(MediaDownloadWorker.isNonMediaPayload(mediaContainerFile))

        val htmlDocFile = tempFolder.newFile("error.html").apply {
            writeText("<!DOCTYPE html><html><head><title>401 Unauthorized</title></head><body>Unauthorized</body></html>")
        }
        assertTrue(MediaDownloadWorker.isNonMediaPayload(htmlDocFile))

        val htmlTagFile = tempFolder.newFile("simple.html").apply {
            writeText("<html xmlns=\"http://www.w3.org/1999/xhtml\"><p>Error</p></html>")
        }
        assertTrue(MediaDownloadWorker.isNonMediaPayload(htmlTagFile))

        val errorXmlFile = tempFolder.newFile("err.xml").apply {
            writeText("<error message=\"Invalid token\" code=\"403\" />")
        }
        assertTrue(MediaDownloadWorker.isNonMediaPayload(errorXmlFile))
    }

    @Test
    fun `isNonMediaPayload allows valid binary media headers`() {
        // MP4 header (ftyp box)
        val mp4File = tempFolder.newFile("sample.mp4").apply {
            writeBytes(byteArrayOf(0x00, 0x00, 0x00, 0x18, 0x66, 0x74, 0x79, 0x70, 0x6D, 0x70, 0x34, 0x32))
        }
        assertFalse(MediaDownloadWorker.isNonMediaPayload(mp4File))

        // MKV / Matroska EBML header
        val mkvFile = tempFolder.newFile("sample.mkv").apply {
            writeBytes(byteArrayOf(0x1A.toByte(), 0x45.toByte(), 0xDF.toByte(), 0xA3.toByte(), 0x01, 0x00))
        }
        assertFalse(MediaDownloadWorker.isNonMediaPayload(mkvFile))

        // MP3 ID3 header
        val mp3File = tempFolder.newFile("sample.mp3").apply {
            writeBytes(byteArrayOf(0x49, 0x44, 0x33, 0x03, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x76))
        }
        assertFalse(MediaDownloadWorker.isNonMediaPayload(mp3File))

        // Empty file
        val emptyFile = tempFolder.newFile("empty.bin")
        assertFalse(MediaDownloadWorker.isNonMediaPayload(emptyFile))
    }
}

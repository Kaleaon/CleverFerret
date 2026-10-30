package com.universalmedialibrary.utils

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.ByteArrayInputStream

class HashUtilsTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @Test
    fun testSha256StringVectors() {
        val input = "hello world"
        val expected = "b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9"
        assertEquals(expected, HashUtils.sha256(input))
        assertEquals(expected, input.sha256())
    }

    @Test
    fun testSha256EmptyStringVector() {
        val input = ""
        val expected = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        assertEquals(expected, HashUtils.sha256(input))
        assertEquals(expected, input.sha256())
    }

    @Test
    fun testSha1StringVectors() {
        val input = "hello world"
        val expected = "2aae6c35c94fcfb415dbe95f408b9ce91ee846ed"
        assertEquals(expected, HashUtils.sha1(input))
        assertEquals(expected, input.sha1())
    }

    @Test
    fun testSha1EmptyStringVector() {
        val input = ""
        val expected = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
        assertEquals(expected, HashUtils.sha1(input))
        assertEquals(expected, input.sha1())
    }

    @Test
    fun testMd5StringVectors() {
        val input = "hello world"
        val expected = "5eb63bbbe01eeed093cb22bb8f5acdc3"
        assertEquals(expected, HashUtils.md5(input))
        assertEquals(expected, input.md5())
    }

    @Test
    fun testMd5EmptyStringVector() {
        val input = ""
        val expected = "d41d8cd98f00b204e9800998ecf8427e"
        assertEquals(expected, HashUtils.md5(input))
        assertEquals(expected, input.md5())
    }

    @Test
    fun testByteArrayToHexString() {
        val bytes = byteArrayOf(0x00, 0x0F, 0x10, 0x7F, 0x80.toByte(), 0xFF.toByte())
        val expected = "000f107f80ff"
        assertEquals(expected, HashUtils.toHexString(bytes))
        assertEquals(expected, bytes.toHexString())
    }

    @Test
    fun testByteArrayHashHelpers() {
        val bytes = "hello world".toByteArray(Charsets.UTF_8)
        assertEquals("b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9", bytes.sha256())
        assertEquals("2aae6c35c94fcfb415dbe95f408b9ce91ee846ed", bytes.sha1())
        assertEquals("5eb63bbbe01eeed093cb22bb8f5acdc3", bytes.md5())
    }

    @Test
    fun testInputStreamHashStream() {
        val content = "hello world"
        val stream = ByteArrayInputStream(content.toByteArray(Charsets.UTF_8))
        val hash = stream.hashStream(HashUtils.ALG_SHA256)
        assertEquals("b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9", hash)
    }

    @Test
    fun testFileComputeHashes() {
        val testFile = tempFolder.newFile("test_hash.txt")
        testFile.writeText("hello world", Charsets.UTF_8)

        val sha256Hex = testFile.computeSha256()
        val sha1Hex = testFile.computeSha1()
        val md5Hex = testFile.computeMd5()

        assertEquals("b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9", sha256Hex)
        assertEquals("2aae6c35c94fcfb415dbe95f408b9ce91ee846ed", sha1Hex)
        assertEquals("5eb63bbbe01eeed093cb22bb8f5acdc3", md5Hex)
    }

    @Test
    fun testGetDigestThreadSafety() {
        val d1 = HashUtils.getDigest(HashUtils.ALG_SHA256)
        val d2 = HashUtils.getDigest(HashUtils.ALG_SHA256)
        assertNotNull(d1)
        assertNotNull(d2)
        assertTrue("getDigest must return new instances", d1 !== d2)
    }
}

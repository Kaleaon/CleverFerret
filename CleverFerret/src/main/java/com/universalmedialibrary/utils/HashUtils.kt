package com.universalmedialibrary.utils

import java.io.File
import java.io.InputStream
import java.security.MessageDigest

/**
 * Centralized thread-safe utility and extension functions for computing cryptographic hashes
 * (SHA-256, SHA-1, MD5) and converting byte arrays to hexadecimal strings.
 */
object HashUtils {
    const val ALG_SHA256 = "SHA-256"
    const val ALG_SHA1 = "SHA-1"
    const val ALG_MD5 = "MD5"

    const val DEFAULT_BUFFER_SIZE = 8192

    private const val HEX_CHARS = "0123456789abcdef"
    private const val BITS_PER_NIBBLE = 4
    private const val NIBBLE_MASK = 0x0F
    private const val BYTE_MASK = 0xFF

    /**
     * Obtains a new [MessageDigest] instance for the given algorithm.
     * Always returns a fresh instance for thread safety.
     */
    fun getDigest(algorithm: String): MessageDigest {
        return MessageDigest.getInstance(algorithm)
    }

    /**
     * Converts a [ByteArray] into a lowercase hexadecimal string representation.
     */
    fun toHexString(bytes: ByteArray): String {
        val hexChars = CharArray(bytes.size * 2)
        for (i in bytes.indices) {
            val v = bytes[i].toInt() and BYTE_MASK
            hexChars[i * 2] = HEX_CHARS[v ushr BITS_PER_NIBBLE]
            hexChars[i * 2 + 1] = HEX_CHARS[v and NIBBLE_MASK]
        }
        return String(hexChars)
    }

    /**
     * Computes the digest bytes for a given [ByteArray] and [algorithm].
     */
    fun digest(input: ByteArray, algorithm: String = ALG_SHA256): ByteArray {
        val messageDigest = getDigest(algorithm)
        return messageDigest.digest(input)
    }

    /**
     * Computes the digest bytes for a given [String] and [algorithm].
     */
    fun digest(input: String, algorithm: String = ALG_SHA256): ByteArray {
        return digest(input.toByteArray(Charsets.UTF_8), algorithm)
    }

    /**
     * Hashes a [String] using the specified [algorithm] and returns a lowercase hex string.
     */
    fun hash(input: String, algorithm: String = ALG_SHA256): String {
        return toHexString(digest(input, algorithm))
    }

    /**
     * Hashes a [ByteArray] using the specified [algorithm] and returns a lowercase hex string.
     */
    fun hash(input: ByteArray, algorithm: String = ALG_SHA256): String {
        return toHexString(digest(input, algorithm))
    }

    /**
     * Hashes an [InputStream] using the specified [algorithm] and returns a lowercase hex string.
     * Note: The input stream reading is managed during execution.
     */
    fun hashStream(
        input: InputStream,
        algorithm: String = ALG_SHA256,
        bufferSize: Int = DEFAULT_BUFFER_SIZE
    ): String {
        val messageDigest = getDigest(algorithm)
        val buffer = ByteArray(bufferSize)
        var bytesRead: Int
        while (input.read(buffer).also { bytesRead = it } > 0) {
            messageDigest.update(buffer, 0, bytesRead)
        }
        return toHexString(messageDigest.digest())
    }

    /**
     * Hashes a [File] using the specified [algorithm] and returns a lowercase hex string.
     * Employs auto-closing `.use {}` resource management.
     */
    fun hashFile(
        file: File,
        algorithm: String = ALG_SHA256,
        bufferSize: Int = DEFAULT_BUFFER_SIZE
    ): String {
        return file.inputStream().use { stream ->
            hashStream(stream, algorithm, bufferSize)
        }
    }

    /**
     * SHA-256 hash helpers
     */
    fun sha256(input: String): String = hash(input, ALG_SHA256)
    fun sha256(input: ByteArray): String = hash(input, ALG_SHA256)
    fun sha256(file: File, bufferSize: Int = DEFAULT_BUFFER_SIZE): String =
        hashFile(file, ALG_SHA256, bufferSize)

    /**
     * SHA-1 hash helpers
     */
    fun sha1(input: String): String = hash(input, ALG_SHA1)
    fun sha1(input: ByteArray): String = hash(input, ALG_SHA1)
    fun sha1(file: File, bufferSize: Int = DEFAULT_BUFFER_SIZE): String =
        hashFile(file, ALG_SHA1, bufferSize)

    /**
     * MD5 hash helpers
     */
    fun md5(input: String): String = hash(input, ALG_MD5)
    fun md5(input: ByteArray): String = hash(input, ALG_MD5)
    fun md5(file: File, bufferSize: Int = DEFAULT_BUFFER_SIZE): String =
        hashFile(file, ALG_MD5, bufferSize)
}

/**
 * Extension functions for ergonomic usage
 */

fun String.sha256(): String = HashUtils.sha256(this)
fun String.sha1(): String = HashUtils.sha1(this)
fun String.md5(): String = HashUtils.md5(this)

fun ByteArray.toHexString(): String = HashUtils.toHexString(this)
fun ByteArray.sha256(): String = HashUtils.sha256(this)
fun ByteArray.sha1(): String = HashUtils.sha1(this)
fun ByteArray.md5(): String = HashUtils.md5(this)

fun File.computeSha256(bufferSize: Int = HashUtils.DEFAULT_BUFFER_SIZE): String =
    HashUtils.sha256(this, bufferSize)

fun File.computeSha1(bufferSize: Int = HashUtils.DEFAULT_BUFFER_SIZE): String =
    HashUtils.sha1(this, bufferSize)

fun File.computeMd5(bufferSize: Int = HashUtils.DEFAULT_BUFFER_SIZE): String =
    HashUtils.md5(this, bufferSize)

fun InputStream.hashStream(
    algorithm: String = HashUtils.ALG_SHA256,
    bufferSize: Int = HashUtils.DEFAULT_BUFFER_SIZE
): String = HashUtils.hashStream(this, algorithm, bufferSize)

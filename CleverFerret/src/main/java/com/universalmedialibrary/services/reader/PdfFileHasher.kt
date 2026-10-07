package com.universalmedialibrary.services.reader

import java.io.File
import java.io.RandomAccessFile
import java.security.MessageDigest

/**
 * Fast, deterministic PDF file hasher.
 * Computes file hash in under 10ms by sampling partial byte offsets and combining with metadata
 * (file size and last modified timestamp).
 */
object PdfFileHasher {

    private const val CHUNK_SIZE = 4096

    /**
     * Compute a fast deterministic hash for a PDF file.
     * Completes in < 10ms regardless of file size.
     */
    fun computeHash(file: File): String {
        if (!file.exists() || !file.isFile) return ""

        return try {
            val length = file.length()
            val lastModified = file.lastModified()

            val digest = MessageDigest.getInstance("SHA-256")

            // Include metadata (size + modification time) in digest
            val metadataStr = "$length:$lastModified"
            digest.update(metadataStr.toByteArray(Charsets.UTF_8))

            if (length > 0) {
                RandomAccessFile(file, "r").use { raf ->
                    val buffer = ByteArray(CHUNK_SIZE)

                    if (length <= CHUNK_SIZE * 3) {
                        // Small file: read entirely
                        raf.seek(0)
                        var bytesRead: Int
                        while (raf.read(buffer).also { bytesRead = it } != -1) {
                            digest.update(buffer, 0, bytesRead)
                        }
                    } else {
                        // Large file: sample head, middle, and tail
                        // 1. Head chunk
                        raf.seek(0)
                        var read = raf.read(buffer)
                        if (read > 0) digest.update(buffer, 0, read)

                        // 2. Middle chunk
                        val midOffset = (length / 2) - (CHUNK_SIZE / 2)
                        raf.seek(midOffset)
                        read = raf.read(buffer)
                        if (read > 0) digest.update(buffer, 0, read)

                        // 3. Tail chunk
                        val tailOffset = length - CHUNK_SIZE
                        raf.seek(tailOffset)
                        read = raf.read(buffer)
                        if (read > 0) digest.update(buffer, 0, read)
                    }
                }
            }

            digest.digest().joinToString("") { "%02x".format(it) }
        } catch (e: Exception) {
            // Fallback hash if file read fails
            "${file.name}_${file.length()}_${file.lastModified()}"
        }
    }
}

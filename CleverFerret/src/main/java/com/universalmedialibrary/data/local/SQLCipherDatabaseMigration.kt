package com.universalmedialibrary.data.local

import android.content.Context
import android.util.Log
import net.zetetic.database.sqlcipher.SQLiteDatabase
import java.io.File
import java.io.RandomAccessFile

/**
 * Handles automated migration of existing legacy unencrypted SQLite database files to
 * SQLCipher encrypted format on boot.
 */
@Suppress("TooGenericExceptionCaught", "MagicNumber", "NestedBlockDepth")
object SQLCipherDatabaseMigration {

    private const val TAG = "SQLCipherMigration"
    private const val SQLITE_HEADER = "SQLite format 3\u0000"
    private const val HEADER_BYTE_COUNT = 16
    private const val BUFFER_SIZE = 4096
    private const val BYTE_MASK = 0xFF
    private const val SHIFT_FOUR = 4
    private const val MASK_FIFTEEN = 0x0F

    /**
     * Inspects the database file and migrates it to SQLCipher encrypted format if unencrypted.
     */
    fun migrateIfNeeded(context: Context, dbName: String, passphrase: ByteArray) {
        val dbFile = context.getDatabasePath(dbName)
        if (!dbFile.exists() || dbFile.length() == 0L) {
            return
        }

        if (isUnencryptedSqliteFile(dbFile)) {
            Log.i(TAG, "Legacy unencrypted SQLite database detected at ${dbFile.absolutePath}. Migrating to SQLCipher...")
            executeMigration(dbFile, passphrase)
        }
    }

    private fun isUnencryptedSqliteFile(dbFile: File): Boolean {
        return try {
            RandomAccessFile(dbFile, "r").use { raf ->
                val header = ByteArray(HEADER_BYTE_COUNT)
                raf.readFully(header)
                String(header, Charsets.US_ASCII) == SQLITE_HEADER
            }
        } catch (e: Exception) {
            Log.w(TAG, "Could not check database header", e)
            false
        }
    }

    private fun executeMigration(dbFile: File, passphrase: ByteArray) {
        val unencryptedFile = File(dbFile.parentFile, "${dbFile.name}.unencrypted")
        if (unencryptedFile.exists()) {
            unencryptedFile.delete()
        }

        // Move unencrypted file and associated WAL/SHM files
        val walFile = File(dbFile.parentFile, "${dbFile.name}-wal")
        val shmFile = File(dbFile.parentFile, "${dbFile.name}-shm")

        if (!dbFile.renameTo(unencryptedFile)) {
            Log.e(TAG, "Failed to rename unencrypted database file for migration")
            return
        }

        val passphraseHex = bytesToHex(passphrase)
        var unencryptedDb: SQLiteDatabase? = null
        try {
            unencryptedDb = SQLiteDatabase.openDatabase(
                unencryptedFile.absolutePath,
                ByteArray(0),
                null,
                SQLiteDatabase.OPEN_READWRITE,
                null
            )

            val attachQuery = "ATTACH DATABASE '${dbFile.absolutePath}' AS encrypted KEY 'x\"$passphraseHex\"';"
            unencryptedDb.execSQL(attachQuery)
            unencryptedDb.execSQL("SELECT sqlcipher_export('encrypted');")
            unencryptedDb.execSQL("DETACH DATABASE encrypted;")

            Log.i(TAG, "Successfully exported unencrypted database to SQLCipher database!")
        } catch (e: Exception) {
            Log.e(TAG, "Error during SQLCipher database migration", e)
            // Rollback: restore unencrypted file if encrypted file was not created properly
            if (!dbFile.exists() && unencryptedFile.exists()) {
                unencryptedFile.renameTo(dbFile)
            }
            throw IllegalStateException("Database encryption migration failed", e)
        } finally {
            try {
                unencryptedDb?.close()
            } catch (e: Exception) {
                Log.w(TAG, "Error closing unencrypted database during cleanup", e)
            }

            // Securely wipe and delete unencrypted database file and WAL/SHM files
            wipeAndDelete(unencryptedFile)
            if (walFile.exists()) wipeAndDelete(walFile)
            if (shmFile.exists()) wipeAndDelete(shmFile)
        }
    }

    private fun wipeAndDelete(file: File) {
        try {
            if (file.exists()) {
                RandomAccessFile(file, "rw").use { raf ->
                    val length = raf.length()
                    raf.seek(0)
                    val zeroBuffer = ByteArray(BUFFER_SIZE)
                    var bytesWritten = 0L
                    while (bytesWritten < length) {
                        val toWrite = minOf(zeroBuffer.size.toLong(), length - bytesWritten).toInt()
                        raf.write(zeroBuffer, 0, toWrite)
                        bytesWritten += toWrite
                    }
                }
                file.delete()
            }
        } catch (e: Exception) {
            Log.w(TAG, "Error securely wiping file: ${file.name}", e)
            file.delete()
        }
    }

    private fun bytesToHex(bytes: ByteArray): String {
        val hexChars = CharArray(bytes.size * 2)
        val hexArray = "0123456789abcdef".toCharArray()
        for (i in bytes.indices) {
            val v = bytes[i].toInt() and BYTE_MASK
            hexChars[i * 2] = hexArray[v ushr SHIFT_FOUR]
            hexChars[i * 2 + 1] = hexArray[v and MASK_FIFTEEN]
        }
        return String(hexChars)
    }
}

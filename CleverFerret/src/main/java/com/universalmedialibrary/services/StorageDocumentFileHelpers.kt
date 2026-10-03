package com.universalmedialibrary.services

import android.content.Context
import android.net.Uri
import androidx.documentfile.provider.DocumentFile

internal fun getOrCreateChildDir(context: Context, parent: DocumentFile, name: String): DocumentFile {
    parent.listFiles().firstOrNull { it.isDirectory && it.name == name }?.let { return it }
    return parent.createDirectory(name) ?: parent
}

internal fun getOrCreateNestedDirs(context: Context, root: DocumentFile, pathSegments: List<String>): DocumentFile {
    var current = root
    for (segment in pathSegments) {
        val cleaned = fileNameSanitizer.sanitizePath(segment).ifBlank { "Unknown" }
        current = getOrCreateChildDir(context, current, cleaned)
    }
    return current
}

internal fun moveDocumentFile(context: Context, src: DocumentFile, dstDir: DocumentFile): Boolean {
    return try {
        // Try DocumentsContract move if possible
        val srcDoc = src.uri
        val dstParent = dstDir.uri
        try {
            val parentUri: Uri? = src.parentFile?.uri
            val moved = if (parentUri != null) {
                DocumentsContract.moveDocument(context.contentResolver, srcDoc, parentUri, dstParent)
            } else {
                null
            }
            moved != null
        } catch (_: Throwable) {
            // Fallback to copy + delete
            val mime = src.type ?: "application/octet-stream"
            val base = src.name ?: "file"
            val target = createUniqueFile(dstDir, mime, base)
            val copied = copyStream(context, src.uri, target.uri)
            if (copied) src.delete() else false
        }
    } catch (e: Exception) {
        ErrorLogger.logWarning("StorageAccessService", "Error moving document file", e)
        false
    }
}

internal fun copyDocumentFile(context: Context, src: DocumentFile, dstDir: DocumentFile, desiredName: String): DocumentFile? {
    return try {
        val mime = src.type ?: "application/octet-stream"
        val target = createUniqueFile(dstDir, mime, desiredName)
        val copied = copyStream(context, src.uri, target.uri)
        if (copied) target else null
    } catch (e: Exception) {
        ErrorLogger.logWarning("StorageAccessService", "Error copying document file", e)
        null
    }
}

internal fun copyDocumentFileWithStrategy(
    context: Context,
    src: DocumentFile,
    dstDir: DocumentFile,
    desiredName: String,
    strategy: ImportConflictStrategy
): CopyResult {
    return try {
        val mime = src.type ?: "application/octet-stream"
        val existing = dstDir.findFile(desiredName)

        when (strategy) {
            ImportConflictStrategy.SKIP -> {
                if (existing != null) return CopyResult.Skipped("Destination exists")
                val target = dstDir.createFile(mime, desiredName) ?: return CopyResult.Failed("Create failed")
                if (copyStream(context, src.uri, target.uri)) CopyResult.Copied(target) else CopyResult.Failed("Copy failed")
            }
            ImportConflictStrategy.REPLACE -> {
                existing?.delete()
                val target = dstDir.createFile(mime, desiredName) ?: return CopyResult.Failed("Create failed")
                if (copyStream(context, src.uri, target.uri)) CopyResult.Copied(target) else CopyResult.Failed("Copy failed")
            }
            ImportConflictStrategy.RENAME -> {
                val target = createUniqueFile(dstDir, mime, desiredName)
                if (copyStream(context, src.uri, target.uri)) CopyResult.Copied(target) else CopyResult.Failed("Copy failed")
            }
            ImportConflictStrategy.QUARANTINE -> {
                // Caller routes to quarantine directory; we just ensure no clobber.
                val target = createUniqueFile(dstDir, mime, desiredName)
                if (copyStream(context, src.uri, target.uri)) CopyResult.Copied(target) else CopyResult.Failed("Copy failed")
            }
        }
    } catch (e: Exception) {
        ErrorLogger.logWarning("StorageAccessService", "Error copying document file (strategy=$strategy)", e)
        CopyResult.Failed(e.message ?: "Copy failed")
    }
}

internal fun createUniqueFile(dstDir: DocumentFile, mime: String, baseName: String): DocumentFile {
    var name = baseName
    var idx = 1
    while (dstDir.findFile(name) != null) {
        val ext = name.substringAfterLast('.', "")
        val stem = if (ext.isNotEmpty()) name.removeSuffix(".$ext") else name
        name = if (ext.isNotEmpty()) "$stem ($idx).$ext" else "$stem ($idx)"
        idx++
    }
    return dstDir.createFile(mime, name) ?: dstDir
}

internal fun copyStream(context: Context, src: Uri, dst: Uri): Boolean {
    return try {
        context.contentResolver.openInputStream(src).use { input ->
            context.contentResolver.openOutputStream(dst, "w").use { output ->
                if (input == null || output == null) return false
                val buf = ByteArray(8192)
                var n: Int
                while (true) {
                    n = input.read(buf)
                    if (n <= 0) break
                    output.write(buf, 0, n)
                }
                output.flush()
            }
        }
        true
    } catch (e: Exception) { false }
}


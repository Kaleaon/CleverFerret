package com.universalmedialibrary.services

import android.content.Context
import com.universalmedialibrary.data.repository.CacheLocation
import com.universalmedialibrary.services.cache.CacheManager
import dagger.hilt.android.qualifiers.ApplicationContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * File Safety Guardrail Service
 * 
 * Centralized service to validate file paths against designated application cache boundaries
 * before allowing deletion during background operations (e.g. thumbnail regeneration or cleanup).
 * Resolves canonical file paths to prevent directory traversal bypasses.
 */
@Singleton
class FileSafetyGuardrail @Inject constructor(
    @ApplicationContext private val context: Context,
    private val cacheManager: CacheManager
) {

    /**
     * Retrieve all canonical cache root directories managed by the app.
     */
    fun getCacheRoots(): List<File> {
        val roots = mutableSetOf<File>()
        
        runCatching { context.cacheDir?.canonicalFile?.let { roots.add(it) } }
        runCatching { context.externalCacheDir?.canonicalFile?.let { roots.add(it) } }
        runCatching { cacheManager.getCacheDirectoryForLocation(CacheLocation.INTERNAL).canonicalFile.let { roots.add(it) } }
        runCatching { cacheManager.getCacheDirectoryForLocation(CacheLocation.EXTERNAL).canonicalFile.let { roots.add(it) } }
        
        return roots.toList()
    }

    /**
     * Check if a path string points to a file inside designated cache directories.
     */
    fun isCachePath(path: String?): Boolean {
        if (path.isNullOrBlank()) return false
        if (path.startsWith("http://") || path.startsWith("https://") || path.startsWith("content://")) {
            return false
        }
        return isCachePath(File(path))
    }

    /**
     * Check if a File points to a location inside designated cache directories.
     */
    fun isCachePath(file: File?): Boolean {
        if (file == null) return false
        val canonicalFile = runCatching { file.canonicalFile }.getOrNull() ?: return false
        val canonicalPath = canonicalFile.path
        
        val roots = getCacheRoots()
        for (root in roots) {
            val rootPath = root.path
            if (canonicalPath == rootPath || canonicalPath.startsWith(rootPath + File.separator)) {
                return true
            }
        }
        return false
    }

    /**
     * Safely delete a file if and only if it resides within designated app cache boundaries.
     * Returns true if deleted or file did not exist in cache, false if deletion was prevented.
     */
    fun safeDeleteCacheFile(path: String?): Boolean {
        if (path.isNullOrBlank()) return true
        if (!isCachePath(path)) {
            return false
        }
        return runCatching {
            val file = File(path)
            if (file.exists()) {
                file.delete()
            } else {
                true
            }
        }.getOrDefault(false)
    }

    /**
     * Safely delete a file if and only if it resides within designated app cache boundaries.
     */
    fun safeDeleteCacheFile(file: File?): Boolean {
        if (file == null) return true
        if (!isCachePath(file)) {
            return false
        }
        return runCatching {
            if (file.exists()) {
                file.delete()
            } else {
                true
            }
        }.getOrDefault(false)
    }
}

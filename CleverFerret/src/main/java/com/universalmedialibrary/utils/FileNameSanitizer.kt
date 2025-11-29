package com.universalmedialibrary.utils

import javax.inject.Inject
import javax.inject.Singleton

/**
 * Centralized utility for sanitizing file names and paths.
 * 
 * Provides consistent file name sanitization across the application
 * to prevent filesystem issues and ensure cross-platform compatibility.
 */
@Singleton
class FileNameSanitizer @Inject constructor() {
    
    /**
     * Sanitizes a file name by removing invalid characters.
     * 
     * @param name The original file name
     * @param maxLength Maximum length of the sanitized name (default: 100)
     * @return Sanitized file name safe for filesystem use
     */
    fun sanitizeFileName(name: String, maxLength: Int = 100): String {
        return name
            .replace(Regex("[^a-zA-Z0-9.-]"), "_")
            .replace(Regex("_{2,}"), "_") // Replace multiple underscores with single
            .trim('_', '.', '-') // Remove leading/trailing special chars
            .take(maxLength)
    }
    
    /**
     * Sanitizes a file name with more permissive characters (includes spaces).
     * 
     * @param name The original file name
     * @param maxLength Maximum length of the sanitized name (default: 100)
     * @return Sanitized file name with spaces preserved
     */
    fun sanitizeFileNamePermissive(name: String, maxLength: Int = 100): String {
        return name
            .replace(Regex("[^a-zA-Z0-9.\\s_-]"), "_")
            .replace(Regex("\\s+"), " ") // Normalize whitespace
            .replace(Regex("_{2,}"), "_")
            .trim('_', '.', '-', ' ')
            .take(maxLength)
    }
    
    /**
     * Sanitizes a path component (directory or file name).
     * 
     * @param path The path component to sanitize
     * @return Sanitized path component
     */
    fun sanitizePath(path: String): String {
        return path
            .replace(Regex("[^a-zA-Z0-9._-]"), "_")
            .replace(Regex("_{2,}"), "_")
            .trim('_', '.')
    }
    
    /**
     * Sanitizes a tag ID or similar identifier.
     * 
     * @param value The value to sanitize
     * @return Sanitized identifier, with fallback if blank
     */
    fun sanitizeTagId(value: String): String {
        val normalized = value
            .trim()
            .lowercase()
            .replace(Regex("[^a-z0-9]+"), "-")
            .trim('-')
        return normalized.ifBlank { "tag-${value.hashCode() and 0xffff}" }
    }
}

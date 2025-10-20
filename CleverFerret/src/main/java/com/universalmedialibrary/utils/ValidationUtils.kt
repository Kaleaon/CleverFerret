package com.universalmedialibrary.utils

import android.util.Patterns
import java.io.File

/**
 * Utility functions for input validation across the app
 */
object ValidationUtils {
    
    /**
     * Validates library name
     * @return null if valid, error message if invalid
     */
    fun validateLibraryName(name: String): String? {
        return when {
            name.isBlank() -> "Library name cannot be empty"
            name.length < 2 -> "Library name must be at least 2 characters"
            name.length > 100 -> "Library name cannot exceed 100 characters"
            !name.matches(Regex("^[a-zA-Z0-9\\s-_]+$")) -> "Library name contains invalid characters"
            else -> null
        }
    }
    
    /**
     * Validates file path
     * @return null if valid, error message if invalid
     */
    fun validatePath(path: String): String? {
        return when {
            path.isBlank() -> "Path cannot be empty"
            path.contains("..") -> "Path contains invalid directory traversal"
            path.length > 4096 -> "Path is too long"
            else -> null
        }
    }
    
    /**
     * Validates directory exists and is readable
     */
    fun validateDirectory(path: String): String? {
        val pathError = validatePath(path)
        if (pathError != null) return pathError
        
        val file = File(path)
        return when {
            !file.exists() -> "Directory does not exist"
            !file.isDirectory -> "Path is not a directory"
            !file.canRead() -> "Directory is not readable"
            else -> null
        }
    }
    
    /**
     * Validates email address
     */
    fun validateEmail(email: String): String? {
        return when {
            email.isBlank() -> "Email cannot be empty"
            !Patterns.EMAIL_ADDRESS.matcher(email).matches() -> "Invalid email format"
            else -> null
        }
    }
    
    /**
     * Validates URL
     */
    fun validateUrl(url: String): String? {
        return when {
            url.isBlank() -> "URL cannot be empty"
            !Patterns.WEB_URL.matcher(url).matches() -> "Invalid URL format"
            else -> null
        }
    }
    
    /**
     * Validates API key format
     */
    fun validateApiKey(key: String): String? {
        return when {
            key.isBlank() -> "API key cannot be empty"
            key.length < 8 -> "API key is too short"
            key.length > 512 -> "API key is too long"
            !key.matches(Regex("^[a-zA-Z0-9-_=]+$")) -> "API key contains invalid characters"
            else -> null
        }
    }
    
    /**
     * Validates ISBN
     */
    fun validateIsbn(isbn: String): String? {
        val cleanIsbn = isbn.replace("-", "").replace(" ", "")
        return when {
            cleanIsbn.isBlank() -> "ISBN cannot be empty"
            cleanIsbn.length == 10 && cleanIsbn.matches(Regex("^[0-9]{9}[0-9X]$")) -> null
            cleanIsbn.length == 13 && cleanIsbn.matches(Regex("^[0-9]{13}$")) -> null
            else -> "Invalid ISBN format (must be 10 or 13 digits)"
        }
    }
    
    /**
     * Validates file size is within limits
     */
    fun validateFileSize(sizeBytes: Long, maxSizeMB: Int = 5000): String? {
        val maxSizeBytes = maxSizeMB * 1024L * 1024L
        return when {
            sizeBytes <= 0 -> "Invalid file size"
            sizeBytes > maxSizeBytes -> "File size exceeds maximum of ${maxSizeMB}MB"
            else -> null
        }
    }
    
    /**
     * Validates password strength
     */
    fun validatePassword(password: String): String? {
        return when {
            password.length < 8 -> "Password must be at least 8 characters"
            !password.any { it.isUpperCase() } -> "Password must contain at least one uppercase letter"
            !password.any { it.isLowerCase() } -> "Password must contain at least one lowercase letter"
            !password.any { it.isDigit() } -> "Password must contain at least one digit"
            else -> null
        }
    }
    
    /**
     * Validates port number
     */
    fun validatePort(port: Int): String? {
        return when {
            port < 1 -> "Port number must be positive"
            port > 65535 -> "Port number cannot exceed 65535"
            port < 1024 -> "Port number below 1024 requires elevated privileges"
            else -> null
        }
    }
    
    /**
     * Sanitizes user input for database queries
     */
    fun sanitizeInput(input: String): String {
        return input
            .trim()
            .replace(Regex("[\\x00-\\x08\\x0B-\\x0C\\x0E-\\x1F]"), "") // Remove control characters
            .take(4096) // Limit length
    }
    
    /**
     * Validates and sanitizes search query
     */
    fun validateSearchQuery(query: String): String? {
        val sanitized = sanitizeInput(query)
        return when {
            sanitized.isBlank() -> "Search query cannot be empty"
            sanitized.length < 2 -> "Search query must be at least 2 characters"
            else -> null
        }
    }
}

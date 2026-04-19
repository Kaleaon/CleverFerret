package com.cleverferret.v2.feature.metadata.ai

class MetadataPromptPrivacyFilter {
    fun redact(input: String): String {
        var result = input
        result = EMAIL_PATTERN.replace(result, "[REDACTED_EMAIL]")
        result = PHONE_PATTERN.replace(result, "[REDACTED_PHONE]")
        result = UNIX_PATH_PATTERN.replace(result, "[REDACTED_PATH]")
        result = WINDOWS_PATH_PATTERN.replace(result, "[REDACTED_PATH]")
        return result
    }

    companion object {
        private val EMAIL_PATTERN = Regex("[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+")
        private val PHONE_PATTERN = Regex("\\+?[0-9][0-9().\\-\\s]{7,}[0-9]")
        private val UNIX_PATH_PATTERN = Regex("/(?:[\\w.-]+/)+[\\w.-]+")
        private val WINDOWS_PATH_PATTERN = Regex("[A-Za-z]:\\\\(?:[^\\\\\\s]+\\\\)*[^\\\\\\s]+")
    }
}

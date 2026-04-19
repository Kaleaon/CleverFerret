package com.cleverferret.v2.feature.ai.privacy

class PromptRedactionFilter {
    fun redact(prompt: String): String {
        var redacted = EMAIL_PATTERN.replace(prompt, "[REDACTED_EMAIL]")
        redacted = API_KEY_PATTERN.replace(redacted, "$1[REDACTED_SECRET]")
        redacted = PHONE_PATTERN.replace(redacted, "[REDACTED_PHONE]")
        redacted = UNIX_PATH_PATTERN.replace(redacted, "[REDACTED_PATH]")
        redacted = WINDOWS_PATH_PATTERN.replace(redacted, "[REDACTED_PATH]")
        return redacted
    }

    companion object {
        private val EMAIL_PATTERN = Regex("[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+")
        private val API_KEY_PATTERN = Regex("(?i)(api[_-]?key\\s*[:=]\\s*)([A-Za-z0-9-_]{8,})")
        private val PHONE_PATTERN = Regex("\\+?[0-9][0-9().\\-\\s]{7,}[0-9]")
        private val UNIX_PATH_PATTERN = Regex("/(?:[\\w.-]+/)+[\\w.-]+")
        private val WINDOWS_PATH_PATTERN = Regex("[A-Za-z]:\\\\(?:[^\\\\\\s]+\\\\)*[^\\\\\\s]+")
    }
}

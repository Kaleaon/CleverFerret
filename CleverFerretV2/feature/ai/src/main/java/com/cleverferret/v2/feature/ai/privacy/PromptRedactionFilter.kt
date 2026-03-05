package com.cleverferret.v2.feature.ai.privacy

class PromptRedactionFilter {
    fun redact(prompt: String): String {
        val noEmail = EMAIL_PATTERN.replace(prompt, "[REDACTED_EMAIL]")
        return API_KEY_PATTERN.replace(noEmail, "$1[REDACTED_SECRET]")
    }

    companion object {
        private val EMAIL_PATTERN = Regex("[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+")
        private val API_KEY_PATTERN = Regex("(?i)(api[_-]?key\s*[:=]\s*)([A-Za-z0-9-_]{8,})")
    }
}

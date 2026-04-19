package com.cleverferret.v2.feature.ai.privacy

import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class PromptRedactionFilterTest {
    private val filter = PromptRedactionFilter()

    @Test
    fun `redacts pii and local file paths`() {
        val input = """
            Contact me at user@example.com or +1 415 555 1212.
            API_KEY=secret12345
            File: /Users/alex/Books/private/notes.txt
            Windows: C:\\Users\\alex\\Desktop\\secret.docx
        """.trimIndent()

        val output = filter.redact(input)

        assertFalse(output.contains("user@example.com"))
        assertFalse(output.contains("/Users/alex/Books/private/notes.txt"))
        assertFalse(output.contains("C:\\Users\\alex\\Desktop\\secret.docx"))
        assertTrue(output.contains("[REDACTED_EMAIL]"))
        assertTrue(output.contains("[REDACTED_PATH]"))
    }
}

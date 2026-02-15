package com.universalmedialibrary.utils

import com.universalmedialibrary.data.local.entity.DictionaryEntry
import com.universalmedialibrary.data.repository.DictionaryRepository
import com.universalmedialibrary.services.dictionary.DictionaryService
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.mockk
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertTrue
import org.junit.Test

class TextSanitizerTest {

    private val dictionaryRepository = mockk<DictionaryRepository>()
    private val dictionaryService = mockk<DictionaryService>()
    private val sanitizer = TextSanitizer(dictionaryRepository, dictionaryService)

    @Test
    fun `sanitizeText handles large content and applies dictionary replacements`() = runTest {
        val largeInput = buildString {
            repeat(5000) {
                append("teh hero entered camidor and said .. this is teh path. ")
            }
        }

        coEvery { dictionaryRepository.getApplicableDictionary(42L) } returns listOf(
            DictionaryEntry(word = "hero", replacement = "champion", bookId = 42L)
        )

        val result = sanitizer.sanitizeText(largeInput, bookId = 42L)

        assertTrue(result.contains("the champion entered Cannidor"))
        assertTrue(result.length > 1000)
        coVerify(exactly = 1) { dictionaryRepository.getApplicableDictionary(42L) }
    }
}

package com.universalmedialibrary.services.dictionary

import com.universalmedialibrary.utils.ErrorLogger
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service to interact with the Free Dictionary API.
 * Used for:
 * - Verifying if a word is a valid English word (vs typo or fictional term)
 * - Fetching definitions for the reader
 */
@Singleton
class DictionaryService @Inject constructor(
    private val api: FreeDictionaryApi
) {

    /**
     * Check if a word exists in the dictionary.
     * Useful for separating typos from fictional words.
     */
    suspend fun isValidWord(word: String): Boolean {
        return try {
            val result = api.getDefinition(word)
            result.isNotEmpty()
        } catch (e: Exception) {
            // 404 means word not found, other errors might be network
            // For "isValid", we assume 404 = false
            if (e.message?.contains("404") == true) {
                false
            } else {
                // On network error, we default to true to avoid flagging real words as typos?
                // Or false? Let's log and return false for safety in "auto-correct" logic
                ErrorLogger.logWarning("DictionaryService", "Error checking word: $word", e)
                false
            }
        }
    }

    /**
     * Get full definition for a word.
     */
    suspend fun getDefinition(word: String): Result<List<WordDefinition>> {
        return try {
            val result = api.getDefinition(word)
            Result.success(result)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}

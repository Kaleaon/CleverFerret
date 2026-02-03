package com.universalmedialibrary.utils

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import okhttp3.OkHttpClient
import okhttp3.Request
import java.util.concurrent.TimeUnit
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Lightweight client for FileBot's public data lists.
 *
 * Uses filebot/data lists to clean up filenames for metadata extraction:
 * - release-groups.txt (removes scene group tags)
 * - query-excludes.txt (removes noisy tokens)
 */
@Singleton
class FilebotDataService @Inject constructor() {
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
    private val httpClient = OkHttpClient.Builder()
        .connectTimeout(10, TimeUnit.SECONDS)
        .readTimeout(10, TimeUnit.SECONDS)
        .build()

    @Volatile
    private var releaseGroups: Set<String> = emptySet()

    @Volatile
    private var releaseGroupRegexes: List<Regex> = emptyList()

    @Volatile
    private var queryExcludeRegexes: List<Regex> = emptyList()

    fun warmCache() {
        if (releaseGroups.isNotEmpty() && queryExcludeRegexes.isNotEmpty()) return
        scope.launch { refresh() }
    }

    fun stripFilebotNoise(input: String): String {
        warmCache()
        val tokens = input
            .replace(Regex("[\\[\\](){}]"), " ")
            .replace(Regex("[._-]+"), " ")
            .replace(Regex("\\s+"), " ")
            .trim()
            .split(" ")
            .filter { it.isNotBlank() }

        if (tokens.isEmpty()) return input

        val filtered = tokens.filterNot { token ->
            val upper = token.uppercase()
            releaseGroups.contains(upper) ||
                releaseGroupRegexes.any { it.matches(token) } ||
                queryExcludeRegexes.any { it.matches(token) }
        }

        return filtered.joinToString(" ").ifBlank { input }
    }

    private suspend fun refresh() {
        val releaseGroupsResponse = fetchLines(FILEBOT_RELEASE_GROUPS_URL)
        val queryExcludesResponse = fetchLines(FILEBOT_QUERY_EXCLUDES_URL)

        releaseGroups = releaseGroupsResponse.plainTokens.map { it.uppercase() }.toSet()
        releaseGroupRegexes = releaseGroupsResponse.regexTokens
        queryExcludeRegexes = queryExcludesResponse.regexTokens + queryExcludesResponse.plainTokens.mapNotNull { token ->
            runCatching { Regex("^${Regex.escape(token)}$", RegexOption.IGNORE_CASE) }.getOrNull()
        }
    }

    private data class FilebotLines(
        val plainTokens: List<String>,
        val regexTokens: List<Regex>
    )

    private fun fetchLines(url: String): FilebotLines {
        return try {
            val request = Request.Builder()
                .url(url)
                .get()
                .build()
            httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) return FilebotLines(emptyList(), emptyList())
                val body = response.body?.string().orEmpty()
                parseFilebotLines(body)
            }
        } catch (_: Exception) {
            FilebotLines(emptyList(), emptyList())
        }
    }

    private fun parseFilebotLines(body: String): FilebotLines {
        val plainTokens = mutableListOf<String>()
        val regexTokens = mutableListOf<Regex>()

        body.lineSequence()
            .map { it.trim() }
            .filter { it.isNotBlank() }
            .forEach { line ->
                val regex = runCatching { Regex(line, RegexOption.IGNORE_CASE) }.getOrNull()
                if (regex != null && line.any { it in ".*?^$|()[]\\" }) {
                    regexTokens.add(regex)
                } else {
                    plainTokens.add(line)
                }
            }

        return FilebotLines(plainTokens, regexTokens)
    }

    private companion object {
        private const val FILEBOT_RELEASE_GROUPS_URL =
            "https://raw.githubusercontent.com/filebot/data/master/release-groups.txt"
        private const val FILEBOT_QUERY_EXCLUDES_URL =
            "https://raw.githubusercontent.com/filebot/data/master/query-excludes.txt"
    }
}

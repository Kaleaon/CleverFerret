package com.universalmedialibrary.services.ingestion

import javax.inject.Inject
import javax.inject.Singleton

interface IncrementalStateStore {
    suspend fun getToken(sourceId: String): String?
    suspend fun setToken(sourceId: String, token: String)
}

@Singleton
class InMemoryIncrementalStateStore @Inject constructor() : IncrementalStateStore {
    private val state = mutableMapOf<String, String>()

    override suspend fun getToken(sourceId: String): String? = synchronized(state) { state[sourceId] }

    override suspend fun setToken(sourceId: String, token: String) {
        synchronized(state) {
            state[sourceId] = token
        }
    }
}

data class SourceHealthSnapshot(
    val sourceId: String,
    val consecutiveFailures: Int,
    val lastFailureAt: Long?,
    val blockedUntilEpochMs: Long?
)

@Singleton
class SourceHealthMonitor @Inject constructor() {
    private val states = mutableMapOf<String, SourceHealthSnapshot>()

    fun assertCanIngest(sourceId: String) {
        val now = System.currentTimeMillis()
        val state = synchronized(states) { states[sourceId] }
        if (state?.blockedUntilEpochMs != null && state.blockedUntilEpochMs > now) {
            val waitMs = state.blockedUntilEpochMs - now
            throw IllegalStateException("Source '$sourceId' is in backoff for ${waitMs}ms")
        }
    }

    fun recordSuccess(sourceId: String) {
        synchronized(states) {
            states[sourceId] = SourceHealthSnapshot(
                sourceId = sourceId,
                consecutiveFailures = 0,
                lastFailureAt = null,
                blockedUntilEpochMs = null
            )
        }
    }

    fun recordFailure(sourceId: String) {
        val now = System.currentTimeMillis()
        synchronized(states) {
            val current = states[sourceId]
            val failures = (current?.consecutiveFailures ?: 0) + 1
            val backoffMs = exponentialBackoffMs(failures)
            states[sourceId] = SourceHealthSnapshot(
                sourceId = sourceId,
                consecutiveFailures = failures,
                lastFailureAt = now,
                blockedUntilEpochMs = now + backoffMs
            )
        }
    }

    fun getHealth(sourceId: String): SourceHealthSnapshot {
        return synchronized(states) {
            states[sourceId] ?: SourceHealthSnapshot(sourceId, 0, null, null)
        }
    }

    private fun exponentialBackoffMs(failureCount: Int): Long {
        val baseMs = 5_000L
        val cappedExponent = failureCount.coerceAtMost(6)
        val scale = 1L shl (cappedExponent - 1)
        return (baseMs * scale).coerceAtMost(10 * 60_000L)
    }
}

data class IngestionOutcome<T>(
    val result: T,
    val sourceHealth: SourceHealthSnapshot,
    val incrementalToken: String?
)

@Singleton
class IngestionPipeline @Inject constructor(
    private val sourceHealthMonitor: SourceHealthMonitor,
    private val incrementalStateStore: InMemoryIncrementalStateStore
) {
    suspend fun <Auth, FetchPage, Parsed, Deduped, Enriched, Persisted> execute(
        sourceId: String,
        authenticate: suspend () -> Auth,
        fetchPage: suspend (Auth, String?) -> FetchPage,
        parse: suspend (FetchPage) -> Parsed,
        deduplicate: suspend (Parsed) -> Deduped,
        enrichMetadata: suspend (Deduped) -> Enriched,
        persist: suspend (Enriched) -> Persisted,
        nextIncrementalToken: suspend (Persisted) -> String?
    ): IngestionOutcome<Persisted> {
        sourceHealthMonitor.assertCanIngest(sourceId)

        return try {
            val auth = authenticate()
            val previousToken = incrementalStateStore.getToken(sourceId)
            val fetched = fetchPage(auth, previousToken)
            val parsed = parse(fetched)
            val deduped = deduplicate(parsed)
            val enriched = enrichMetadata(deduped)
            val persisted = persist(enriched)
            val token = nextIncrementalToken(persisted)
            if (!token.isNullOrBlank()) {
                incrementalStateStore.setToken(sourceId, token)
            }
            sourceHealthMonitor.recordSuccess(sourceId)
            IngestionOutcome(
                result = persisted,
                sourceHealth = sourceHealthMonitor.getHealth(sourceId),
                incrementalToken = token
            )
        } catch (t: Throwable) {
            sourceHealthMonitor.recordFailure(sourceId)
            throw t
        }
    }
}

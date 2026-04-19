package com.cleverferret.v2.feature.plex.services.plex

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.core.network.plex.PlexMetadataBoundary

interface PlexSyncCheckpointStore {
    fun read(): String?
    fun write(checkpoint: String)
    fun clear()
}

class InMemoryPlexSyncCheckpointStore : PlexSyncCheckpointStore {
    private var checkpoint: String? = null
    override fun read(): String? = checkpoint
    override fun write(checkpoint: String) {
        this.checkpoint = checkpoint
    }
    override fun clear() {
        checkpoint = null
    }
}

class PlexMetadataSyncService(
    private val metadataBoundary: PlexMetadataBoundary,
    private val checkpointStore: PlexSyncCheckpointStore,
) {
    fun clearCheckpoint() = checkpointStore.clear()

    fun importMetadata(accessToken: String): IntegrationResult<PlexMetadataSyncOutcome> {
        var cursor: String? = null
        var imported = 0
        var latestCheckpoint = checkpointStore.read().orEmpty()

        do {
            val pageResult = metadataBoundary.fetchMetadataPage(accessToken, cursor)
            if (pageResult is IntegrationResult.Failure) {
                return pageResult
            }
            val page = (pageResult as IntegrationResult.Success).value
            imported += page.records.size
            cursor = page.nextCursor
            latestCheckpoint = page.syncCheckpoint
        } while (cursor != null)

        checkpointStore.write(latestCheckpoint)
        return IntegrationResult.success(PlexMetadataSyncOutcome(imported, latestCheckpoint))
    }
}

data class PlexMetadataSyncOutcome(
    val importedItems: Int,
    val checkpoint: String,
)

package com.cleverferret.v2.feature.plex.services.plex

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.core.network.plex.PlexMetadataBoundary
import com.cleverferret.v2.core.network.plex.PlexMetadataPage
import com.cleverferret.v2.core.network.plex.PlexMetadataRecord
import kotlin.test.Test
import kotlin.test.assertEquals

class PlexMetadataSyncServiceTest {
    @Test
    fun `initial import pages through records and stores checkpoint`() {
        val checkpointStore = InMemoryPlexSyncCheckpointStore()
        val boundary = object : PlexMetadataBoundary {
            override fun fetchMetadataPage(accessToken: String, pageCursor: String?): IntegrationResult<PlexMetadataPage> {
                return when (pageCursor) {
                    null -> IntegrationResult.success(
                        PlexMetadataPage(
                            records = listOf(PlexMetadataRecord("1", "A", "movie", 1)),
                            nextCursor = "page-2",
                            syncCheckpoint = "cp-1",
                        ),
                    )
                    "page-2" -> IntegrationResult.success(
                        PlexMetadataPage(
                            records = listOf(PlexMetadataRecord("2", "B", "show", 2), PlexMetadataRecord("3", "C", "show", 3)),
                            nextCursor = null,
                            syncCheckpoint = "cp-2",
                        ),
                    )
                    else -> error("unexpected")
                }
            }
        }

        val service = PlexMetadataSyncService(boundary, checkpointStore)
        val result = service.importMetadata("token") as IntegrationResult.Success

        assertEquals(3, result.value.importedItems)
        assertEquals("cp-2", result.value.checkpoint)
        assertEquals("cp-2", checkpointStore.read())
    }
}

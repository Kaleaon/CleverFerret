package com.cleverferret.v2.feature.plex.api

import com.cleverferret.v2.core.common.VersionedContract
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.plex.services.plex.PlexSyncResultV1

sealed class PlexNavDestination(val route: String) {
    data object Integration : PlexNavDestination("sync/plex")
}

interface PlexFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
    fun syncLibrary(accessToken: String): IntegrationResult<PlexSyncResultV1>
}

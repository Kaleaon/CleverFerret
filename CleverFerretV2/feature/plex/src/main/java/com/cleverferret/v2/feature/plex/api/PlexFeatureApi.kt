package com.cleverferret.v2.feature.plex.api

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.plex.services.plex.PlexSyncResultV1

interface PlexFeatureApi {
    fun featureKey(): String
    fun syncLibrary(accessToken: String): IntegrationResult<PlexSyncResultV1>
}

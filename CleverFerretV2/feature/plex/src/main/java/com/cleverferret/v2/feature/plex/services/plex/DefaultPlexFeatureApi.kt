package com.cleverferret.v2.feature.plex.services.plex

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.plex.api.PlexFeatureApi

class DefaultPlexFeatureApi : PlexFeatureApi {
    override fun featureKey(): String = "feature:plex"

    override fun syncLibrary(accessToken: String): IntegrationResult<PlexSyncResultV1> {
        return IntegrationResult.success(
            PlexSyncResultV1(
                accountId = accessToken,
                syncedItems = 0,
                syncedAtEpochMillis = System.currentTimeMillis(),
            )
        )
    }
}

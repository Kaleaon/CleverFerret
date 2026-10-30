package com.cleverferret.v2.feature.sync.services.sync

import com.cleverferret.v2.feature.sync.api.SyncFeatureApi

class DefaultSyncFeatureApi : SyncFeatureApi {
    override fun featureKey(): String = "feature:sync"
}

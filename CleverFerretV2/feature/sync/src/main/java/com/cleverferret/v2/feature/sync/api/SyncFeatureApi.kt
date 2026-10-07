package com.cleverferret.v2.feature.sync.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class SyncNavDestination(val route: String) {
    data object Home : SyncNavDestination("sync/home")
    data object Providers : SyncNavDestination("sync/providers")
    data object History : SyncNavDestination("sync/history")
    data object Conflicts : SyncNavDestination("sync/conflicts")
}

interface SyncFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}

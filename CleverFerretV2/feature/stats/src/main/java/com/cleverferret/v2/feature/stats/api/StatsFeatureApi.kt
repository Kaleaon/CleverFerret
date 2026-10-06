package com.cleverferret.v2.feature.stats.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class StatsNavDestination(val route: String) {
    data object ReadingStats : StatsNavDestination("library/stats")
}

interface StatsFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}

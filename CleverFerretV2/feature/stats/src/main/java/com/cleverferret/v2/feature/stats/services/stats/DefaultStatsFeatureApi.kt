package com.cleverferret.v2.feature.stats.services.stats

import com.cleverferret.v2.feature.stats.api.StatsFeatureApi

class DefaultStatsFeatureApi : StatsFeatureApi {
    override fun featureKey(): String = "feature:stats"
}

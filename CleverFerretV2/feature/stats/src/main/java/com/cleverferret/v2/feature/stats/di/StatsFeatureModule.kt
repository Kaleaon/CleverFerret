package com.cleverferret.v2.feature.stats.di

import com.cleverferret.v2.feature.stats.api.StatsFeatureApi
import com.cleverferret.v2.feature.stats.services.stats.DefaultStatsFeatureApi

object StatsFeatureModule {
    fun provideStatsFeatureApi(): StatsFeatureApi = DefaultStatsFeatureApi()
}

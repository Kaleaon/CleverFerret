package com.cleverferret.v2.feature.sync.di

import com.cleverferret.v2.feature.sync.api.SyncFeatureApi
import com.cleverferret.v2.feature.sync.services.sync.DefaultSyncFeatureApi

object SyncFeatureModule {
    fun provideSyncFeatureApi(): SyncFeatureApi = DefaultSyncFeatureApi()
}

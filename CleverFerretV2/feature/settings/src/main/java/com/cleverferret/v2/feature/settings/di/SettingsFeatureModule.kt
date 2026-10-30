package com.cleverferret.v2.feature.settings.di

import com.cleverferret.v2.feature.settings.api.SettingsFeatureApi
import com.cleverferret.v2.feature.settings.services.settings.DefaultSettingsFeatureApi

object SettingsFeatureModule {
    fun provideSettingsFeatureApi(): SettingsFeatureApi = DefaultSettingsFeatureApi()
}

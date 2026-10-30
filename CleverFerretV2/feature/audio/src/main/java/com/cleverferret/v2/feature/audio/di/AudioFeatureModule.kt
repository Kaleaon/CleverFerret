package com.cleverferret.v2.feature.audio.di

import com.cleverferret.v2.feature.audio.api.AudioFeatureApi
import com.cleverferret.v2.feature.audio.services.audio.DefaultAudioFeatureApi

object AudioFeatureModule {
    fun provideAudioFeatureApi(): AudioFeatureApi = DefaultAudioFeatureApi()
}

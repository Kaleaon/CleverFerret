package com.cleverferret.v2.feature.radio.di

import com.cleverferret.v2.feature.radio.api.RadioFeatureApi
import com.cleverferret.v2.feature.radio.services.radio.DefaultRadioFeatureApi

object RadioFeatureModule {
    fun provideRadioFeatureApi(): RadioFeatureApi = DefaultRadioFeatureApi()
}

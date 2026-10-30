package com.cleverferret.v2.feature.reader.di

import com.cleverferret.v2.feature.reader.api.ReaderFeatureApi
import com.cleverferret.v2.feature.reader.services.reader.DefaultReaderFeatureApi

object ReaderFeatureModule {
    fun provideReaderFeatureApi(): ReaderFeatureApi = DefaultReaderFeatureApi()
}

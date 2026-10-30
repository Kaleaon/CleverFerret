package com.cleverferret.v2.feature.ai.di

import com.cleverferret.v2.feature.ai.api.AiFeatureApi
import com.cleverferret.v2.feature.ai.api.MetadataAiUseCases
import com.cleverferret.v2.feature.ai.api.ReaderAiUseCases
import com.cleverferret.v2.feature.ai.usecase.DefaultAiFeatureApi

object AiFeatureModule {
    fun provideAiFeatureApi(
        readerAiUseCases: ReaderAiUseCases,
        metadataAiUseCases: MetadataAiUseCases,
    ): AiFeatureApi = DefaultAiFeatureApi(readerAiUseCases, metadataAiUseCases)
}

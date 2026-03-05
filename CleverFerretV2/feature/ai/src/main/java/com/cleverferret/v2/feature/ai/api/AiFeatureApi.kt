package com.cleverferret.v2.feature.ai.api


interface AiFeatureApi : ReaderAiUseCases, MetadataAiUseCases {
    fun featureKey(): String
}

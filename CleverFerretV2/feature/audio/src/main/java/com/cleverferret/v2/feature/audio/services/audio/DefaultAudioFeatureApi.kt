package com.cleverferret.v2.feature.audio.services.audio

import com.cleverferret.v2.feature.audio.api.AudioFeatureApi

class DefaultAudioFeatureApi : AudioFeatureApi {
    override fun featureKey(): String = "feature:audio"
}

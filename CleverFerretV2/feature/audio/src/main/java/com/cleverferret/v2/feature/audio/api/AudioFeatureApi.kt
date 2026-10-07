package com.cleverferret.v2.feature.audio.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class AudioNavDestination(val route: String) {
    data object Home : AudioNavDestination("audio/home")
    data object NowPlaying : AudioNavDestination("audio/now-playing")
    data object Queue : AudioNavDestination("audio/queue")
    data object Audiobooks : AudioNavDestination("audio/audiobooks")
    data object Podcasts : AudioNavDestination("audio/podcasts")
    data object Music : AudioNavDestination("audio/music")
}

interface AudioFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}

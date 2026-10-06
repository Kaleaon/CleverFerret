package com.cleverferret.v2.feature.radio.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class RadioNavDestination(val route: String) {
    data object Home : RadioNavDestination("radio/home")
    data class Station(val stationId: String) : RadioNavDestination("radio/station/$stationId") {
        companion object {
            const val ROUTE_PATTERN = "radio/station/{stationId}"
        }
    }
    data object Favorites : RadioNavDestination("radio/favorites")
}

interface RadioFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}

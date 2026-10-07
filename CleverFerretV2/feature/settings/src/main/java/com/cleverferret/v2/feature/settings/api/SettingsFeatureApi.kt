package com.cleverferret.v2.feature.settings.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class SettingsNavDestination(val route: String) {
    data object Home : SettingsNavDestination("settings/home")
    data object Reader : SettingsNavDestination("settings/reader")
    data object Playback : SettingsNavDestination("settings/playback")
    data object Network : SettingsNavDestination("settings/network")
    data object Security : SettingsNavDestination("settings/security")
    data object ImportExport : SettingsNavDestination("settings/import-export")
    data object About : SettingsNavDestination("settings/about")
}

interface SettingsFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}

package com.cleverferret.v2.feature.settings.services.settings

import com.cleverferret.v2.feature.settings.api.SettingsFeatureApi

class DefaultSettingsFeatureApi : SettingsFeatureApi {
    override fun featureKey(): String = "feature:settings"
}

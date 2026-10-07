package com.cleverferret.v2.feature.widgets.api

import com.cleverferret.v2.core.common.VersionedContract

interface WidgetsFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}

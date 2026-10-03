package com.cleverferret.v2.feature.radio.api

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.radio.services.radio.RadioStationResultV1

interface RadioFeatureApi {
    fun featureKey(): String
    fun resolveStation(stationQuery: String): IntegrationResult<RadioStationResultV1>
}

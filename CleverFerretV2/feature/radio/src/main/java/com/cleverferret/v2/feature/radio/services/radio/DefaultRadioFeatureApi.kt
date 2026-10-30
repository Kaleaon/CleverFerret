package com.cleverferret.v2.feature.radio.services.radio

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.radio.api.RadioFeatureApi

class DefaultRadioFeatureApi : RadioFeatureApi {
    override fun featureKey(): String = "feature:radio"

    override fun resolveStation(stationQuery: String): IntegrationResult<RadioStationResultV1> {
        return IntegrationResult.success(
            RadioStationResultV1(
                stationId = stationQuery,
                name = "Station $stationQuery",
                streamUrl = "http://radio.example.com/$stationQuery",
                codec = "mp3",
            )
        )
    }
}

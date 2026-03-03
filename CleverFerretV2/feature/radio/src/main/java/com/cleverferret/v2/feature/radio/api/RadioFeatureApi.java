package com.cleverferret.v2.feature.radio.api;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.radio.services.radio.RadioStationResultV1;

public interface RadioFeatureApi {
    String featureKey();

    IntegrationResult<RadioStationResultV1> resolveStation(String stationQuery);
}

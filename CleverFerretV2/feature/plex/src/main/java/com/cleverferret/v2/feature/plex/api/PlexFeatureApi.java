package com.cleverferret.v2.feature.plex.api;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.plex.services.plex.PlexSyncResultV1;

public interface PlexFeatureApi {
    String featureKey();

    IntegrationResult<PlexSyncResultV1> syncLibrary(String accessToken);
}

package com.cleverferret.v2.feature.metadata.api;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.metadata.services.metadata.MetadataLookupResultV1;

public interface MetadataFeatureApi {
    String featureKey();

    IntegrationResult<MetadataLookupResultV1> fetchMetadata(String query);
}

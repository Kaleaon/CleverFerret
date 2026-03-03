package com.cleverferret.v2.feature.opds.api;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.opds.services.opds.OpdsCatalogResultV1;

public interface OpdsFeatureApi {
    String featureKey();

    IntegrationResult<OpdsCatalogResultV1> fetchCatalog(String catalogUrl);
}

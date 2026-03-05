package com.cleverferret.v2.feature.opds.api

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.opds.services.opds.OpdsCatalogResultV1

interface OpdsFeatureApi {
    fun featureKey(): String
    fun fetchCatalog(catalogUrl: String): IntegrationResult<OpdsCatalogResultV1>
}

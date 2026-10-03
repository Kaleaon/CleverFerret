package com.cleverferret.v2.feature.metadata.api

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.metadata.services.metadata.MetadataLookupResultV1

interface MetadataFeatureApi {
    fun featureKey(): String
    fun fetchMetadata(query: String): IntegrationResult<MetadataLookupResultV1>
}

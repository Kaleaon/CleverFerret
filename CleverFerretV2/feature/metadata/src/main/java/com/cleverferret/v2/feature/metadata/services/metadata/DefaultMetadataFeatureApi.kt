package com.cleverferret.v2.feature.metadata.services.metadata

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.metadata.api.MetadataFeatureApi

class DefaultMetadataFeatureApi : MetadataFeatureApi {
    override fun featureKey(): String = "feature:metadata"

    override fun fetchMetadata(query: String): IntegrationResult<MetadataLookupResultV1> {
        return IntegrationResult.success(
            MetadataLookupResultV1(
                source = "default",
                title = "Metadata for $query",
                creator = "Unknown",
                description = "Metadata lookup result for $query",
            )
        )
    }
}

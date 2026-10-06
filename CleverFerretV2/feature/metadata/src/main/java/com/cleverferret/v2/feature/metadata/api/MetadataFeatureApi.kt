package com.cleverferret.v2.feature.metadata.api

import com.cleverferret.v2.core.common.VersionedContract
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.metadata.services.metadata.MetadataLookupResultV1

sealed class MetadataNavDestination(val route: String) {
    data class Editor(val itemId: String) : MetadataNavDestination("metadata/editor/$itemId") {
        companion object {
            const val ROUTE_PATTERN = "metadata/editor/{itemId}"
        }
    }
}

interface MetadataFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
    fun fetchMetadata(query: String): IntegrationResult<MetadataLookupResultV1>
}

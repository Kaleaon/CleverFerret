package com.cleverferret.v2.feature.collections.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class CollectionsNavDestination(val route: String) {
    data class Detail(val collectionId: String) : CollectionsNavDestination("library/collection/$collectionId") {
        companion object {
            const val ROUTE_PATTERN = "library/collection/{collectionId}"
        }
    }
}

interface CollectionsFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}

package com.cleverferret.v2.feature.opds.api

import com.cleverferret.v2.core.common.VersionedContract
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.opds.model.OpdsFlowResultV1
import com.cleverferret.v2.feature.opds.services.opds.OpdsCatalogResultV1

sealed class OpdsNavDestination(val route: String) {
    data object Catalog : OpdsNavDestination("discover/opds")
    data class Detail(val entryId: String) : OpdsNavDestination("opds/detail/$entryId") {
        companion object {
            const val ROUTE_PATTERN = "opds/detail/{entryId}"
        }
    }
}

interface OpdsFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
    fun fetchCatalog(catalogUrl: String): IntegrationResult<OpdsCatalogResultV1>
    fun browseDownloadAndImport(catalogUrl: String, entryId: String): IntegrationResult<OpdsFlowResultV1>
}

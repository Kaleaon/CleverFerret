package com.cleverferret.v2.feature.opds.services.opds

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.core.network.error.ErrorStateMapper
import com.cleverferret.v2.core.network.resilience.AppErrorException
import com.cleverferret.v2.feature.opds.api.OpdsFeatureApi
import com.cleverferret.v2.feature.opds.model.OpdsFlowResultV1

class DefaultOpdsFeatureApi(
    private val orchestrator: OpdsBackendOrchestrator,
) : OpdsFeatureApi {

    override fun featureKey(): String = "feature.opds"

    override fun fetchCatalog(catalogUrl: String): IntegrationResult<OpdsCatalogResultV1> {
        return try {
            val feed = orchestrator.fetchCatalog(catalogUrl)
            IntegrationResult.success(
                OpdsCatalogResultV1(
                    catalogId = feed.catalogId,
                    title = feed.title,
                    entryIds = feed.entries.map { it.id },
                )
            )
        } catch (error: AppErrorException) {
            IntegrationResult.failure(error.error, ErrorStateMapper.toUserFacingState(error.error))
        } catch (error: Exception) {
            val appError = AppError.UnknownFailure("OPDS catalog request failed", error)
            IntegrationResult.failure(appError, UserFacingState.UNKNOWN_ERROR)
        }
    }

    override fun browseDownloadAndImport(catalogUrl: String, entryId: String): IntegrationResult<OpdsFlowResultV1> =
        orchestrator.browseDownloadAndImport(catalogUrl, entryId)

}

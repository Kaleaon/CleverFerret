package com.cleverferret.v2.feature.opds.services.opds

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.core.network.error.ErrorStateMapper
import com.cleverferret.v2.core.network.resilience.AppErrorException
import com.cleverferret.v2.core.network.resilience.JitteredExponentialRetryPolicy
import com.cleverferret.v2.core.network.resilience.RetryExecutor
import com.cleverferret.v2.feature.opds.model.DownloadLifecycleRecordV1
import com.cleverferret.v2.feature.opds.model.OpdsFlowResultV1

class OpdsBackendOrchestrator(
    private val httpClient: OpdsHttpClient,
    private val parser: OpdsFeedParser,
    private val lifecycleStore: DownloadLifecycleStore,
    private val libraryImportGateway: LibraryImportGateway,
    private val retryExecutor: RetryExecutor = RetryExecutor(JitteredExponentialRetryPolicy()),
) {

    fun browseDownloadAndImport(catalogUrl: String, entryId: String): IntegrationResult<OpdsFlowResultV1> {
        return try {
            val feed = fetchCatalog(catalogUrl)
            val entry = feed.entries.firstOrNull { it.id == entryId }
                ?: return IntegrationResult.failure(
                    AppError.ExternalServiceFailure("Requested entry not found", "opds", "ENTRY_NOT_FOUND"),
                    UserFacingState.UNAVAILABLE,
                )

            val acquisitionLink = entry.acquisitionLinks.firstOrNull { it.href.isNotBlank() }
                ?: return IntegrationResult.failure(
                    AppError.ExternalServiceFailure("Unsupported acquisition link", "opds", "UNSUPPORTED_ACQUISITION"),
                    UserFacingState.UNAVAILABLE,
                )

            val downloadId = lifecycleStore.createQueued(acquisitionLink.href)
            lifecycleStore.markDownloading(downloadId)
            val bytes = retryExecutor.execute {
                runCatching { httpClient.download(acquisitionLink.href) }
                    .getOrElse { throw AppErrorException(mapTransportFailure(it)) }
            }
            if (bytes.isEmpty()) {
                lifecycleStore.markFailed(downloadId, "Download payload was empty")
                return IntegrationResult.failure(
                    AppError.ExternalServiceFailure("Downloaded file was empty", "opds", "EMPTY_DOWNLOAD"),
                    UserFacingState.DATA_UNREADABLE,
                )
            }

            lifecycleStore.markVerifying(downloadId)
            val localUri = "file:///opds/${downloadId}.bin"
            lifecycleStore.markImportedAtomically(downloadId, localUri)
            val importedId = libraryImportGateway.importFile(localUri, entry.title, entry.authors)
            val lifecycle = lifecycleStore.get(downloadId)
                ?: DownloadLifecycleRecordV1(downloadId, com.cleverferret.v2.feature.opds.model.DownloadLifecycleStatusV1.IMPORTED, acquisitionLink.href, localUri, null)

            IntegrationResult.success(
                OpdsFlowResultV1(
                    catalogTitle = feed.title,
                    importedLibraryItemId = importedId,
                    lifecycle = lifecycle,
                )
            )
        } catch (error: AppErrorException) {
            val appError = error.error
            IntegrationResult.failure(appError, ErrorStateMapper.toUserFacingState(appError))
        } catch (error: Exception) {
            val appError = AppError.UnknownFailure("Unexpected OPDS flow failure", error)
            IntegrationResult.failure(appError, UserFacingState.UNKNOWN_ERROR)
        }
    }

    fun fetchCatalog(catalogUrl: String) = retryExecutor.execute {
        val response = runCatching { httpClient.get(catalogUrl) }
            .getOrElse { throw AppErrorException(mapTransportFailure(it)) }
        when (response.code) {
            401 -> throw AppErrorException(AppError.AuthenticationFailure("Authentication required", "opds"))
            403 -> throw AppErrorException(AppError.AuthorizationFailure("Forbidden", "opds"))
            404 -> throw AppErrorException(AppError.ExternalServiceFailure("Catalog not found", "opds", "HTTP_404"))
        }
        if (response.code !in 200..299) {
            throw AppErrorException(
                AppError.TransportFailure(
                    message = "HTTP ${response.code}",
                    httpStatus = response.code,
                    timeout = response.code == 408,
                )
            )
        }
        parser.parse(catalogUrl, response.body)
    }

    private fun mapTransportFailure(error: Throwable): AppError {
        val message = error.message ?: "Network request failed"
        return if (message.contains("timeout", ignoreCase = true)) {
            AppError.TransportFailure("Network timeout", 408, timeout = true)
        } else {
            AppError.TransportFailure(message, 503, timeout = false)
        }
    }
}

package com.cleverferret.v2.feature.opds.di

import com.cleverferret.v2.feature.opds.api.OpdsFeatureApi
import com.cleverferret.v2.feature.opds.services.opds.*

object OpdsFeatureModule {
    fun provideOpdsFeatureApi(
        orchestrator: OpdsBackendOrchestrator? = null,
    ): OpdsFeatureApi {
        val activeOrchestrator = orchestrator ?: createDefaultOrchestrator()
        return DefaultOpdsFeatureApi(activeOrchestrator)
    }

    private fun createDefaultOrchestrator(): OpdsBackendOrchestrator {
        val dummyHttpClient = object : OpdsHttpClient {
            override fun get(url: String) = OpdsHttpClient.HttpResponse(200, "")
            override fun download(url: String) = ByteArray(0)
        }
        val dummyLifecycleStore = object : DownloadLifecycleStore {
            override fun createQueued(sourceUrl: String) = "dl-1"
            override fun markDownloading(downloadId: String) {}
            override fun markVerifying(downloadId: String) {}
            override fun markImportedAtomically(downloadId: String, localFileUri: String) {}
            override fun markFailed(downloadId: String, reason: String) {}
            override fun get(downloadId: String): com.cleverferret.v2.feature.opds.model.DownloadLifecycleRecordV1? = null
        }
        val dummyImportGateway = LibraryImportGateway { _, _, _ -> "item-1" }
        return OpdsBackendOrchestrator(
            httpClient = dummyHttpClient,
            parser = OpdsFeedParser(),
            lifecycleStore = dummyLifecycleStore,
            libraryImportGateway = dummyImportGateway,
        )
    }
}

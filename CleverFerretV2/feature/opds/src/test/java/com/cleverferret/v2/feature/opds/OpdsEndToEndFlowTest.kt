package com.cleverferret.v2.feature.opds

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.opds.model.DownloadLifecycleRecordV1
import com.cleverferret.v2.feature.opds.model.DownloadLifecycleStatusV1
import com.cleverferret.v2.feature.opds.services.opds.DownloadLifecycleStore
import com.cleverferret.v2.feature.opds.services.opds.LibraryImportGateway
import com.cleverferret.v2.feature.opds.services.opds.OpdsBackendOrchestrator
import com.cleverferret.v2.feature.opds.services.opds.OpdsFeedParser
import com.cleverferret.v2.feature.opds.services.opds.OpdsHttpClient
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertIs

class OpdsEndToEndFlowTest {

    @Test
    fun `executes catalog to import lifecycle`() {
        val fakeHttp = FakeHttpClient()
        val lifecycleStore = InMemoryLifecycleStore()
        val fakeImport = LibraryImportGateway { _, title, _ -> "library-$title" }
        val orchestrator = OpdsBackendOrchestrator(fakeHttp, OpdsFeedParser(), lifecycleStore, fakeImport)

        val result = orchestrator.browseDownloadAndImport("https://example.org/opds", "entry-1")

        val success = assertIs<IntegrationResult.Success<*>>(result)
        val flow = success.value as com.cleverferret.v2.feature.opds.model.OpdsFlowResultV1
        assertEquals("Demo Feed", flow.catalogTitle)
        assertEquals(DownloadLifecycleStatusV1.IMPORTED, flow.lifecycle.status)
        assertEquals("file:///opds/dl-1.bin", flow.lifecycle.localFileUri)
    }

    private class FakeHttpClient : OpdsHttpClient {
        override fun get(url: String): OpdsHttpClient.HttpResponse = OpdsHttpClient.HttpResponse(
            200,
            """
                <feed xmlns="http://www.w3.org/2005/Atom">
                    <title>Demo Feed</title>
                    <entry>
                        <id>entry-1</id>
                        <title>Demo Book</title>
                        <author><name>Tester</name></author>
                        <link rel="http://opds-spec.org/acquisition" href="https://example.org/book.epub" type="application/epub+zip" />
                    </entry>
                </feed>
            """.trimIndent()
        )

        override fun download(url: String): ByteArray = "book".encodeToByteArray()
    }

    private class InMemoryLifecycleStore : DownloadLifecycleStore {
        private val records = linkedMapOf<String, DownloadLifecycleRecordV1>()
        private var next = 1

        override fun createQueued(sourceUrl: String): String {
            val id = "dl-${next++}"
            records[id] = DownloadLifecycleRecordV1(id, DownloadLifecycleStatusV1.QUEUED, sourceUrl, null, null)
            return id
        }

        override fun markDownloading(downloadId: String) {
            update(downloadId, DownloadLifecycleStatusV1.DOWNLOADING)
        }

        override fun markVerifying(downloadId: String) {
            update(downloadId, DownloadLifecycleStatusV1.VERIFYING)
        }

        override fun markImportedAtomically(downloadId: String, localFileUri: String) {
            records[downloadId] = records.getValue(downloadId).copy(status = DownloadLifecycleStatusV1.IMPORTED, localFileUri = localFileUri, failureReason = null)
        }

        override fun markFailed(downloadId: String, reason: String) {
            records[downloadId] = records.getValue(downloadId).copy(status = DownloadLifecycleStatusV1.FAILED, failureReason = reason)
        }

        override fun get(downloadId: String): DownloadLifecycleRecordV1? = records[downloadId]

        private fun update(downloadId: String, status: DownloadLifecycleStatusV1) {
            records[downloadId] = records.getValue(downloadId).copy(status = status)
        }
    }
}

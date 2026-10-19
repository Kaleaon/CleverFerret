package com.universalmedialibrary.services.fanfiction

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.services.fanfiction.adapters.AO3Adapter
import com.universalmedialibrary.services.fanfiction.adapters.BaseFanfictionAdapter
import com.universalmedialibrary.services.fanfiction.adapters.FFNAdapter
import com.universalmedialibrary.services.fanfiction.adapters.RoyalRoadAdapter
import com.universalmedialibrary.services.fanfiction.models.Chapter
import com.universalmedialibrary.services.fanfiction.models.StoryMetadata
import com.universalmedialibrary.services.fanfiction.models.UpdateInfo
import kotlinx.coroutines.runBlocking
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Protocol
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.junit.Assert.assertThrows
import org.junit.Test

class BaseFanfictionAdapterTest {

    private class TestFanfictionAdapter(httpClient: OkHttpClient) : BaseFanfictionAdapter(httpClient) {
        override val siteName: String = "Test Site"
        override val baseUrl: String = "https://example.com"
        override fun canHandle(url: String): Boolean = url.startsWith(baseUrl)
        override suspend fun extractMetadata(url: String): Result<StoryMetadata> =
            Result.failure(NotImplementedError())
        override suspend fun downloadChapters(
            url: String,
            progressCallback: (Int, Int, String) -> Unit
        ): Result<List<Chapter>> = Result.failure(NotImplementedError())
        override suspend fun checkForUpdates(storyId: String, lastChapter: Int): Result<UpdateInfo> =
            Result.failure(NotImplementedError())
        override fun extractStoryId(url: String): String? = "123"

        public suspend fun testFetchDocument(url: String) = fetchDocument(url)
        public fun testCountWords(text: String) = countWords(text)
    }

    @Test
    fun `countWords accurately counts words split by whitespace`() {
        val client = OkHttpClient()
        val adapter = TestFanfictionAdapter(client)

        assertThat(adapter.testCountWords("Hello world")).isEqualTo(2)
        assertThat(adapter.testCountWords("   Multiple    spaces   between   words  ")).isEqualTo(4)
        assertThat(adapter.testCountWords("One\ntwo\tthree\r\nfour")).isEqualTo(4)
        assertThat(adapter.testCountWords("   ")).isEqualTo(0)
        assertThat(adapter.testCountWords("")).isEqualTo(0)
    }

    @Test
    fun `fetchDocument sends user agent header and parses HTML response`() = runBlocking {
        var capturedUserAgent: String? = null

        val client = OkHttpClient.Builder()
            .addInterceptor { chain ->
                val request = chain.request()
                capturedUserAgent = request.header("User-Agent")
                Response.Builder()
                    .request(request)
                    .protocol(Protocol.HTTP_1_1)
                    .code(200)
                    .message("OK")
                    .body(
                        "<html><body><h2 class=\"title\">Test Work Title</h2></body></html>"
                            .toResponseBody("text/html".toMediaType())
                    )
                    .build()
            }
            .build()

        val adapter = TestFanfictionAdapter(client)
        val doc = adapter.testFetchDocument("https://example.com/works/123")

        assertThat(capturedUserAgent).isEqualTo("CleverFerret/1.0 (Android)")
        assertThat(doc.select("h2.title").text()).isEqualTo("Test Work Title")
    }

    @Test
    fun `fetchDocument throws Exception on HTTP error code`() {
        val client = OkHttpClient.Builder()
            .addInterceptor { chain ->
                val request = chain.request()
                Response.Builder()
                    .request(request)
                    .protocol(Protocol.HTTP_1_1)
                    .code(404)
                    .message("Not Found")
                    .body("Error".toResponseBody("text/html".toMediaType()))
                    .build()
            }
            .build()

        val adapter = TestFanfictionAdapter(client)
        val exception = assertThrows(Exception::class.java) {
            runBlocking {
                adapter.testFetchDocument("https://example.com/works/404")
            }
        }

        assertThat(exception.message).contains("HTTP error: 404")
    }

    @Test
    fun `adapters inherit from BaseFanfictionAdapter`() {
        val client = OkHttpClient()
        val ao3 = AO3Adapter(client)
        val royalRoad = RoyalRoadAdapter(client)
        val ffn = FFNAdapter(client)

        assertThat(ao3).isInstanceOf(BaseFanfictionAdapter::class.java)
        assertThat(royalRoad).isInstanceOf(BaseFanfictionAdapter::class.java)
        assertThat(ffn).isInstanceOf(BaseFanfictionAdapter::class.java)
    }
}

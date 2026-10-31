package com.universalmedialibrary.services.metadata.covers

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.repository.APIKeyRepository
import io.mockk.mockk
import kotlinx.coroutines.runBlocking
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Protocol
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.junit.Test

class BaseCoverSourceTest {

    private class TestCoverSource(httpClient: OkHttpClient) : BaseCoverSource(httpClient) {
        override val sourceName: String = "Test Cover Source"
        override val priority: Int = 1
        override suspend fun searchCover(isbn: String?, title: String?, author: String?): Result<CoverResult?> = Result.success(null)

        public fun testBuildSearchQuery(isbn: String?, title: String?, author: String?): String = buildSearchQuery(isbn, title, author)
    }

    @Test
    fun `downloadCover succeeds on HTTP 200 and returns byte array`() = runBlocking {
        val expectedBytes = "fake image bytes".toByteArray()
        val client = OkHttpClient.Builder()
            .addInterceptor { chain ->
                val request = chain.request()
                Response.Builder()
                    .request(request)
                    .protocol(Protocol.HTTP_1_1)
                    .code(200)
                    .message("OK")
                    .body(expectedBytes.toResponseBody("image/jpeg".toMediaType()))
                    .build()
            }
            .build()

        val coverSource = TestCoverSource(client)
        val result = coverSource.downloadCover("https://example.com/cover.jpg")

        assertThat(result.isSuccess).isTrue()
        assertThat(result.getOrNull()).isEqualTo(expectedBytes)
    }

    @Test
    fun `downloadCover fails on HTTP 404 response`() = runBlocking {
        val client = OkHttpClient.Builder()
            .addInterceptor { chain ->
                val request = chain.request()
                Response.Builder()
                    .request(request)
                    .protocol(Protocol.HTTP_1_1)
                    .code(404)
                    .message("Not Found")
                    .body("Missing".toResponseBody("text/plain".toMediaType()))
                    .build()
            }
            .build()

        val coverSource = TestCoverSource(client)
        val result = coverSource.downloadCover("https://example.com/cover.jpg")

        assertThat(result.isFailure).isTrue()
        assertThat(result.exceptionOrNull()?.message).contains("HTTP error: 404")
    }

    @Test
    fun `buildSearchQuery encodes ISBN title and author parameters`() {
        val client = OkHttpClient()
        val coverSource = TestCoverSource(client)

        assertThat(coverSource.testBuildSearchQuery("978-0132350884", "Clean Code", "Robert C. Martin"))
            .isEqualTo("978-0132350884")

        assertThat(coverSource.testBuildSearchQuery(null, "Clean Code", "Robert C. Martin"))
            .isEqualTo("Clean+Code+Robert+C.+Martin")

        assertThat(coverSource.testBuildSearchQuery(null, "Clean Code", null))
            .isEqualTo("Clean+Code")

        assertThat(coverSource.testBuildSearchQuery(null, null, null))
            .isEmpty()
    }

    @Test
    fun `getCoverUrl default implementation returns Result with null`() = runBlocking {
        val client = OkHttpClient()
        val coverSource = TestCoverSource(client)
        val result = coverSource.getCoverUrl("12345")

        assertThat(result.isSuccess).isTrue()
        assertThat(result.getOrNull()).isNull()
    }

    @Test
    fun `cover sources inherit from BaseCoverSource`() {
        val client = OkHttpClient()
        val apiKeyRepo = mockk<APIKeyRepository>(relaxed = true)

        val apple = AppleBooksCoverSource(client)
        val amazon = AmazonCoverSource(client)
        val google = GoogleBooksCoverSource(client, apiKeyRepo)

        assertThat(apple).isInstanceOf(BaseCoverSource::class.java)
        assertThat(amazon).isInstanceOf(BaseCoverSource::class.java)
        assertThat(google).isInstanceOf(BaseCoverSource::class.java)
    }
}

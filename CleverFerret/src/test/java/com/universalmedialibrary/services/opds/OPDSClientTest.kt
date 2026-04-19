package com.universalmedialibrary.services.opds

import kotlinx.coroutines.test.runTest
import okhttp3.Interceptor
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Protocol
import okhttp3.Request
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.util.concurrent.atomic.AtomicInteger

class OPDSClientTest {

    @Test
    fun `parses fixture with unescaped ampersands and malformed entities`() = runTest {
        val fixture = loadFixture("internet_archive_malformed_entities.xml")
        val client = OPDSClient(clientWithScriptedResponses(listOf(response(200, fixture))))

        val feed = client.fetchFeed("https://archive.org/services/opds")

        assertEquals("Internet Archive Books", feed.title)
        assertEquals(1, feed.entries.size)
        assertEquals("Alpha & Omega", feed.entries.first().title)
        assertTrue(feed.entries.first().acquisitionLinks.first().href.contains("foo=1&bar=2"))
    }

    @Test
    fun `parses fixture containing orphan numeric entity prefix`() = runTest {
        val fixture = loadFixture("orphan_numeric_entity.xml")
        val client = OPDSClient(clientWithScriptedResponses(listOf(response(200, fixture))))

        val feed = client.fetchFeed("https://example.com/opds")

        assertEquals("Malformed Numeric Entity Feed", feed.title)
        assertEquals(1, feed.entries.size)
        assertEquals("Entry with &#oops", feed.entries.first().title)
    }

    @Test
    fun `retries transient http failure and succeeds`() = runTest {
        val attempts = AtomicInteger(0)
        val client = OPDSClient(
            OkHttpClient.Builder()
                .addInterceptor { chain ->
                    val count = attempts.incrementAndGet()
                    if (count == 1) {
                        response(503, "Service unavailable", chain.request())
                    } else {
                        response(200, minimalFeed("Retry Success"), chain.request())
                    }
                }
                .build()
        )

        val feed = client.fetchFeed("https://retry.example/opds")

        assertEquals("Retry Success", feed.title)
        assertEquals(2, attempts.get())
    }

    @Test
    fun `does not retry non transient http failure`() = runTest {
        val attempts = AtomicInteger(0)
        val client = OPDSClient(
            OkHttpClient.Builder()
                .addInterceptor { chain ->
                    attempts.incrementAndGet()
                    response(404, "Not Found", chain.request())
                }
                .build()
        )

        val failure = runCatching {
            client.fetchFeed("https://retry.example/opds")
        }.exceptionOrNull()

        assertTrue(failure is IllegalStateException)
        assertTrue(failure?.message?.contains("HTTP 404") == true)
        assertEquals(1, attempts.get())
    }

    @Test
    fun `keeps fatal parsing failures explicit without retry`() = runTest {
        val attempts = AtomicInteger(0)
        val client = OPDSClient(
            OkHttpClient.Builder()
                .addInterceptor { chain ->
                    attempts.incrementAndGet()
                    response(200, "<html>not opds</html>", chain.request())
                }
                .build()
        )

        val failure = runCatching {
            client.fetchFeed("https://retry.example/opds")
        }.exceptionOrNull()

        assertTrue(failure is IllegalStateException)
        assertTrue(failure?.message?.contains("Malformed OPDS feed") == true)
        assertEquals(1, attempts.get())
    }

    private fun loadFixture(name: String): String {
        val stream = javaClass.classLoader?.getResourceAsStream("opds/$name")
            ?: error("Missing fixture: $name")
        return stream.bufferedReader().use { it.readText() }
    }

    private fun clientWithScriptedResponses(responses: List<Response>): OkHttpClient {
        val index = AtomicInteger(0)
        return OkHttpClient.Builder()
            .addInterceptor(Interceptor { chain ->
                val i = index.getAndIncrement().coerceAtMost(responses.lastIndex)
                val source = responses[i]
                source.newBuilder().request(chain.request()).build()
            })
            .build()
    }

    private fun minimalFeed(title: String): String = """
        <?xml version="1.0" encoding="utf-8"?>
        <feed xmlns="http://www.w3.org/2005/Atom">
            <title>$title</title>
            <entry>
                <title>Book</title>
                <link rel="http://opds-spec.org/acquisition" href="https://example.com/book.epub" type="application/epub+zip"/>
            </entry>
        </feed>
    """.trimIndent()

    private fun response(
        code: Int,
        body: String,
        request: Request = Request.Builder().url("https://example.com").build()
    ): Response {
        return Response.Builder()
            .request(request)
            .protocol(Protocol.HTTP_1_1)
            .code(code)
            .message(if (code in 200..299) "OK" else "Error")
            .body(body.toResponseBody("application/atom+xml".toMediaType()))
            .build()
    }
}

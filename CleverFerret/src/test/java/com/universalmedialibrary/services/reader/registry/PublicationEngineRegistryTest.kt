package com.universalmedialibrary.services.reader.registry

import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class PublicationEngineRegistryTest {

    @Test
    fun `routes to highest ranked parser deterministically`() = runBlocking {
        val detector = object : PublicationDetector {
            override suspend fun detect(request: PublicationRequest): DetectionResult {
                return DetectionResult(
                    extension = "epub",
                    mimeType = "application/epub+zip",
                    signature = SignatureInfo(isZip = true),
                    candidates = emptyList()
                )
            }
        }

        val a = fakeAdapter("a-parser", setOf("epub"), parseSucceeds = true)
        val b = fakeAdapter("b-parser", setOf("epub"), parseSucceeds = true)

        val registry = PublicationEngineRegistry(detector, listOf(b, a, FallbackParserAdapter()))

        val result = registry.route(PublicationRequest(path = "/tmp/book.epub"))
        assertTrue(result is ParserResult.Success)
        assertEquals("a-parser", (result as ParserResult.Success).parserId)
    }

    @Test
    fun `falls back with structured error when candidates fail`() = runBlocking {
        val detector = object : PublicationDetector {
            override suspend fun detect(request: PublicationRequest): DetectionResult {
                return DetectionResult(
                    extension = "bin",
                    mimeType = "application/octet-stream",
                    signature = SignatureInfo(),
                    candidates = emptyList()
                )
            }
        }

        val failing = fakeAdapter("failing-parser", setOf("bin"), parseSucceeds = false)
        val registry = PublicationEngineRegistry(detector, listOf(failing, FallbackParserAdapter()))

        val result = registry.route(PublicationRequest(path = "/tmp/file.bin"))
        assertTrue(result is ParserResult.Failure)

        val failure = result as ParserResult.Failure
        assertEquals(RoutingStage.FALLBACK, failure.error.stage)
        assertEquals("UNSUPPORTED_PUBLICATION", failure.error.code)
    }

    private fun fakeAdapter(
        id: String,
        extensions: Set<String>,
        parseSucceeds: Boolean
    ): EngineAdapter {
        return object : EngineAdapter {
            override val id: String = id
            override val descriptor: EngineDescriptor = EngineDescriptor(
                displayName = id,
                extensions = extensions,
                mimeTypes = emptySet(),
                readiness = ReadinessFlag.READY,
                firstClass = true
            )

            override fun supports(extension: String, mimeType: String?): Boolean = extension in descriptor.extensions

            override fun signatureScore(signature: SignatureInfo): Int = if (signature.isZip) 10 else 0

            override suspend fun parse(request: PublicationRequest): ParserResult {
                return if (parseSucceeds) {
                    ParserResult.Success(id, Unit)
                } else {
                    ParserResult.Failure(
                        id,
                        RoutingError(RoutingStage.RANKING, "FAILED", "failed")
                    )
                }
            }

            override suspend fun render(request: PublicationRequest, parserResult: ParserResult): RenderResult {
                return RenderResult.Success(id, Unit)
            }

            override suspend fun open(request: PublicationRequest): SessionResult {
                return SessionResult.Opened("$id:1", id)
            }

            override suspend fun close(sessionId: String) = Unit
        }
    }
}

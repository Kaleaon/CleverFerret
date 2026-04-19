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

    @Test
    fun `routes by extension when mime is absent`() = runBlocking {
        val detector = object : PublicationDetector {
            override suspend fun detect(request: PublicationRequest): DetectionResult {
                return DetectionResult(
                    extension = "mobi",
                    mimeType = null,
                    signature = SignatureInfo(),
                    candidates = emptyList()
                )
            }
        }

        val mobi = fakeAdapter("mobi-parser", setOf("mobi"), parseSucceeds = true)
        val pdf = fakeAdapter("pdf-parser", setOf("pdf"), parseSucceeds = true)
        val registry = PublicationEngineRegistry(detector, listOf(pdf, mobi, FallbackParserAdapter()))

        val result = registry.route(PublicationRequest(path = "/tmp/book.mobi"))
        assertTrue(result is ParserResult.Success)
        assertEquals("mobi-parser", (result as ParserResult.Success).parserId)
    }

    @Test
    fun `routes by mime when extension is unknown`() = runBlocking {
        val detector = object : PublicationDetector {
            override suspend fun detect(request: PublicationRequest): DetectionResult {
                return DetectionResult(
                    extension = "bin",
                    mimeType = "application/epub+zip",
                    signature = SignatureInfo(),
                    candidates = emptyList()
                )
            }
        }

        val epubMimeAdapter = fakeAdapter(
            id = "epub-parser",
            extensions = emptySet(),
            mimeTypes = setOf("application/epub+zip"),
            parseSucceeds = true
        )
        val generic = fakeAdapter("generic-parser", setOf("bin"), parseSucceeds = true)
        val registry = PublicationEngineRegistry(detector, listOf(generic, epubMimeAdapter, FallbackParserAdapter()))

        val result = registry.route(PublicationRequest(path = "/tmp/unknown.bin"))
        assertTrue(result is ParserResult.Success)
        assertEquals("epub-parser", (result as ParserResult.Success).parserId)
    }

    @Test
    fun `routes by signature when extension and mime do not match`() = runBlocking {
        val detector = object : PublicationDetector {
            override suspend fun detect(request: PublicationRequest): DetectionResult {
                return DetectionResult(
                    extension = "dat",
                    mimeType = "application/octet-stream",
                    signature = SignatureInfo(isZip = true),
                    candidates = emptyList()
                )
            }
        }

        val signatureAware = fakeAdapter("signature-parser", setOf("epub"), parseSucceeds = true, signatureScore = 60)
        val noSignature = fakeAdapter("generic-parser", setOf("txt"), parseSucceeds = true, signatureScore = 0)
        val registry = PublicationEngineRegistry(detector, listOf(noSignature, signatureAware, FallbackParserAdapter()))

        val result = registry.route(PublicationRequest(path = "/tmp/signed.dat"))
        assertTrue(result is ParserResult.Success)
        assertEquals("signature-parser", (result as ParserResult.Success).parserId)
    }

    private fun fakeAdapter(
        id: String,
        extensions: Set<String>,
        parseSucceeds: Boolean,
        mimeTypes: Set<String> = emptySet(),
        signatureScore: Int = 10
    ): EngineAdapter {
        return object : EngineAdapter {
            override val id: String = id
            override val descriptor: EngineDescriptor = EngineDescriptor(
                displayName = id,
                extensions = extensions,
                mimeTypes = mimeTypes,
                readiness = ReadinessFlag.READY,
                firstClass = true
            )

            override fun supports(extension: String, mimeType: String?): Boolean {
                return extension in descriptor.extensions || mimeType in descriptor.mimeTypes
            }

            override fun signatureScore(signature: SignatureInfo): Int = if (signature.isZip) signatureScore else 0

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

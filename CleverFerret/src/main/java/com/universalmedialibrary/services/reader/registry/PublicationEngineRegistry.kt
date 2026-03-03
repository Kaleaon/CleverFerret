package com.universalmedialibrary.services.reader.registry

import com.universalmedialibrary.parsers.DocumentParser
import com.universalmedialibrary.parsers.ParserFactory
import com.universalmedialibrary.services.comic.GeminiComicService
import com.universalmedialibrary.services.epub.ReadiumEpubService
import com.universalmedialibrary.services.epub.ReadiumPdfService
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File

interface PublicationDetector {
    suspend fun detect(request: PublicationRequest): DetectionResult
}

interface PublicationParser {
    val id: String
    val descriptor: EngineDescriptor

    fun supports(extension: String, mimeType: String?): Boolean
    fun signatureScore(signature: SignatureInfo): Int

    suspend fun parse(request: PublicationRequest): ParserResult
}

interface PublicationRenderer {
    suspend fun render(request: PublicationRequest, parserResult: ParserResult): RenderResult
}

interface PublicationSession {
    suspend fun open(request: PublicationRequest): SessionResult
    suspend fun close(sessionId: String)
}

data class PublicationRequest(
    val path: String,
    val mimeType: String? = null
) {
    val extension: String = path.substringAfterLast('.', "").lowercase()
}

data class DetectionResult(
    val extension: String,
    val mimeType: String?,
    val signature: SignatureInfo,
    val candidates: List<CandidateScore>
)

data class CandidateScore(
    val parserId: String,
    val score: Int,
    val readiness: ReadinessFlag
)

enum class ReadinessFlag {
    READY,
    LIMITED,
    EXPERIMENTAL
}

data class EngineDescriptor(
    val displayName: String,
    val extensions: Set<String>,
    val mimeTypes: Set<String>,
    val readiness: ReadinessFlag,
    val firstClass: Boolean
)

data class SignatureInfo(
    val isZip: Boolean = false,
    val isPdf: Boolean = false,
    val isRar: Boolean = false,
    val isDjvu: Boolean = false,
    val isMobiFamily: Boolean = false
)

sealed class ParserResult {
    data class Success(val parserId: String, val payload: Any?) : ParserResult()
    data class Failure(val parserId: String, val error: RoutingError) : ParserResult()
}

sealed class RenderResult {
    data class Success(val rendererId: String, val payload: Any?) : RenderResult()
    data class Failure(val rendererId: String, val error: RoutingError) : RenderResult()
}

sealed class SessionResult {
    data class Opened(val sessionId: String, val engineId: String) : SessionResult()
    data class Failed(val error: RoutingError) : SessionResult()
}

data class RoutingError(
    val stage: RoutingStage,
    val code: String,
    val message: String,
    val details: Map<String, String> = emptyMap(),
    val candidates: List<CandidateScore> = emptyList()
)

enum class RoutingStage {
    MIME_EXTENSION,
    SIGNATURE,
    RANKING,
    FALLBACK
}

class SignatureSniffingDetector : PublicationDetector {
    override suspend fun detect(request: PublicationRequest): DetectionResult = withContext(Dispatchers.IO) {
        val signature = sniffSignature(File(request.path))
        DetectionResult(
            extension = request.extension,
            mimeType = request.mimeType,
            signature = signature,
            candidates = emptyList()
        )
    }

    private fun sniffSignature(file: File): SignatureInfo {
        if (!file.exists() || !file.isFile) return SignatureInfo()

        val header = ByteArray(16)
        val count = file.inputStream().use { it.read(header) }
        if (count < 4) return SignatureInfo()

        val ascii = String(header, Charsets.US_ASCII)
        return SignatureInfo(
            isZip = header.startsWith(0x50, 0x4B, 0x03, 0x04),
            isPdf = ascii.startsWith("%PDF"),
            isRar = header.startsWith(0x52, 0x61, 0x72, 0x21),
            isDjvu = ascii.startsWith("AT&TFORM"),
            isMobiFamily = ascii.contains("BOOKMOBI")
        )
    }

    private fun ByteArray.startsWith(vararg bytes: Int): Boolean {
        if (size < bytes.size) return false
        for (index in bytes.indices) {
            if (this[index].toInt() and 0xFF != bytes[index]) return false
        }
        return true
    }
}

class PublicationEngineRegistry(
    private val detector: PublicationDetector,
    private val adapters: List<EngineAdapter>
) {

    suspend fun route(request: PublicationRequest): ParserResult {
        val detection = detector.detect(request)

        val ranked = adapters
            .map { adapter ->
                val mimeExtScore = if (adapter.supports(detection.extension, detection.mimeType)) 100 else 0
                val signature = adapter.signatureScore(detection.signature)
                CandidateScore(adapter.id, mimeExtScore + signature, adapter.descriptor.readiness)
            }
            .sortedWith(compareByDescending<CandidateScore> { it.score }.thenBy { it.parserId })

        val eligible = ranked.filter { it.score > 0 }

        for (candidate in eligible) {
            val adapter = adapters.first { it.id == candidate.parserId }
            when (val result = adapter.parse(request)) {
                is ParserResult.Success -> return result
                is ParserResult.Failure -> {
                    if (candidate == eligible.last()) {
                        return ParserResult.Failure(
                            parserId = adapter.id,
                            error = result.error.copy(candidates = ranked)
                        )
                    }
                }
            }
        }

        val fallback = adapters.firstOrNull { it.id == FALLBACK_ADAPTER_ID }
            ?: return ParserResult.Failure(
                parserId = "none",
                error = RoutingError(
                    stage = RoutingStage.FALLBACK,
                    code = "NO_FALLBACK",
                    message = "No fallback parser adapter has been registered",
                    candidates = ranked
                )
            )

        return fallback.parse(request)
    }

    companion object {
        const val FALLBACK_ADAPTER_ID = "fallback-parser"
    }
}

interface EngineAdapter : PublicationParser, PublicationRenderer, PublicationSession

class ReadiumEpubAdapter(
    private val readiumEpubService: ReadiumEpubService
) : EngineAdapter {
    override val id: String = "readium-epub"
    override val descriptor: EngineDescriptor = EngineDescriptor(
        displayName = "Readium EPUB",
        extensions = setOf("epub"),
        mimeTypes = setOf("application/epub+zip"),
        readiness = ReadinessFlag.READY,
        firstClass = true
    )

    override fun supports(extension: String, mimeType: String?): Boolean {
        return extension in descriptor.extensions || mimeType in descriptor.mimeTypes
    }

    override fun signatureScore(signature: SignatureInfo): Int = if (signature.isZip) 20 else 0

    override suspend fun parse(request: PublicationRequest): ParserResult {
        val metadata = readiumEpubService.extractMetadata(request.path)
        return if (metadata != null) {
            ParserResult.Success(id, metadata)
        } else {
            ParserResult.Failure(
                id,
                RoutingError(RoutingStage.RANKING, "EPUB_PARSE_FAILED", "Readium EPUB parser failed")
            )
        }
    }

    override suspend fun render(request: PublicationRequest, parserResult: ParserResult): RenderResult {
        return RenderResult.Success(id, parserResult)
    }

    override suspend fun open(request: PublicationRequest): SessionResult {
        return SessionResult.Opened("epub:${request.path.hashCode()}", id)
    }

    override suspend fun close(sessionId: String) = Unit
}

class ReadiumPdfAdapter(
    private val readiumPdfService: ReadiumPdfService
) : EngineAdapter {
    override val id: String = "readium-pdf"
    override val descriptor: EngineDescriptor = EngineDescriptor(
        displayName = "Readium PDF",
        extensions = setOf("pdf"),
        mimeTypes = setOf("application/pdf"),
        readiness = ReadinessFlag.READY,
        firstClass = true
    )

    override fun supports(extension: String, mimeType: String?): Boolean {
        return extension in descriptor.extensions || mimeType in descriptor.mimeTypes
    }

    override fun signatureScore(signature: SignatureInfo): Int = if (signature.isPdf) 30 else 0

    override suspend fun parse(request: PublicationRequest): ParserResult {
        val metadata = readiumPdfService.extractMetadata(request.path)
        return if (metadata != null) {
            ParserResult.Success(id, metadata)
        } else {
            ParserResult.Failure(
                id,
                RoutingError(RoutingStage.RANKING, "PDF_PARSE_FAILED", "Readium PDF parser failed")
            )
        }
    }

    override suspend fun render(request: PublicationRequest, parserResult: ParserResult): RenderResult {
        return RenderResult.Success(id, parserResult)
    }

    override suspend fun open(request: PublicationRequest): SessionResult {
        return SessionResult.Opened("pdf:${request.path.hashCode()}", id)
    }

    override suspend fun close(sessionId: String) = Unit
}

class GeminiComicAdapter(
    private val geminiComicService: GeminiComicService
) : EngineAdapter {
    override val id: String = "gemini-comic"
    override val descriptor: EngineDescriptor = EngineDescriptor(
        displayName = "Gemini Comic",
        extensions = setOf("cbz", "cbr", "cbt", "cb7"),
        mimeTypes = setOf("application/vnd.comicbook+zip", "application/x-cbr"),
        readiness = ReadinessFlag.READY,
        firstClass = true
    )

    override fun supports(extension: String, mimeType: String?): Boolean {
        return extension in descriptor.extensions || mimeType in descriptor.mimeTypes
    }

    override fun signatureScore(signature: SignatureInfo): Int {
        return when {
            signature.isZip -> 20
            signature.isRar -> 20
            else -> 0
        }
    }

    override suspend fun parse(request: PublicationRequest): ParserResult {
        return ParserResult.Success(id, mapOf("path" to request.path, "service" to geminiComicService::class.simpleName.orEmpty()))
    }

    override suspend fun render(request: PublicationRequest, parserResult: ParserResult): RenderResult {
        return RenderResult.Success(id, parserResult)
    }

    override suspend fun open(request: PublicationRequest): SessionResult {
        return SessionResult.Opened("comic:${request.path.hashCode()}", id)
    }

    override suspend fun close(sessionId: String) = Unit
}

class ParserFactoryAdapter(
    override val id: String,
    override val descriptor: EngineDescriptor,
    private val parserSelector: (String) -> DocumentParser? = { fileName ->
        runCatching { ParserFactory.getParserForFileName(fileName) }.getOrNull()
    }
) : EngineAdapter {

    override fun supports(extension: String, mimeType: String?): Boolean {
        return extension in descriptor.extensions || mimeType in descriptor.mimeTypes
    }

    override fun signatureScore(signature: SignatureInfo): Int {
        return when {
            descriptor.extensions.any { it == "djvu" || it == "djv" } && signature.isDjvu -> 40
            descriptor.extensions.any { it == "mobi" || it == "azw" || it == "azw3" } && signature.isMobiFamily -> 40
            else -> 0
        }
    }

    override suspend fun parse(request: PublicationRequest): ParserResult {
        val parser = parserSelector(File(request.path).name)
            ?: return ParserResult.Failure(
                id,
                RoutingError(
                    stage = RoutingStage.RANKING,
                    code = "PARSER_NOT_AVAILABLE",
                    message = "No parser is available for ${request.path}"
                )
            )

        return runCatching { parser.parse(request.path) }
            .fold(
                onSuccess = { ParserResult.Success(id, it) },
                onFailure = {
                    ParserResult.Failure(
                        id,
                        RoutingError(
                            stage = RoutingStage.RANKING,
                            code = "PARSER_EXECUTION_FAILED",
                            message = it.message ?: "Unknown parser failure"
                        )
                    )
                }
            )
    }

    override suspend fun render(request: PublicationRequest, parserResult: ParserResult): RenderResult {
        return RenderResult.Success(id, parserResult)
    }

    override suspend fun open(request: PublicationRequest): SessionResult {
        return SessionResult.Opened("parser:${id}:${request.path.hashCode()}", id)
    }

    override suspend fun close(sessionId: String) = Unit
}

class FallbackParserAdapter : EngineAdapter {
    override val id: String = PublicationEngineRegistry.FALLBACK_ADAPTER_ID
    override val descriptor: EngineDescriptor = EngineDescriptor(
        displayName = "Structured Fallback",
        extensions = emptySet(),
        mimeTypes = emptySet(),
        readiness = ReadinessFlag.READY,
        firstClass = true
    )

    override fun supports(extension: String, mimeType: String?): Boolean = true

    override fun signatureScore(signature: SignatureInfo): Int = 1

    override suspend fun parse(request: PublicationRequest): ParserResult {
        return ParserResult.Failure(
            id,
            RoutingError(
                stage = RoutingStage.FALLBACK,
                code = "UNSUPPORTED_PUBLICATION",
                message = "Unable to route publication",
                details = mapOf("path" to request.path, "extension" to request.extension)
            )
        )
    }

    override suspend fun render(request: PublicationRequest, parserResult: ParserResult): RenderResult {
        return RenderResult.Failure(
            id,
            RoutingError(
                stage = RoutingStage.FALLBACK,
                code = "NOT_RENDERABLE",
                message = "Fallback parser result is not renderable"
            )
        )
    }

    override suspend fun open(request: PublicationRequest): SessionResult {
        return SessionResult.Failed(
            RoutingError(
                stage = RoutingStage.FALLBACK,
                code = "NO_SESSION",
                message = "Cannot open session with fallback parser"
            )
        )
    }

    override suspend fun close(sessionId: String) = Unit
}

object ReaderEngineAdapters {
    fun parserFactoryMobiAdapter(): ParserFactoryAdapter {
        return ParserFactoryAdapter(
            id = "mobi-family-parser",
            descriptor = EngineDescriptor(
                displayName = "MOBI/AZW/AZW3 Parser",
                extensions = setOf("mobi", "azw", "azw3"),
                mimeTypes = setOf("application/x-mobipocket-ebook", "application/vnd.amazon.ebook"),
                readiness = ReadinessFlag.READY,
                firstClass = true
            )
        )
    }

    fun parserFactoryDjvuAdapter(): ParserFactoryAdapter {
        return ParserFactoryAdapter(
            id = "djvu-parser",
            descriptor = EngineDescriptor(
                displayName = "DJVU Parser",
                extensions = setOf("djvu", "djv"),
                mimeTypes = setOf("image/vnd.djvu", "image/x-djvu"),
                readiness = ReadinessFlag.LIMITED,
                firstClass = true
            )
        )
    }
}

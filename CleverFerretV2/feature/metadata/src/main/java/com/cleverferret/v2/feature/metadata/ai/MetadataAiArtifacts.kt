package com.cleverferret.v2.feature.metadata.ai

import com.cleverferret.v2.core.network.ai.AiProviderId
import java.time.Instant
import java.util.concurrent.ConcurrentHashMap


data class MetadataAiArtifact(
    val mediaId: String,
    val contract: MetadataAiContract,
    val version: Int,
    val provider: AiProviderId,
    val payload: String,
    val generatedAt: Instant,
    val provenanceTag: String,
)

interface MetadataAiArtifactRepository {
    fun findLatest(mediaId: String, contract: MetadataAiContract): MetadataAiArtifact?
    fun saveNext(mediaId: String, contract: MetadataAiContract, provider: AiProviderId, payload: String, generatedAt: Instant): MetadataAiArtifact
}

class InMemoryMetadataAiArtifactRepository : MetadataAiArtifactRepository {
    private val values = ConcurrentHashMap<String, MutableList<MetadataAiArtifact>>()

    override fun findLatest(mediaId: String, contract: MetadataAiContract): MetadataAiArtifact? {
        return values[key(mediaId, contract)]?.maxByOrNull { it.version }
    }

    override fun saveNext(mediaId: String, contract: MetadataAiContract, provider: AiProviderId, payload: String, generatedAt: Instant): MetadataAiArtifact {
        val bucket = values.getOrPut(key(mediaId, contract)) { mutableListOf() }
        val version = (bucket.maxOfOrNull { it.version } ?: 0) + 1
        val artifact = MetadataAiArtifact(
            mediaId = mediaId,
            contract = contract,
            version = version,
            provider = provider,
            payload = payload,
            generatedAt = generatedAt,
            provenanceTag = "AI-generated • ${provider.name.lowercase()} • ${generatedAt}",
        )
        bucket += artifact
        return artifact
    }

    private fun key(mediaId: String, contract: MetadataAiContract): String = "$mediaId:${contract.contractId}"
}

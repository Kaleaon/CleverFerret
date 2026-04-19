package com.cleverferret.v2.feature.metadata.ai

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.core.network.ai.AiProviderGateway
import com.cleverferret.v2.core.network.ai.AiProviderId
import com.cleverferret.v2.core.network.ai.AiProviderRequest
import java.time.Instant
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.Executors
import java.util.concurrent.Future

class MetadataAiGenerationCoordinator(
    private val providers: List<AiProviderGateway>,
    private val settings: MetadataAiSettings,
    private val consentStore: MetadataAiConsentStore,
    private val privacyFilter: MetadataPromptPrivacyFilter,
    private val artifactRepository: MetadataAiArtifactRepository,
) {
    private val executor = Executors.newCachedThreadPool()
    private val jobs = ConcurrentHashMap<String, Future<IntegrationResult<MetadataAiArtifact>>>()

    fun requiresOptInScreen(): Boolean = !consentStore.hasOptedIn()

    fun submit(
        mediaId: String,
        contract: MetadataAiContract,
        sourceMetadata: String,
    ): MetadataAiJobHandle {
        val jobId = UUID.randomUUID().toString()
        val task = executor.submit<IntegrationResult<MetadataAiArtifact>> {
            generate(mediaId, contract, sourceMetadata)
        }
        jobs[jobId] = task
        return MetadataAiJobHandle(jobId)
    }

    fun cancel(handle: MetadataAiJobHandle): Boolean {
        return jobs.remove(handle.jobId)?.cancel(true) == true
    }

    fun await(handle: MetadataAiJobHandle): IntegrationResult<MetadataAiArtifact> {
        val result = jobs[handle.jobId]?.get()
            ?: return IntegrationResult.failure(
                AppError.UnknownFailure("Missing AI generation job: ${handle.jobId}", IllegalStateException("Unknown job")),
                UserFacingState.UNKNOWN_ERROR,
            )
        jobs.remove(handle.jobId)
        return result
    }

    private fun generate(mediaId: String, contract: MetadataAiContract, sourceMetadata: String): IntegrationResult<MetadataAiArtifact> {
        if (!consentStore.hasOptedIn()) {
            return IntegrationResult.failure(
                AppError.AuthorizationFailure("AI generation requires explicit opt-in", "feature:metadata"),
                UserFacingState.PERMISSION_DENIED,
            )
        }

        val prompt = privacyFilter.redact(MetadataAiPromptFactory.buildPrompt(contract, sourceMetadata))
        val provider = selectProvider()
            ?: return IntegrationResult.failure(
                AppError.ExternalServiceFailure("No AI provider available for mode=${settings.mode}", "feature:metadata", "NO_PROVIDER"),
                UserFacingState.TEMPORARILY_DEGRADED,
            )

        val response = provider.generate(
            AiProviderRequest(
                prompt = prompt,
                model = modelFor(provider.providerId()),
                temperature = 0.2,
                maxTokens = 1400,
                metadata = mapOf("contract" to contract.contractId, "mediaId" to mediaId),
            ),
        )

        return when (response) {
            is IntegrationResult.Success -> {
                val validation = MetadataAiSchemaValidator.validate(contract, response.value.content)
                IntegrationResult.success(
                    artifactRepository.saveNext(
                        mediaId = mediaId,
                        contract = contract,
                        provider = response.value.provider,
                        payload = validation.fallbackPayload,
                        generatedAt = Instant.now(),
                    ),
                )
            }

            is IntegrationResult.Failure -> response
        }
    }

    private fun selectProvider(): AiProviderGateway? {
        val eligible = when (settings.mode) {
            AiExecutionMode.LOCAL_ONLY -> providers.filter { it.providerId() == AiProviderId.OLLAMA }
            AiExecutionMode.CLOUD_ALLOWED -> providers
        }
        return eligible.firstOrNull { it.isAvailable() }
    }

    private fun modelFor(providerId: AiProviderId): String = when (providerId) {
        AiProviderId.OLLAMA -> settings.defaultLocalModel
        AiProviderId.OPENAI,
        AiProviderId.GEMINI,
        -> settings.defaultCloudModel
    }
}

data class MetadataAiJobHandle(val jobId: String)

// UI integration contracts for Ktheme layer.
data class MetadataAiPromptSheetState(
    val component: String = "BottomSheetDialog",
    val reducedMotion: Boolean,
    val motionSpeed: MotionToken = MotionToken.NORMAL,
)

data class MetadataAiResultCardModel(
    val component: String = "CollectionCard",
    val title: String,
    val body: String,
    val provenance: String,
)

data class MetadataAiGraphCardModel(
    val component: String = "GraphCard",
    val graphJson: String,
    val provenance: String,
)

enum class MotionToken {
    FAST,
    NORMAL,
    SLOW,
}

package com.cleverferret.v2.feature.metadata.usecase

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.api.MetadataAiUseCases
import com.cleverferret.v2.feature.ai.model.AiGenerationResult
import com.cleverferret.v2.feature.metadata.ai.MetadataAiArtifact
import com.cleverferret.v2.feature.metadata.ai.MetadataAiContract
import com.cleverferret.v2.feature.metadata.ai.MetadataAiGenerationCoordinator
import com.cleverferret.v2.feature.metadata.ai.MetadataAiJobHandle

class MetadataAiIntegrationUseCase(
    private val metadataAiUseCases: MetadataAiUseCases,
    private val generationCoordinator: MetadataAiGenerationCoordinator,
) {
    fun summarizeMetadataRecord(metadataText: String): IntegrationResult<AiGenerationResult> =
        metadataAiUseCases.summarizeMetadata("feature:metadata", metadataText)

    fun generateRecommendations(metadataText: String): IntegrationResult<AiGenerationResult> =
        metadataAiUseCases.recommendFromMetadata("feature:metadata", metadataText)

    fun submitBookInsights(mediaId: String, metadataText: String): MetadataAiJobHandle =
        generationCoordinator.submit(mediaId, MetadataAiContract.BOOK_INSIGHTS_SUMMARY, metadataText)

    fun submitCharacterThemes(mediaId: String, metadataText: String): MetadataAiJobHandle =
        generationCoordinator.submit(mediaId, MetadataAiContract.CHARACTER_THEME_EXTRACTION, metadataText)

    fun submitMindMap(mediaId: String, metadataText: String): MetadataAiJobHandle =
        generationCoordinator.submit(mediaId, MetadataAiContract.MIND_MAP_GRAPH, metadataText)

    fun submitRecommendationReasoning(mediaId: String, metadataText: String): MetadataAiJobHandle =
        generationCoordinator.submit(mediaId, MetadataAiContract.RECOMMENDATION_REASONING, metadataText)

    fun awaitJob(handle: MetadataAiJobHandle): IntegrationResult<MetadataAiArtifact> = generationCoordinator.await(handle)

    fun cancelJob(handle: MetadataAiJobHandle): Boolean = generationCoordinator.cancel(handle)

    fun shouldShowOptInScreen(): Boolean = generationCoordinator.requiresOptInScreen()
}

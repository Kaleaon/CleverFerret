package com.cleverferret.v2.feature.metadata.usecase

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.api.MetadataAiUseCases
import com.cleverferret.v2.feature.ai.model.AiGenerationResult

class MetadataAiIntegrationUseCase(private val metadataAiUseCases: MetadataAiUseCases) {
    fun summarizeMetadataRecord(metadataText: String): IntegrationResult<AiGenerationResult> =
        metadataAiUseCases.summarizeMetadata("feature:metadata", metadataText)

    fun generateRecommendations(metadataText: String): IntegrationResult<AiGenerationResult> =
        metadataAiUseCases.recommendFromMetadata("feature:metadata", metadataText)
}

package com.cleverferret.v2.feature.ai.usecase

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.api.MetadataAiUseCases
import com.cleverferret.v2.feature.ai.model.AiCapability
import com.cleverferret.v2.feature.ai.model.AiGenerationResult

class DefaultMetadataAiUseCases(
    private val aiExecutionEngine: AiExecutionEngine,
) : MetadataAiUseCases {
    override fun summarizeMetadata(requester: String, metadataText: String): IntegrationResult<AiGenerationResult> =
        aiExecutionEngine.execute(requester, AiCapability.SUMMARY, metadataText, 1000, 0.015)

    override fun recommendFromMetadata(requester: String, metadataText: String): IntegrationResult<AiGenerationResult> =
        aiExecutionEngine.execute(requester, AiCapability.RECOMMENDATIONS, metadataText, 1200, 0.02)
}

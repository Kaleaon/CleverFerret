package com.cleverferret.v2.feature.ai.usecase

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.api.ReaderAiUseCases
import com.cleverferret.v2.feature.ai.model.AiCapability
import com.cleverferret.v2.feature.ai.model.AiGenerationResult

class DefaultReaderAiUseCases(
    private val aiExecutionEngine: AiExecutionEngine,
) : ReaderAiUseCases {
    override fun summarizeSelection(requester: String, text: String): IntegrationResult<AiGenerationResult> =
        aiExecutionEngine.execute(requester, AiCapability.SUMMARY, text, 1200, 0.02)

    override fun analyzeCharacters(requester: String, text: String): IntegrationResult<AiGenerationResult> =
        aiExecutionEngine.execute(requester, AiCapability.CHARACTER_ANALYSIS, text, 1600, 0.03)

    override fun generateMindMap(requester: String, text: String): IntegrationResult<AiGenerationResult> =
        aiExecutionEngine.execute(requester, AiCapability.MIND_MAPS, text, 1400, 0.025)
}

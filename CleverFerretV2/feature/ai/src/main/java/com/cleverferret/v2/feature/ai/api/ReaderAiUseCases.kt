package com.cleverferret.v2.feature.ai.api

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.model.AiGenerationResult

interface ReaderAiUseCases {
    fun summarizeSelection(requester: String, text: String): IntegrationResult<AiGenerationResult>
    fun analyzeCharacters(requester: String, text: String): IntegrationResult<AiGenerationResult>
    fun generateMindMap(requester: String, text: String): IntegrationResult<AiGenerationResult>
}

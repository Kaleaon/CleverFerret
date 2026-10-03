package com.cleverferret.v2.feature.ai.api

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.model.AiGenerationResult

interface MetadataAiUseCases {
    fun summarizeMetadata(requester: String, metadataText: String): IntegrationResult<AiGenerationResult>
    fun recommendFromMetadata(requester: String, metadataText: String): IntegrationResult<AiGenerationResult>
}

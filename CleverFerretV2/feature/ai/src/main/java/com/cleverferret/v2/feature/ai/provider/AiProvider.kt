package com.cleverferret.v2.feature.ai.provider

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.model.AiGenerationResult
import com.cleverferret.v2.feature.ai.model.AiRequest

interface AiProvider {
    fun providerKey(): String
    fun isAvailable(): Boolean
    fun generate(request: AiRequest): IntegrationResult<AiGenerationResult>
}

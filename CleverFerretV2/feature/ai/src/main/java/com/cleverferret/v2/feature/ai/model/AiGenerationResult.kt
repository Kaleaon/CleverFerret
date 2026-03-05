package com.cleverferret.v2.feature.ai.model


data class AiGenerationResult(
    val content: String,
    val provider: String,
    val promptTokens: Int,
    val completionTokens: Int,
    val costUsd: Double,
    val fallbackUsed: Boolean
)

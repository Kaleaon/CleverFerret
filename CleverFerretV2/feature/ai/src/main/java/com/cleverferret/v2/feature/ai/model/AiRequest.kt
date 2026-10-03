package com.cleverferret.v2.feature.ai.model


data class AiRequest(
    val requester: String,
    val capability: AiCapability,
    val prompt: String,
    val maxTokens: Int,
    val maxCostUsd: Double
)

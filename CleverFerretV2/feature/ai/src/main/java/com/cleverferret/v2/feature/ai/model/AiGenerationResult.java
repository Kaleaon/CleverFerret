package com.cleverferret.v2.feature.ai.model;

public record AiGenerationResult(
        String content,
        String provider,
        int promptTokens,
        int completionTokens,
        double costUsd,
        boolean fallbackUsed
) {}

package com.cleverferret.v2.feature.ai.model;

public record AiRequest(
        String requester,
        AiCapability capability,
        String prompt,
        int maxTokens,
        double maxCostUsd
) {}

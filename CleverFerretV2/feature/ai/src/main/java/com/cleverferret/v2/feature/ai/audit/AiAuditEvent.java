package com.cleverferret.v2.feature.ai.audit;

import com.cleverferret.v2.feature.ai.model.AiCapability;

import java.time.Instant;

public record AiAuditEvent(
        Instant timestamp,
        String requester,
        String provider,
        AiCapability capability,
        boolean outbound,
        String status
) {}

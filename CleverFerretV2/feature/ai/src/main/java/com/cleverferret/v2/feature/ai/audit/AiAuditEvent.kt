package com.cleverferret.v2.feature.ai.audit

import com.cleverferret.v2.feature.ai.model.AiCapability
import java.time.Instant

data class AiAuditEvent(
    val timestamp: Instant,
    val requester: String,
    val provider: String,
    val capability: AiCapability,
    val outbound: Boolean,
    val status: String
)

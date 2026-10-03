package com.cleverferret.v2.feature.ai.audit


interface AiAuditLogRepository {
    fun append(event: AiAuditEvent): void
}

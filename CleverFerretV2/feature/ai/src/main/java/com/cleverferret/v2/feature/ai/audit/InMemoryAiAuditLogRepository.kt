package com.cleverferret.v2.feature.ai.audit

class InMemoryAiAuditLogRepository : AiAuditLogRepository {
    private val _events = mutableListOf<AiAuditEvent>()
    override fun append(event: AiAuditEvent) { _events += event }
    fun events(): List<AiAuditEvent> = _events.toList()
}

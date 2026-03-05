package com.cleverferret.v2.feature.ai.audit;

public interface AiAuditLogRepository {
    void append(AiAuditEvent event);
}

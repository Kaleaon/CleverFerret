package com.cleverferret.v2.feature.ai.audit;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class InMemoryAiAuditLogRepository implements AiAuditLogRepository {
    private final List<AiAuditEvent> events = new ArrayList<>();

    @Override
    public void append(AiAuditEvent event) {
        events.add(event);
    }

    public List<AiAuditEvent> events() {
        return Collections.unmodifiableList(events);
    }
}

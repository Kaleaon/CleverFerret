package com.cleverferret.v2.feature.ai.consent;

import com.cleverferret.v2.feature.ai.model.AiRequest;

public interface UserConsentGateway {
    boolean hasOutboundConsent(AiRequest request);
}

package com.cleverferret.v2.feature.ai.consent;

import com.cleverferret.v2.feature.ai.model.AiRequest;

public final class InMemoryUserConsentGateway implements UserConsentGateway {
    private final boolean consentGranted;

    public InMemoryUserConsentGateway(boolean consentGranted) {
        this.consentGranted = consentGranted;
    }

    @Override
    public boolean hasOutboundConsent(AiRequest request) {
        return consentGranted;
    }
}

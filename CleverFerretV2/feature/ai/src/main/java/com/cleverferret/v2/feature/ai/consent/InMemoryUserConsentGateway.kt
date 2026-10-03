package com.cleverferret.v2.feature.ai.consent

import com.cleverferret.v2.feature.ai.model.AiRequest

class InMemoryUserConsentGateway(private val consentGranted: Boolean) : UserConsentGateway {
    override fun hasOutboundConsent(request: AiRequest): Boolean = consentGranted
}

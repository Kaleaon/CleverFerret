package com.cleverferret.v2.feature.ai.consent

import com.cleverferret.v2.feature.ai.model.AiRequest

interface UserConsentGateway {
    fun hasOutboundConsent(request: AiRequest): Boolean
}

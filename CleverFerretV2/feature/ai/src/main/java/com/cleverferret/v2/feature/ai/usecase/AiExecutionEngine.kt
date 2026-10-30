package com.cleverferret.v2.feature.ai.usecase

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.audit.AiAuditEvent
import com.cleverferret.v2.feature.ai.audit.AiAuditLogRepository
import com.cleverferret.v2.feature.ai.budgeting.TokenCostBudgeter
import com.cleverferret.v2.feature.ai.consent.UserConsentGateway
import com.cleverferret.v2.feature.ai.model.*
import com.cleverferret.v2.feature.ai.privacy.PromptRedactionFilter
import com.cleverferret.v2.feature.ai.provider.AiProvider
import java.time.Instant

class AiExecutionEngine(
    providerOrder: List<AiProvider>,
    private val capabilityFlags: AiCapabilityFlags,
    private val budgeter: TokenCostBudgeter,
    private val redactionFilter: PromptRedactionFilter,
    private val consentGateway: UserConsentGateway,
    private val auditLogRepository: AiAuditLogRepository,
) {
    private val providerOrder = providerOrder.toList()

    fun execute(
        requester: String,
        capability: AiCapability,
        prompt: String,
        maxTokens: Int,
        maxCostUsd: Double,
    ): IntegrationResult<AiGenerationResult> {
        if (!capabilityFlags.isEnabled(capability)) {
            return IntegrationResult.failure(
                AppError.Throttled("Capability is disabled: $capability", "feature:ai"),
                UserFacingState.TEMPORARILY_DEGRADED
            )
        }
        val budgetDecision = budgeter.evaluate((prompt.length / 4).coerceAtLeast(1), maxTokens, maxCostUsd)
        if (!budgetDecision.approved) {
            return IntegrationResult.failure(
                AppError.Throttled("Budget check failed: ${budgetDecision.reason}", "feature:ai"),
                UserFacingState.RATE_LIMITED
            )
        }
        val request = AiRequest(requester, capability, redactionFilter.redact(prompt), maxTokens, maxCostUsd)
        if (!consentGateway.hasOutboundConsent(request)) {
            auditLogRepository.append(AiAuditEvent(Instant.now(), requester, "none", capability, false, "consent_denied"))
            return IntegrationResult.failure(
                AppError.AuthorizationFailure("User has not consented to outbound AI requests", "feature:ai"),
                UserFacingState.PERMISSION_DENIED
            )
        }
        for (provider in providerOrder) {
            if (!provider.isAvailable()) continue
            val providerResult = provider.generate(request)
            if (providerResult is IntegrationResult.Success<AiGenerationResult>) {
                auditLogRepository.append(AiAuditEvent(Instant.now(), requester, provider.providerKey(), capability, true, "success"))
                return providerResult
            }
        }
        return IntegrationResult.success(AiGenerationResult("Offline fallback", "offline-fallback", 0, 0, 0.0, true))
    }
}

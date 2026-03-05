package com.cleverferret.v2.feature.ai.usecase

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.api.AiFeatureApi
import com.cleverferret.v2.feature.ai.audit.AiAuditEvent
import com.cleverferret.v2.feature.ai.audit.AiAuditLogRepository
import com.cleverferret.v2.feature.ai.budgeting.TokenCostBudgeter
import com.cleverferret.v2.feature.ai.consent.UserConsentGateway
import com.cleverferret.v2.feature.ai.model.*
import com.cleverferret.v2.feature.ai.privacy.PromptRedactionFilter
import com.cleverferret.v2.feature.ai.provider.AiProvider
import java.time.Instant

class DefaultAiFeatureApi(
    providerOrder: List<AiProvider>,
    private val capabilityFlags: AiCapabilityFlags,
    private val budgeter: TokenCostBudgeter,
    private val redactionFilter: PromptRedactionFilter,
    private val consentGateway: UserConsentGateway,
    private val auditLogRepository: AiAuditLogRepository,
) : AiFeatureApi {
    private val providerOrder = providerOrder.toList()

    override fun featureKey(): String = "feature:ai"
    override fun summarizeSelection(requester: String, text: String) = execute(requester, AiCapability.SUMMARY, text, 1200, 0.02)
    override fun analyzeCharacters(requester: String, text: String) = execute(requester, AiCapability.CHARACTER_ANALYSIS, text, 1600, 0.03)
    override fun generateMindMap(requester: String, text: String) = execute(requester, AiCapability.MIND_MAPS, text, 1400, 0.025)
    override fun summarizeMetadata(requester: String, metadataText: String) = execute(requester, AiCapability.SUMMARY, metadataText, 1000, 0.015)
    override fun recommendFromMetadata(requester: String, metadataText: String) = execute(requester, AiCapability.RECOMMENDATIONS, metadataText, 1200, 0.02)

    private fun execute(requester: String, capability: AiCapability, prompt: String, maxTokens: Int, maxCostUsd: Double): IntegrationResult<AiGenerationResult> {
        if (!capabilityFlags.isEnabled(capability)) {
            return IntegrationResult.failure(AppError.Throttled("Capability is disabled: $capability", featureKey()), UserFacingState.TEMPORARILY_DEGRADED)
        }
        val budgetDecision = budgeter.evaluate((prompt.length / 4).coerceAtLeast(1), maxTokens, maxCostUsd)
        if (!budgetDecision.approved) {
            return IntegrationResult.failure(AppError.Throttled("Budget check failed: ${budgetDecision.reason}", featureKey()), UserFacingState.RATE_LIMITED)
        }
        val request = AiRequest(requester, capability, redactionFilter.redact(prompt), maxTokens, maxCostUsd)
        if (!consentGateway.hasOutboundConsent(request)) {
            auditLogRepository.append(AiAuditEvent(Instant.now(), requester, "none", capability, false, "consent_denied"))
            return IntegrationResult.failure(AppError.AuthorizationFailure("User has not consented to outbound AI requests", featureKey()), UserFacingState.PERMISSION_DENIED)
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

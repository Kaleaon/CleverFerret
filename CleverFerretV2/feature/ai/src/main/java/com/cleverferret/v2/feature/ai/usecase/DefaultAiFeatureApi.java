package com.cleverferret.v2.feature.ai.usecase;

import com.cleverferret.v2.core.common.error.AppError;
import com.cleverferret.v2.core.common.error.UserFacingState;
import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.ai.api.AiFeatureApi;
import com.cleverferret.v2.feature.ai.audit.AiAuditEvent;
import com.cleverferret.v2.feature.ai.audit.AiAuditLogRepository;
import com.cleverferret.v2.feature.ai.budgeting.BudgetDecision;
import com.cleverferret.v2.feature.ai.budgeting.TokenCostBudgeter;
import com.cleverferret.v2.feature.ai.consent.UserConsentGateway;
import com.cleverferret.v2.feature.ai.model.AiCapability;
import com.cleverferret.v2.feature.ai.model.AiCapabilityFlags;
import com.cleverferret.v2.feature.ai.model.AiGenerationResult;
import com.cleverferret.v2.feature.ai.model.AiRequest;
import com.cleverferret.v2.feature.ai.privacy.PromptRedactionFilter;
import com.cleverferret.v2.feature.ai.provider.AiProvider;

import java.time.Instant;
import java.util.List;

public final class DefaultAiFeatureApi implements AiFeatureApi {
    private final List<AiProvider> providerOrder;
    private final AiCapabilityFlags capabilityFlags;
    private final TokenCostBudgeter budgeter;
    private final PromptRedactionFilter redactionFilter;
    private final UserConsentGateway consentGateway;
    private final AiAuditLogRepository auditLogRepository;

    public DefaultAiFeatureApi(
            List<AiProvider> providerOrder,
            AiCapabilityFlags capabilityFlags,
            TokenCostBudgeter budgeter,
            PromptRedactionFilter redactionFilter,
            UserConsentGateway consentGateway,
            AiAuditLogRepository auditLogRepository
    ) {
        this.providerOrder = List.copyOf(providerOrder);
        this.capabilityFlags = capabilityFlags;
        this.budgeter = budgeter;
        this.redactionFilter = redactionFilter;
        this.consentGateway = consentGateway;
        this.auditLogRepository = auditLogRepository;
    }

    @Override
    public String featureKey() {
        return "feature:ai";
    }

    @Override
    public IntegrationResult<AiGenerationResult> summarizeSelection(String requester, String text) {
        return execute(requester, AiCapability.SUMMARY, text, 1200, 0.02);
    }

    @Override
    public IntegrationResult<AiGenerationResult> analyzeCharacters(String requester, String text) {
        return execute(requester, AiCapability.CHARACTER_ANALYSIS, text, 1600, 0.03);
    }

    @Override
    public IntegrationResult<AiGenerationResult> generateMindMap(String requester, String text) {
        return execute(requester, AiCapability.MIND_MAPS, text, 1400, 0.025);
    }

    @Override
    public IntegrationResult<AiGenerationResult> summarizeMetadata(String requester, String metadataText) {
        return execute(requester, AiCapability.SUMMARY, metadataText, 1000, 0.015);
    }

    @Override
    public IntegrationResult<AiGenerationResult> recommendFromMetadata(String requester, String metadataText) {
        return execute(requester, AiCapability.RECOMMENDATIONS, metadataText, 1200, 0.02);
    }

    private IntegrationResult<AiGenerationResult> execute(
            String requester,
            AiCapability capability,
            String prompt,
            int maxTokens,
            double maxCostUsd
    ) {
        if (!capabilityFlags.isEnabled(capability)) {
            return IntegrationResult.failure(
                    new AppError.Throttled("Capability is disabled: " + capability, featureKey()),
                    UserFacingState.TEMPORARILY_DEGRADED
            );
        }

        int estimatedPromptTokens = Math.max(1, prompt.length() / 4);
        BudgetDecision budgetDecision = budgeter.evaluate(estimatedPromptTokens, maxTokens, maxCostUsd);
        if (!budgetDecision.approved()) {
            return IntegrationResult.failure(
                    new AppError.Throttled("Budget check failed: " + budgetDecision.reason(), featureKey()),
                    UserFacingState.RATE_LIMITED
            );
        }

        String redactedPrompt = redactionFilter.redact(prompt);
        AiRequest request = new AiRequest(requester, capability, redactedPrompt, maxTokens, maxCostUsd);

        if (!consentGateway.hasOutboundConsent(request)) {
            auditLogRepository.append(new AiAuditEvent(Instant.now(), requester, "none", capability, false, "consent_denied"));
            return IntegrationResult.failure(
                    new AppError.AuthorizationFailure("User has not consented to outbound AI requests", featureKey()),
                    UserFacingState.PERMISSION_DENIED
            );
        }

        for (AiProvider provider : providerOrder) {
            if (!provider.isAvailable()) {
                continue;
            }
            IntegrationResult<AiGenerationResult> providerResult = provider.generate(request);
            if (providerResult instanceof IntegrationResult.Success<AiGenerationResult> success) {
                auditLogRepository.append(new AiAuditEvent(Instant.now(), requester, provider.providerKey(), capability, true, "success"));
                return success;
            }
        }

        auditLogRepository.append(new AiAuditEvent(Instant.now(), requester, "none", capability, false, "offline_fallback"));
        return IntegrationResult.success(offlineFallback(capability));
    }

    private AiGenerationResult offlineFallback(AiCapability capability) {
        String content = switch (capability) {
            case SUMMARY -> "Offline fallback summary: AI providers are unavailable, showing extracted highlights only.";
            case CHARACTER_ANALYSIS -> "Offline fallback character analysis: list named entities from local text parsing.";
            case RECOMMENDATIONS -> "Offline fallback recommendations: suggest items based on local genre and author matches.";
            case MIND_MAPS -> "Offline fallback mind map: return a simple outline generated from headings.";
        };
        return new AiGenerationResult(content, "offline-fallback", 0, 0, 0.0, true);
    }
}

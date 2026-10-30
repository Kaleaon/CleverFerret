package com.cleverferret.v2.feature.ai.usecase

import com.cleverferret.v2.feature.ai.api.AiFeatureApi
import com.cleverferret.v2.feature.ai.api.MetadataAiUseCases
import com.cleverferret.v2.feature.ai.api.ReaderAiUseCases
import com.cleverferret.v2.feature.ai.audit.AiAuditLogRepository
import com.cleverferret.v2.feature.ai.budgeting.TokenCostBudgeter
import com.cleverferret.v2.feature.ai.consent.UserConsentGateway
import com.cleverferret.v2.feature.ai.model.AiCapabilityFlags
import com.cleverferret.v2.feature.ai.privacy.PromptRedactionFilter
import com.cleverferret.v2.feature.ai.provider.AiProvider

class DefaultAiFeatureApi(
    private val readerAiUseCases: ReaderAiUseCases,
    private val metadataAiUseCases: MetadataAiUseCases,
) : AiFeatureApi,
    ReaderAiUseCases by readerAiUseCases,
    MetadataAiUseCases by metadataAiUseCases {

    constructor(
        providerOrder: List<AiProvider>,
        capabilityFlags: AiCapabilityFlags,
        budgeter: TokenCostBudgeter,
        redactionFilter: PromptRedactionFilter,
        consentGateway: UserConsentGateway,
        auditLogRepository: AiAuditLogRepository,
    ) : this(
        engine = AiExecutionEngine(
            providerOrder = providerOrder,
            capabilityFlags = capabilityFlags,
            budgeter = budgeter,
            redactionFilter = redactionFilter,
            consentGateway = consentGateway,
            auditLogRepository = auditLogRepository,
        )
    )

    private constructor(engine: AiExecutionEngine) : this(
        readerAiUseCases = DefaultReaderAiUseCases(engine),
        metadataAiUseCases = DefaultMetadataAiUseCases(engine),
    )

    override fun featureKey(): String = "feature:ai"
}

package com.cleverferret.v2.feature.metadata.ai

enum class AiExecutionMode {
    LOCAL_ONLY,
    CLOUD_ALLOWED,
}

interface MetadataAiConsentStore {
    fun hasOptedIn(): Boolean
    fun setOptIn(accepted: Boolean)
}

class InMemoryMetadataAiConsentStore : MetadataAiConsentStore {
    private var optedIn: Boolean = false
    override fun hasOptedIn(): Boolean = optedIn
    override fun setOptIn(accepted: Boolean) {
        optedIn = accepted
    }
}

data class MetadataAiSettings(
    val mode: AiExecutionMode,
    val defaultCloudModel: String = "gpt-4.1-mini",
    val defaultLocalModel: String = "llama3.2",
)

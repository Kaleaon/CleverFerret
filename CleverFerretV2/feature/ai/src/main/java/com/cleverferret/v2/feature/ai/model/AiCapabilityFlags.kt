package com.cleverferret.v2.feature.ai.model

class AiCapabilityFlags(flags: Map<AiCapability, Boolean>) {
    private val flags: Map<AiCapability, Boolean> = flags.toMap()

    fun isEnabled(capability: AiCapability): Boolean = flags.getOrDefault(capability, false)

    companion object {
        fun allEnabled(): AiCapabilityFlags = AiCapabilityFlags(AiCapability.entries.associateWith { true })
    }
}

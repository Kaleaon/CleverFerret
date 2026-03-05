package com.cleverferret.v2.feature.ai.model;

import java.util.EnumMap;
import java.util.Map;

public final class AiCapabilityFlags {
    private final Map<AiCapability, Boolean> flags;

    public AiCapabilityFlags(Map<AiCapability, Boolean> flags) {
        this.flags = new EnumMap<>(AiCapability.class);
        this.flags.putAll(flags);
    }

    public static AiCapabilityFlags allEnabled() {
        EnumMap<AiCapability, Boolean> values = new EnumMap<>(AiCapability.class);
        for (AiCapability capability : AiCapability.values()) {
            values.put(capability, true);
        }
        return new AiCapabilityFlags(values);
    }

    public boolean isEnabled(AiCapability capability) {
        return flags.getOrDefault(capability, false);
    }
}

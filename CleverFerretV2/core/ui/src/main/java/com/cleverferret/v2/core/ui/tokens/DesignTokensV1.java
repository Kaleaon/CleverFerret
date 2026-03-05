package com.cleverferret.v2.core.ui.tokens;

import java.util.Map;

/**
 * V1 semantic token contract for core:ui.
 */
public final class DesignTokensV1 {
    private DesignTokensV1() {}

    public static final Map<String, Integer> SPACING_DP = Map.ofEntries(
            Map.entry("space.0", 0),
            Map.entry("space.1", 4),
            Map.entry("space.2", 8),
            Map.entry("space.3", 12),
            Map.entry("space.4", 16),
            Map.entry("space.5", 20),
            Map.entry("space.6", 24),
            Map.entry("space.8", 32),
            Map.entry("space.10", 40),
            Map.entry("space.12", 48),
            Map.entry("space.16", 64)
    );

    public static final MotionDuration MOTION_DURATION = new MotionDuration(100, 200, 320);

    public record MotionDuration(int fastMs, int normalMs, int slowMs) {}

    public record ContrastTargets(double bodyTextMin, double largeTextMin, double interactiveMin, double focusIndicatorMin) {}

    public static final ContrastTargets CONTRAST_TARGETS = new ContrastTargets(4.5, 3.0, 3.0, 3.0);
}

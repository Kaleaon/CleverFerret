package com.cleverferret.v2.core.ui.accessibility;

import java.util.List;

/**
 * Accessibility acceptance criteria shared by component and navigation specs.
 */
public final class AccessibilityAcceptanceV1 {
    private AccessibilityAcceptanceV1() {}

    public static final double BODY_TEXT_CONTRAST_MIN = 4.5;
    public static final double LARGE_TEXT_CONTRAST_MIN = 3.0;
    public static final int DYNAMIC_TYPE_MAX_PERCENT = 200;

    public static final List<String> REQUIRED_CRITERIA = List.of(
            "TalkBack labels and roles are announced for interactive elements",
            "Dynamic type scaling remains usable from 100% to 200%",
            "Contrast targets meet minimum thresholds for text and controls",
            "Focus order follows logical reading order and is restored after dialogs"
    );
}

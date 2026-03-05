package com.cleverferret.v2.core.ui.accessibility

object AccessibilityAcceptanceV1 {
    const val BODY_TEXT_CONTRAST_MIN = 4.5
    const val LARGE_TEXT_CONTRAST_MIN = 3.0
    const val DYNAMIC_TYPE_MAX_PERCENT = 200

    val REQUIRED_CRITERIA = listOf(
        "TalkBack labels and roles are announced for interactive elements",
        "Dynamic type scaling remains usable from 100% to 200%",
        "Contrast targets meet minimum thresholds for text and controls",
        "Focus order follows logical reading order and is restored after dialogs",
    )
}

package com.universalmedialibrary.ui.media.theme

import android.animation.ValueAnimator
import androidx.compose.animation.EnterTransition
import androidx.compose.animation.ExitTransition
import androidx.compose.animation.core.tween
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.runtime.Composable

/**
 * Shared motion tokens/specs for media surfaces.
 */
object MediaMotion {
    private const val SECTION_DURATION_MS = 220
    private const val SECTION_BASE_STAGGER_MS = 45
    private const val SECTION_STAGGER_CAP_MS = 180
    private const val SECTION_SLIDE_OFFSET_DIVISOR = 10

    fun sectionEnter(sectionIndex: Int, reducedMotionEnabled: Boolean): EnterTransition {
        if (reducedMotionEnabled) return EnterTransition.None
        val delay = (sectionIndex * SECTION_BASE_STAGGER_MS).coerceAtMost(SECTION_STAGGER_CAP_MS)
        return fadeIn(
            animationSpec = tween(durationMillis = SECTION_DURATION_MS, delayMillis = delay)
        ) + slideInVertically(
            animationSpec = tween(durationMillis = SECTION_DURATION_MS, delayMillis = delay),
            initialOffsetY = { fullHeight -> fullHeight / SECTION_SLIDE_OFFSET_DIVISOR }
        )
    }

    fun sectionExit(reducedMotionEnabled: Boolean): ExitTransition {
        if (reducedMotionEnabled) return ExitTransition.None
        return fadeOut(animationSpec = tween(durationMillis = SECTION_DURATION_MS / 2)) +
            slideOutVertically(
                animationSpec = tween(durationMillis = SECTION_DURATION_MS / 2),
                targetOffsetY = { fullHeight -> fullHeight / 20 }
            )
    }
}

@Composable
fun isReducedMotionEnabled(): Boolean = !ValueAnimator.areAnimatorsEnabled()

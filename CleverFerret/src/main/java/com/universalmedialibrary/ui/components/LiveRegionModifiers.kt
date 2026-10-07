package com.universalmedialibrary.ui.components

import androidx.compose.ui.Modifier
import androidx.compose.ui.composed
import androidx.compose.ui.semantics.LiveRegionMode
import androidx.compose.ui.semantics.liveRegion
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.semantics.stateDescription
import com.cleverferret.core.designsystem.theme.LocalLiveRegionPolicy

/**
 * Extension modifier that attaches accessibility live region updates to composable semantics.
 * Resolves default [LiveRegionMode] from [LocalLiveRegionPolicy] if unsupplied.
 *
 * @param mode Optional explicit [LiveRegionMode] (e.g. Polite or Assertive).
 * @param stateDescription Optional state description string to announce.
 */
fun Modifier.liveRegionUpdate(
    mode: LiveRegionMode? = null,
    stateDescription: String? = null
): Modifier = composed {
    val policy = LocalLiveRegionPolicy.current
    val effectiveMode = mode ?: policy.toComposeLiveRegionMode()
    this.semantics {
        liveRegion = effectiveMode
        if (stateDescription != null) {
            this.stateDescription = stateDescription
        }
    }
}

/**
 * Extension modifier that binds dynamic state updates and live region accessibility announcements.
 * Allows TalkBack and screen readers to convey dynamic state changes without an explicit focus shift.
 *
 * @param stateDescription Human-readable text describing the dynamic state.
 * @param mode Optional explicit [LiveRegionMode]. Defaults to theme policy or Polite.
 */
fun Modifier.dynamicStateDescription(
    stateDescription: String,
    mode: LiveRegionMode? = null
): Modifier = composed {
    val policy = LocalLiveRegionPolicy.current
    val effectiveMode = mode ?: policy.toComposeLiveRegionMode()
    this.semantics {
        liveRegion = effectiveMode
        this.stateDescription = stateDescription
    }
}

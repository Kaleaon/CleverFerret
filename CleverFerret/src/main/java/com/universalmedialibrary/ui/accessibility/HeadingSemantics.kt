package com.universalmedialibrary.ui.accessibility

import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics

/**
 * Extension modifier that applies heading semantics (`SemanticsProperties.Heading`) to Compose UI elements.
 * Screen readers such as TalkBack use heading semantics for section title and landmark navigation.
 */
fun Modifier.headingSemantics(): Modifier = this.then(
    Modifier.semantics {
        heading()
    }
)

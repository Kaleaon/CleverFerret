package com.universalmedialibrary.ui.components.pin

/**
 * Describes a PIN unlock request for parental controls.
 *
 * @param title Human readable content title (e.g., story name).
 * @param rating Optional content rating string.
 * @param mediaType Optional media type (BOOK, STORY, MOVIE, etc.).
 * @param tags Optional tags associated with the content.
 * @param description Optional supporting text that explains why the PIN is required.
 */
data class PinChallenge(
    val title: String,
    val rating: String? = null,
    val mediaType: String? = null,
    val tags: List<String> = emptyList(),
    val description: String? = null
)

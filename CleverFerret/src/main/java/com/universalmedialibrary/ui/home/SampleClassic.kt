package com.universalmedialibrary.ui.home

import androidx.annotation.DrawableRes

/**
 * Metadata describing a freely-downloadable public domain sample from Project Gutenberg.
 */
data class SampleClassic(
    val id: String,
    val title: String,
    val author: String,
    val description: String,
    val downloadUrl: String,
    val fileName: String,
    @DrawableRes val coverRes: Int
)

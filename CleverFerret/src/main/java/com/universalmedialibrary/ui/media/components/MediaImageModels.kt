package com.universalmedialibrary.ui.media.components

import android.net.Uri
import androidx.annotation.DrawableRes
import com.universalmedialibrary.R
import java.io.File

internal object MediaImageModels {
    @DrawableRes
    const val PlaceholderRes: Int = R.drawable.placeholder_book_cover

    @DrawableRes
    const val ErrorRes: Int = R.drawable.placeholder_book_cover

    fun resolve(model: String?): Any? {
        val value = model?.trim().orEmpty()
        if (value.isEmpty()) return null

        val uri = Uri.parse(value)
        val scheme = uri.scheme?.lowercase()
        return when {
            scheme == "file" || scheme == "content" || scheme == "https" || scheme == "http" -> uri
            value.startsWith("/") -> Uri.fromFile(File(value))
            else -> null
        }
    }
}

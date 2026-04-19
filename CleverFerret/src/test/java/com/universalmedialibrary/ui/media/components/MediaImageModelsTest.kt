package com.universalmedialibrary.ui.media.components

import android.net.Uri
import com.google.common.truth.Truth.assertThat
import org.junit.Test

class MediaImageModelsTest {

    @Test
    fun resolvesAbsoluteHttpUris() {
        val model = MediaImageModels.resolve("https://example.com/cover.png")
        assertThat(model).isEqualTo(Uri.parse("https://example.com/cover.png"))
    }

    @Test
    fun resolvesAbsoluteFilePathsToFileUri() {
        val model = MediaImageModels.resolve("/storage/emulated/0/Pictures/cover.jpg") as Uri
        assertThat(model.scheme).isEqualTo("file")
    }

    @Test
    fun returnsNullForBadRelativeValue() {
        val model = MediaImageModels.resolve("cover.jpg")
        assertThat(model).isNull()
    }
}

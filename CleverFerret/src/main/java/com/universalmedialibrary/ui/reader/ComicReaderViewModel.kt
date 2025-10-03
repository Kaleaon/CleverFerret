package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject
import com.universalmedialibrary.services.gemini.GeminiService

@HiltViewModel
class ComicReaderViewModel @Inject constructor(
    private val geminiService: GeminiService
) : ViewModel() {

    suspend fun translatePage(bitmap: Bitmap, targetLanguage: String): String {
        if (!geminiService.isInitialized()) {
            geminiService.initialize()
        }
        return geminiService.translateComicPage(bitmap, targetLanguage)
    }
}

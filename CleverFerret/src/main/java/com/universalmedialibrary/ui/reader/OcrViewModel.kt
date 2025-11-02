package com.universalmedialibrary.ui.reader

import android.graphics.Bitmap
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.ocr.OcrRepository
import com.universalmedialibrary.services.ocr.OcrResult
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * ViewModel for handling OCR operations in readers
 */
@HiltViewModel
class OcrViewModel @Inject constructor(
    private val ocrRepository: OcrRepository
) : ViewModel() {

    private val _ocrState = MutableStateFlow<OcrState>(OcrState.Idle)
    val ocrState: StateFlow<OcrState> = _ocrState.asStateFlow()

    /**
     * Perform OCR on a bitmap image
     */
    fun recognizeText(
        bitmap: Bitmap,
        mediaItemId: String,
        pageNumber: Int = 0,
        useCache: Boolean = true
    ) {
        viewModelScope.launch {
            try {
                _ocrState.value = OcrState.Processing
                
                val result = ocrRepository.recognizeText(
                    bitmap = bitmap,
                    mediaItemId = mediaItemId,
                    pageNumber = pageNumber,
                    useCache = useCache
                )
                
                result.onSuccess { ocrResult ->
                    _ocrState.value = OcrState.Success(ocrResult)
                }.onFailure { error ->
                    _ocrState.value = OcrState.Error(
                        error.message ?: "OCR failed"
                    )
                }
            } catch (e: Exception) {
                _ocrState.value = OcrState.Error(
                    e.message ?: "Unexpected error"
                )
            }
        }
    }

    /**
     * Clear OCR result
     */
    fun clearResult() {
        _ocrState.value = OcrState.Idle
    }

    /**
     * Clear cache for a specific media item
     */
    fun clearCache(mediaItemId: String) {
        viewModelScope.launch {
            ocrRepository.clearCacheForMediaItem(mediaItemId)
        }
    }
}

/**
 * OCR UI state
 */
sealed class OcrState {
    object Idle : OcrState()
    object Processing : OcrState()
    data class Success(val result: OcrResult) : OcrState()
    data class Error(val message: String) : OcrState()
}

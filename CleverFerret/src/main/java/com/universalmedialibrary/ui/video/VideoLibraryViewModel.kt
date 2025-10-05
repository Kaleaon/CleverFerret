package com.universalmedialibrary.ui.video

import android.content.ContentUris
import android.content.Context
import android.net.Uri
import android.provider.MediaStore
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.MediaItem
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class VideoLibraryViewModel @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaItemDao: MediaItemDao
) : ViewModel() {

    private val _uiState = MutableStateFlow(VideoLibraryUiState())
    val uiState: StateFlow<VideoLibraryUiState> = _uiState.asStateFlow()

    init {
        scanVideos()
    }

    fun scanVideos() {
        viewModelScope.launch(Dispatchers.IO) {
            _uiState.value = _uiState.value.copy(isLoading = true)

            try {
                val videos = mutableListOf<VideoItem>()
                val projection = arrayOf(
                    MediaStore.Video.Media._ID,
                    MediaStore.Video.Media.TITLE,
                    MediaStore.Video.Media.DISPLAY_NAME,
                    MediaStore.Video.Media.DURATION,
                    MediaStore.Video.Media.SIZE,
                    MediaStore.Video.Media.RESOLUTION,
                    MediaStore.Video.Media.DATE_ADDED
                )

                context.contentResolver.query(
                    MediaStore.Video.Media.EXTERNAL_CONTENT_URI,
                    projection,
                    null,
                    null,
                    "${MediaStore.Video.Media.DATE_ADDED} DESC"
                )?.use { cursor ->
                    val idCol = cursor.getColumnIndexOrThrow(MediaStore.Video.Media._ID)
                    val titleCol = cursor.getColumnIndexOrThrow(MediaStore.Video.Media.TITLE)
                    val nameCol = cursor.getColumnIndexOrThrow(MediaStore.Video.Media.DISPLAY_NAME)
                    val durationCol = cursor.getColumnIndexOrThrow(MediaStore.Video.Media.DURATION)
                    val sizeCol = cursor.getColumnIndexOrThrow(MediaStore.Video.Media.SIZE)

                    while (cursor.moveToNext()) {
                        val id = cursor.getLong(idCol)
                        val title = cursor.getString(titleCol)
                        val displayName = cursor.getString(nameCol)
                        val duration = cursor.getLong(durationCol)
                        val size = cursor.getLong(sizeCol)
                        val contentUri: Uri = ContentUris.withAppendedId(
                            MediaStore.Video.Media.EXTERNAL_CONTENT_URI,
                            id
                        )

                        videos.add(
                            VideoItem(
                                id = id,
                                title = title ?: displayName,
                                displayName = displayName,
                                duration = duration,
                                size = size,
                                uri = contentUri
                            )
                        )
                    }
                }

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    videos = videos
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to scan videos: ${e.message}"
                )
            }
        }
    }

    fun clearError() {
        _uiState.value = _uiState.value.copy(error = null)
    }
}

data class VideoLibraryUiState(
    val isLoading: Boolean = false,
    val videos: List<VideoItem> = emptyList(),
    val error: String? = null
)

data class VideoItem(
    val id: Long,
    val title: String,
    val displayName: String,
    val duration: Long, // milliseconds
    val size: Long, // bytes
    val uri: Uri
)

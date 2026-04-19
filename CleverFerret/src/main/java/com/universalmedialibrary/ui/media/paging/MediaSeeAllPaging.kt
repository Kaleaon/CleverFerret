package com.universalmedialibrary.ui.media.paging

import androidx.paging.Pager
import androidx.paging.PagingConfig
import androidx.paging.PagingData
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.ui.media.components.MediaItem
import com.universalmedialibrary.ui.media.components.MediaType
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class MediaSeeAllPaging @Inject constructor(
    private val mediaItemDao: MediaItemDao
) {
    fun pagerFor(mediaType: String, pageSize: Int = 30): Flow<PagingData<MediaItem>> {
        return Pager(
            config = PagingConfig(pageSize = pageSize, enablePlaceholders = false),
            pagingSourceFactory = {
                MediaSectionPagingSource { limit, offset ->
                    mediaItemDao.getByType(mediaType.uppercase(), limit, offset).map { item ->
                        MediaItem(
                            id = item.itemId.toString(),
                            title = item.fileName,
                            subtitle = item.filePath,
                            imageUrl = item.thumbnailPath,
                            mediaType = mapType(item.mediaType)
                        )
                    }
                }
            }
        ).flow
    }

    private fun mapType(mediaType: String): MediaType = when (mediaType.uppercase()) {
        "BOOK", "EBOOK" -> MediaType.BOOK
        "AUDIOBOOK" -> MediaType.AUDIOBOOK
        "COMIC", "MANGA" -> MediaType.COMIC
        "MUSIC" -> MediaType.MUSIC
        "PODCAST" -> MediaType.PODCAST
        "MOVIE" -> MediaType.MOVIE
        "TV_SHOW" -> MediaType.TV_SHOW
        "DOCUMENT" -> MediaType.DOCUMENT
        else -> MediaType.UNKNOWN
    }
}

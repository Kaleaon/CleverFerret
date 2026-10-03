package com.universalmedialibrary.ui.media.paging

import androidx.paging.PagingSource
import androidx.paging.PagingState

class MediaSectionPagingSource<T : Any>(
    private val loader: suspend (limit: Int, offset: Int) -> List<T>
) : PagingSource<Int, T>() {

    override suspend fun load(params: LoadParams<Int>): LoadResult<Int, T> {
        return try {
            val offset = params.key ?: 0
            val pageSize = params.loadSize
            val items = loader(pageSize, offset)
            val nextKey = if (items.isEmpty()) null else offset + items.size
            val prevKey = if (offset == 0) null else (offset - pageSize).coerceAtLeast(0)
            LoadResult.Page(
                data = items,
                prevKey = prevKey,
                nextKey = nextKey
            )
        } catch (error: Throwable) {
            LoadResult.Error(error)
        }
    }

    override fun getRefreshKey(state: PagingState<Int, T>): Int? {
        val anchor = state.anchorPosition ?: return null
        val closestPage = state.closestPageToPosition(anchor) ?: return null
        return closestPage.prevKey?.plus(state.config.pageSize)
            ?: closestPage.nextKey?.minus(state.config.pageSize)
    }
}

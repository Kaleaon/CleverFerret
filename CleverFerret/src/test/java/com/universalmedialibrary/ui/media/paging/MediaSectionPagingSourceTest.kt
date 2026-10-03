package com.universalmedialibrary.ui.media.paging

import androidx.paging.PagingSource
import com.google.common.truth.Truth.assertThat
import kotlinx.coroutines.test.runTest
import org.junit.Test

class MediaSectionPagingSourceTest {

    @Test
    fun loadsBeyondTwentyItemsAcrossPages() = runTest {
        val data = (1..55).map { "item-$it" }
        val pagingSource = MediaSectionPagingSource<String> { limit, offset ->
            data.drop(offset).take(limit)
        }

        val page1 = pagingSource.load(
            PagingSource.LoadParams.Refresh(key = null, loadSize = 20, placeholdersEnabled = false)
        ) as PagingSource.LoadResult.Page
        val page2 = pagingSource.load(
            PagingSource.LoadParams.Append(key = page1.nextKey, loadSize = 20, placeholdersEnabled = false)
        ) as PagingSource.LoadResult.Page

        assertThat(page1.data).hasSize(20)
        assertThat(page2.data).hasSize(20)
        assertThat(page2.data.first()).isEqualTo("item-21")
    }
}

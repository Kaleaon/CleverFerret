package com.universalmedialibrary.ui.media.paging

import androidx.paging.PagingSource
import com.google.common.truth.Truth.assertThat
import kotlinx.coroutines.test.runTest
import org.junit.Test

class MediaSectionPagingIntegrationTest {

    @Test
    fun pagingSource_requestsExpectedLimitAndOffsetSequence() = runTest {
        val requested = mutableListOf<Pair<Int, Int>>()
        val data = (1..65).map { it }
        val pagingSource = MediaSectionPagingSource<Int> { limit, offset ->
            requested += limit to offset
            data.drop(offset).take(limit)
        }

        val first = pagingSource.load(
            PagingSource.LoadParams.Refresh(key = null, loadSize = 20, placeholdersEnabled = false)
        ) as PagingSource.LoadResult.Page
        val second = pagingSource.load(
            PagingSource.LoadParams.Append(key = first.nextKey, loadSize = 20, placeholdersEnabled = false)
        ) as PagingSource.LoadResult.Page
        val third = pagingSource.load(
            PagingSource.LoadParams.Append(key = second.nextKey, loadSize = 20, placeholdersEnabled = false)
        ) as PagingSource.LoadResult.Page

        assertThat(requested).containsExactly(20 to 0, 20 to 20, 20 to 40).inOrder()
        assertThat(first.data.first()).isEqualTo(1)
        assertThat(second.data.first()).isEqualTo(21)
        assertThat(third.data.first()).isEqualTo(41)
    }

    @Test
    fun pagingSource_returnsNullNextKeyOnFinalPage() = runTest {
        val data = (1..18).toList()
        val pagingSource = MediaSectionPagingSource<Int> { limit, offset ->
            data.drop(offset).take(limit)
        }

        val page = pagingSource.load(
            PagingSource.LoadParams.Refresh(key = null, loadSize = 20, placeholdersEnabled = false)
        ) as PagingSource.LoadResult.Page

        assertThat(page.data).hasSize(18)
        assertThat(page.nextKey).isNull()
    }
}

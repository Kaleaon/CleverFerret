package com.universalmedialibrary.services.opds

import android.content.Context
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.OPDSCatalogDao
import com.universalmedialibrary.utils.FileNameSanitizer
import io.mockk.MockKAnnotations
import io.mockk.coVerify
import io.mockk.every
import io.mockk.impl.annotations.MockK
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runTest
import okhttp3.OkHttpClient
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class OPDSDownloadServiceTest {

    @MockK
    lateinit var context: Context

    @MockK
    lateinit var catalogDao: OPDSCatalogDao

    @MockK
    lateinit var mediaItemDao: MediaItemDao

    @MockK
    lateinit var metadataDao: MetadataDao

    @MockK
    lateinit var fileNameSanitizer: FileNameSanitizer

    private lateinit var service: OPDSDownloadService

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        every { fileNameSanitizer.sanitizeFileName(any()) } answers { firstArg<String>() }
        service = OPDSDownloadService(
            context = context,
            catalogDao = catalogDao,
            mediaItemDao = mediaItemDao,
            metadataDao = metadataDao,
            httpClient = OkHttpClient(),
            fileNameSanitizer = fileNameSanitizer
        )
    }

    @Test
    fun `persistCompletedDownload marks completion atomically`() = runTest {
        service.persistCompletedDownload(downloadId = 9L, localPath = "/tmp/book.epub")

        coVerify(exactly = 1) { catalogDao.markDownloadCompleteAtomically(9L, "/tmp/book.epub", any()) }
    }
}

package com.universalmedialibrary.data

import android.os.Build
import androidx.room.Room
import androidx.test.core.app.ApplicationProvider
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.Library
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.annotation.Config

@RunWith(AndroidJUnit4::class)
@Config(sdk = [Build.VERSION_CODES.P])
class MediaItemDaoTest {

    private lateinit var database: AppDatabase
    private lateinit var mediaItemDao: MediaItemDao
    private var testLibraryId: Long = 0

    @Before
    fun setup() = runBlocking {
        // Using ApplicationProvider to get a context in a test environment with Robolectric
        val context = ApplicationProvider.getApplicationContext<android.content.Context>()
        database = Room.inMemoryDatabaseBuilder(context, AppDatabase::class.java)
            .allowMainThreadQueries()
            .build()
        mediaItemDao = database.mediaItemDao()
        
        // Create a test library for foreign key constraint
        testLibraryId = database.libraryDao().insertLibrary(
            Library(
                name = "Test Library",
                type = "BOOK",
                path = "/test/path"
            )
        )
    }

    @After
    fun teardown() {
        database.close()
    }

    @Test
    fun `insertMediaItem and getMediaItemById returns correct item`() = runBlocking {
        // ARRANGE
        val newItem = MediaItem(
            libraryId = testLibraryId,
            filePath = "/path/to/book.epub",
            fileName = "book.epub",
            fileExtension = "epub",
            fileSize = 1024000,
            mediaType = "BOOK"
        )

        // ACT
        val newId = mediaItemDao.insertMediaItem(newItem)
        val retrievedItem = mediaItemDao.getMediaItemById(newId)

        // ASSERT
        assertThat(retrievedItem).isNotNull()
        assertThat(retrievedItem?.itemId).isEqualTo(newId)
        assertThat(retrievedItem?.fileName).isEqualTo("book.epub")
        assertThat(retrievedItem?.mediaType).isEqualTo("BOOK")
    }

    @Test
    fun `getMediaItemsForLibrary returns items for specified library`() = runBlocking {
        // ARRANGE
        val item1 = MediaItem(
            libraryId = testLibraryId,
            filePath = "/path/to/book1.epub",
            fileName = "book1.epub",
            fileExtension = "epub",
            fileSize = 1024000,
            mediaType = "BOOK"
        )
        val item2 = MediaItem(
            libraryId = testLibraryId,
            filePath = "/path/to/book2.epub",
            fileName = "book2.epub",
            fileExtension = "epub",
            fileSize = 2048000,
            mediaType = "BOOK"
        )
        
        mediaItemDao.insertMediaItem(item1)
        mediaItemDao.insertMediaItem(item2)

        // ACT
        val allItems = mediaItemDao.getMediaItemsForLibrary(testLibraryId).first()

        // ASSERT
        assertThat(allItems).hasSize(2)
        assertThat(allItems.map { it.fileName }).containsExactly("book2.epub", "book1.epub").inOrder()
    }

    @Test
    fun `getMediaItemById returns null for non-existent item`() = runBlocking {
        // ACT
        val retrievedItem = mediaItemDao.getMediaItemById(999)

        // ASSERT
        assertThat(retrievedItem).isNull()
    }

    @Test
    fun `getItemCountForLibrary returns correct count`() = runBlocking {
        // ARRANGE
        val item1 = MediaItem(
            libraryId = testLibraryId,
            filePath = "/path/to/book1.epub",
            fileName = "book1.epub",
            fileExtension = "epub",
            fileSize = 1024000,
            mediaType = "BOOK"
        )
        val item2 = MediaItem(
            libraryId = testLibraryId,
            filePath = "/path/to/book2.epub",
            fileName = "book2.epub",
            fileExtension = "epub",
            fileSize = 2048000,
            mediaType = "BOOK"
        )
        
        mediaItemDao.insertMediaItem(item1)
        mediaItemDao.insertMediaItem(item2)

        // ACT
        val count = mediaItemDao.getItemCountForLibrary(testLibraryId)

        // ASSERT
        assertThat(count).isEqualTo(2)
    }

    @Test
    fun `updateMediaItem modifies existing item`() = runBlocking {
        // ARRANGE
        val item = MediaItem(
            libraryId = testLibraryId,
            filePath = "/path/to/book.epub",
            fileName = "book.epub",
            fileExtension = "epub",
            fileSize = 1024000,
            mediaType = "BOOK"
        )
        val itemId = mediaItemDao.insertMediaItem(item)
        
        // ACT
        val retrievedItem = mediaItemDao.getMediaItemById(itemId)!!
        val updatedItem = retrievedItem.copy(fileName = "updated_book.epub")
        mediaItemDao.updateMediaItem(updatedItem)
        val finalItem = mediaItemDao.getMediaItemById(itemId)

        // ASSERT
        assertThat(finalItem?.fileName).isEqualTo("updated_book.epub")
    }

    @Test
    fun `deleteMediaItem removes item from database`() = runBlocking {
        // ARRANGE
        val item = MediaItem(
            libraryId = testLibraryId,
            filePath = "/path/to/book.epub",
            fileName = "book.epub",
            fileExtension = "epub",
            fileSize = 1024000,
            mediaType = "BOOK"
        )
        val itemId = mediaItemDao.insertMediaItem(item)
        val insertedItem = mediaItemDao.getMediaItemById(itemId)!!
        
        // ACT
        mediaItemDao.deleteMediaItem(insertedItem)
        val deletedItem = mediaItemDao.getMediaItemById(itemId)

        // ASSERT
        assertThat(deletedItem).isNull()
    }
}

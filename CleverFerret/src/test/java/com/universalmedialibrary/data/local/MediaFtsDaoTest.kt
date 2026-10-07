package com.universalmedialibrary.data.local

import androidx.room.Room
import androidx.sqlite.db.SupportSQLiteDatabase
import androidx.test.core.app.ApplicationProvider
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.Tag
import com.universalmedialibrary.data.local.dao.MediaFtsDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataBook
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMusicTrack
import com.universalmedialibrary.data.local.entity.PlexMediaItem
import com.universalmedialibrary.data.local.entity.PlexServer
import com.universalmedialibrary.data.local.migrations.MIGRATION_46_47
import com.universalmedialibrary.services.search.EnhancedSearchService
import com.universalmedialibrary.services.search.SearchQuery
import io.mockk.every
import io.mockk.just
import io.mockk.mockk
import io.mockk.runs
import io.mockk.verify
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(manifest = Config.NONE)
class MediaFtsDaoTest {

    private lateinit var database: AppDatabase
    private lateinit var mediaFtsDao: MediaFtsDao
    private lateinit var mediaItemDao: MediaItemDao
    private lateinit var enhancedSearchService: EnhancedSearchService

    @Before
    fun setup() {
        val context = ApplicationProvider.getApplicationContext<android.content.Context>()
        database = Room.inMemoryDatabaseBuilder(context, AppDatabase::class.java)
            .allowMainThreadQueries()
            .build()
        mediaFtsDao = database.mediaFtsDao()
        mediaItemDao = database.mediaItemDao()
        enhancedSearchService = EnhancedSearchService(context, database)

        // Ensure triggers are active by executing migration 46_47 SQL or ensuring DB setup
        val openHelper = database.openHelper.writableDatabase
        MIGRATION_46_47.migrate(openHelper)
    }

    @After
    fun tearDown() {
        database.close()
    }

    @Test
    fun `migration 46 to 47 executes expected SQL`() {
        val mockDb = mockk<SupportSQLiteDatabase>()
        val executedSql = mutableListOf<String>()
        every { mockDb.execSQL(capture(executedSql)) } just runs

        MIGRATION_46_47.migrate(mockDb)

        assertThat(executedSql.any { it.contains("CREATE VIRTUAL TABLE IF NOT EXISTS `media_fts` USING fts") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE TRIGGER IF NOT EXISTS media_items_ai") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE TRIGGER IF NOT EXISTS media_items_ad") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE TRIGGER IF NOT EXISTS metadata_common_ai") }).isTrue()
        assertThat(executedSql.any { it.contains("CREATE TRIGGER IF NOT EXISTS plex_media_items_ai") }).isTrue()
    }

    @Test
    fun `fts search returns matching items across books, movies, music, and synced items`() = runBlocking {
        // Create library
        val libId = database.libraryDao().insertLibrary(
            Library(name = "Main Library", path = "/storage/media")
        )

        // Insert Book
        val bookItemId = mediaItemDao.insertMediaItem(
            MediaItem(libraryId = libId, filePath = "/books/tolkien.epub", fileName = "The Hobbit.epub", fileSize = 1000, mediaType = "BOOK")
        )
        database.metadataDao().insertMetadataCommon(
            MetadataCommon(itemId = bookItemId, title = "The Hobbit", summary = "In a hole in the ground there lived a hobbit.")
        )
        database.metadataDao().insertMetadataBook(
            MetadataBook(itemId = bookItemId, series = "Middle-earth", additionalAuthors = "J.R.R. Tolkien")
        )

        // Insert Movie
        val movieItemId = mediaItemDao.insertMediaItem(
            MediaItem(libraryId = libId, filePath = "/movies/lotr.mp4", fileName = "The Lord of the Rings.mp4", fileSize = 5000, mediaType = "MOVIE")
        )
        database.metadataDao().insertMetadataCommon(
            MetadataCommon(itemId = movieItemId, title = "The Lord of the Rings", summary = "An epic fantasy film directed by Peter Jackson.")
        )
        database.metadataDao().insertMetadataMovie(
            MetadataMovie(itemId = movieItemId, franchise = "Middle-earth")
        )

        // Insert Music Track
        val musicItemId = mediaItemDao.insertMediaItem(
            MediaItem(libraryId = libId, filePath = "/music/soundtrack.flac", fileName = "Hobbiton Theme.flac", fileSize = 200, mediaType = "MUSIC_TRACK")
        )
        database.metadataDao().insertMetadataCommon(
            MetadataCommon(itemId = musicItemId, title = "Hobbiton Theme")
        )
        database.metadataDao().insertMetadataMusicTrack(
            MetadataMusicTrack(itemId = musicItemId, artist = "Howard Shore", album = "Middle-earth Soundtracks")
        )

        // Insert Synced Plex Item
        val plexServerId = database.plexServerDao().insertServer(
            PlexServer(name = "Plex Home", serverId = "p123", url = "http://localhost:32400")
        )
        database.plexMediaItemDao().insertMediaItem(
            PlexMediaItem(serverId = plexServerId, plexRatingKey = "rk999", title = "Tolkien Documentary", type = "MOVIE", libraryName = "Plex Movies")
        )

        // Perform FTS prefix query for "Middle-earth"
        val resultsSeries = mediaFtsDao.searchFts("Middle*")
        assertThat(resultsSeries.size).isAtLeast(3)

        // Perform FTS search for "Hobbit"
        val resultsHobbit = mediaFtsDao.searchFts("Hobbit*")
        assertThat(resultsHobbit).isNotEmpty()
        val titles = resultsHobbit.map { it.title }
        assertThat(titles.any { it?.contains("Hobbit", ignoreCase = true) == true }).isTrue()

        // Perform search through EnhancedSearchService
        val searchResults = enhancedSearchService.search(SearchQuery(textQuery = "Hobbit"))
        assertThat(searchResults).isNotEmpty()
    }

    @Test
    fun `triggers automated update on metadata change`() = runBlocking {
        val libId = database.libraryDao().insertLibrary(Library(name = "Lib", path = "/path"))
        val itemId = mediaItemDao.insertMediaItem(
            MediaItem(libraryId = libId, filePath = "/books/dune.epub", fileName = "Dune.epub", fileSize = 100, mediaType = "BOOK")
        )

        // Initially search for Herbert -> no match
        var results = mediaFtsDao.searchFts("Herbert*")
        assertThat(results).isEmpty()

        // Insert metadata with author Frank Herbert
        database.metadataDao().insertMetadataBook(
            MetadataBook(itemId = itemId, additionalAuthors = "Frank Herbert", series = "Dune Chronicles")
        )

        // Search again -> should match automatically via trigger!
        results = mediaFtsDao.searchFts("Herbert*")
        assertThat(results).hasSize(1)
        assertThat(results[0].itemId).isEqualTo(itemId)

        // Search series
        val seriesResults = mediaFtsDao.searchFts("Chronicles*")
        assertThat(seriesResults).hasSize(1)
    }

    @Test
    fun `triggers automated delete on media item delete`() = runBlocking {
        val libId = database.libraryDao().insertLibrary(Library(name = "Lib", path = "/path"))
        val item = MediaItem(libraryId = libId, filePath = "/media/delete_me.mp4", fileName = "ToDelete.mp4", fileSize = 50, mediaType = "MOVIE")
        val itemId = mediaItemDao.insertMediaItem(item)

        var results = mediaFtsDao.searchFts("ToDelete*")
        assertThat(results).hasSize(1)

        // Delete the media item
        val createdItem = mediaItemDao.getMediaItemById(itemId)!!
        mediaItemDao.deleteMediaItem(createdItem)

        // Search again -> should be deleted from FTS index automatically via trigger!
        results = mediaFtsDao.searchFts("ToDelete*")
        assertThat(results).isEmpty()
    }

    @Test
    fun `user preference updates do not clear fts records`() = runBlocking {
        val libId = database.libraryDao().insertLibrary(Library(name = "Lib", path = "/path"))
        val itemId = mediaItemDao.insertMediaItem(
            MediaItem(libraryId = libId, filePath = "/books/starwars.epub", fileName = "Star Wars.epub", fileSize = 100, mediaType = "BOOK")
        )
        database.metadataDao().insertMetadataCommon(
            MetadataCommon(itemId = itemId, title = "Star Wars: Heir to the Empire", summary = "Grand Admiral Thrawn attacks.")
        )

        var results = mediaFtsDao.searchFts("Thrawn*")
        assertThat(results).hasSize(1)

        // Update user media preferences (e.g., isFavorite, playCount, lastPlayed)
        mediaItemDao.setFavorite(itemId, true)
        val currentItem = mediaItemDao.getMediaItemById(itemId)!!
        mediaItemDao.updateMediaItem(currentItem.copy(playCount = 5, lastPlayed = 999999L))

        // Verify FTS record is still present and intact!
        results = mediaFtsDao.searchFts("Thrawn*")
        assertThat(results).hasSize(1)
        assertThat(results[0].title).contains("Heir to the Empire")
    }
}

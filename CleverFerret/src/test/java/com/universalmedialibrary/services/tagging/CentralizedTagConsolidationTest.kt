package com.universalmedialibrary.services.tagging

import com.universalmedialibrary.data.local.dao.UnifiedTagDao
import com.universalmedialibrary.data.local.entity.ItemTag
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.local.entity.UnifiedTag
import com.universalmedialibrary.data.music.MusicTag
import com.universalmedialibrary.data.music.MusicTagRepository
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.mockito.kotlin.any
import org.mockito.kotlin.doAnswer
import org.mockito.kotlin.doReturn
import org.mockito.kotlin.mock
import org.mockito.kotlin.stub

class CentralizedTagConsolidationTest {

    private val tagsDb = mutableMapOf<Long, UnifiedTag>()
    private val itemTagsDb = mutableListOf<ItemTag>()
    private var tagIdCounter = 1L

    private lateinit var mockUnifiedTagDao: UnifiedTagDao
    private lateinit var mockMusicTagRepository: MusicTagRepository
    private lateinit var migrator: LegacyMusicTagMigrator

    @Before
    fun setUp() {
        tagsDb.clear()
        itemTagsDb.clear()
        tagIdCounter = 1L

        mockUnifiedTagDao = mock()
        mockMusicTagRepository = mock()

        mockUnifiedTagDao.stub {
            onBlocking { getTagByName(any()) } doAnswer { invocation ->
                val nameArg = invocation.getArgument<String>(0)
                tagsDb.values.firstOrNull { it.name.equals(nameArg, ignoreCase = true) }
            }

            onBlocking { insertTag(any()) } doAnswer { invocation ->
                val tagArg = invocation.getArgument<UnifiedTag>(0)
                val id = tagIdCounter++
                val newTag = tagArg.copy(tagId = id)
                tagsDb[id] = newTag
                id
            }

            onBlocking { findOrCreateTag(any(), any(), any()) } doAnswer { invocation ->
                val nameArg = invocation.getArgument<String>(0).trim()
                val typeArg = invocation.getArgument<TagType>(1)
                val colorArg = invocation.getArgument<String?>(2)

                val existing = tagsDb.values.firstOrNull { it.name.equals(nameArg, ignoreCase = true) }
                if (existing != null) {
                    existing.tagId
                } else {
                    val id = tagIdCounter++
                    tagsDb[id] = UnifiedTag(tagId = id, name = nameArg, type = typeArg, color = colorArg)
                    id
                }
            }

            onBlocking { addTagToItem(any()) } doAnswer { invocation ->
                val itemTagArg = invocation.getArgument<ItemTag>(0)
                itemTagsDb.add(itemTagArg)
                Unit
            }

            onBlocking { recalculateUsageCount(any()) } doAnswer { invocation ->
                val targetTagId = invocation.getArgument<Long>(0)
                val count = itemTagsDb.count { it.tagId == targetTagId }
                tagsDb[targetTagId]?.let { tag ->
                    tagsDb[targetTagId] = tag.copy(usageCount = count)
                }
                Unit
            }

            onBlocking { getTagsForItemSync(any()) } doAnswer { invocation ->
                val targetItemId = invocation.getArgument<Long>(0)
                val assignedTagIds = itemTagsDb.filter { it.itemId == targetItemId }.map { it.tagId }
                tagsDb.values.filter { it.tagId in assignedTagIds }
            }
        }

        migrator = LegacyMusicTagMigrator(mockMusicTagRepository, mockUnifiedTagDao)
    }

    @Test
    fun `test legacy music tags migrate cleanly into unified_tags and item_tags`() = runBlocking {
        val legacyTags = listOf(
            MusicTag(id = 101L, name = "Synthwave", color = "#FF00FF"),
            MusicTag(id = 102L, name = "Cyberpunk", color = "#00FFFF")
        )

        mockMusicTagRepository.stub {
            on { getAllTags() } doReturn flowOf(legacyTags)
            onBlocking { getTrackIdsForTag(101L) } doReturn listOf(1001L, 1002L)
            onBlocking { getTrackIdsForTag(102L) } doReturn listOf(1002L)
        }

        val migratedCount = migrator.migrateLegacyMusicTags()

        assertEquals(3, migratedCount)
        assertEquals(2, tagsDb.size)

        val synthwaveTag = tagsDb.values.firstOrNull { it.name == "Synthwave" }
        assertNotNull(synthwaveTag)
        assertEquals(2, synthwaveTag?.usageCount)

        val cyberpunkTag = tagsDb.values.firstOrNull { it.name == "Cyberpunk" }
        assertNotNull(cyberpunkTag)
        assertEquals(1, cyberpunkTag?.usageCount)
    }

    @Test
    fun `test duplicate tag names are normalized during tag creation`() = runBlocking {
        val id1 = mockUnifiedTagDao.findOrCreateTag("  Sci-Fi ", TagType.AUTO_GENERATED)
        val id2 = mockUnifiedTagDao.findOrCreateTag("sci-fi", TagType.USER_DEFINED)
        val id3 = mockUnifiedTagDao.findOrCreateTag("SCI-FI", TagType.AUTO_GENERATED)

        assertEquals(id1, id2)
        assertEquals(id1, id3)
        assertEquals(1, tagsDb.size)
        assertEquals("Sci-Fi", tagsDb[id1]?.name)
    }

    @Test
    fun `test ID3 genre string splitting and central tag association`() = runBlocking {
        val rawGenre = "Rock, Synthwave / Alternative; Pop"
        val genres = rawGenre.split(',', '/', ';').map { it.trim() }.filter { it.isNotEmpty() }

        val itemId = 5001L
        for (genre in genres) {
            val tagId = mockUnifiedTagDao.findOrCreateTag(genre, TagType.AUTO_GENERATED)
            mockUnifiedTagDao.addTagToItem(ItemTag(itemId = itemId, tagId = tagId))
            mockUnifiedTagDao.recalculateUsageCount(tagId)
        }

        assertEquals(4, tagsDb.size)
        val itemTags = mockUnifiedTagDao.getTagsForItemSync(itemId)
        assertEquals(4, itemTags.size)
        assertTrue(itemTags.any { it.name == "Rock" })
        assertTrue(itemTags.any { it.name == "Synthwave" })
        assertTrue(itemTags.any { it.name == "Alternative" })
        assertTrue(itemTags.any { it.name == "Pop" })
    }

    @Test
    fun `test cross media tag search filters items sharing tags across media types`() = runBlocking {
        val bookItem = MediaItem(itemId = 101L, libraryId = 1L, filePath = "/books/scifi.epub", fileName = "Space Odyssey.epub", fileExtension = "epub", mediaType = "BOOK", fileSize = 1000L)
        val musicItem = MediaItem(itemId = 102L, libraryId = 2L, filePath = "/music/scifi_track.mp3", fileName = "Space Ambient.mp3", fileExtension = "mp3", mediaType = "MUSIC", fileSize = 2000L)
        val webfictionItem = MediaItem(itemId = 103L, libraryId = 3L, filePath = "/stories/space.html", fileName = "Space Serial.html", fileExtension = "html", mediaType = "WEBFICTION", fileSize = 500L)
        val videoItem = MediaItem(itemId = 104L, libraryId = 4L, filePath = "/movies/action.mp4", fileName = "Action Movie.mp4", fileExtension = "mp4", mediaType = "MOVIE", fileSize = 5000L)

        val spaceTagId = mockUnifiedTagDao.findOrCreateTag("Space", TagType.AUTO_GENERATED)

        mockUnifiedTagDao.addTagToItem(ItemTag(itemId = bookItem.itemId, tagId = spaceTagId))
        mockUnifiedTagDao.addTagToItem(ItemTag(itemId = musicItem.itemId, tagId = spaceTagId))
        mockUnifiedTagDao.addTagToItem(ItemTag(itemId = webfictionItem.itemId, tagId = spaceTagId))

        val allItems = listOf(bookItem, musicItem, webfictionItem, videoItem)
        val matchingItems = allItems.filter { item ->
            val tags = mockUnifiedTagDao.getTagsForItemSync(item.itemId)
            tags.any { it.name.equals("Space", ignoreCase = true) }
        }

        assertEquals(3, matchingItems.size)
        assertTrue(matchingItems.any { it.mediaType == "BOOK" })
        assertTrue(matchingItems.any { it.mediaType == "MUSIC" })
        assertTrue(matchingItems.any { it.mediaType == "WEBFICTION" })
        assertTrue(matchingItems.none { it.mediaType == "MOVIE" })
    }
}

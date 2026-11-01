package com.universalmedialibrary.services.tagging

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.UnifiedTagDao
import com.universalmedialibrary.data.local.entity.ItemTag
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.local.entity.UnifiedTag
import com.universalmedialibrary.services.comic.ComicInfoHandler
import com.universalmedialibrary.services.metadata.EmbeddedTagExtractor
import com.universalmedialibrary.services.metadata.UniversalMetadata
import com.universalmedialibrary.services.search.EnhancedSearchService
import com.universalmedialibrary.services.search.SearchFilters
import com.universalmedialibrary.services.search.SearchQuery
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.mockito.kotlin.any
import org.mockito.kotlin.anyOrNull
import org.mockito.kotlin.doAnswer
import org.mockito.kotlin.doReturn
import org.mockito.kotlin.mock
import org.mockito.kotlin.stub
import java.io.File
import java.io.FileOutputStream
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

@OptIn(ExperimentalCoroutinesApi::class)
class UnifiedTagIndexingListenerTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    private val tagsDb = mutableMapOf<Long, UnifiedTag>()
    private val itemTagsDb = mutableListOf<ItemTag>()
    private var tagIdCounter = 1L

    private lateinit var mockUnifiedTagDao: UnifiedTagDao
    private lateinit var mockComicInfoHandler: ComicInfoHandler
    private lateinit var mockEmbeddedTagExtractor: EmbeddedTagExtractor
    private lateinit var tagExtractor: MediaFormatTagExtractor
    private lateinit var listener: UnifiedTagIndexingListener

    private val testDispatcher = StandardTestDispatcher()
    private val testScope = TestScope(testDispatcher)

    @Before
    fun setUp() {
        tagsDb.clear()
        itemTagsDb.clear()
        tagIdCounter = 1L

        mockUnifiedTagDao = mock()
        mockComicInfoHandler = ComicInfoHandler()
        mockEmbeddedTagExtractor = mock()

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

            onBlocking { findOrCreateTag(any(), any(), anyOrNull()) } doAnswer { invocation ->
                val nameArg = invocation.getArgument<String>(0).trim()
                val typeArg = invocation.getArgument<TagType>(1)
                val colorArg = invocation.getArgument<String?>(2)

                val existing = tagsDb.values.firstOrNull { it.name.equals(nameArg, ignoreCase = true) }
                if (existing != null) {
                    existing.tagId
                } else {
                    val id = tagIdCounter++
                    tagsDb[id] = UnifiedTag(
                        tagId = id,
                        name = nameArg,
                        type = typeArg,
                        color = colorArg
                    )
                    id
                }
            }

            onBlocking { addTagToItem(any()) } doAnswer { invocation ->
                val itemTag = invocation.getArgument<ItemTag>(0)
                if (itemTagsDb.none { it.itemId == itemTag.itemId && it.tagId == itemTag.tagId }) {
                    itemTagsDb.add(itemTag.copy(id = itemTagsDb.size.toLong() + 1))
                }
                Unit
            }

            onBlocking { recalculateUsageCount(any()) } doAnswer { invocation ->
                val tagIdArg = invocation.getArgument<Long>(0)
                val current = tagsDb[tagIdArg]
                if (current != null) {
                    val count = itemTagsDb.count { it.tagId == tagIdArg }
                    tagsDb[tagIdArg] = current.copy(usageCount = count)
                }
                Unit
            }

            onBlocking { getTagsForItemSync(any()) } doAnswer { invocation ->
                val itemIdArg = invocation.getArgument<Long>(0)
                val tagIds = itemTagsDb.filter { it.itemId == itemIdArg }.map { it.tagId }
                tagIds.mapNotNull { tagsDb[it] }
            }
        }

        tagExtractor = MediaFormatTagExtractor(mockComicInfoHandler, mockEmbeddedTagExtractor)
        listener = UnifiedTagIndexingListener(mockUnifiedTagDao, tagExtractor, Dispatchers.IO)
    }

    @Test
    fun normalizeTags_trimsSplitsLimitsAndDeduplicates() {
        val longTag = "A".repeat(100)
        val raw = listOf(
            "  Fantasy  , Sci-Fi; Space Opera / Cyberpunk | Grimdark \n Steampunk ",
            "fantasy", // Duplicate case-insensitive
            "SCI-FI",  // Duplicate case-insensitive
            longTag,
            "",
            "   "
        )

        val normalized = tagExtractor.normalizeTags(raw)

        assertEquals(7, normalized.size)
        assertTrue(normalized.contains("Fantasy"))
        assertTrue(normalized.contains("Sci-Fi"))
        assertTrue(normalized.contains("Space Opera"))
        assertTrue(normalized.contains("Cyberpunk"))
        assertTrue(normalized.contains("Grimdark"))
        assertTrue(normalized.contains("Steampunk"))

        val expectedLong = "A".repeat(64)
        assertTrue(normalized.contains(expectedLong))
        assertFalse(normalized.any { it.length > 64 })
    }

    @Test
    fun extractEpubTags_extractsSubjectsFromOpf() = runTest {
        val epubFile = tempFolder.newFile("sample.epub")
        ZipOutputStream(FileOutputStream(epubFile)).use { zip ->
            zip.putNextEntry(ZipEntry("META-INF/container.xml"))
            val containerXml = """
                <?xml version="1.0"?>
                <container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
                   <rootfiles>
                      <rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/>
                   </rootfiles>
                </container>
            """.trimIndent()
            zip.write(containerXml.toByteArray())
            zip.closeEntry()

            zip.putNextEntry(ZipEntry("OEBPS/content.opf"))
            val opfXml = """
                <?xml version="1.0" encoding="utf-8"?>
                <package xmlns="http://www.idpf.org/2007/opf" version="3.0">
                  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
                    <dc:title>Test Fantasy Novel</dc:title>
                    <dc:subject>Fantasy</dc:subject>
                    <dc:subject>Epic Fantasy, High Magic</dc:subject>
                  </metadata>
                </package>
            """.trimIndent()
            zip.write(opfXml.toByteArray())
            zip.closeEntry()
        }

        val mediaItem = MediaItem(
            itemId = 101L,
            libraryId = 1L,
            filePath = epubFile.absolutePath,
            fileName = epubFile.name,
            fileExtension = "epub",
            fileSize = epubFile.length(),
            mediaType = "BOOK"
        )

        val extracted = tagExtractor.extractTags(mediaItem)
        assertEquals(listOf("Fantasy", "Epic Fantasy", "High Magic"), extracted)

        val indexed = listener.processItem(mediaItem)
        assertEquals(listOf("Fantasy", "Epic Fantasy", "High Magic"), indexed)

        val itemTags = mockUnifiedTagDao.getTagsForItemSync(101L)
        assertEquals(3, itemTags.size)
        assertTrue(itemTags.all { it.type == TagType.AUTO_GENERATED })
        assertEquals(1, itemTags.first { it.name == "Fantasy" }.usageCount)
    }

    @Test
    fun extractComicTags_extractsGenreAndTagsFromComicInfo() = runTest {
        val cbzFile = tempFolder.newFile("comic.cbz")
        ZipOutputStream(FileOutputStream(cbzFile)).use { zip ->
            zip.putNextEntry(ZipEntry("ComicInfo.xml"))
            val comicInfoXml = """
                <?xml version="1.0"?>
                <ComicInfo>
                  <Title>Superhero Comic #1</Title>
                  <Genre>Superhero, Action</Genre>
                  <Tags>Graphic Novel, Sci-Fi</Tags>
                </ComicInfo>
            """.trimIndent()
            zip.write(comicInfoXml.toByteArray())
            zip.closeEntry()
        }

        val mediaItem = MediaItem(
            itemId = 202L,
            libraryId = 1L,
            filePath = cbzFile.absolutePath,
            fileName = cbzFile.name,
            fileExtension = "cbz",
            fileSize = cbzFile.length(),
            mediaType = "COMIC"
        )

        val indexed = listener.processItem(mediaItem)
        assertEquals(listOf("Superhero", "Action", "Graphic Novel", "Sci-Fi"), indexed)

        val itemTags = mockUnifiedTagDao.getTagsForItemSync(202L)
        assertEquals(4, itemTags.size)
        assertTrue(itemTags.any { it.name == "Superhero" })
        assertTrue(itemTags.any { it.name == "Graphic Novel" })
    }

    @Test
    fun extractVideoTags_extractsGenreFromEmbeddedExtractor() = runTest {
        val videoFile = tempFolder.newFile("movie.mp4")
        mockEmbeddedTagExtractor.stub {
            onBlocking { extractMetadata(videoFile.absolutePath) } doReturn UniversalMetadata(
                title = "Movie Title",
                genre = "Sci-Fi / Adventure",
                hasVideo = true,
                filePath = videoFile.absolutePath
            )
        }

        val mediaItem = MediaItem(
            itemId = 303L,
            libraryId = 1L,
            filePath = videoFile.absolutePath,
            fileName = videoFile.name,
            fileExtension = "mp4",
            fileSize = videoFile.length(),
            mediaType = "MOVIE"
        )

        val indexed = listener.processItem(mediaItem)
        assertEquals(listOf("Sci-Fi", "Adventure"), indexed)

        val itemTags = mockUnifiedTagDao.getTagsForItemSync(303L)
        assertEquals(2, itemTags.size)
    }

    @Test
    fun asynchronousBatching_updatesUsageCountsCorrectly() = runTest {
        val comicFile1 = tempFolder.newFile("comic1.cbz")
        val comicFile2 = tempFolder.newFile("comic2.cbz")

        ZipOutputStream(FileOutputStream(comicFile1)).use { zip ->
            zip.putNextEntry(ZipEntry("ComicInfo.xml"))
            zip.write("<ComicInfo><Genre>Fantasy</Genre></ComicInfo>".toByteArray())
            zip.closeEntry()
        }

        ZipOutputStream(FileOutputStream(comicFile2)).use { zip ->
            zip.putNextEntry(ZipEntry("ComicInfo.xml"))
            zip.write("<ComicInfo><Genre>Fantasy, Cyberpunk</Genre></ComicInfo>".toByteArray())
            zip.closeEntry()
        }

        val item1 = MediaItem(itemId = 401L, libraryId = 1L, filePath = comicFile1.absolutePath, fileName = "comic1.cbz", fileExtension = "cbz", fileSize = 100L, mediaType = "COMIC")
        val item2 = MediaItem(itemId = 402L, libraryId = 1L, filePath = comicFile2.absolutePath, fileName = "comic2.cbz", fileExtension = "cbz", fileSize = 100L, mediaType = "COMIC")

        listener.onMediaItemIngested(item1)
        listener.onMediaItemIngested(item2)
        listener.flush()

        val fantasyTag = mockUnifiedTagDao.getTagByName("Fantasy")
        val cyberpunkTag = mockUnifiedTagDao.getTagByName("Cyberpunk")

        assertEquals(2, fantasyTag?.usageCount)
        assertEquals(1, cyberpunkTag?.usageCount)
    }

    @Test
    fun resilientAgainstFailures_doesNotDisruptWorkflow() = runTest {
        // Non-existent file
        val badItem = MediaItem(
            itemId = 999L,
            libraryId = 1L,
            filePath = "/non/existent/path/corrupt.epub",
            fileName = "corrupt.epub",
            fileExtension = "epub",
            fileSize = 0L,
            mediaType = "BOOK"
        )

        // Should not throw
        val tags = listener.processItem(badItem)
        assertTrue(tags.isEmpty())

        listener.onMediaItemIngested(badItem)
        listener.flush()
    }
}

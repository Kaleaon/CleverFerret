package com.universalmedialibrary.services.comic

import android.content.Context
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.dao.ComicPanelDao
import com.universalmedialibrary.data.local.entity.ComicPanelData
import com.universalmedialibrary.data.local.entity.ComicTranslation
import io.mockk.MockKAnnotations
import io.mockk.coEvery
import io.mockk.coVerify
import io.mockk.impl.annotations.MockK
import io.mockk.slot
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

@OptIn(ExperimentalCoroutinesApi::class)
class ComicDataServiceTest {

    @get:Rule
    val tempFolder = TemporaryFolder()

    @MockK(relaxed = true)
    lateinit var context: Context

    @MockK(relaxed = true)
    lateinit var comicPanelDao: ComicPanelDao

    private lateinit var comicDataService: ComicDataService

    @Before
    fun setUp() {
        MockKAnnotations.init(this)
        comicDataService = ComicDataService(context, comicPanelDao)
    }

    @Test
    fun `exportPanelDataToFile maps page panels and translations correctly`() = runTest {
        val comicId = 1L
        val comicFile = tempFolder.newFile("test_comic.cbz")
        val comicFilePath = comicFile.absolutePath

        val mockPanels = listOf(
            ComicPanelData(id = 101L, comicId = comicId, comicFilePath = comicFilePath, pageNumber = 1, totalPages = 2, panelIndex = 0, x = 0, y = 0, width = 100, height = 100),
            ComicPanelData(id = 102L, comicId = comicId, comicFilePath = comicFilePath, pageNumber = 1, totalPages = 2, panelIndex = 1, x = 100, y = 0, width = 100, height = 100),
            ComicPanelData(id = 201L, comicId = comicId, comicFilePath = comicFilePath, pageNumber = 2, totalPages = 2, panelIndex = 0, x = 0, y = 0, width = 200, height = 200)
        )

        val mockTranslations = listOf(
            ComicTranslation(id = 1L, panelId = 101L, comicId = comicId, pageNumber = 1, bubbleX = 10, bubbleY = 10, bubbleWidth = 30, bubbleHeight = 20, originalText = "Hello", translatedText = "Hola"),
            ComicTranslation(id = 2L, panelId = 102L, comicId = comicId, pageNumber = 1, bubbleX = 110, bubbleY = 10, bubbleWidth = 30, bubbleHeight = 20, originalText = "World", translatedText = "Mundo"),
            ComicTranslation(id = 3L, panelId = 201L, comicId = comicId, pageNumber = 2, bubbleX = 10, bubbleY = 10, bubbleWidth = 40, bubbleHeight = 30, originalText = "End", translatedText = "Fin")
        )

        coEvery { comicPanelDao.getAllPanelsForComic(comicId) } returns mockPanels
        coEvery { comicPanelDao.getAllTranslationsForComic(comicId) } returns mockTranslations

        val resultFile = comicDataService.exportPanelDataToFile(
            comicId = comicId,
            comicFilePath = comicFilePath,
            comicTitle = "Test Comic",
            totalPages = 2
        )

        assertThat(resultFile).isNotNull()
        assertThat(resultFile!!.exists()).isTrue()

        val jsonContent = resultFile.readText()
        assertThat(jsonContent).contains("Test Comic")
        assertThat(jsonContent).contains("Hola")
        assertThat(jsonContent).contains("Mundo")
        assertThat(jsonContent).contains("Fin")
    }

    @Test
    fun `saveTranslationData indexes panels by index without redundant DB calls`() = runTest {
        val comicId = 1L
        val pageNumber = 1

        val pagePanels = listOf(
            ComicPanelData(id = 10L, comicId = comicId, comicFilePath = "path", pageNumber = pageNumber, totalPages = 1, panelIndex = 0, x = 0, y = 0, width = 100, height = 100),
            ComicPanelData(id = 20L, comicId = comicId, comicFilePath = "path", pageNumber = pageNumber, totalPages = 1, panelIndex = 1, x = 100, y = 0, width = 100, height = 100)
        )

        coEvery { comicPanelDao.getPanelsForPage(comicId, pageNumber) } returns pagePanels

        val pageTranslation = PageTranslationResult(
            pageNumber = pageNumber,
            sourceLanguage = "en",
            targetLanguage = "es",
            panels = listOf(
                PanelTranslationResult(
                    panelIndex = 0,
                    bubbles = listOf(
                        TextBubbleTranslation(
                            bounds = BoundingBox(0, 0, 10, 10),
                            originalText = "Hello",
                            translatedText = "Hola",
                            confidence = 0.9f
                        )
                    )
                ),
                PanelTranslationResult(
                    panelIndex = 1,
                    bubbles = listOf(
                        TextBubbleTranslation(
                            bounds = BoundingBox(10, 0, 10, 10),
                            originalText = "Bye",
                            translatedText = "Adios",
                            confidence = 0.95f
                        )
                    )
                )
            )
        )

        comicDataService.saveTranslationData(comicId, pageTranslation)

        val slot = slot<List<ComicTranslation>>()
        coVerify(exactly = 1) { comicPanelDao.insertTranslations(capture(slot)) }
        assertThat(slot.captured).hasSize(2)
        assertThat(slot.captured[0].panelId).isEqualTo(10L)
        assertThat(slot.captured[1].panelId).isEqualTo(20L)
    }

    @Test
    fun `importPanelDataFromFile indexes panels by index for imported translations`() = runTest {
        val comicId = 1L
        val comicFile = tempFolder.newFile("import_test.cbz")
        val comicFilePath = comicFile.absolutePath

        val jsonContent = """
            {
                "comicFilePath": "$comicFilePath",
                "comicTitle": "Import Test",
                "totalPages": 1,
                "pages": [
                    {
                        "pageNumber": 1,
                        "panels": [
                            { "panelIndex": 0, "x": 0, "y": 0, "width": 100, "height": 100, "readingOrder": 0, "confidence": 0.9 },
                            { "panelIndex": 1, "x": 100, "y": 0, "width": 100, "height": 100, "readingOrder": 1, "confidence": 0.9 }
                        ],
                        "translations": [
                            {
                                "panelIndex": 0,
                                "bubbleX": 5, "bubbleY": 5, "bubbleWidth": 20, "bubbleHeight": 10,
                                "originalText": "Hi", "translatedText": "Hola",
                                "detectedLanguage": "en", "targetLanguage": "es"
                            },
                            {
                                "panelIndex": 1,
                                "bubbleX": 105, "bubbleY": 5, "bubbleWidth": 20, "bubbleHeight": 10,
                                "originalText": "Bye", "translatedText": "Chao",
                                "detectedLanguage": "en", "targetLanguage": "es"
                            }
                        ]
                    }
                ]
            }
        """.trimIndent()

        val jsonFile = File(comicFilePath + ".panels.json")
        jsonFile.writeText(jsonContent)

        val insertedPanels = listOf(
            ComicPanelData(id = 101L, comicId = comicId, comicFilePath = comicFilePath, pageNumber = 1, totalPages = 1, panelIndex = 0, x = 0, y = 0, width = 100, height = 100),
            ComicPanelData(id = 102L, comicId = comicId, comicFilePath = comicFilePath, pageNumber = 1, totalPages = 1, panelIndex = 1, x = 100, y = 0, width = 100, height = 100)
        )
        coEvery { comicPanelDao.getPanelsForPage(comicId, 1) } returns insertedPanels

        val success = comicDataService.importPanelDataFromFile(comicId, comicFilePath)

        assertThat(success).isTrue()
        val slot = slot<List<ComicTranslation>>()
        coVerify(exactly = 1) { comicPanelDao.insertTranslations(capture(slot)) }
        assertThat(slot.captured).hasSize(2)
        assertThat(slot.captured[0].panelId).isEqualTo(101L)
        assertThat(slot.captured[1].panelId).isEqualTo(102L)
    }
}

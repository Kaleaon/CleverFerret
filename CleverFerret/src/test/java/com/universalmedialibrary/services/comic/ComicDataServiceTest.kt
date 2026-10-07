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

typealias PanelTranslationResult = TranslatedPanel
typealias TextBubbleTranslation = TranslatedBubble
typealias BoundingBox = NormalizedRect

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
            ComicPanelData(
                id = 101L, comicId = comicId, comicFilePath = comicFilePath,
                pageNumber = 1, totalPages = 2, panelIndex = 0,
                x = 0f, y = 0f, width = 100f, height = 100f
            ),
            ComicPanelData(
                id = 102L, comicId = comicId, comicFilePath = comicFilePath,
                pageNumber = 1, totalPages = 2, panelIndex = 1,
                x = 100f, y = 0f, width = 100f, height = 100f
            ),
            ComicPanelData(
                id = 201L, comicId = comicId, comicFilePath = comicFilePath,
                pageNumber = 2, totalPages = 2, panelIndex = 0,
                x = 0f, y = 0f, width = 200f, height = 200f
            )
        )

        val mockTranslations = listOf(
            ComicTranslation(
                id = 1L, panelId = 101L, comicId = comicId, pageNumber = 1,
                bubbleX = 10f, bubbleY = 10f, bubbleWidth = 30f, bubbleHeight = 20f,
                originalText = "Hello", detectedLanguage = "en", translatedText = "Hola"
            ),
            ComicTranslation(
                id = 2L, panelId = 102L, comicId = comicId, pageNumber = 1,
                bubbleX = 110f, bubbleY = 10f, bubbleWidth = 30f, bubbleHeight = 20f,
                originalText = "World", detectedLanguage = "en", translatedText = "Mundo"
            ),
            ComicTranslation(
                id = 3L, panelId = 201L, comicId = comicId, pageNumber = 2,
                bubbleX = 10f, bubbleY = 10f, bubbleWidth = 40f, bubbleHeight = 30f,
                originalText = "End", detectedLanguage = "en", translatedText = "Fin"
            )
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
            ComicPanelData(
                id = 10L, comicId = comicId, comicFilePath = "path",
                pageNumber = pageNumber, totalPages = 1, panelIndex = 0,
                x = 0f, y = 0f, width = 100f, height = 100f
            ),
            ComicPanelData(
                id = 20L, comicId = comicId, comicFilePath = "path",
                pageNumber = pageNumber, totalPages = 1, panelIndex = 1,
                x = 100f, y = 0f, width = 100f, height = 100f
            )
        )

        coEvery { comicPanelDao.getPanelsForPage(comicId, pageNumber) } returns pagePanels

        val pageTranslation = PageTranslationResult(
            pageNumber = pageNumber,
            sourceLanguage = "en",
            targetLanguage = "es",
            translationMethod = "gemini",
            panels = listOf(
                TranslatedPanel(
                    panelIndex = 0,
                    bubbles = listOf(
                        TranslatedBubble(
                            bounds = NormalizedRect(0f, 0f, 10f, 10f),
                            originalText = "Hello",
                            translatedText = "Hola",
                            confidence = 0.9f
                        )
                    )
                ),
                TranslatedPanel(
                    panelIndex = 1,
                    bubbles = listOf(
                        TranslatedBubble(
                            bounds = NormalizedRect(10f, 0f, 10f, 10f),
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
            ComicPanelData(
                id = 101L, comicId = comicId, comicFilePath = comicFilePath,
                pageNumber = 1, totalPages = 1, panelIndex = 0,
                x = 0f, y = 0f, width = 100f, height = 100f
            ),
            ComicPanelData(
                id = 102L, comicId = comicId, comicFilePath = comicFilePath,
                pageNumber = 1, totalPages = 1, panelIndex = 1,
                x = 100f, y = 0f, width = 100f, height = 100f
            )
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

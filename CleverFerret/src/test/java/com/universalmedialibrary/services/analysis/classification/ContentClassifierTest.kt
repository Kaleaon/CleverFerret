package com.universalmedialibrary.services.analysis.classification

import com.google.common.truth.Truth.assertThat
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class ContentClassifierTest {

    private lateinit var contentClassifier: ContentClassifier

    @Before
    fun setUp() {
        contentClassifier = ContentClassifier()
    }

    @Test
    fun `classifyDocument correctly identifies genres and topics using token frequencies`() = runTest {
        val documentText = """
            In an ancient kingdom, a brave wizard and a heroic dragon set out on a dangerous quest.
            With powerful magic and a sharp sword, they fought against dark forces threatening the fantasy realm.
            Meanwhile, researchers in computer technology and software digital systems analyzed the historical data.
        """.trimIndent()

        val classification = contentClassifier.classifyDocument(documentText)

        assertThat(classification.genre).isEqualTo("fantasy")
        assertThat(classification.tags).contains("technology")
    }

    @Test
    fun `classifyDocument handles large documents efficiently`() = runTest {
        val repeatedText = "mystery detective investigation mystery crime clue murder suspect "
        val largeText = repeatedText.repeat(5000)

        val startTime = System.currentTimeMillis()
        val classification = contentClassifier.classifyDocument(largeText)
        val elapsedTime = System.currentTimeMillis() - startTime

        assertThat(classification.genre).isEqualTo("mystery")
        // Check that processing complete fast (under 1 second)
        assertThat(elapsedTime).isLessThan(1000L)
    }
}

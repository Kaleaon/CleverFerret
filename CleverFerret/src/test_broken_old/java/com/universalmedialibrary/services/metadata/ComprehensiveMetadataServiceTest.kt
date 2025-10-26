package com.universalmedialibrary.services.metadata

import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.repository.APIKeyRepository
import kotlinx.coroutines.runBlocking
import org.junit.Before
import org.junit.Test
import org.mockito.kotlin.any
import org.mockito.kotlin.mock
import org.mockito.kotlin.whenever

class ComprehensiveMetadataServiceTest {

    private lateinit var service: ComprehensiveMetadataService
    private val apiKeyRepository: APIKeyRepository = mock()

    private val hardcoverApi: HardcoverApi = mock()
    private val comicVineApi: ComicVineApi = mock()
    private val mangaUpdatesApi: MangaUpdatesApi = mock()
    private val librivoxApi: LibriVoxApi = mock()
    private val isbnDbApi: ISBNDbApi = mock()

    @Before
    fun setup() {
        service = ComprehensiveMetadataService(apiKeyRepository)

        // Use reflection to set the private API fields for testing.
        // This is not ideal, but it avoids a larger refactor of the service class.
        val hardcoverField = service::class.java.getDeclaredField("hardcoverApi")
        hardcoverField.isAccessible = true
        hardcoverField.set(service, hardcoverApi)

        val comicVineField = service::class.java.getDeclaredField("comicVineApi")
        comicVineField.isAccessible = true
        comicVineField.set(service, comicVineApi)

        val mangaUpdatesField = service::class.java.getDeclaredField("mangaUpdatesApi")
        mangaUpdatesField.isAccessible = true
        mangaUpdatesField.set(service, mangaUpdatesApi)

        val librivoxField = service::class.java.getDeclaredField("libriVoxApi")
        librivoxField.isAccessible = true
        librivoxField.set(service, librivoxApi)

        val isbnDbField = service::class.java.getDeclaredField("isbnDbApi")
        isbnDbField.isAccessible = true
        isbnDbField.set(service, isbnDbApi)
    }

    @Test
    fun `searchAllBookSources should return empty list when all sources fail`() = runBlocking {
        // Given
        val query = "test query"
        whenever(apiKeyRepository.getActiveAPIKeysMap()).thenReturn(mapOf("isbn_db" to "test_key"))
        whenever(hardcoverApi.searchBooks(any())).thenThrow(RuntimeException("API error"))
        whenever(isbnDbApi.searchBooks(any(), any(), any())).thenThrow(RuntimeException("API error"))


        // When
        val results = service.searchAllBookSources(query)

        // Then
        assertThat(results).isEmpty()
    }

    @Test
    fun `searchAllBookSources should return results from Hardcover`() = runBlocking {
        // Given
        val query = "Dune"
        val hardcoverResponse = HardcoverSearchResponse(
            data = listOf(
                HardcoverBook(
                    id = "1",
                    title = "Dune",
                    author = "Frank Herbert",
                    description = "A classic sci-fi novel.",
                    image = "url",
                    isbn = "12345",
                    publisher = "Ace",
                    pages = 412,
                    rating = 4.5f
                )
            )
        )
        whenever(apiKeyRepository.getActiveAPIKeysMap()).thenReturn(emptyMap())
        whenever(hardcoverApi.searchBooks(query)).thenReturn(hardcoverResponse)

        // When
        val results = service.searchAllBookSources(query)

        // Then
        assertThat(results).hasSize(1)
        val book = results[0]
        assertThat(book.title).isEqualTo("Dune")
        assertThat(book.author).isEqualTo("Frank Herbert")
        assertThat(book.source).isEqualTo("Hardcover")
    }

    @Test
    fun `searchAllBookSources should combine results from multiple sources`() = runBlocking {
        // Given
        val query = "Asimov"
        val hardcoverResponse = HardcoverSearchResponse(
            data = listOf(
                HardcoverBook(
                    id = "1",
                    title = "Foundation",
                    author = "Isaac Asimov",
                    description = "A classic sci-fi novel.",
                    image = "url",
                    isbn = "11111",
                    publisher = "Gnome Press",
                    pages = 255,
                    rating = 4.8f
                )
            )
        )
        val isbnDbResponse = ISBNDbSearchResponse(
            books = listOf(
                ISBNDbBook(
                    title = "I, Robot",
                    authors = listOf("Isaac Asimov"),
                    publisher = "Gnome Press",
                    date_published = "1950",
                    pages = 253,
                    image = "url",
                    subjects = listOf("Science Fiction")
                )
            )
        )
        whenever(apiKeyRepository.getActiveAPIKeysMap()).thenReturn(mapOf("isbn_db" to "test_key"))
        whenever(hardcoverApi.searchBooks(query, 20)).thenReturn(hardcoverResponse)
        whenever(isbnDbApi.searchBooks(any(), any(), any())).thenReturn(isbnDbResponse)

        // When
        val results = service.searchAllBookSources(query)

        // Then
        assertThat(results).hasSize(2)
        assertThat(results.map { it.source }).containsExactly("Hardcover", "ISBNDb")
    }

    @Test
    fun `searchComicSources should return results from ComicVine`() = runBlocking {
        // Given
        val query = "Saga"
        val comicVineResponse = ComicVineSearchResponse(
            error = "OK",
            results = listOf(
                ComicVineVolume(
                    id = 123,
                    name = "Saga",
                    publisher = ComicVinePublisher("Image Comics"),
                    description = "An epic space opera.",
                    image = ComicVineImage("url", "url", "url"),
                    start_year = "2012",
                    count_of_issues = 54
                )
            )
        )
        whenever(apiKeyRepository.getActiveAPIKeysMap()).thenReturn(mapOf("comicvine" to "test_key"))
        whenever(comicVineApi.searchComics("test_key", query, "volume", "json")).thenReturn(comicVineResponse)
        whenever(mangaUpdatesApi.searchManga(query)).thenThrow(RuntimeException("API error"))


        // When
        val results = service.searchComicSources(query)

        // Then
        assertThat(results).hasSize(1)
        val comic = results[0]
        assertThat(comic.title).isEqualTo("Saga")
        assertThat(comic.author).isEqualTo("Image Comics")
        assertThat(comic.source).isEqualTo("ComicVine")
    }

    @Test
    fun `searchComicSources should combine results from multiple sources`() = runBlocking {
        // Given
        val query = "Berserk"
        val comicVineResponse = ComicVineSearchResponse(
            error = "OK",
            results = listOf(
                ComicVineVolume(
                    id = 456,
                    name = "Berserk",
                    publisher = ComicVinePublisher("Dark Horse"),
                    description = "A dark fantasy manga.",
                    image = ComicVineImage("url", "url", "url"),
                    start_year = "1989",
                    count_of_issues = 364
                )
            )
        )
        val mangaUpdatesResponse = MangaUpdatesSearchResponse(
            results = listOf(
                MangaUpdatesSeries(
                    record = MangaUpdatesRecord(
                        series_id = 789,
                        title = "Berserk",
                        description = "A seinen manga.",
                        image = MangaUpdatesImage(MangaUpdatesImageUrl("url")),
                        authors = listOf(MangaUpdatesAuthor("Miura Kentarou")),
                        genres = listOf(MangaUpdatesGenre("Action"))
                    )
                )
            )
        )
        whenever(apiKeyRepository.getActiveAPIKeysMap()).thenReturn(mapOf("comicvine" to "test_key"))
        whenever(comicVineApi.searchComics("test_key", query, "volume", "json")).thenReturn(comicVineResponse)
        whenever(mangaUpdatesApi.searchManga(query)).thenReturn(mangaUpdatesResponse)

        // When
        val results = service.searchComicSources(query)

        // Then
        assertThat(results).hasSize(2)
        assertThat(results.map { it.source }).containsExactly("ComicVine", "MangaUpdates")
    }

    @Test
    fun `searchAudiobookSources should return results from LibriVox`() = runBlocking {
        // Given
        val query = "Dracula"
        val librivoxResponse = LibriVoxSearchResponse(
            books = listOf(
                LibriVoxBook(
                    id = "123",
                    title = "Dracula",
                    description = "A classic horror novel.",
                    authors = listOf(LibriVoxAuthor(last_name = "Stoker", first_name = "Bram")),
                    url_zip_file = "url"
                )
            )
        )
        whenever(librivoxApi.searchAudiobooks(query, "json")).thenReturn(librivoxResponse)

        // When
        val results = service.searchAudiobookSources(query)

        // Then
        assertThat(results).hasSize(1)
        val audiobook = results[0]
        assertThat(audiobook.title).isEqualTo("Dracula")
        assertThat(audiobook.author).isEqualTo("Bram Stoker")
        assertThat(audiobook.source).isEqualTo("LibriVox")
    }

    @Test
    fun `searchAudiobookSources should return empty list on API error`() = runBlocking {
        // Given
        val query = "Dracula"
        whenever(librivoxApi.searchAudiobooks(query, "json")).thenThrow(RuntimeException("API Error"))

        // When
        val results = service.searchAudiobookSources(query)

        // Then
        assertThat(results).isEmpty()
    }
}

// Dummy data classes for LibriVox since they are not present in the main source
data class LibriVoxSearchResponse(val books: List<LibriVoxBook>)
data class LibriVoxBook(
    val id: String,
    val title: String,
    val description: String,
    val authors: List<LibriVoxAuthor>,
    val url_zip_file: String
)
data class LibriVoxAuthor(val last_name: String, val first_name: String)

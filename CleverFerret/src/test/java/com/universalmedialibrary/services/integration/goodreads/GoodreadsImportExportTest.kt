package com.universalmedialibrary.services.integration.goodreads

import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.time.LocalDate

/**
 * Unit tests for GoodreadsImportExport service
 */
class GoodreadsImportExportTest {
    
    private lateinit var service: GoodreadsImportExport
    
    @Before
    fun setup() {
        service = GoodreadsImportExport()
    }
    
    @Test
    fun `test CSV import with valid data`() {
        val csvData = """
            Title,Author,Additional Authors,ISBN,ISBN13,Publisher,Number of Pages,Year Published,Original Publication Year,Progress,Series,Format,Language,Date Read,Date Added,Date Started,My Rating,My Review,Bookmark,Exclusive Shelf,Description
            "The Great Gatsby","F. Scott Fitzgerald","","0743273565","9780743273565","Scribner",180,2004,1925,180,"","Paperback","eng","2023/12/15","2023/11/01","2023/12/01",5,"Amazing book!",1,read,"A classic American novel"
            "1984: A Novel","George Orwell","","0451524934","9780451524935","Signet Classic",328,1961,1949,0,"","Paperback","eng","","2024/01/05","",0,"",0,to-read,"Dystopian masterpiece"
        """.trimIndent()
        
        val inputStream = ByteArrayInputStream(csvData.toByteArray())
        val books = service.importFromCSV(inputStream)
        
        assertEquals(2, books.size)
        
        // Verify first book
        val book1 = books[0]
        assertEquals("The Great Gatsby", book1.title)
        assertNull(book1.subtitle)
        assertEquals("F. Scott Fitzgerald", book1.author)
        assertEquals("0743273565", book1.isbn10)
        assertEquals("9780743273565", book1.isbn13)
        assertEquals("Scribner", book1.publisher)
        assertEquals(180, book1.numberPages)
        assertEquals(2004, book1.year)
        assertEquals(1925, book1.originalYear)
        assertEquals("Paperback", book1.format)
        assertEquals(5, book1.rating)
        assertEquals("read", book1.shelf)
        assertTrue(book1.bookmark)
        assertNotNull(book1.dateRead)
        assertEquals("Amazing book!", book1.notes)
        
        // Verify second book
        val book2 = books[1]
        assertEquals("1984", book2.title)
        assertEquals("A Novel", book2.subtitle)
        assertEquals("George Orwell", book2.author)
        assertEquals("to-read", book2.shelf)
        assertFalse(book2.bookmark)
        assertNull(book2.dateRead)
    }
    
    @Test
    fun `test CSV export with valid data`() {
        val books = listOf(
            GoodreadsImportExport.GoodreadsBook(
                title = "The Hobbit",
                subtitle = "or There and Back Again",
                author = "J.R.R. Tolkien",
                isbn13 = "9780547928227",
                publisher = "Mariner Books",
                year = 2012,
                originalYear = 1937,
                numberPages = 300,
                rating = 5,
                shelf = "read",
                bookmark = true,
                dateAdded = LocalDate.of(2023, 1, 1).toEpochDay(),
                dateRead = LocalDate.of(2023, 6, 15).toEpochDay()
            )
        )
        
        val outputStream = ByteArrayOutputStream()
        service.exportToCSV(outputStream, books)
        
        val csvOutput = outputStream.toString()
        
        assertTrue(csvOutput.contains("The Hobbit: or There and Back Again"))
        assertTrue(csvOutput.contains("J.R.R. Tolkien"))
        assertTrue(csvOutput.contains("9780547928227"))
        assertTrue(csvOutput.contains("Mariner Books"))
        assertTrue(csvOutput.contains("300"))
        assertTrue(csvOutput.contains("2012"))
        assertTrue(csvOutput.contains("1937"))
        assertTrue(csvOutput.contains("read"))
        assertTrue(csvOutput.contains("2023/06/15"))
    }
    
    @Test
    fun `test conversion to CleverFerret entities`() {
        val goodreadsBook = GoodreadsImportExport.GoodreadsBook(
            title = "Test Book",
            author = "Test Author",
            isbn13 = "9781234567890",
            publisher = "Test Publisher",
            year = 2024,
            numberPages = 250,
            shelf = "currently-reading",
            bookmark = true,
            dateAdded = LocalDate.now().toEpochDay()
        )
        
        val (mediaItem, metadataCommon, metadataBook) = service.toCleverFerretEntities(
            goodreadsBook,
            libraryId = 1L
        )
        
        // Verify MediaItem
        assertEquals(1L, mediaItem.libraryId)
        assertEquals("Test Book", mediaItem.fileName)
        assertEquals("BOOK", mediaItem.mediaType)
        assertFalse(mediaItem.isAvailable) // Imported books are not available until file is found
        
        // Verify MetadataCommon
        assertEquals("Test Book", metadataCommon.title)
        assertEquals(2024, metadataCommon.year)
        assertEquals("Test Book".lowercase(), metadataCommon.sortTitle)
        assertEquals("goodreads_import", metadataCommon.metadataSource)
        assertTrue(metadataCommon.isFavorite) // Bookmarked
        
        // Verify MetadataBook
        assertEquals("Test Publisher", metadataBook.publisher)
        assertEquals("9781234567890", metadataBook.isbn13)
        assertEquals(250, metadataBook.pageCount)
        // Note: shelf is stored in the new schema
        assertEquals("currently-reading", metadataBook.shelf)
        assertTrue(metadataBook.bookmarked)
        assertFalse(metadataBook.isRead)
        assertEquals(0f, metadataBook.readingProgress, 0.01f) // Currently reading means not finished
    }
    
    @Test
    fun `test import handles empty fields gracefully`() {
        val csvData = """
            Title,Author,Additional Authors,ISBN,ISBN13,Publisher,Number of Pages,Year Published,Original Publication Year,Progress,Series,Format,Language,Date Read,Date Added,Date Started,My Rating,My Review,Bookmark,Exclusive Shelf,Description
            "Minimal Book","","","","","",,"","",,,"","","","2024/01/01","",,"",,"",""
        """.trimIndent()
        
        val inputStream = ByteArrayInputStream(csvData.toByteArray())
        val books = service.importFromCSV(inputStream)
        
        assertEquals(1, books.size)
        val book = books[0]
        assertEquals("Minimal Book", book.title)
        assertNull(book.author)
        assertNull(book.isbn10)
        assertNull(book.isbn13)
        assertNull(book.publisher)
        assertEquals("", book.shelf) // Empty becomes empty string
    }
    
    @Test
    fun `test title and subtitle splitting`() {
        val csvData = """
            Title,Author,Additional Authors,ISBN,ISBN13,Publisher,Number of Pages,Year Published,Original Publication Year,Progress,Series,Format,Language,Date Read,Date Added,Date Started,My Rating,My Review,Bookmark,Exclusive Shelf,Description
            "Main Title: With Subtitle","Author Name","","","","",,"","",,,"","","","2024/01/01","",,"",,"to-read",""
        """.trimIndent()
        
        val inputStream = ByteArrayInputStream(csvData.toByteArray())
        val books = service.importFromCSV(inputStream)
        
        assertEquals(1, books.size)
        assertEquals("Main Title", books[0].title)
        assertEquals("With Subtitle", books[0].subtitle)
    }
}

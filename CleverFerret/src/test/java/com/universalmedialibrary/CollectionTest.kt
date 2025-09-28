package com.universalmedialibrary

import com.universalmedialibrary.data.local.entity.MediaCollection
import com.universalmedialibrary.data.local.entity.MediaCollectionItem
import org.junit.Test
import org.junit.Assert.*

/**
 * Tests for the Collection system
 */
class CollectionTest {

    @Test
    fun testCollectionCreation() {
        val collection = MediaCollection(
            collectionId = 1L,
            name = "Summer Reading",
            description = "Books to read this summer",
            type = "CUSTOM",
            coverImagePath = "/covers/summer.jpg",
            color = "#4CAF50",
            icon = "book",
            isPublic = false,
            isActive = true,
            isPinned = true,
            sortOrder = "MANUAL",
            sortDirection = "ASC",
            itemCount = 5
        )
        
        assertEquals("Summer Reading", collection.name)
        assertEquals("Books to read this summer", collection.description)
        assertEquals("CUSTOM", collection.type)
        assertEquals("/covers/summer.jpg", collection.coverImagePath)
        assertEquals("#4CAF50", collection.color)
        assertEquals("book", collection.icon)
        assertFalse(collection.isPublic)
        assertTrue(collection.isActive)
        assertTrue(collection.isPinned)
        assertEquals("MANUAL", collection.sortOrder)
        assertEquals("ASC", collection.sortDirection)
        assertEquals(5, collection.itemCount)
    }

    @Test
    fun testSmartCollection() {
        val smartCollection = MediaCollection(
            collectionId = 2L,
            name = "Recently Added Books",
            type = "SMART",
            smartFilters = """{"mediaType": "BOOK", "dateAdded": {"operator": ">=", "value": "7d"}}""",
            isActive = true
        )
        
        assertEquals("Recently Added Books", smartCollection.name)
        assertEquals("SMART", smartCollection.type)
        assertNotNull(smartCollection.smartFilters)
        assertTrue(smartCollection.smartFilters!!.contains("BOOK"))
        assertTrue(smartCollection.isActive)
    }

    @Test
    fun testCollectionDefaults() {
        val collection = MediaCollection(
            name = "Test Collection",
            type = "CUSTOM"
        )
        
        assertEquals("Test Collection", collection.name)
        assertEquals("CUSTOM", collection.type)
        assertNull(collection.description)
        assertNull(collection.coverImagePath)
        assertNull(collection.color)
        assertNull(collection.icon)
        assertFalse(collection.isPublic)
        assertTrue(collection.isActive)
        assertFalse(collection.isPinned)
        assertEquals("MANUAL", collection.sortOrder)
        assertEquals("ASC", collection.sortDirection)
        assertNull(collection.smartFilters)
        assertEquals(0, collection.itemCount)
        assertTrue(collection.createdDate > 0)
        assertTrue(collection.lastModified > 0)
        assertNull(collection.lastAccessed)
    }

    @Test
    fun testCollectionItemRelationship() {
        val collectionItem = MediaCollectionItem(
            collectionId = 1L,
            itemId = 100L,
            position = 2,
            addedBy = "user",
            notes = "Great book!"
        )
        
        assertEquals(1L, collectionItem.collectionId)
        assertEquals(100L, collectionItem.itemId)
        assertEquals(2, collectionItem.position)
        assertEquals("user", collectionItem.addedBy)
        assertEquals("Great book!", collectionItem.notes)
        assertTrue(collectionItem.addedDate > 0)
    }

    @Test
    fun testCollectionItemDefaults() {
        val collectionItem = MediaCollectionItem(
            collectionId = 1L,
            itemId = 100L
        )
        
        assertEquals(1L, collectionItem.collectionId)
        assertEquals(100L, collectionItem.itemId)
        assertEquals(0, collectionItem.position)
        assertNull(collectionItem.addedBy)
        assertNull(collectionItem.notes)
        assertTrue(collectionItem.addedDate > 0)
    }
}
package com.universalmedialibrary

import com.universalmedialibrary.data.local.entity.Tag
import com.universalmedialibrary.data.local.entity.ItemTag
import org.junit.Test
import org.junit.Assert.*

/**
 * Tests for the Tag system
 */
class TagTest {

    @Test
    fun testTagCreation() {
        val tag = Tag(
            tagId = 1L,
            name = "favorites",
            description = "My favorite items",
            category = "personal",
            color = "#FF5722",
            icon = "star",
            isSystem = false,
            isActive = true
        )
        
        assertEquals("favorites", tag.name)
        assertEquals("My favorite items", tag.description)
        assertEquals("personal", tag.category)
        assertEquals("#FF5722", tag.color)
        assertEquals("star", tag.icon)
        assertFalse(tag.isSystem)
        assertTrue(tag.isActive)
        assertEquals(0, tag.usageCount)
    }

    @Test
    fun testSystemTag() {
        val systemTag = Tag(
            tagId = 2L,
            name = "recently-added",
            category = "system",
            isSystem = true,
            isActive = true
        )
        
        assertEquals("recently-added", systemTag.name)
        assertEquals("system", systemTag.category)
        assertTrue(systemTag.isSystem)
        assertTrue(systemTag.isActive)
    }

    @Test
    fun testItemTagRelationship() {
        val itemTag = ItemTag(
            itemId = 100L,
            tagId = 1L,
            addedBy = "user"
        )
        
        assertEquals(100L, itemTag.itemId)
        assertEquals(1L, itemTag.tagId)
        assertEquals("user", itemTag.addedBy)
        assertTrue(itemTag.addedDate > 0)
    }

    @Test
    fun testTagDefaults() {
        val tag = Tag(
            name = "test-tag"
        )
        
        assertEquals("test-tag", tag.name)
        assertNull(tag.description)
        assertNull(tag.category)
        assertNull(tag.color)
        assertNull(tag.icon)
        assertFalse(tag.isSystem)
        assertTrue(tag.isActive)
        assertEquals(0, tag.usageCount)
        assertNull(tag.lastUsed)
        assertTrue(tag.createdDate > 0)
    }
}
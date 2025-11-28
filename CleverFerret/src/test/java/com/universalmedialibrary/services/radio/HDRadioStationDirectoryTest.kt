package com.universalmedialibrary.services.radio

import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test

class HDRadioStationDirectoryTest {

    private lateinit var directory: HDRadioStationDirectory

    @Before
    fun setup() {
        directory = HDRadioStationDirectory()
    }

    @Test
    fun `lookup by zip returns stations`() {
        val result = directory.lookupByZip("60601")

        assertNotNull(result)
        assertEquals("Chicago", result?.city)
        assertEquals("IL", result?.state)
        assertTrue(result?.stations?.isNotEmpty() == true)
    }

    @Test
    fun `lookup by zip ignores non digit characters`() {
        val result = directory.lookupByZip(" 9-0-0-1-2 ")

        assertNotNull(result)
        assertEquals("Los Angeles", result?.city)
    }

    @Test
    fun `lookup returns null for unknown zip`() {
        val result = directory.lookupByZip("00000")

        assertNull(result)
    }

    @Test
    fun `supported zips lists known entries`() {
        val zips = directory.supportedZips()

        assertTrue("60601" in zips)
        assertTrue("90012" in zips)
        assertTrue("10001" in zips)
    }
}

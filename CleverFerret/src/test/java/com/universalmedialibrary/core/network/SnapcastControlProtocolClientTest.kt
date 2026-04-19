package com.universalmedialibrary.core.network

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class SnapcastControlProtocolClientTest {

    private val client = SnapcastControlProtocolClient()

    @Test
    fun `parse Stream_OnTime message`() {
        val frame = """{"method":"Stream.OnTime","params":{"stream":"music","serverTimeMs":12345.5}}"""

        val parsed = client.parseFrame(frame)

        assertTrue(parsed is SnapcastProtocolMessage.StreamTimeSync)
        parsed as SnapcastProtocolMessage.StreamTimeSync
        assertEquals("music", parsed.streamId)
        assertEquals(12345.5, parsed.serverTimeMs, 0.001)
    }

    @Test
    fun `parse Group_OnUpdate message`() {
        val frame = """{"method":"Group.OnUpdate","params":{"group":"Living Room","members":["a","b"]}}"""

        val parsed = client.parseFrame(frame)

        parsed as SnapcastProtocolMessage.GroupUpdated
        assertEquals("Living Room", parsed.groupName)
        assertEquals(listOf("a", "b"), parsed.members)
    }

    @Test
    fun `build volume request clamps range`() {
        val request = client.buildSetClientVolumeRequest(id = 1, clientId = "dev-1", volume = 123)
        assertTrue(request.contains("\"Client.SetVolume\""))
        assertTrue(request.contains("\"volume\":100"))
    }
}

package com.universalmedialibrary.data.crdt

import org.junit.Assert.*
import org.junit.Test

class VectorClockTest {

    @Test
    fun testIncrementAndGetClock() {
        var clock = VectorClock()
        assertEquals(0L, clock.getClock("nodeA"))

        clock = clock.increment("nodeA")
        assertEquals(1L, clock.getClock("nodeA"))

        clock = clock.increment("nodeA")
        assertEquals(2L, clock.getClock("nodeA"))

        clock = clock.increment("nodeB")
        assertEquals(2L, clock.getClock("nodeA"))
        assertEquals(1L, clock.getClock("nodeB"))
    }

    @Test
    fun testMergeClocks() {
        val clockA = VectorClock(mapOf("nodeA" to 3L, "nodeB" to 1L))
        val clockB = VectorClock(mapOf("nodeB" to 4L, "nodeC" to 2L))

        val merged = clockA.merge(clockB)
        assertEquals(3L, merged.getClock("nodeA"))
        assertEquals(4L, merged.getClock("nodeB"))
        assertEquals(2L, merged.getClock("nodeC"))
    }

    @Test
    fun testDominance() {
        val base = VectorClock(mapOf("A" to 1L, "B" to 1L))
        val advancedA = VectorClock(mapOf("A" to 2L, "B" to 1L))
        val concurrent = VectorClock(mapOf("A" to 1L, "B" to 2L))

        assertTrue(advancedA.dominates(base))
        assertFalse(base.dominates(advancedA))
        assertFalse(advancedA.dominates(concurrent))
        assertFalse(concurrent.dominates(advancedA))

        assertTrue(advancedA.concurrentWith(concurrent))
        assertFalse(advancedA.concurrentWith(base))
    }

    @Test
    fun testJsonSerializationAndDeserialization() {
        val original = VectorClock(mapOf("device-1" to 5L, "device-2" to 12L))
        val json = original.toJson()

        val parsed = VectorClock.fromJson(json)
        assertEquals(5L, parsed.getClock("device-1"))
        assertEquals(12L, parsed.getClock("device-2"))

        val emptyParsed = VectorClock.fromJson("{}")
        assertTrue(emptyParsed.clocks.isEmpty())

        val nullParsed = VectorClock.fromJson(null)
        assertTrue(nullParsed.clocks.isEmpty())
    }
}

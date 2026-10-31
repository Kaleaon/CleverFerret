package com.universalmedialibrary.utils.media

import org.junit.Assert.assertEquals
import org.junit.Test

class MediaTimeFormatterTest {

    @Test
    fun formatMediaTime_nullInput_returnsFallback() {
        val nullVal: Long? = null
        assertEquals("0:00", MediaTimeFormatter.formatMediaTime(nullVal))
        assertEquals("0:00", nullVal.formatAsMediaTime())
    }

    @Test
    fun formatMediaTime_zeroOrNegative_returnsFallback() {
        assertEquals("0:00", MediaTimeFormatter.formatMediaTime(0L))
        assertEquals("0:00", MediaTimeFormatter.formatMediaTime(-1000L))
        assertEquals("0:00", 0L.formatAsMediaTime())
        assertEquals("0:00", (-500L).formatAsMediaTime())
    }

    @Test
    fun formatMediaTime_underOneMinute() {
        assertEquals("0:05", 5000L.formatAsMediaTime())
        assertEquals("0:45", 45000L.formatAsMediaTime())
        assertEquals("0:59", 59000L.formatAsMediaTime())
    }

    @Test
    fun formatMediaTime_underOneHour() {
        assertEquals("1:00", 60000L.formatAsMediaTime())
        assertEquals("1:05", 65000L.formatAsMediaTime())
        assertEquals("12:34", 754000L.formatAsMediaTime())
        assertEquals("59:59", 3599000L.formatAsMediaTime())
    }

    @Test
    fun formatMediaTime_oneHourOrMore() {
        assertEquals("1:00:00", 3600000L.formatAsMediaTime())
        assertEquals("1:01:05", 3665000L.formatAsMediaTime())
        assertEquals("10:20:30", 37230000L.formatAsMediaTime())
    }

    @Test
    fun formatVerboseDuration_nullInput_returnsFallback() {
        val nullVal: Long? = null
        assertEquals("0s", MediaTimeFormatter.formatVerboseDuration(nullVal))
        assertEquals("0s", nullVal.formatAsVerboseDuration())
    }

    @Test
    fun formatVerboseDuration_zeroOrNegative_returnsFallback() {
        assertEquals("0s", MediaTimeFormatter.formatVerboseDuration(0L))
        assertEquals("0s", MediaTimeFormatter.formatVerboseDuration(-1000L))
        assertEquals("0s", 0L.formatAsVerboseDuration())
        assertEquals("0s", (-500L).formatAsVerboseDuration())
    }

    @Test
    fun formatVerboseDuration_secondsOnly() {
        assertEquals("5s", 5000L.formatAsVerboseDuration())
        assertEquals("45s", 45000L.formatAsVerboseDuration())
    }

    @Test
    fun formatVerboseDuration_minutesAndSeconds() {
        assertEquals("1m", 60000L.formatAsVerboseDuration())
        assertEquals("1m 5s", 65000L.formatAsVerboseDuration())
        assertEquals("12m 34s", 754000L.formatAsVerboseDuration())
    }

    @Test
    fun formatVerboseDuration_hoursAndMinutes() {
        assertEquals("1h", 3600000L.formatAsVerboseDuration())
        assertEquals("1h 1m", 3660000L.formatAsVerboseDuration())
        assertEquals("1h 23m", 4980000L.formatAsVerboseDuration())
        assertEquals("10h 20m", 37200000L.formatAsVerboseDuration())
    }
}

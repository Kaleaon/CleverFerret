package com.universalmedialibrary.services.podcast

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class PodcastDateParsingTest {

    @Test
    fun parsePubDateToMillis_withValidRfc822Date_returnsCorrectMillis() {
        val pubDate = "Tue, 06 Oct 2026 10:18:48 +0000"
        val millis = parsePubDateToMillis(pubDate)
        assertEquals(1791281928000L, millis)
    }

    @Test
    fun parsePubDateToMillis_withGmtTimeZone_returnsCorrectMillis() {
        val pubDate = "Tue, 06 Oct 2026 10:18:48 GMT"
        val millis = parsePubDateToMillis(pubDate)
        assertEquals(1791281928000L, millis)
    }

    @Test
    fun parsePubDateToMillis_withTimezoneOffset_returnsCorrectMillis() {
        val pubDate = "Tue, 06 Oct 2026 10:18:48 -0500"
        val millis = parsePubDateToMillis(pubDate)
        assertEquals(1791299928000L, millis)
    }

    @Test
    fun parsePubDateToMillis_withSingleDigitDayAndEstTimezone_returnsCorrectMillis() {
        val pubDate = "Tue, 6 Oct 2026 10:18:48 EST"
        val millis = parsePubDateToMillis(pubDate)
        assertEquals(1791296328000L, millis)
    }

    @Test
    fun parsePubDateToMillis_withIsoOffsetAndNoDayOfWeek_returnsCorrectMillis() {
        val pubDate = "06 Oct 2026 10:18:48 +00:00"
        val millis = parsePubDateToMillis(pubDate)
        assertEquals(1791281928000L, millis)
    }

    @Test
    fun parsePubDateToMillis_withNullInput_returnsZero() {
        val millis = parsePubDateToMillis(null)
        assertEquals(0L, millis)
    }

    @Test
    fun parsePubDateToMillis_withBlankInput_returnsZero() {
        val millis = parsePubDateToMillis("   ")
        assertEquals(0L, millis)
    }

    @Test
    fun parsePubDateToMillis_withInvalidFormat_returnsZero() {
        val millis = parsePubDateToMillis("invalid date string")
        assertEquals(0L, millis)
    }

    @Test
    fun convertRSSItemsToEpisodes_parsesPubDatesCorrectly() {
        val items = listOf(
            RSSItem(
                title = "Episode 1",
                pubDate = "Tue, 06 Oct 2026 10:18:48 +0000",
                audioUrl = "https://example.com/audio1.mp3"
            ),
            RSSItem(
                title = "Episode 2",
                pubDate = "invalid-date",
                audioUrl = "https://example.com/audio2.mp3"
            )
        )

        val beforeMs = System.currentTimeMillis()
        val episodes = convertRSSItemsToEpisodes(items, podcastId = 100L)
        val afterMs = System.currentTimeMillis()

        assertEquals(2, episodes.size)
        assertEquals(1791281928000L, episodes[0].publishDate)
        assertTrue("Fallback date should be around current time", episodes[1].publishDate in beforeMs..afterMs)
    }
}

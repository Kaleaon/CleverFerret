package com.universalmedialibrary

import com.universalmedialibrary.services.media.MediaSessionService
import org.junit.Test

class MediaSessionServiceTest {

    @Test
    fun `service constants are properly defined`() {
        // Verify that essential constants are defined
        assert(MediaSessionService.ACTION_PLAY_PAUSE.isNotEmpty())
        assert(MediaSessionService.ACTION_NEXT.isNotEmpty())
        assert(MediaSessionService.ACTION_PREVIOUS.isNotEmpty())
        assert(MediaSessionService.ACTION_STOP.isNotEmpty())
    }
}
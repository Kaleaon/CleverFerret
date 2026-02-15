package com.universalmedialibrary.services.opds

import com.universalmedialibrary.core.FormatRegistry
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.SharedLink
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.repository.SharingRepository
import fi.iki.elonen.NanoHTTPD
import io.mockk.coEvery
import io.mockk.every
import io.mockk.mockk
import kotlinx.coroutines.delay
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class OpdsServerTest {

    private val mediaRepository = mockk<MediaRepository>()
    private val libraryRepository = mockk<LibraryRepository>()
    private val sharingRepository = mockk<SharingRepository>()
    private val opdsFeedGenerator = mockk<OpdsFeedGenerator>()
    private val formatRegistry = mockk<FormatRegistry>()

    @Test
    fun `serve libraries returns accepted quickly while token lookup is inflight`() {
        coEvery { sharingRepository.getByToken("slow-token") } coAnswers {
            delay(300)
            SharedLink(targetType = "LIBRARY", targetId = 7L, token = "slow-token")
        }
        coEvery { libraryRepository.getLibraryById(7L) } returns Library(
            libraryId = 7L,
            name = "Sci-Fi",
            type = "BOOK",
            path = "/tmp/library"
        )
        every { opdsFeedGenerator.generateCatalogFeed() } returns "<feed/>"

        val server = OpdsServer(
            mediaRepository,
            libraryRepository,
            sharingRepository,
            opdsFeedGenerator,
            formatRegistry
        )
        server.forceEnabledForTest()

        try {
            val firstStart = System.nanoTime()
            val firstResponse = server.serve(mockSession("/opds/libraries", mapOf("token" to listOf("slow-token"))))
            val elapsedMs = (System.nanoTime() - firstStart) / 1_000_000

            assertEquals(NanoHTTPD.Response.Status.ACCEPTED, firstResponse.status)
            assertTrue("Expected fast non-blocking response but took ${elapsedMs}ms", elapsedMs < 150)

            Thread.sleep(350)
            val secondResponse = server.serve(mockSession("/opds/libraries", mapOf("token" to listOf("slow-token"))))
            assertEquals(NanoHTTPD.Response.Status.OK, secondResponse.status)
        } finally {
            server.stopServer()
        }
    }

    private fun OpdsServer.forceEnabledForTest() {
        val field = OpdsServer::class.java.getDeclaredField("enabled")
        field.isAccessible = true
        field.set(this, true)
    }

    private fun mockSession(uri: String, parameters: Map<String, List<String>>): NanoHTTPD.IHTTPSession {
        val session = mockk<NanoHTTPD.IHTTPSession>()
        every { session.uri } returns uri
        every { session.parameters } returns parameters
        return session
    }
}

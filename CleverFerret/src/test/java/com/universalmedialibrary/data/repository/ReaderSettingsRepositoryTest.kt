package com.universalmedialibrary.data.repository

import android.content.Context
import androidx.room.Room
import androidx.test.core.app.ApplicationProvider
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.CustomFontDao
import com.universalmedialibrary.data.local.dao.ReaderSettingsDao
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.runBlocking
import org.junit.After
import org.junit.Assert.assertThrows
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.io.File

@RunWith(RobolectricTestRunner::class)
@Config(manifest = Config.NONE, sdk = [28])
class ReaderSettingsRepositoryTest {

    private lateinit var context: Context
    private lateinit var database: AppDatabase
    private lateinit var readerSettingsDao: ReaderSettingsDao
    private lateinit var customFontDao: CustomFontDao
    private lateinit var repository: ReaderSettingsRepository

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        database = Room.inMemoryDatabaseBuilder(context, AppDatabase::class.java)
            .allowMainThreadQueries()
            .build()
        readerSettingsDao = database.readerSettingsDao()
        customFontDao = database.customFontDao()
        repository = ReaderSettingsRepository(context, readerSettingsDao, customFontDao)
    }

    @After
    fun tearDown() {
        database.close()
    }

    @Test
    fun importCustomFont_validTtf_persistsToStorageAndDatabase(): Unit = runBlocking {
        // Create sample TTF file
        val tempFontFile = File(context.cacheDir, "sample_font.ttf").apply {
            writeBytes("TTF_DUMMY_FONT_BYTES_1234567890".toByteArray())
        }

        val result = repository.importCustomFontFile(tempFontFile, "Sample TTF Font")

        assertThat(result).isNotNull()
        assertThat(result.displayName).isEqualTo("Sample TTF Font")
        assertThat(File(result.filePath).exists()).isTrue()
        assertThat(result.filePath).contains("fonts")

        // Verify database persistence
        val dbRecord = customFontDao.getCustomFontById(result.id)
        assertThat(dbRecord).isNotNull()
        assertThat(dbRecord?.displayName).isEqualTo("Sample TTF Font")

        val allFonts = repository.getAllCustomFonts()
        assertThat(allFonts).hasSize(1)
        assertThat(allFonts.first().id).isEqualTo(result.id)

        val flowFonts = repository.getCustomFontsFlow().first()
        assertThat(flowFonts).hasSize(1)

        // Clean up temp
        tempFontFile.delete()
    }

    @Test
    fun importCustomFont_validOtf_persistsToStorageAndDatabase(): Unit = runBlocking {
        // Create sample OTF file
        val tempFontFile = File(context.cacheDir, "sample_font.otf").apply {
            writeBytes("OTF_DUMMY_FONT_BYTES_0987654321".toByteArray())
        }

        val result = repository.importCustomFontFile(tempFontFile, "Sample OTF Font")

        assertThat(result).isNotNull()
        assertThat(result.displayName).isEqualTo("Sample OTF Font")
        assertThat(File(result.filePath).exists()).isTrue()

        val dbRecord = customFontDao.getCustomFontById(result.id)
        assertThat(dbRecord).isNotNull()
        assertThat(dbRecord?.displayName).isEqualTo("Sample OTF Font")

        // Clean up temp
        tempFontFile.delete()
    }

    @Test
    fun importCustomFont_invalidExtension_throwsException(): Unit = runBlocking {
        val tempTextFile = File(context.cacheDir, "document.txt").apply {
            writeText("This is plain text, not a font file.")
        }

        val exception = assertThrows(IllegalArgumentException::class.java) {
            runBlocking {
                repository.importCustomFontFile(tempTextFile, "Invalid Font")
            }
        }

        assertThat(exception.message).contains("Only TTF and OTF files are supported")

        // Verify database remains empty
        val allFonts = repository.getAllCustomFonts()
        assertThat(allFonts).isEmpty()

        tempTextFile.delete()
    }

    @Test
    fun deleteCustomFont_removesDiskFileAndDatabaseRecord(): Unit = runBlocking {
        val tempFontFile = File(context.cacheDir, "to_delete.ttf").apply {
            writeBytes("DUMMY_FONT_BYTES".toByteArray())
        }

        val font = repository.importCustomFontFile(tempFontFile, "Font To Delete")
        val fontFilePath = font.filePath

        assertThat(File(fontFilePath).exists()).isTrue()
        assertThat(customFontDao.getCustomFontById(font.id)).isNotNull()

        // Delete custom font
        repository.deleteCustomFont(font.id)

        // Verify disk file deleted
        assertThat(File(fontFilePath).exists()).isFalse()

        // Verify database record deleted
        assertThat(customFontDao.getCustomFontById(font.id)).isNull()
        assertThat(repository.getAllCustomFonts()).isEmpty()

        tempFontFile.delete()
    }
}

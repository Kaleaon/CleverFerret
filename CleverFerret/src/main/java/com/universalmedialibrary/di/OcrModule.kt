package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.services.ocr.MLKitOcrService
import com.universalmedialibrary.services.ocr.OcrService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import kotlinx.serialization.json.Json
import javax.inject.Singleton

/**
 * Hilt module for OCR dependencies
 */
@Module
@InstallIn(SingletonComponent::class)
object OcrModule {

    @Provides
    @Singleton
    fun provideOcrService(
        @ApplicationContext context: Context
    ): OcrService {
        return MLKitOcrService(context)
    }

    @Provides
    @Singleton
    fun provideJson(): Json {
        return Json {
            ignoreUnknownKeys = true
            isLenient = true
            encodeDefaults = true
        }
    }
}

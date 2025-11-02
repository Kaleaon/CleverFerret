package com.universalmedialibrary.di

import android.content.Context
import com.universalmedialibrary.services.ocr.MLKitOcrService
import com.universalmedialibrary.services.ocr.MultiLanguageOcrService
import com.universalmedialibrary.services.ocr.OcrService
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import kotlinx.serialization.json.Json
import javax.inject.Named
import javax.inject.Singleton

/**
 * Hilt module for OCR dependencies
 */
@Module
@InstallIn(SingletonComponent::class)
object OcrModule {

    /**
     * Provide basic OCR service (Latin script only)
     */
    @Provides
    @Singleton
    @Named("BasicOcr")
    fun provideBasicOcrService(
        @ApplicationContext context: Context
    ): OcrService {
        return MLKitOcrService(context)
    }

    /**
     * Provide multi-language OCR service (primary service)
     */
    @Provides
    @Singleton
    fun provideOcrService(
        @ApplicationContext context: Context
    ): OcrService {
        return MultiLanguageOcrService(context)
    }

    /**
     * Provide multi-language OCR service with specific type
     */
    @Provides
    @Singleton
    fun provideMultiLanguageOcrService(
        @ApplicationContext context: Context
    ): MultiLanguageOcrService {
        return MultiLanguageOcrService(context)
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

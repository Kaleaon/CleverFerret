package com.universalmedialibrary.di

import com.universalmedialibrary.api.MediaCommandAPI
import com.universalmedialibrary.services.music.AdvancedMusicPlayerService
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Dagger Hilt module for media-related dependencies
 */
@Module
@InstallIn(SingletonComponent::class)
abstract class MediaModule {
    
    /**
     * Binds the AdvancedMusicPlayerService to MediaCommandAPI interface
     * This allows BroadcastReceiver to inject the interface instead of the concrete service
     */
    @Binds
    @Singleton
    abstract fun bindMediaCommandAPI(
        service: AdvancedMusicPlayerService
    ): MediaCommandAPI
}

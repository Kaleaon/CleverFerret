package com.universalmedialibrary.di

import android.content.Context
// import com.universalmedialibrary.data.settings.SettingsRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object SettingsModule {

    // Temporarily disabled until SettingsRepository is fixed
    // @Provides
    // @Singleton
    // fun provideSettingsRepository(
    //     @ApplicationContext context: Context
    // ): SettingsRepository {
    //     return SettingsRepository(context)
    // }
}
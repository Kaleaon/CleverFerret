package com.universalmedialibrary.di

import android.content.Context
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Basic Hilt module for dependency injection
 * Starting with minimal dependencies to ensure successful build
 */
@Module
@InstallIn(SingletonComponent::class)
object AppModule {
    
    // For now, just provide basic Context-based services
    // We'll add more complex dependencies incrementally
    
}

package com.universalmedialibrary.di

import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

/**
 * Main Hilt module for dependency injection
 */
@Module
@InstallIn(SingletonComponent::class)
object AppModule {
    // Basic module setup - dependencies will be added as needed
}
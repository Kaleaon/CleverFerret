package com.universalmedialibrary.di

import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.core.DebugFeatureFlagRegistry
import com.universalmedialibrary.core.FeatureFlagRegistry
import com.universalmedialibrary.core.FeatureFlags
import com.universalmedialibrary.core.ReleaseFeatureFlagRegistry
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object FeatureFlagModule {

    @Provides
    @Singleton
    fun provideFeatureFlagRegistry(
        debugRegistry: DebugFeatureFlagRegistry,
        releaseRegistry: ReleaseFeatureFlagRegistry
    ): FeatureFlagRegistry {
        val registry = if (BuildConfig.DEBUG) {
            debugRegistry
        } else {
            releaseRegistry
        }
        FeatureFlags.setRegistry(registry)
        return registry
    }
}

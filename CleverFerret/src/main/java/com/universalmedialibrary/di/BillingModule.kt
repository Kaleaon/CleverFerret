package com.universalmedialibrary.di

import com.universalmedialibrary.services.billing.BillingService
import com.universalmedialibrary.services.billing.GooglePlayBillingAdapter
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
abstract class BillingModule {

    @Binds
    @Singleton
    abstract fun bindBillingService(
        googlePlayBillingAdapter: GooglePlayBillingAdapter
    ): BillingService
}

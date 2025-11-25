package com.universalmedialibrary.di

import com.universalmedialibrary.services.dictionary.FreeDictionaryApi
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Named
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object DictionaryModule {

    @Provides
    @Singleton
    @Named("FreeDictionaryRetrofit")
    fun provideRetrofit(): Retrofit {
        return Retrofit.Builder()
            .baseUrl("https://api.dictionaryapi.dev/api/v2/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }

    @Provides
    @Singleton
    fun provideFreeDictionaryApi(@Named("FreeDictionaryRetrofit") retrofit: Retrofit): FreeDictionaryApi {
        return retrofit.create(FreeDictionaryApi::class.java)
    }
}

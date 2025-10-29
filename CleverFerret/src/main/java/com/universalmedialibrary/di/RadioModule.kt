package com.universalmedialibrary.di

import android.content.Context
import androidx.room.Room
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.RadioStationDao
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDao
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDatabase
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

/**
 * Hilt module for radio streaming dependencies
 */
@Module
@InstallIn(SingletonComponent::class)
object RadioModule {

    @Provides
    @Singleton
    fun provideRadioStationDao(database: AppDatabase): RadioStationDao {
        return database.radioStationDao()
    }

    @Provides
    @Singleton
    fun provideOldTimeRadioDatabase(@ApplicationContext context: Context): OldTimeRadioDatabase {
        return Room.databaseBuilder(
            context,
            OldTimeRadioDatabase::class.java,
            "old_time_radio_db"
        ).build()
    }

    @Provides
    @Singleton
    fun provideOldTimeRadioDao(database: OldTimeRadioDatabase): OldTimeRadioDao {
        return database.oldTimeRadioDao()
    }
}

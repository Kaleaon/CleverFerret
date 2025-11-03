package com.universalmedialibrary.data.midi

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters

/**
 * Room database for MIDI files, tracks, and soundfonts
 */
@Database(
    entities = [
        MidiFile::class,
        MidiTrackInfo::class,
        Soundfont::class
    ],
    version = 1,
    exportSchema = false
)
@TypeConverters(MidiTypeConverters::class)
abstract class MidiDatabase : RoomDatabase() {
    abstract fun midiDao(): MidiDao
    
    companion object {
        @Volatile
        private var INSTANCE: MidiDatabase? = null
        
        fun getInstance(context: Context): MidiDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    MidiDatabase::class.java,
                    "midi_database"
                )
                    .fallbackToDestructiveMigration()
                    .build()
                INSTANCE = instance
                instance
            }
        }
    }
}

/**
 * Type converters for Room database
 */
class MidiTypeConverters {
    @androidx.room.TypeConverter
    fun fromSoundfontFormat(format: SoundfontFormat): String {
        return format.name
    }
    
    @androidx.room.TypeConverter
    fun toSoundfontFormat(formatString: String): SoundfontFormat {
        return try {
            SoundfontFormat.valueOf(formatString)
        } catch (e: IllegalArgumentException) {
            SoundfontFormat.SF2 // Default fallback
        }
    }
}

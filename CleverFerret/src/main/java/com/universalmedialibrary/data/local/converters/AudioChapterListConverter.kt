package com.universalmedialibrary.data.local.converters

import androidx.room.TypeConverter
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.universalmedialibrary.services.audiobook.AudioChapter

/**
 * Room type converter for List<AudioChapter>
 */
class AudioChapterListConverter {
    private val gson = Gson()
    
    @TypeConverter
    fun fromAudioChapterList(chapters: List<AudioChapter>?): String? {
        return chapters?.let { gson.toJson(it) }
    }
    
    @TypeConverter
    fun toAudioChapterList(data: String?): List<AudioChapter>? {
        if (data == null) return null
        val listType = object : TypeToken<List<AudioChapter>>() {}.type
        return gson.fromJson(data, listType)
    }
}

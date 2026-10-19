package com.universalmedialibrary.data.crdt

import androidx.room.TypeConverter

class CrdtTypeConverters {

    @TypeConverter
    fun fromCrdtOperationType(type: CrdtOperationType?): String? {
        return type?.name
    }

    @TypeConverter
    fun toCrdtOperationType(value: String?): CrdtOperationType? {
        if (value.isNullOrEmpty()) return null
        return try {
            CrdtOperationType.valueOf(value)
        } catch (e: Exception) {
            CrdtOperationType.LWW_SET
        }
    }
}

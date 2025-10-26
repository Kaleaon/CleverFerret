#======================================
# CleverFerret ProGuard Rules
#======================================
# Project-specific rules for code shrinking and obfuscation
# 
# These rules ensure:
# - Proper preservation of framework classes
# - Room database functionality
# - Hilt dependency injection
# - Compose UI rendering
# - Network operations with Retrofit/OkHttp
# 
# For more information:
# https://developer.android.com/studio/build/shrink-code
#======================================

# Keep Android and AndroidX classes
-keep class android.** { *; }
-keep class androidx.** { *; }

# Keep Compose classes
-keep class androidx.compose.** { *; }
-dontwarn androidx.compose.**

# Keep Hilt classes
-keep class dagger.hilt.** { *; }
-keep class javax.inject.** { *; }

# Keep Room database classes
-keep class * extends androidx.room.RoomDatabase
-keep @androidx.room.Entity class *
-keepclassmembers class * {
    @androidx.room.* <fields>;
    @androidx.room.* <methods>;
}

# Keep Retrofit and OkHttp
-keep class retrofit2.** { *; }
-keep class okhttp3.** { *; }
-keepattributes Signature
-keepattributes *Annotation*

# Keep Kotlin Serialization
-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.AnnotationsKt
-keep,includedescriptorclasses class com.universalmedialibrary.**$$serializer { *; }
-keepclassmembers class com.universalmedialibrary.** {
    *** Companion;
}
-keepclasseswithmembers class com.universalmedialibrary.** {
    kotlinx.serialization.KSerializer serializer(...);
}

# Keep application classes
-keep class com.universalmedialibrary.** { *; }

# Keep Parcelable classes
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep Enum classes
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Prevent obfuscation of coroutines
-keep class kotlinx.coroutines.** { *; }
-dontwarn kotlinx.coroutines.**

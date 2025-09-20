# Add project specific ProGuard rules here.
# By default, the shrinker preserves all classes that have a public entry point (such as activities, services, etc.).
# You can add additional rules here for specific classes that you want to keep.
#
# For more information, see the Android documentation:
# https://developer.android.com/studio/build/shrink-code

# Keep application class
-keep class com.universalmedialibrary.CleverFerretApplication { *; }

# Keep all data classes and models for Room/serialization
-keep class com.universalmedialibrary.data.local.model.** { *; }
-keep class com.universalmedialibrary.data.settings.** { *; }

# Room specific rules
-keep class * extends androidx.room.RoomDatabase
-keep @androidx.room.Entity class *
-keep @androidx.room.Dao class *
-dontwarn android.arch.persistence.db.SupportSQLiteProgram
-dontwarn android.arch.persistence.db.SupportSQLiteQuery

# Hilt rules
-keep class dagger.hilt.** { *; }
-keep class javax.inject.** { *; }
-keep class * extends dagger.hilt.android.lifecycle.HiltViewModel { *; }
-keep @dagger.hilt.android.AndroidEntryPoint class * { *; }

# Kotlin serialization rules
-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.SerializationKt
-keep,includedescriptorclasses class com.universalmedialibrary.**$$serializer { *; }
-keepclassmembers class com.universalmedialibrary.** {
    *** Companion;
}
-keepclasseswithmembers class com.universalmedialibrary.** {
    kotlinx.serialization.KSerializer serializer(...);
}

# Media3 ExoPlayer rules
-keep class com.google.android.exoplayer2.** { *; }
-keep class androidx.media3.** { *; }
-dontwarn com.google.android.exoplayer2.**
-dontwarn androidx.media3.**

# Compose rules
-keep class androidx.compose.** { *; }
-dontwarn androidx.compose.**

# PDF processing
-keep class com.github.barteksc.pdfviewer.** { *; }
-keep class com.shockwave.** { *; }

# EPUB and document processing
-keep class org.jsoup.** { *; }
-keep class org.apache.commons.compress.** { *; }

# Jackson XML processing
-keep class com.fasterxml.jackson.** { *; }
-keep @com.fasterxml.jackson.annotation.JsonIgnoreProperties class * { *; }
-keep @com.fasterxml.jackson.annotation.JsonCreator class * { *; }
-keep @com.fasterxml.jackson.annotation.JsonProperty class * { *; }

# Keep service classes
-keep class com.universalmedialibrary.services.** { *; }

# General Android rules
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator CREATOR;
}

# Remove logging in release builds
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** i(...);
    public static *** v(...);
}

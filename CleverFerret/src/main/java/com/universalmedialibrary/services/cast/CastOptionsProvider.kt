package com.universalmedialibrary.services.cast

import android.content.Context
import com.google.android.gms.cast.framework.CastOptions
import com.google.android.gms.cast.framework.OptionsProvider
import com.google.android.gms.cast.framework.SessionProvider
import com.google.android.gms.cast.framework.media.CastMediaOptions
import com.google.android.gms.cast.framework.media.NotificationOptions

/**
 * Cast Options Provider for Chromecast configuration
 */
class CastOptionsProvider : OptionsProvider {
    override fun getCastOptions(context: Context): CastOptions {
        // Use the default Media Receiver or specify a custom receiver app ID
        // For now using the default styled media receiver
        val receiverAppId = "CC1AD845" // Default Media Receiver

        val notificationOptions = NotificationOptions.Builder()
            .setTargetActivityClassName(expandedControllerActivityClassName)
            .build()

        val mediaOptions = CastMediaOptions.Builder()
            .setNotificationOptions(notificationOptions)
            .setExpandedControllerActivityClassName(expandedControllerActivityClassName)
            .build()

        return CastOptions.Builder()
            .setReceiverApplicationId(receiverAppId)
            .setCastMediaOptions(mediaOptions)
            .build()
    }

    override fun getAdditionalSessionProviders(context: Context): List<SessionProvider>? {
        return null
    }

    companion object {
        private const val expandedControllerActivityClassName =
            "com.universalmedialibrary.ui.cast.ExpandedControlsActivity"
    }
}

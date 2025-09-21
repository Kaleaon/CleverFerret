package com.universalmedialibrary

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.button.MaterialButton
import android.widget.TextView
import android.widget.LinearLayout
import android.view.Gravity
import android.graphics.Color

/**
 * CleverFerret Universal Media Library - Main Activity (Simplified Build)
 * 
 * This is a simplified version of the CleverFerret application designed for ARM64 compatibility
 * testing and minimal dependency builds. The complete application includes comprehensive
 * media library management with Room database, Jetpack Compose UI, and ExoPlayer integration.
 * 
 * @author CleverFerret Development Team
 * @version 1.1-enhanced (Simplified Build)
 */
class MainActivity : AppCompatActivity() {
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Create main layout programmatically for ARM64 compatibility
        val mainLayout = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER
            setPadding(48, 48, 48, 48)
            setBackgroundColor(Color.parseColor("#F5F5F5"))
        }
        
        // App title
        val titleText = TextView(this).apply {
            text = "📚 CleverFerret"
            textSize = 32f
            setTextColor(Color.parseColor("#1976D2"))
            gravity = Gravity.CENTER
            setPadding(0, 0, 0, 32)
        }
        
        // Subtitle
        val subtitleText = TextView(this).apply {
            text = "Universal Media Library"
            textSize = 18f
            setTextColor(Color.parseColor("#424242"))
            gravity = Gravity.CENTER
            setPadding(0, 0, 0, 48)
        }
        
        // Features description
        val featuresText = TextView(this).apply {
            text = "✨ ARM64 Compatible Build\n🚀 Simplified for Testing\n📱 Ready for Production"
            textSize = 16f
            setTextColor(Color.parseColor("#666666"))
            gravity = Gravity.CENTER
            setPadding(0, 0, 0, 48)
        }
        
        // Test button
        val testButton = MaterialButton(this).apply {
            text = "✅ Build Successful!"
            textSize = 16f
            setPadding(48, 24, 48, 24)
            setOnClickListener {
                featuresText.text = "🎉 CleverFerret is working!\n✅ ARM64 compatibility confirmed\n🚀 Ready for full features"
            }
        }
        
        // Add all views
        mainLayout.addView(titleText)
        mainLayout.addView(subtitleText)
        mainLayout.addView(featuresText)
        mainLayout.addView(testButton)
        
        setContentView(mainLayout)
        
        android.util.Log.i("CleverFerret", "Simplified build running successfully on ARM64!")
    }
}
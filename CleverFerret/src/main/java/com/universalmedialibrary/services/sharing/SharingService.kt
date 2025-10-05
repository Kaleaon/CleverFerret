package com.universalmedialibrary.services.sharing

import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.net.Uri
import androidx.core.content.FileProvider
import dagger.hilt.android.qualifiers.ApplicationContext
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Sharing Service
 * Features:
 * - Quote sharing with custom backgrounds
 * - Reading progress sharing
 * - Book recommendations
 * - Social media integration
 * - Export annotations
 * - Share book covers
 * - Generate reading statistics images
 */

data class Quote(
    val text: String,
    val bookTitle: String,
    val author: String,
    val page: Int? = null
)

data class ReadingProgress(
    val bookTitle: String,
    val author: String,
    val progress: Float,
    val pagesRead: Int,
    val totalPages: Int
)

data class ReadingStats(
    val booksRead: Int,
    val pagesRead: Int,
    val readingTimeHours: Int,
    val favoriteGenre: String,
    val longestStreak: Int
)

@Singleton
class SharingService @Inject constructor(
    @ApplicationContext private val context: Context
) {

    /**
     * Share a quote
     */
    fun shareQuote(
        quote: Quote,
        includeImage: Boolean = true,
        onImageGenerated: ((Uri) -> Unit)? = null
    ) {
        val shareText = buildQuoteText(quote)
        
        if (includeImage) {
            // Generate quote image
            val bitmap = generateQuoteImage(quote)
            val imageUri = saveBitmapToCache(bitmap, "quote_${System.currentTimeMillis()}.png")
            
            // Share with image
            shareImageWithText(imageUri, shareText)
            onImageGenerated?.invoke(imageUri)
        } else {
            // Share text only
            shareText(shareText)
        }
    }

    /**
     * Share reading progress
     */
    fun shareReadingProgress(progress: ReadingProgress) {
        val bitmap = generateProgressImage(progress)
        val imageUri = saveBitmapToCache(bitmap, "progress_${System.currentTimeMillis()}.png")
        
        val shareText = "I'm ${(progress.progress * 100).toInt()}% through \"${progress.bookTitle}\" by ${progress.author}! 📚"
        shareImageWithText(imageUri, shareText)
    }

    /**
     * Share book recommendation
     */
    fun shareBookRecommendation(
        bookTitle: String,
        author: String,
        rating: Int,
        review: String? = null
    ) {
        val shareText = buildString {
            append("📖 Book Recommendation\n\n")
            append("\"$bookTitle\" by $author\n")
            append("⭐ ".repeat(rating))
            append("\n\n")
            if (review != null) {
                append(review)
                append("\n\n")
            }
            append("Shared from CleverFerret")
        }
        
        shareText(shareText)
    }

    /**
     * Share reading statistics
     */
    fun shareReadingStats(stats: ReadingStats) {
        val bitmap = generateStatsImage(stats)
        val imageUri = saveBitmapToCache(bitmap, "stats_${System.currentTimeMillis()}.png")
        
        val shareText = buildString {
            append("📊 My Reading Stats\n\n")
            append("📚 Books Read: ${stats.booksRead}\n")
            append("📄 Pages Read: ${stats.pagesRead}\n")
            append("⏰ Reading Time: ${stats.readingTimeHours}h\n")
            append("🎯 Favorite Genre: ${stats.favoriteGenre}\n")
            append("🔥 Longest Streak: ${stats.longestStreak} days")
        }
        
        shareImageWithText(imageUri, shareText)
    }

    /**
     * Export annotations as text file
     */
    fun exportAnnotations(
        annotations: List<Pair<String, String>>, // (text, note)
        bookTitle: String
    ): Uri {
        val fileName = "annotations_${bookTitle.replace(" ", "_")}.txt"
        val file = File(context.cacheDir, fileName)
        
        file.writer().use { writer ->
            writer.write("Annotations from \"$bookTitle\"\n\n")
            annotations.forEachIndexed { index, (text, note) ->
                writer.write("${index + 1}. $text\n")
                if (note.isNotEmpty()) {
                    writer.write("   Note: $note\n")
                }
                writer.write("\n")
            }
        }
        
        return FileProvider.getUriForFile(
            context,
            "${context.packageName}.fileprovider",
            file
        )
    }

    /**
     * Share to specific platform
     */
    fun shareToSocialMedia(
        platform: SocialPlatform,
        content: String,
        imageUri: Uri? = null
    ) {
        val intent = when (platform) {
            SocialPlatform.TWITTER -> createTwitterIntent(content, imageUri)
            SocialPlatform.FACEBOOK -> createFacebookIntent(content, imageUri)
            SocialPlatform.INSTAGRAM -> createInstagramIntent(imageUri)
            SocialPlatform.GOODREADS -> createGoodreadsIntent(content)
        }
        
        if (intent != null) {
            context.startActivity(Intent.createChooser(intent, "Share via"))
        }
    }

    /**
     * Build quote text for sharing
     */
    private fun buildQuoteText(quote: Quote): String {
        return buildString {
            append("\"${quote.text}\"\n\n")
            append("— ${quote.author}, ${quote.bookTitle}")
            if (quote.page != null) {
                append(" (p. ${quote.page})")
            }
            append("\n\nShared from CleverFerret 📚")
        }
    }

    /**
     * Generate quote image
     */
    private fun generateQuoteImage(quote: Quote): Bitmap {
        val width = 1080
        val height = 1080
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        val canvas = android.graphics.Canvas(bitmap)
        
        // Background gradient
        val gradient = android.graphics.LinearGradient(
            0f, 0f, 0f, height.toFloat(),
            intArrayOf(
                android.graphics.Color.parseColor("#667eea"),
                android.graphics.Color.parseColor("#764ba2")
            ),
            null,
            android.graphics.Shader.TileMode.CLAMP
        )
        val paint = android.graphics.Paint().apply {
            shader = gradient
        }
        canvas.drawRect(0f, 0f, width.toFloat(), height.toFloat(), paint)
        
        // Quote text
        val textPaint = android.graphics.Paint().apply {
            color = android.graphics.Color.WHITE
            textSize = 48f
            typeface = android.graphics.Typeface.create(
                android.graphics.Typeface.DEFAULT,
                android.graphics.Typeface.NORMAL
            )
            isAntiAlias = true
            textAlign = android.graphics.Paint.Align.CENTER
        }
        
        // Draw quote (word wrap)
        val words = quote.text.split(" ")
        var line = ""
        var y = height / 3f
        val lineHeight = 60f
        
        words.forEach { word ->
            val testLine = if (line.isEmpty()) word else "$line $word"
            val width = textPaint.measureText(testLine)
            
            if (width > 900) {
                canvas.drawText(line, width / 2f, y, textPaint)
                line = word
                y += lineHeight
            } else {
                line = testLine
            }
        }
        if (line.isNotEmpty()) {
            canvas.drawText(line, width / 2f, y, textPaint)
        }
        
        // Author and book
        val attributionPaint = android.graphics.Paint().apply {
            color = android.graphics.Color.WHITE
            textSize = 32f
            typeface = android.graphics.Typeface.create(
                android.graphics.Typeface.DEFAULT,
                android.graphics.Typeface.ITALIC
            )
            isAntiAlias = true
            textAlign = android.graphics.Paint.Align.CENTER
        }
        
        canvas.drawText(
            "— ${quote.author}",
            width / 2f,
            height * 0.75f,
            attributionPaint
        )
        canvas.drawText(
            quote.bookTitle,
            width / 2f,
            height * 0.75f + 45f,
            attributionPaint
        )
        
        return bitmap
    }

    /**
     * Generate progress image
     */
    private fun generateProgressImage(progress: ReadingProgress): Bitmap {
        val width = 1080
        val height = 1080
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        val canvas = android.graphics.Canvas(bitmap)
        
        // Background
        canvas.drawColor(android.graphics.Color.parseColor("#f8f9fa"))
        
        // Progress circle
        val centerX = width / 2f
        val centerY = height / 2f
        val radius = 300f
        
        val backgroundPaint = android.graphics.Paint().apply {
            color = android.graphics.Color.parseColor("#e9ecef")
            style = android.graphics.Paint.Style.STROKE
            strokeWidth = 40f
            isAntiAlias = true
        }
        canvas.drawCircle(centerX, centerY, radius, backgroundPaint)
        
        val progressPaint = android.graphics.Paint().apply {
            color = android.graphics.Color.parseColor("#4CAF50")
            style = android.graphics.Paint.Style.STROKE
            strokeWidth = 40f
            strokeCap = android.graphics.Paint.Cap.ROUND
            isAntiAlias = true
        }
        
        val rect = android.graphics.RectF(
            centerX - radius,
            centerY - radius,
            centerX + radius,
            centerY + radius
        )
        canvas.drawArc(rect, -90f, progress.progress * 360f, false, progressPaint)
        
        // Progress percentage
        val percentPaint = android.graphics.Paint().apply {
            color = android.graphics.Color.parseColor("#212529")
            textSize = 120f
            typeface = android.graphics.Typeface.create(
                android.graphics.Typeface.DEFAULT,
                android.graphics.Typeface.BOLD
            )
            textAlign = android.graphics.Paint.Align.CENTER
            isAntiAlias = true
        }
        canvas.drawText(
            "${(progress.progress * 100).toInt()}%",
            centerX,
            centerY + 40f,
            percentPaint
        )
        
        // Book title
        val titlePaint = android.graphics.Paint().apply {
            color = android.graphics.Color.parseColor("#495057")
            textSize = 36f
            textAlign = android.graphics.Paint.Align.CENTER
            isAntiAlias = true
        }
        canvas.drawText(progress.bookTitle, centerX, centerY + 400f, titlePaint)
        canvas.drawText(progress.author, centerX, centerY + 450f, titlePaint)
        
        return bitmap
    }

    /**
     * Generate statistics image
     */
    private fun generateStatsImage(stats: ReadingStats): Bitmap {
        val width = 1080
        val height = 1080
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        val canvas = android.graphics.Canvas(bitmap)
        
        // Background
        val gradient = android.graphics.LinearGradient(
            0f, 0f, 0f, height.toFloat(),
            intArrayOf(
                android.graphics.Color.parseColor("#f093fb"),
                android.graphics.Color.parseColor("#f5576c")
            ),
            null,
            android.graphics.Shader.TileMode.CLAMP
        )
        val paint = android.graphics.Paint().apply {
            shader = gradient
        }
        canvas.drawRect(0f, 0f, width.toFloat(), height.toFloat(), paint)
        
        // Title
        val titlePaint = android.graphics.Paint().apply {
            color = android.graphics.Color.WHITE
            textSize = 64f
            typeface = android.graphics.Typeface.create(
                android.graphics.Typeface.DEFAULT,
                android.graphics.Typeface.BOLD
            )
            textAlign = android.graphics.Paint.Align.CENTER
            isAntiAlias = true
        }
        canvas.drawText("My Reading Stats", width / 2f, 150f, titlePaint)
        
        // Stats
        val statPaint = android.graphics.Paint().apply {
            color = android.graphics.Color.WHITE
            textSize = 48f
            isAntiAlias = true
        }
        
        var y = 300f
        val lineHeight = 100f
        
        canvas.drawText("📚 Books Read: ${stats.booksRead}", 100f, y, statPaint)
        y += lineHeight
        canvas.drawText("📄 Pages Read: ${stats.pagesRead}", 100f, y, statPaint)
        y += lineHeight
        canvas.drawText("⏰ Reading Time: ${stats.readingTimeHours}h", 100f, y, statPaint)
        y += lineHeight
        canvas.drawText("🎯 Favorite: ${stats.favoriteGenre}", 100f, y, statPaint)
        y += lineHeight
        canvas.drawText("🔥 Streak: ${stats.longestStreak} days", 100f, y, statPaint)
        
        return bitmap
    }

    /**
     * Save bitmap to cache directory
     */
    private fun saveBitmapToCache(bitmap: Bitmap, fileName: String): Uri {
        val file = File(context.cacheDir, fileName)
        FileOutputStream(file).use { out ->
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, out)
        }
        
        return FileProvider.getUriForFile(
            context,
            "${context.packageName}.fileprovider",
            file
        )
    }

    /**
     * Share text only
     */
    private fun shareText(text: String) {
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = "text/plain"
            putExtra(Intent.EXTRA_TEXT, text)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        context.startActivity(Intent.createChooser(intent, "Share via"))
    }

    /**
     * Share image with text
     */
    private fun shareImageWithText(imageUri: Uri, text: String) {
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = "image/*"
            putExtra(Intent.EXTRA_STREAM, imageUri)
            putExtra(Intent.EXTRA_TEXT, text)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        context.startActivity(Intent.createChooser(intent, "Share via"))
    }

    /**
     * Create Twitter share intent
     */
    private fun createTwitterIntent(text: String, imageUri: Uri?): Intent? {
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = if (imageUri != null) "image/*" else "text/plain"
            putExtra(Intent.EXTRA_TEXT, text)
            imageUri?.let { putExtra(Intent.EXTRA_STREAM, it) }
            setPackage("com.twitter.android")
        }
        return intent
    }

    /**
     * Create Facebook share intent
     */
    private fun createFacebookIntent(text: String, imageUri: Uri?): Intent? {
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = if (imageUri != null) "image/*" else "text/plain"
            putExtra(Intent.EXTRA_TEXT, text)
            imageUri?.let { putExtra(Intent.EXTRA_STREAM, it) }
            setPackage("com.facebook.katana")
        }
        return intent
    }

    /**
     * Create Instagram share intent
     */
    private fun createInstagramIntent(imageUri: Uri?): Intent? {
        if (imageUri == null) return null
        
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = "image/*"
            putExtra(Intent.EXTRA_STREAM, imageUri)
            setPackage("com.instagram.android")
        }
        return intent
    }

    /**
     * Create Goodreads share intent
     */
    private fun createGoodreadsIntent(text: String): Intent? {
        // Goodreads doesn't have direct sharing, open in browser
        val url = "https://www.goodreads.com/review/new"
        val intent = Intent(Intent.ACTION_VIEW).apply {
            data = Uri.parse(url)
        }
        return intent
    }
}

enum class SocialPlatform {
    TWITTER,
    FACEBOOK,
    INSTAGRAM,
    GOODREADS
}
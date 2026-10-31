package com.universalmedialibrary.services.ai

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class SmartContentAnalyzer @Inject constructor(
    @ApplicationContext private val context: Context
) {
    fun analyzeContent(text: String): String = "analyzed"
}

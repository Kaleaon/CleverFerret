package com.universalmedialibrary.services.barcode

import android.app.Activity
import com.google.zxing.integration.android.IntentIntegrator
import com.google.zxing.integration.android.IntentResult
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Barcode Scanner Service using ZXing
 * 
 * Provides ISBN barcode scanning capabilities for quickly adding books to the library.
 * Uses the ZXing ("Zebra Crossing") library for barcode scanning.
 * 
 * Adapted from badreads project: https://github.com/fenimore/badreads
 */
@Singleton
class BarcodeScannerService @Inject constructor() {
    
    /**
     * Result of a barcode scan
     */
    sealed class ScanResult {
        data class Success(val isbn: String, val format: String) : ScanResult()
        data class Cancelled(val message: String = "Scan cancelled") : ScanResult()
        data class Error(val message: String) : ScanResult()
    }
    
    /**
     * Initiate barcode scanning
     * 
     * @param activity The activity to launch the scanner from
     * @param prompt Optional custom prompt message
     */
    fun startScan(activity: Activity, prompt: String = "Scan book barcode") {
        val integrator = IntentIntegrator(activity)
        integrator.setPrompt(prompt)
        integrator.setBeepEnabled(false)
        integrator.setOrientationLocked(false)
        integrator.setBarcodeImageEnabled(true)
        integrator.initiateScan()
    }
    
    /**
     * Parse the scan result from ZXing
     * 
     * @param result The intent result from the scanner activity
     * @return Parsed scan result
     */
    fun parseScanResult(result: IntentResult?): ScanResult {
        if (result == null || result.contents == null) {
            return ScanResult.Cancelled()
        }
        
        val contents = result.contents
        val format = result.formatName
        
        // Validate ISBN format
        if (!isValidISBN(contents)) {
            return ScanResult.Error("Invalid ISBN format: $contents")
        }
        
        return ScanResult.Success(
            isbn = contents,
            format = format
        )
    }
    
    /**
     * Validate ISBN format (ISBN-10 or ISBN-13)
     */
    private fun isValidISBN(isbn: String): Boolean {
        val cleaned = isbn.replace("-", "").replace(" ", "")
        return when (cleaned.length) {
            10 -> cleaned.matches(Regex("^\\d{9}[\\dX]$"))
            13 -> cleaned.matches(Regex("^\\d{13}$"))
            else -> false
        }
    }
    
    /**
     * Normalize ISBN to standard format
     */
    fun normalizeISBN(isbn: String): String {
        return isbn.replace("-", "").replace(" ", "")
    }
}

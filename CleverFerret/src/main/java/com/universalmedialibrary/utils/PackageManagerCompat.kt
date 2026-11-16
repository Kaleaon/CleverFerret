package com.universalmedialibrary.utils

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build

/**
 * Extension function for [PackageManager] that provides backwards-compatible
 * [PackageInfo] retrieval across Android versions.
 *
 * Android 13 (API 33, Tiramisu) deprecated [PackageManager.getPackageInfo] taking an [Int] flags parameter
 * in favor of [PackageManager.PackageInfoFlags].
 *
 * @param packageName The name of the package to retrieve.
 * @param flags Additional option flags to modify the data returned. Defaults to 0.
 * @return A [PackageInfo] object containing information about the package.
 * @throws PackageManager.NameNotFoundException if a package with the given name cannot be found.
 */
@Throws(PackageManager.NameNotFoundException::class)
fun PackageManager.getPackageInfoCompat(
    packageName: String,
    flags: Long = 0
): PackageInfo {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
        getPackageInfo(packageName, PackageManager.PackageInfoFlags.of(flags))
    } else {
        @Suppress("DEPRECATION")
        getPackageInfo(packageName, flags.toInt())
    }
}

/**
 * Convenience overload for [PackageManager.getPackageInfoCompat] accepting 32-bit integer [flags].
 */
@Throws(PackageManager.NameNotFoundException::class)
fun PackageManager.getPackageInfoCompat(
    packageName: String,
    flags: Int
): PackageInfo = getPackageInfoCompat(packageName, flags.toLong())

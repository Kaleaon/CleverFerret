package com.universalmedialibrary.api.plugin

/**
 * Representation of a semantic version (major.minor.patch).
 */
data class SemVer(
    val major: Int,
    val minor: Int = 0,
    val patch: Int = 0
) : Comparable<SemVer> {
    override fun compareTo(other: SemVer): Int {
        if (this.major != other.major) return this.major.compareTo(other.major)
        if (this.minor != other.minor) return this.minor.compareTo(other.minor)
        return this.patch.compareTo(other.patch)
    }

    companion object {
        fun parse(versionStr: String?): SemVer? {
            if (versionStr.isNullOrBlank()) return null
            val cleaned = versionStr.trim().removePrefix("v")
            if (cleaned.isEmpty()) return null
            val base = cleaned.split("-", "+")[0]
            val parts = base.split(".")
            val major = parts.getOrNull(0)?.toIntOrNull() ?: return null
            val minor = parts.getOrNull(1)?.toIntOrNull() ?: 0
            val patch = parts.getOrNull(2)?.toIntOrNull() ?: 0
            return SemVer(major, minor, patch)
        }
    }
}

/**
 * Pre-flight manifest validation result.
 */
sealed class ManifestValidationResult {
    object Valid : ManifestValidationResult()
    data class Invalid(val reason: String) : ManifestValidationResult()
}

/**
 * Strict validator for plugin manifests against host API constraints.
 */
object PluginManifestValidator {
    fun validate(manifest: PluginManifest?, currentHostVersion: String): ManifestValidationResult {
        if (manifest == null) {
            return ManifestValidationResult.Invalid("Plugin manifest is missing")
        }
        if (manifest.id.isBlank()) {
            return ManifestValidationResult.Invalid("Plugin ID cannot be blank")
        }
        if (manifest.name.isBlank()) {
            return ManifestValidationResult.Invalid("Plugin display name cannot be blank")
        }
        if (manifest.version.isBlank() || SemVer.parse(manifest.version) == null) {
            return ManifestValidationResult.Invalid("Plugin version is invalid or blank: '${manifest.version}'")
        }

        val hostSemVer = SemVer.parse(currentHostVersion)
            ?: return ManifestValidationResult.Invalid("Current host API version is invalid: '$currentHostVersion'")

        val minHostSemVer = SemVer.parse(manifest.minHostVersion)
            ?: return ManifestValidationResult.Invalid("Plugin minimum host version is invalid: '${manifest.minHostVersion}'")

        val maxHostSemVer = manifest.maxHostVersion?.takeIf { it.isNotBlank() }?.let { maxHostStr ->
            val parsed = SemVer.parse(maxHostStr)
                ?: return ManifestValidationResult.Invalid("Plugin maximum host version is invalid: '$maxHostStr'")

            if (minHostSemVer > parsed) {
                return ManifestValidationResult.Invalid(
                    "Plugin manifest version range invalid: minHostVersion '${manifest.minHostVersion}' is greater than maxHostVersion '$maxHostStr'"
                )
            }
            parsed
        }

        if (hostSemVer < minHostSemVer) {
            return ManifestValidationResult.Invalid(
                "Incompatible host API version '$currentHostVersion': minimum required host version is '${manifest.minHostVersion}'"
            )
        }

        if (maxHostSemVer != null && hostSemVer > maxHostSemVer) {
            return ManifestValidationResult.Invalid(
                "Incompatible host API version '$currentHostVersion': maximum supported host version is '${manifest.maxHostVersion}'"
            )
        }

        return ManifestValidationResult.Valid
    }
}

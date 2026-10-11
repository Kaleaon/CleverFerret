package com.universalmedialibrary.ui.modern.theme

import com.google.gson.JsonObject
import com.google.gson.JsonParser
import java.io.Reader

/** Consumer of the versioned Ktheme contract bundled under assets/theme. */
class CFLayoutStandard(val layout: CFLayout, private val spec: JsonObject, private val common: JsonObject) {
    val corners: CFLayoutCorners = spec.getAsJsonObject("corners").let {
        CFLayoutCorners(it["large"].asFloat, it["panel"].asFloat, it["tile"].asFloat,
            it["cover"].asFloat, it["control"].asFloat, it["icon"].asFloat, it["artwork"].asFloat)
    }
    val minimumTarget: Float = common["minimumTarget"].asFloat
    val adaptiveWidth: Float = common["adaptiveWidth"].asFloat
    val minimumMetadata: Float = spec.getAsJsonObject("typography")["minimumMetadata"].asFloat
    val navigationCase: String = spec.getAsJsonObject("typography")["navigationCase"].asString
    val navigationPhone: String = spec.getAsJsonObject("navigation")["phone"].asString
    val navigationWide: String = spec.getAsJsonObject("navigation")["wide"].asString
    val quiet: Boolean = spec["shadow"].asString == "none"
    val frame: CFLcarsFrame? = spec.getAsJsonObject("frame")?.let { CFLcarsFrame(it) }
    val maximumQuickActionHeight: Float? = spec["maximumQuickActionHeight"]?.asFloat

    companion object {
        const val ASSET_PATH = "theme/layout-standards.v1.json"
        private const val VERSION = 1

        fun read(reader: Reader, layout: CFLayout): CFLayoutStandard {
            val document = JsonParser.parseReader(reader).asJsonObject
            require(document["version"].asInt == VERSION) { "Unsupported layout contract version" }
            val spec = document.getAsJsonObject("layouts").getAsJsonObject(layout.id)
            require(spec["id"].asString == layout.id) { "Layout contract ID mismatch" }
            return CFLayoutStandard(layout, spec, document.getAsJsonObject("common"))
        }
    }
}

data class CFLayoutCorners(
    val large: Float, val panel: Float, val tile: Float, val cover: Float,
    val control: Float, val icon: Float, val artwork: Float
)

/** Elliptical outer arcs and circular inner arcs share centers on both opposing sweeps. */
class CFLcarsFrame(spec: JsonObject) {
    val rail: Float = spec["rail"].asFloat
    val bar: Float = spec["bar"].asFloat
    val gap: Float = spec["gap"].asFloat
    val inner: Float = spec["inner"].asFloat
    val arm: Float = spec["arm"].asFloat
    val header: Float = spec["header"].asFloat
    val elbow: Float = spec["elbow"].asFloat
    val footer: Float = spec["footer"].asFloat
    val outerX: Float = rail + inner
    val outerY: Float = bar + inner
    val headerTop: Float = arm + gap
    val headerBottom: Float = headerTop + header
    val contentTop: Float = headerBottom + gap
    val shellTop: Float = contentTop + bar
    val railTop: Float = contentTop + elbow + gap
}

@file:Suppress("MagicNumber")

import groovy.json.JsonSlurper

plugins {
    alias(libs.plugins.android.library)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.kotlin.compose)
    alias(libs.plugins.kotlin.serialization)
}

abstract class GenerateKthemeLayoutTokensTask : DefaultTask() {
    @get:InputFile
    abstract val jsonFile: RegularFileProperty

    @get:OutputDirectory
    abstract val outputDir: DirectoryProperty

    @TaskAction
    fun generate() {
        val file = jsonFile.get().asFile
        require(file.exists()) { "Layout JSON file does not exist at ${file.absolutePath}" }
        val jsonText = file.readText()
        val slurper = JsonSlurper()
        @Suppress("UNCHECKED_CAST")
        val jsonMap = slurper.parseText(jsonText) as Map<String, Any>
        @Suppress("UNCHECKED_CAST")
        val layouts = jsonMap["layouts"] as? Map<String, Map<String, Any>>
            ?: error("Invalid layout JSON format: missing 'layouts' object")

        val targetDir = outputDir.get().asFile.resolve("com/cleverferret/core/designsystem/theme")
        targetDir.mkdirs()

        targetDir.resolve("CFCornerTokens.kt").writeText(generateCornerTokensCode())
        targetDir.resolve("CFTypographySpec.kt").writeText(generateTypographySpecCode())
        targetDir.resolve("CFNavigationSpec.kt").writeText(generateNavigationSpecCode())
        targetDir.resolve("CFLcarsFrameSpec.kt").writeText(generateLcarsFrameSpecCode())
        targetDir.resolve("CFLayout.kt").writeText(generateLayoutEnumCode(layouts))
    }

    private fun generateCornerTokensCode(): String = """
        package com.cleverferret.core.designsystem.theme

        import androidx.compose.foundation.shape.CircleShape
        import androidx.compose.foundation.shape.CornerBasedShape
        import androidx.compose.foundation.shape.RoundedCornerShape
        import androidx.compose.material3.Shapes
        import androidx.compose.ui.unit.Dp
        import androidx.compose.ui.unit.dp

        data class CFCornerTokens(
            val largeDp: Int,
            val panelDp: Int,
            val tileDp: Int,
            val coverDp: Int,
            val controlDp: Int,
            val iconDp: Int,
            val artworkDp: Int,
        ) {
            val large: Dp get() = largeDp.dp
            val panel: Dp get() = panelDp.dp
            val tile: Dp get() = tileDp.dp
            val cover: Dp get() = coverDp.dp
            val control: Dp get() = controlDp.dp
            val icon: Dp get() = iconDp.dp
            val artwork: Dp get() = artworkDp.dp

            val largeShape: CornerBasedShape get() = if (largeDp >= 999) CircleShape else RoundedCornerShape(largeDp.dp)
            val panelShape: CornerBasedShape get() = if (panelDp >= 999) CircleShape else RoundedCornerShape(panelDp.dp)
            val tileShape: CornerBasedShape get() = if (tileDp >= 999) CircleShape else RoundedCornerShape(tileDp.dp)
            val coverShape: CornerBasedShape get() = if (coverDp >= 999) CircleShape else RoundedCornerShape(coverDp.dp)
            val controlShape: CornerBasedShape get() = if (controlDp >= 999) CircleShape else RoundedCornerShape(controlDp.dp)
            val iconShape: CornerBasedShape get() = if (iconDp >= 999) CircleShape else RoundedCornerShape(iconDp.dp)
            val artworkShape: CornerBasedShape get() = if (artworkDp >= 999) CircleShape else RoundedCornerShape(artworkDp.dp)

            fun toMaterial3Shapes(): Shapes = Shapes(
                extraSmall = coverShape,
                small = tileShape,
                medium = panelShape,
                large = largeShape,
                extraLarge = artworkShape,
            )
        }
    """.trimIndent()

    private fun generateTypographySpecCode(): String = """
        package com.cleverferret.core.designsystem.theme

        import androidx.compose.ui.unit.TextUnit
        import androidx.compose.ui.unit.sp

        data class CFTypographySpec(
            val bodyFontFamily: String,
            val minimumMetadataSp: Int,
            val contentCase: String,
            val navigationCase: String,
            val mediaTracking: Double,
            val wrap: String,
        ) {
            val minimumMetadata: TextUnit get() = minimumMetadataSp.sp
        }
    """.trimIndent()

    private fun generateNavigationSpecCode(): String = """
        package com.cleverferret.core.designsystem.theme

        data class CFNavigationSpec(
            val phone: String,
            val wide: String,
        )
    """.trimIndent()

    private fun generateLcarsFrameSpecCode(): String = """
        package com.cleverferret.core.designsystem.theme

        import androidx.compose.ui.unit.Dp
        import androidx.compose.ui.unit.dp

        data class CFLcarsFrameSpec(
            val railDp: Int = 76,
            val barDp: Int = 12,
            val gapDp: Int = 4,
            val innerDp: Int = 18,
            val armDp: Int = 48,
            val headerDp: Int = 64,
            val elbowDp: Int = 48,
            val footerDp: Int = 24,
            val fieldColorHex: String = "#000000",
        ) {
            val rail: Dp get() = railDp.dp
            val bar: Dp get() = barDp.dp
            val gap: Dp get() = gapDp.dp
            val inner: Dp get() = innerDp.dp
            val arm: Dp get() = armDp.dp
            val header: Dp get() = headerDp.dp
            val elbow: Dp get() = elbowDp.dp
            val footer: Dp get() = footerDp.dp
            val outerRadiusWidth: Dp get() = (innerDp + railDp).dp
            val outerRadiusHeight: Dp get() = (innerDp + barDp).dp
        }
    """.trimIndent()

    private fun generateLayoutEnumCode(layouts: Map<String, Map<String, Any>>): String {
        val entries = layouts.map { (key, data) ->
            val enumName = key.uppercase()
            val id = data["id"].toString()
            val displayName = data["name"].toString()

            @Suppress("UNCHECKED_CAST")
            val cornersMap = data["corners"] as Map<String, Any>
            val large = (cornersMap["large"] as Number).toInt()
            val panel = (cornersMap["panel"] as Number).toInt()
            val tile = (cornersMap["tile"] as Number).toInt()
            val cover = (cornersMap["cover"] as Number).toInt()
            val control = (cornersMap["control"] as Number).toInt()
            val icon = (cornersMap["icon"] as Number).toInt()
            val artwork = (cornersMap["artwork"] as Number).toInt()

            @Suppress("UNCHECKED_CAST")
            val typoMap = data["typography"] as Map<String, Any>
            val bodyFontFamily = typoMap["body"].toString()
            val minMeta = (typoMap["minimumMetadata"] as Number).toInt()
            val contentCase = typoMap["contentCase"].toString()
            val navCase = typoMap["navigationCase"].toString()
            val mediaTracking = (typoMap["mediaTracking"] as Number).toDouble()
            val wrap = typoMap["wrap"].toString()

            @Suppress("UNCHECKED_CAST")
            val navMap = data["navigation"] as Map<String, Any>
            val phone = navMap["phone"].toString()
            val wide = navMap["wide"].toString()

            val surfaces = data["surfaces"].toString()
            val actions = data["actions"].toString()
            val player = data["player"].toString()
            val shadow = data["shadow"].toString()
            val refEffect = data["referenceEffect"]?.takeIf { it != "null" }?.toString()
            val refEffectVal = if (refEffect != null) "\"$refEffect\"" else "null"

            @Suppress("UNCHECKED_CAST")
            val frameMap = data["frame"] as? Map<String, Any>
            val frameVal = if (frameMap != null) {
                val rail = (frameMap["rail"] as Number).toInt()
                val bar = (frameMap["bar"] as Number).toInt()
                val gap = (frameMap["gap"] as Number).toInt()
                val inner = (frameMap["inner"] as Number).toInt()
                val arm = (frameMap["arm"] as Number).toInt()
                val header = (frameMap["header"] as Number).toInt()
                val elbow = (frameMap["elbow"] as Number).toInt()
                val footer = (frameMap["footer"] as Number).toInt()
                val field = frameMap["field"].toString()
                "CFLcarsFrameSpec(railDp = $rail, barDp = $bar, gapDp = $gap, innerDp = $inner, armDp = $arm, headerDp = $header, elbowDp = $elbow, footerDp = $footer, fieldColorHex = \"$field\")"
            } else {
                "null"
            }

            """
    $enumName(
        id = "$id",
        displayName = "$displayName",
        corners = CFCornerTokens(
            largeDp = $large,
            panelDp = $panel,
            tileDp = $tile,
            coverDp = $cover,
            controlDp = $control,
            iconDp = $icon,
            artworkDp = $artwork,
        ),
        typography = CFTypographySpec(
            bodyFontFamily = "$bodyFontFamily",
            minimumMetadataSp = $minMeta,
            contentCase = "$contentCase",
            navigationCase = "$navCase",
            mediaTracking = $mediaTracking,
            wrap = "$wrap",
        ),
        navigation = CFNavigationSpec(
            phone = "$phone",
            wide = "$wide",
        ),
        surfaces = "$surfaces",
        actions = "$actions",
        player = "$player",
        shadow = "$shadow",
        referenceEffect = $refEffectVal,
        lcarsFrame = $frameVal,
    )""".trimIndent()
        }.joinToString(",\n")

        return """
package com.cleverferret.core.designsystem.theme

enum class CFLayout(
    val id: String,
    val displayName: String,
    val corners: CFCornerTokens,
    val typography: CFTypographySpec,
    val navigation: CFNavigationSpec,
    val surfaces: String,
    val actions: String,
    val player: String,
    val shadow: String,
    val referenceEffect: String? = null,
    val lcarsFrame: CFLcarsFrameSpec? = null,
) {
$entries;

    companion object {
        val Compose: CFLayout = COMPOSE
        val Lcars: CFLayout = SWEEP
        val Metro: CFLayout = TILES
        val Terminal: CFLayout = TERMINAL
        val Sweep: CFLayout = SWEEP
        val Tiles: CFLayout = TILES
        val Glass: CFLayout = GLASS
        val Rules: CFLayout = RULES
        val Press: CFLayout = PRESS

        fun fromId(id: String?): CFLayout {
            if (id.isNullOrBlank()) return COMPOSE
            return when (id.trim().lowercase()) {
                "compose" -> COMPOSE
                "terminal" -> TERMINAL
                "sweep", "lcars" -> SWEEP
                "tiles", "metro" -> TILES
                "glass" -> GLASS
                "rules" -> RULES
                "press" -> PRESS
                else -> COMPOSE
            }
        }
    }
}
        """.trimIndent()
    }
}

val layoutJsonFile = provider {
    val kthemeFile = file("${project.rootDir}/../Ktheme/src/standards/layouts.v1.json")
    val localFile = file("src/main/resources/standards/layouts.v1.json")
    if (kthemeFile.exists()) kthemeFile else localFile
}

val generateLayoutTokensTask = tasks.register<GenerateKthemeLayoutTokensTask>("generateKthemeLayoutTokens") {
    jsonFile.set(layoutJsonFile.get())
    outputDir.set(layout.buildDirectory.dir("generated/ksp/src/main/kotlin"))
}

android {
    namespace = "com.cleverferret.core.designsystem"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    sourceSets {
        named("main") {
            java.srcDir(layout.buildDirectory.dir("generated/ksp/src/main/kotlin"))
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }
    buildFeatures {
        compose = true
    }
}

tasks.named("preBuild").configure {
    dependsOn(generateLayoutTokensTask)
}

tasks.matching { it.name.startsWith("compile") && it.name.endsWith("Kotlin") }.configureEach {
    dependsOn(generateLayoutTokensTask)
}

dependencies {
    implementation(platform(libs.androidx.compose.bom))
    implementation(libs.androidx.compose.ui)
    implementation(libs.androidx.compose.material3)
    implementation(libs.androidx.core.ktx)
    implementation(libs.kotlinx.serialization.json)
    testImplementation(libs.junit)
    testImplementation(libs.kotlinx.coroutines.test)
}


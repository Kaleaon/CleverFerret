plugins {
    application
}

val targetJavaVersion = if (JavaVersion.current() == JavaVersion.VERSION_17) 17 else JavaVersion.current().majorVersion.toInt()

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(targetJavaVersion))
    }
}

application {
    mainClass.set("com.cleverferret.v2.app.MainKt")
}

dependencies {
    testImplementation(kotlin("test"))
    implementation(project(":CleverFerretV2:core:common"))
    implementation(project(":CleverFerretV2:core:ui"))
    implementation(project(":CleverFerretV2:core:data"))
    implementation(project(":CleverFerretV2:core:network"))
    implementation(project(":CleverFerretV2:core:database"))
    implementation(project(":CleverFerretV2:core:media"))
    implementation(project(":CleverFerretV2:core:auth"))

    implementation(project(":CleverFerretV2:feature:library"))
    implementation(project(":CleverFerretV2:feature:reader"))
    implementation(project(":CleverFerretV2:feature:audio"))
    implementation(project(":CleverFerretV2:feature:radio"))
    implementation(project(":CleverFerretV2:feature:podcast"))
    implementation(project(":CleverFerretV2:feature:webfiction"))
    implementation(project(":CleverFerretV2:feature:metadata"))
    implementation(project(":CleverFerretV2:feature:sync"))
    implementation(project(":CleverFerretV2:feature:opds"))
    implementation(project(":CleverFerretV2:feature:plex"))
    implementation(project(":CleverFerretV2:feature:settings"))
    implementation(project(":CleverFerretV2:feature:search"))
    implementation(project(":CleverFerretV2:feature:collections"))
    implementation(project(":CleverFerretV2:feature:stats"))
    implementation(project(":CleverFerretV2:feature:widgets"))
}

plugins {
    application
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

application {
    mainClass.set("com.cleverferret.v2.app.MainKt")
}

dependencies {
    testImplementation(kotlin("test"))
    implementation(project(":core:common"))
    implementation(project(":core:ui"))
    implementation(project(":core:data"))
    implementation(project(":core:network"))
    implementation(project(":core:database"))
    implementation(project(":core:media"))
    implementation(project(":core:auth"))

    implementation(project(":feature:library"))
    implementation(project(":feature:reader"))
    implementation(project(":feature:audio"))
    implementation(project(":feature:radio"))
    implementation(project(":feature:podcast"))
    implementation(project(":feature:webfiction"))
    implementation(project(":feature:metadata"))
    implementation(project(":feature:sync"))
    implementation(project(":feature:opds"))
    implementation(project(":feature:plex"))
    implementation(project(":feature:settings"))
    implementation(project(":feature:search"))
    implementation(project(":feature:collections"))
    implementation(project(":feature:stats"))
    implementation(project(":feature:widgets"))
}

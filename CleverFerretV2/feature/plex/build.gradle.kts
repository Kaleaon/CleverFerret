dependencies {
    api(project(":core:common"))
    api(project(":core:data"))
    implementation(project(":core:network"))
    implementation(project(":core:auth"))
    implementation(project(":core:ui"))

    testImplementation(kotlin("test"))
}

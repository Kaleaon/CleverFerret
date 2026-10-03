dependencies {
    api(project(":core:common"))
    api(project(":core:data"))
    implementation(project(":core:network"))

    testImplementation(kotlin("test"))
}

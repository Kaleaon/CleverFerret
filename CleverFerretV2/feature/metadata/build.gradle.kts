dependencies {
    api(project(":core:common"))
    api(project(":core:data"))
    api(project(":feature:ai"))
    implementation(project(":core:network"))

    testImplementation(kotlin("test"))
}

dependencies {
    api(project(":CleverFerretV2:core:common"))
    api(project(":CleverFerretV2:core:data"))
    implementation(project(":CleverFerretV2:core:network"))

    testImplementation(kotlin("test"))
}

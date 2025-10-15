#!/bin/bash

# Script to update API level references from 26 to 36 and android-34 to android-36

echo "Updating API level references across the project..."

# Update minSdk references in markdown files
find . -name "*.md" -type f -exec sed -i 's/minSdk.*26/minSdk 36/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/minSdk = 26/minSdk = 36/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/minSdk: 26/minSdk: 36/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/minSdkVersion 26/minSdkVersion 36/g' {} \;

# Update API level references
find . -name "*.md" -type f -exec sed -i 's/API 26/API 36/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/API level 26/API level 36/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/Android 8\.0+/Android 15+/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/Android 8\.0 or higher/Android 15 or higher/g' {} \;

# Update compileSdk and targetSdk references to 36
find . -name "*.md" -type f -exec sed -i 's/compileSdk = 34/compileSdk = 36/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/targetSdk = 34/targetSdk = 36/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/compileSdk: 34/compileSdk: 36/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/targetSdk: 34/targetSdk: 36/g' {} \;

# Update android-34 to android-36 references
find . -name "*.md" -type f -exec sed -i 's/android-34/android-36/g' {} \;
find . -name "*.md" -type f -exec sed -i 's/platforms;android-34/platforms;android-36/g' {} \;

# Update YAML files
find . -name "*.yml" -type f -exec sed -i 's/android-34/android-36/g' {} \;
find . -name "*.yml" -type f -exec sed -i 's/platforms;android-34/platforms;android-36/g' {} \;
find . -name "*.yaml" -type f -exec sed -i 's/android-34/android-36/g' {} \;
find . -name "*.yaml" -type f -exec sed -i 's/platforms;android-34/platforms;android-36/g' {} \;

# Update Kotlin comments
find . -name "*.kt" -type f -exec sed -i 's/minSdk 26/minSdk 36/g' {} \;
find . -name "*.kt" -type f -exec sed -i 's/minSdk = 26/minSdk = 36/g' {} \;
find . -name "*.kt" -type f -exec sed -i 's/API 26/API 36/g' {} \;
find . -name "*.kt" -type f -exec sed -i 's/API level 26/API level 36/g' {} \;
find . -name "*.kt" -type f -exec sed -i 's/Android 8\.0/Android 15/g' {} \;

# Update copilot instructions
find . -name "*copilot*" -type f -exec sed -i 's/minSdk 26/minSdk 36/g' {} \;
find . -name "*copilot*" -type f -exec sed -i 's/compileSdk = 34/compileSdk = 36/g' {} \;
find . -name "*copilot*" -type f -exec sed -i 's/targetSdk = 34/targetSdk = 36/g' {} \;
find . -name "*copilot*" -type f -exec sed -i 's/android-34/android-36/g' {} \;

echo "API level update complete!"
echo "Summary:"
echo "- minSdk: 26 → 36 (Android 8.0 → Android 15)"
echo "- compileSdk: 34 → 36"
echo "- targetSdk: 34 → 36"
echo "- Platform: android-34 → android-36"

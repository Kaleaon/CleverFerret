#!/bin/bash

# CleverFerret Docker Build Solution for ARM64 Compatibility
# Uses x86_64 Docker container to bypass ARM64 AAPT2 issues

echo "🚀 CleverFerret Docker Build Solution"
echo "Solving ARM64 AAPT2 compatibility issues using x86_64 container"

# Check if Docker is available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found. Installing Docker..."
    
    # Install Docker
    apt-get update
    apt-get install -y docker.io
    
    # Start Docker service
    service docker start 2>/dev/null || systemctl start docker 2>/dev/null || echo "Docker service start may need manual intervention"
fi

echo "✅ Docker available"

# Create Dockerfile for Android build
cat > Dockerfile.android-build << 'EOF'
# Use x86_64 base image to avoid ARM64 AAPT2 issues
FROM --platform=linux/amd64 openjdk:17-jdk-slim

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set up Android SDK
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# Create Android SDK directory
RUN mkdir -p $ANDROID_HOME

# Download and install Android command line tools
RUN cd $ANDROID_HOME && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
    unzip -q commandlinetools-linux-11076708_latest.zip && \
    mkdir -p cmdline-tools/latest && \
    mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true && \
    rm commandlinetools-linux-11076708_latest.zip

# Accept licenses and install required components
RUN yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses && \
    $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platforms;android-34" && \
    $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "build-tools;33.0.2" && \
    $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "platform-tools"

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the APK
CMD ["./gradlew", "assembleDebug", "--no-daemon", "--stacktrace"]
EOF

echo "✅ Dockerfile created"

# Build Docker image
echo "🔨 Building Docker image with x86_64 Android environment..."
docker build --platform linux/amd64 -f Dockerfile.android-build -t cleverferret-builder:latest . || {
    echo "❌ Docker build failed. Trying alternative approach..."
    exit 1
}

echo "✅ Docker image built successfully"

# Run the build in Docker container
echo "🚀 Running Android build in x86_64 container..."
docker run --rm --platform linux/amd64 -v $(pwd):/app -w /app cleverferret-builder:latest || {
    echo "❌ Docker build run failed"
    exit 1
}

echo "✅ Build completed in Docker container"

# Check if APK was created
if [ -f "CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk" ]; then
    echo "🎉 SUCCESS: APK created successfully!"
    
    # Copy to builds directory
    mkdir -p builds
    cp CleverFerret/build/outputs/apk/debug/CleverFerret-debug.apk builds/CleverFerret-docker-build-$(date +%Y%m%d).apk
    
    echo "📱 APK Location: builds/CleverFerret-docker-build-$(date +%Y%m%d).apk"
    ls -lh builds/CleverFerret-docker-build-$(date +%Y%m%d).apk
else
    echo "❌ APK not found. Check build logs above."
    exit 1
fi

echo "🎯 CleverFerret Docker build solution completed successfully!"
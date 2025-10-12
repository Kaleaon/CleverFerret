#!/bin/bash

# GitHub Release Creation Script for CleverFerret v1.0.0
# This script creates a GitHub release with the pre-built APK files

set -e

VERSION="v1.0.0"
REPO_OWNER="YOUR_USERNAME"  # Replace with actual GitHub username
REPO_NAME="YOUR_REPO"        # Replace with actual repo name

# Check if gh is authenticated
if ! gh auth status &>/dev/null; then
    echo "Error: GitHub CLI is not authenticated"
    echo "Please run: gh auth login"
    echo "Or set GH_TOKEN environment variable"
    exit 1
fi

# Check if release already exists
if gh release view "$VERSION" &>/dev/null; then
    echo "Release $VERSION already exists."
    read -p "Do you want to delete and recreate it? (y/N): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo "Deleting existing release..."
        gh release delete "$VERSION" --yes
    else
        echo "Aborting."
        exit 1
    fi
fi

# Check if APK files exist
if [[ ! -f "builds/universal-media-library-v1.0-signed.apk" ]]; then
    echo "Error: Signed APK not found at builds/universal-media-library-v1.0-signed.apk"
    exit 1
fi

if [[ ! -f "builds/universal-media-library-v1.0.apk" ]]; then
    echo "Error: Debug APK not found at builds/universal-media-library-v1.0.apk"
    exit 1
fi

# Create checksums
echo "Generating checksums..."
cd builds
sha256sum universal-media-library-v1.0-signed.apk > universal-media-library-v1.0-signed.apk.sha256
sha256sum universal-media-library-v1.0.apk > universal-media-library-v1.0.apk.sha256
cd ..

# Check if tag exists
if ! git rev-parse "$VERSION" >/dev/null 2>&1; then
    echo "Warning: Tag $VERSION does not exist."
    read -p "Do you want to create it at current HEAD? (y/N): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo "Creating tag $VERSION..."
        git tag -a "$VERSION" -m "Release $VERSION"
        git push origin "$VERSION"
    else
        echo "Aborting. Please create the tag first."
        exit 1
    fi
fi

# Create the release
echo "Creating GitHub release $VERSION..."
gh release create "$VERSION" \
    --title "CleverFerret $VERSION" \
    --notes-file RELEASE_NOTES.md \
    builds/universal-media-library-v1.0-signed.apk \
    builds/universal-media-library-v1.0.apk \
    builds/universal-media-library-v1.0-signed.apk.sha256 \
    builds/universal-media-library-v1.0.apk.sha256

echo ""
echo "✅ Release created successfully!"
echo "View it at: https://github.com/$REPO_OWNER/$REPO_NAME/releases/tag/$VERSION"
echo ""
echo "Next steps:"
echo "1. Verify the release page looks correct"
echo "2. Test downloading and installing the APKs"
echo "3. Announce the release to users"

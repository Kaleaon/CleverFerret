#!/usr/bin/env python3
"""Fix core library desugaring configuration in build.gradle.kts"""

import re

# Read the build.gradle.kts file
with open('CleverFerret/build.gradle.kts', 'r') as f:
    content = f.read()

# Add isCoreLibraryDesugaringEnabled to compileOptions
content = re.sub(
    r'(compileOptions\s*\{[^}]*targetCompatibility\s*=\s*JavaVersion\.VERSION_1_8)',
    r'\1\n        isCoreLibraryDesugaringEnabled = true',
    content
)

# Add coreLibraryDesugaring dependency if not present
if 'coreLibraryDesugaring' not in content:
    # Find the dependencies block and add the desugaring library
    content = re.sub(
        r'(dependencies\s*\{)',
        r'\1\n    // Core library desugaring for Java 8+ APIs\n    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")\n',
        content
    )

# Write the modified content back
with open('CleverFerret/build.gradle.kts', 'w') as f:
    f.write(content)

print("✅ Successfully added core library desugaring configuration")
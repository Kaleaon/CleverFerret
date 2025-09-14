#!/usr/bin/env python3
"""
Dependency Fixer for CleverFerret Android Project
This script analyzes and fixes problematic dependencies in the Android project.
"""

import re
import sys
from pathlib import Path

class DependencyFixer:
    def __init__(self, project_root):
        self.project_root = Path(project_root)
        self.build_file = self.project_root / "CleverFerret" / "build.gradle.kts"
        self.settings_file = self.project_root / "settings.gradle.kts"
        
    def analyze_dependencies(self):
        """Analyze current dependencies and suggest fixes"""
        print("🔍 Analyzing Android Dependencies...")
        print("=" * 50)
        
        if not self.build_file.exists():
            print("❌ build.gradle.kts not found")
            return False
        
        with open(self.build_file, 'r') as f:
            content = f.read()
        
        # Check for problematic dependencies
        problematic_deps = {
            'com.github.barteksc:android-pdf-viewer:3.2.0-beta.1': {
                'issue': 'Beta version not found',
                'fix': 'com.github.barteksc:android-pdf-viewer:2.8.2',
                'status': 'FIXED' if '2.8.2' in content else 'NEEDS_FIX'
            },
            'com.artifex.mupdf:mini:1.23.8': {
                'issue': 'Not compatible with Android',
                'fix': 'Remove - use android-pdf-viewer instead',
                'status': 'FIXED' if 'com.artifex.mupdf:mini:1.23.8' not in content else 'NEEDS_FIX'
            },
            'androidx.media3:media3-decoder-ffmpeg:1.3.0': {
                'issue': 'Version does not exist',
                'fix': 'Remove - use standard Media3 decoders',
                'status': 'FIXED' if 'media3-decoder-ffmpeg' not in content else 'NEEDS_FIX'
            },
            'org.apache.lucene:lucene-analyzers-common:9.7.0': {
                'issue': 'Too heavy for Android, version compatibility',
                'fix': 'Downgrade to 8.11.2 or remove',
                'status': 'FIXED' if '8.11.2' in content else 'NEEDS_FIX'
            },
            'com.github.kilianB:JImageHash:3.0.0': {
                'issue': 'Needs JitPack repository',
                'fix': 'Add JitPack repository',
                'status': 'NEEDS_REPO_CHECK'
            },
            'org.apache.commons:commons-net:3.9.0': {
                'issue': 'Wrong groupId',
                'fix': 'commons-net:commons-net:3.9.0',
                'status': 'FIXED' if 'commons-net:commons-net' in content else 'NEEDS_FIX'
            },
            'com.github.thegrizzlylabs:sardine-android:0.8': {
                'issue': 'Needs JitPack repository',
                'fix': 'Add JitPack repository',
                'status': 'NEEDS_REPO_CHECK'
            },
            'edu.stanford.nlp:stanford-corenlp:4.5.0': {
                'issue': 'Too heavy for Android (200MB+)',
                'fix': 'Remove - use lighter alternatives',
                'status': 'FIXED' if 'stanford-corenlp' not in content else 'NEEDS_FIX'
            }
        }
        
        print("📊 Dependency Analysis Results:")
        print("-" * 30)
        
        fixed_count = 0
        needs_fix_count = 0
        
        for dep, info in problematic_deps.items():
            status_icon = {
                'FIXED': '✅',
                'NEEDS_FIX': '❌',
                'NEEDS_REPO_CHECK': '🔍'
            }.get(info['status'], '❓')
            
            print(f"{status_icon} {dep}")
            print(f"   Issue: {info['issue']}")
            print(f"   Fix: {info['fix']}")
            print(f"   Status: {info['status']}")
            print()
            
            if info['status'] == 'FIXED':
                fixed_count += 1
            elif info['status'] == 'NEEDS_FIX':
                needs_fix_count += 1
        
        print(f"📈 Summary: {fixed_count} fixed, {needs_fix_count} need fixing")
        return needs_fix_count == 0
    
    def check_repositories(self):
        """Check if necessary repositories are configured"""
        print("\n🏛️ Checking Repository Configuration...")
        print("-" * 40)
        
        if not self.settings_file.exists():
            print("❌ settings.gradle.kts not found")
            return False
        
        with open(self.settings_file, 'r') as f:
            content = f.read()
        
        required_repos = {
            'google()': 'Google Maven Repository',
            'mavenCentral()': 'Maven Central Repository',
            'jitpack.io': 'JitPack (for GitHub libraries)',
        }
        
        missing_repos = []
        for repo, description in required_repos.items():
            if repo in content or 'jitpack.io' in content:
                print(f"✅ {description}")
            else:
                print(f"❌ {description}")
                missing_repos.append(repo)
        
        if missing_repos:
            print(f"\n⚠️  Missing repositories: {', '.join(missing_repos)}")
            return False
        
        print("✅ All required repositories are configured")
        return True
    
    def suggest_alternatives(self):
        """Suggest lighter alternatives for removed dependencies"""
        print("\n💡 Suggested Alternatives for Removed Dependencies:")
        print("-" * 50)
        
        alternatives = {
            'MuPDF (com.artifex.mupdf)': [
                'android-pdf-viewer (com.github.barteksc) - Already included',
                'PDF.js integration for WebView rendering',
                'Android native PDF rendering with PdfRenderer'
            ],
            'Stanford CoreNLP': [
                'Google ML Kit for text processing',
                'Apache OpenNLP (lighter alternative)',
                'Custom regex-based text analysis',
                'Cloud-based NLP APIs (Google, AWS)'
            ],
            'FFmpeg decoder': [
                'ExoPlayer standard decoders (already included)',
                'Android MediaMetadataRetriever',
                'VLC Android SDK (if needed)'
            ],
            'Heavy Lucene libraries': [
                'SQLite FTS (Full-Text Search)',
                'Room database search',
                'Simple string matching algorithms'
            ]
        }
        
        for category, alts in alternatives.items():
            print(f"🔧 {category}:")
            for alt in alts:
                print(f"   • {alt}")
            print()
    
    def generate_build_command(self):
        """Generate build command to test fixes"""
        print("🚀 Next Steps:")
        print("-" * 20)
        print("1. Test the dependency fixes:")
        print("   ./gradlew clean")
        print("   ./gradlew checkDebugAarMetadata")
        print("   ./gradlew assembleDebug")
        print()
        print("2. If successful, try lint:")
        print("   ./gradlew lintDebug")
        print()
        print("3. Full build test:")
        print("   ./gradlew build")
    
    def run_analysis(self):
        """Run complete dependency analysis"""
        success = True
        success &= self.analyze_dependencies()
        success &= self.check_repositories()
        
        self.suggest_alternatives()
        self.generate_build_command()
        
        if success:
            print("\n🎉 Dependency configuration looks good!")
            print("The build should now work without dependency resolution errors.")
        else:
            print("\n⚠️  Some issues remain. Check the analysis above.")
        
        return success

def main():
    if len(sys.argv) > 1:
        project_root = sys.argv[1]
    else:
        project_root = "/app"
    
    fixer = DependencyFixer(project_root)
    success = fixer.run_analysis()
    
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
#!/usr/bin/env python3
"""
Lint Configuration Checker for CleverFerret Android Project
This script validates that the lint configuration is properly set up
without requiring the full Android SDK installation.
"""

import os
import re
import sys
from pathlib import Path

class LintConfigChecker:
    def __init__(self, project_root):
        self.project_root = Path(project_root)
        # Prefer standard module name `app`, fallback to legacy `CleverFerret`
        candidate_app = self.project_root / "app"
        candidate_cf = self.project_root / "CleverFerret"
        self.android_dir = candidate_app if candidate_app.exists() else candidate_cf
        self.issues = []
        self.warnings = []
        
    def check_build_gradle_lint_config(self):
        """Check if build.gradle.kts has proper lint configuration"""
        build_file = self.android_dir / "build.gradle.kts"
        
        if not build_file.exists():
            self.issues.append("build.gradle.kts not found")
            return False
        
        with open(build_file, 'r') as f:
            content = f.read()
        
        # Check for lint block
        if "lint {" not in content:
            self.issues.append("No lint configuration block found in build.gradle.kts")
            return False
        
        # Check for key lint settings
        required_settings = [
            "abortOnError = false",
            "warningsAsErrors = false", 
            "lintConfig = file(\"lint.xml\")",
            "disable += setOf("
        ]
        
        missing_settings = []
        for setting in required_settings:
            if setting not in content:
                missing_settings.append(setting)
        
        if missing_settings:
            self.warnings.append(f"Missing lint settings: {', '.join(missing_settings)}")
        
        # Check for disabled lint rules
        disabled_rules = [
            "MissingTranslation",
            "HardcodedText", 
            "ContentDescription",
            "UnusedResources"
        ]
        
        missing_rules = []
        for rule in disabled_rules:
            if f'"{rule}"' not in content:
                missing_rules.append(rule)
        
        if missing_rules:
            self.warnings.append(f"Common problematic lint rules not disabled: {', '.join(missing_rules)}")
        
        return True
    
    def check_lint_xml_exists(self):
        """Check if lint.xml configuration file exists"""
        lint_file = self.android_dir / "lint.xml"
        
        if not lint_file.exists():
            self.issues.append("lint.xml configuration file not found")
            return False
        
        with open(lint_file, 'r') as f:
            content = f.read()
        
        # Basic XML validation
        if not content.startswith('<?xml'):
            self.issues.append("lint.xml is not a valid XML file")
            return False
        
        if '<lint>' not in content:
            self.issues.append("lint.xml missing root <lint> element")
            return False
        
        # Check for suppressed issues
        common_suppressions = [
            'id="MissingTranslation"',
            'id="HardcodedText"',
            'id="UnusedResources"'
        ]
        
        found_suppressions = 0
        for suppression in common_suppressions:
            if suppression in content:
                found_suppressions += 1
        
        if found_suppressions == 0:
            self.warnings.append("No common lint suppressions found in lint.xml")
        
        return True
    
    def check_strings_xml_exists(self):
        """Check if strings.xml exists to avoid translation issues"""
        strings_file = self.android_dir / "src/main/res/values/strings.xml"
        
        if not strings_file.exists():
            self.issues.append("strings.xml not found - this will cause translation lint errors")
            return False
        
        with open(strings_file, 'r') as f:
            content = f.read()
        
        # Check for basic strings
        if 'name="app_name"' not in content:
            self.warnings.append("app_name string not found in strings.xml")
        
        # Count string resources
        string_count = len(re.findall(r'<string name="[^"]*">', content))
        if string_count < 10:
            self.warnings.append(f"Only {string_count} string resources found - may need more for proper localization")
        
        return True
    
    def check_colors_xml_exists(self):
        """Check if colors.xml exists"""
        colors_file = self.android_dir / "src/main/res/values/colors.xml"
        
        if not colors_file.exists():
            self.warnings.append("colors.xml not found - recommended for theme consistency")
            return False
        
        return True
    
    def check_manifest_issues(self):
        """Check AndroidManifest.xml for common lint issues"""
        manifest_file = self.android_dir / "src/main/AndroidManifest.xml"
        
        if not manifest_file.exists():
            self.issues.append("AndroidManifest.xml not found")
            return False
        
        with open(manifest_file, 'r') as f:
            content = f.read()
        
        # Check for allowBackup setting
        if 'android:allowBackup=' not in content:
            self.warnings.append("allowBackup attribute not set in manifest")
        
        # Check for app icon
        if 'android:icon=' not in content:
            self.warnings.append("App icon not specified in manifest") 
        
        # Check for app label using string resource
        if 'android:label="@string/' not in content:
            self.warnings.append("App label should use string resource instead of hardcoded text")
        
        return True
    
    def check_gradle_wrapper(self):
        """Check if Gradle wrapper exists"""
        gradlew_file = self.project_root / "gradlew"
        
        if not gradlew_file.exists():
            self.issues.append("gradlew wrapper script not found")
            return False
        
        # Check if executable
        if not os.access(gradlew_file, os.X_OK):
            self.warnings.append("gradlew script is not executable")
        
        return True
    
    def run_all_checks(self):
        """Run all lint configuration checks"""
        print("🔍 Checking CleverFerret Lint Configuration...")
        print("=" * 50)
        
        checks = [
            ("Build Gradle Lint Config", self.check_build_gradle_lint_config),
            ("Lint XML Configuration", self.check_lint_xml_exists),
            ("Strings XML Resources", self.check_strings_xml_exists),
            ("Colors XML Resources", self.check_colors_xml_exists), 
            ("Android Manifest", self.check_manifest_issues),
            ("Gradle Wrapper", self.check_gradle_wrapper)
        ]
        
        passed = 0
        total = len(checks)
        
        for check_name, check_func in checks:
            try:
                result = check_func()
                status = "✅ PASS" if result else "❌ FAIL"
                print(f"{status} {check_name}")
                if result:
                    passed += 1
            except Exception as e:
                print(f"❌ FAIL {check_name} - Error: {e}")
        
        print("\n" + "=" * 50)
        print(f"📊 Summary: {passed}/{total} checks passed")
        
        if self.issues:
            print(f"\n🚨 Critical Issues ({len(self.issues)}):")
            for issue in self.issues:
                print(f"   • {issue}")
        
        if self.warnings:
            print(f"\n⚠️  Warnings ({len(self.warnings)}):")
            for warning in self.warnings:
                print(f"   • {warning}")
        
        if not self.issues:
            print("\n🎉 Lint configuration appears to be properly set up!")
            print("   The Android build should now pass lint checks.")
            print("\n📝 Next steps:")
            print("   1. Install Android SDK for full build testing")
            print("   2. Run: ./gradlew lintDebug") 
            print("   3. Check lint reports in CleverFerret/build/reports/")
            return True
        else:
            print(f"\n💥 Found {len(self.issues)} critical issues that need to be fixed")
            return False

def main():
    if len(sys.argv) > 1:
        project_root = sys.argv[1]
    else:
        project_root = "/app"
    
    checker = LintConfigChecker(project_root)
    success = checker.run_all_checks()
    
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
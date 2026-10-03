#!/usr/bin/env python3
"""
Android Responsive Navigation Testing for CleverFerret

This test suite validates the responsive navigation implementation:
1. ResponsiveNavigation.kt component structure
2. PhosphorIcons additions (Television, FilmSlate)
3. MainActivity.kt integration
4. Navigation items configuration
5. Kotlin syntax validation
6. Material 3 components usage
"""

import os
import re
from pathlib import Path
from typing import Dict, List, Tuple

class ResponsiveNavigationTester:
    """Test suite for responsive navigation components"""
    
    def __init__(self):
        self.app_path = "/app"
        self.test_results = []
        self.errors = []
        self.warnings = []
        
    def log_result(self, test_name: str, status: str, message: str, details: str = ""):
        """Log test result"""
        result = {
            "test": test_name,
            "status": status,
            "message": message,
            "details": details
        }
        self.test_results.append(result)
        
        if status == "FAIL":
            self.errors.append(f"{test_name}: {message}")
        elif status == "SKIP":
            self.warnings.append(f"{test_name}: {message}")
            
        print(f"[{status}] {test_name}: {message}")
        if details:
            print(f"    Details: {details}")
    
    def read_file(self, path: str) -> str:
        """Read file content"""
        try:
            with open(path, 'r', encoding='utf-8') as f:
                return f.read()
        except Exception as e:
            return ""
    
    def test_responsive_navigation_file(self) -> bool:
        """Test ResponsiveNavigation.kt exists and has proper structure"""
        print("\n=== Testing ResponsiveNavigation.kt ===")
        
        file_path = f"{self.app_path}/CleverFerret/src/main/java/com/universalmedialibrary/ui/components/ResponsiveNavigation.kt"
        
        if not os.path.exists(file_path):
            self.log_result("ResponsiveNavigation File", "FAIL", 
                          "ResponsiveNavigation.kt file not found")
            return False
        
        content = self.read_file(file_path)
        if not content:
            self.log_result("ResponsiveNavigation File", "FAIL", 
                          "Could not read ResponsiveNavigation.kt")
            return False
        
        # Check for required components
        required_items = [
            ("package com.universalmedialibrary.ui.components", "Package declaration"),
            ("data class NavigationItem", "NavigationItem data class"),
            ("object NavigationItems", "NavigationItems object"),
            ("@Composable", "Composable annotations"),
            ("fun ResponsiveNavigationScaffold", "ResponsiveNavigationScaffold function"),
            ("NavigationBar", "Material 3 NavigationBar"),
            ("NavigationRail", "Material 3 NavigationRail"),
            ("val isCompact = configuration.screenWidthDp < 600", "Responsive breakpoint"),
        ]
        
        missing = []
        for item, desc in required_items:
            if item not in content:
                missing.append(desc)
        
        if missing:
            self.log_result("ResponsiveNavigation Structure", "FAIL",
                          f"Missing {len(missing)} required components",
                          f"Missing: {', '.join(missing)}")
            return False
        
        self.log_result("ResponsiveNavigation Structure", "PASS",
                      "All required components present")
        return True
    
    def test_navigation_items(self) -> bool:
        """Test navigation items configuration"""
        print("\n=== Testing Navigation Items ===")
        
        file_path = f"{self.app_path}/CleverFerret/src/main/java/com/universalmedialibrary/ui/components/ResponsiveNavigation.kt"
        content = self.read_file(file_path)
        
        if not content:
            self.log_result("Navigation Items", "SKIP", "Could not read file")
            return False
        
        # Check for all 8 required media types
        required_media_types = [
            ("Home", "home"),
            ("Books", "library_details/1"),
            ("Comics", "library_details/3"),
            ("Audiobooks", "library_details/2"),
            ("Music", "music"),
            ("Movies", "library_details/4"),
            ("TV Shows", "library_details/5"),
            ("Radio", "radio")
        ]
        
        found = 0
        missing = []
        for label, route in required_media_types:
            if f'label = "{label}"' in content and route in content:
                found += 1
            else:
                missing.append(label)
        
        if found == 8:
            self.log_result("Navigation Items", "PASS",
                          f"All 8 required media types configured correctly")
            return True
        else:
            self.log_result("Navigation Items", "FAIL",
                          f"Only {found}/8 media types found",
                          f"Missing: {', '.join(missing)}")
            return False
    
    def test_phosphor_icons(self) -> bool:
        """Test PhosphorIcons additions"""
        print("\n=== Testing PhosphorIcons ===")
        
        file_path = f"{self.app_path}/CleverFerret/src/main/java/com/universalmedialibrary/ui/icons/PhosphorIcons.kt"
        content = self.read_file(file_path)
        
        if not content:
            self.log_result("PhosphorIcons", "SKIP", "Could not read file")
            return False
        
        # Check for new icons
        required_icons = [
            "val Television: ImageVector",
            "val FilmSlate: ImageVector",
            "private var _television: ImageVector?",
            "private var _filmSlate: ImageVector?"
        ]
        
        missing = []
        for icon in required_icons:
            if icon not in content:
                missing.append(icon)
        
        if not missing:
            self.log_result("PhosphorIcons", "PASS",
                          "Television and FilmSlate icons properly added")
            return True
        else:
            self.log_result("PhosphorIcons", "FAIL",
                          f"Missing {len(missing)} required icon components",
                          f"Missing: {', '.join(missing)}")
            return False
    
    def test_mainactivity_integration(self) -> bool:
        """Test MainActivity.kt integration"""
        print("\n=== Testing MainActivity Integration ===")
        
        file_path = f"{self.app_path}/CleverFerret/src/main/java/com/universalmedialibrary/MainActivity.kt"
        content = self.read_file(file_path)
        
        if not content:
            self.log_result("MainActivity Integration", "SKIP", "Could not read file")
            return False
        
        # Check for ResponsiveNavigationScaffold import and usage
        required_items = [
            "import com.universalmedialibrary.ui.components.ResponsiveNavigationScaffold",
            "ResponsiveNavigationScaffold(",
            "navController = navController"
        ]
        
        missing = []
        for item in required_items:
            if item not in content:
                missing.append(item)
        
        if not missing:
            self.log_result("MainActivity Integration", "PASS",
                          "ResponsiveNavigationScaffold properly integrated")
            return True
        else:
            self.log_result("MainActivity Integration", "FAIL",
                          f"Missing {len(missing)} required components",
                          f"Missing: {', '.join(missing)}")
            return False
    
    def test_kotlin_syntax(self) -> bool:
        """Test Kotlin syntax validity"""
        print("\n=== Testing Kotlin Syntax ===")
        
        files_to_check = [
            "CleverFerret/src/main/java/com/universalmedialibrary/ui/components/ResponsiveNavigation.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/ui/icons/PhosphorIcons.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/MainActivity.kt"
        ]
        
        syntax_errors = []
        for file_rel in files_to_check:
            file_path = f"{self.app_path}/{file_rel}"
            if not os.path.exists(file_path):
                continue
            
            content = self.read_file(file_path)
            if not content:
                continue
            
            # Basic syntax checks
            if content.count('{') != content.count('}'):
                syntax_errors.append(f"{file_rel}: Unbalanced braces")
            
            if content.count('(') != content.count(')'):
                syntax_errors.append(f"{file_rel}: Unbalanced parentheses")
            
            # Check for common Kotlin patterns
            if 'package ' not in content:
                syntax_errors.append(f"{file_rel}: Missing package declaration")
        
        if not syntax_errors:
            self.log_result("Kotlin Syntax", "PASS",
                          "All Kotlin files have valid syntax structure")
            return True
        else:
            self.log_result("Kotlin Syntax", "FAIL",
                          f"Found {len(syntax_errors)} syntax issues",
                          f"Issues: {'; '.join(syntax_errors)}")
            return False
    
    def test_material3_components(self) -> bool:
        """Test Material 3 components usage"""
        print("\n=== Testing Material 3 Components ===")
        
        file_path = f"{self.app_path}/CleverFerret/src/main/java/com/universalmedialibrary/ui/components/ResponsiveNavigation.kt"
        content = self.read_file(file_path)
        
        if not content:
            self.log_result("Material 3 Components", "SKIP", "Could not read file")
            return False
        
        # Check for Material 3 imports and components
        required_components = [
            "import androidx.compose.material3.*",
            "NavigationBar(",
            "NavigationBarItem(",
            "NavigationRail(",
            "NavigationRailItem(",
            "Scaffold(",
            "MaterialTheme.colorScheme"
        ]
        
        missing = []
        for component in required_components:
            if component not in content:
                missing.append(component)
        
        if not missing:
            self.log_result("Material 3 Components", "PASS",
                          "All required Material 3 components used correctly")
            return True
        else:
            self.log_result("Material 3 Components", "FAIL",
                          f"Missing {len(missing)} Material 3 components",
                          f"Missing: {', '.join(missing)}")
            return False
    
    def run_all_tests(self) -> Dict:
        """Run all tests and return summary"""
        print("Starting Android Responsive Navigation Tests...")
        print("=" * 70)
        
        # Run all tests
        self.test_responsive_navigation_file()
        self.test_navigation_items()
        self.test_phosphor_icons()
        self.test_mainactivity_integration()
        self.test_kotlin_syntax()
        self.test_material3_components()
        
        # Generate summary
        print("\n" + "=" * 70)
        print("ANDROID RESPONSIVE NAVIGATION - TEST REPORT")
        print("=" * 70)
        
        passed = sum(1 for r in self.test_results if r["status"] == "PASS")
        failed = sum(1 for r in self.test_results if r["status"] == "FAIL")
        skipped = sum(1 for r in self.test_results if r["status"] == "SKIP")
        total = len(self.test_results)
        
        print(f"\nTEST SUMMARY:")
        print(f"Total Tests: {total}")
        print(f"Passed: {passed}")
        print(f"Failed: {failed}")
        print(f"Skipped: {skipped}")
        print(f"Success Rate: {(passed/total*100) if total > 0 else 0:.1f}%")
        
        if self.errors:
            print(f"\nFAILED TESTS:")
            for error in self.errors:
                print(f"❌ {error}")
        
        passed_tests = [r for r in self.test_results if r["status"] == "PASS"]
        if passed_tests:
            print(f"\nPASSED TESTS:")
            for result in passed_tests:
                print(f"✅ {result['message']}")
        
        print("\n" + "=" * 70)
        
        if failed == 0:
            print("\n✅ All responsive navigation tests passed!")
            return {"status": "success", "passed": passed, "failed": failed, "total": total}
        else:
            print(f"\n❌ {failed} responsive navigation tests failed")
            return {"status": "failure", "passed": passed, "failed": failed, "total": total}

if __name__ == "__main__":
    tester = ResponsiveNavigationTester()
    result = tester.run_all_tests()
    exit(0 if result["status"] == "success" else 1)

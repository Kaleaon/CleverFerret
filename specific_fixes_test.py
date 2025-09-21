#!/usr/bin/env python3
"""
Specific GitHub Actions Fixes Validation
Tests the exact fixes mentioned in the review request
"""

import os
import sys
import yaml
import subprocess
import glob
from pathlib import Path

class SpecificFixesValidator:
    def __init__(self):
        self.base_path = Path("/app")
        self.workflow_path = self.base_path / ".github/workflows/ai-review.yml"
        self.issues = []
        self.successes = []

    def log_result(self, test_name, passed, details=""):
        """Log test results"""
        if passed:
            self.successes.append(f"✅ {test_name}: {details}")
            print(f"✅ {test_name}")
            if details:
                print(f"   {details}")
        else:
            self.issues.append(f"❌ {test_name}: {details}")
            print(f"❌ {test_name}")
            if details:
                print(f"   {details}")

    def test_hashfiles_pattern_fix(self):
        """Test Fix 1: hashFiles('**/*.gradle*') → specific patterns"""
        print("\n🔧 Testing hashFiles Pattern Fix...")
        
        with open(self.workflow_path, 'r') as f:
            content = f.read()
        
        # Check that the old problematic pattern is NOT present
        old_pattern = "hashFiles('**/*.gradle*')"
        if old_pattern in content:
            self.log_result("hashFiles Pattern Fix", False, 
                          f"Old problematic pattern still found: {old_pattern}")
            return
        
        # Check that the new specific patterns ARE present
        new_patterns = [
            "**/*.gradle.kts",
            "**/gradle.properties", 
            "gradlew*"
        ]
        
        pattern_found = False
        for pattern in new_patterns:
            if pattern in content:
                pattern_found = True
                break
        
        if not pattern_found:
            self.log_result("hashFiles Pattern Fix", False, 
                          "New specific patterns not found in workflow")
            return
        
        # Verify the files actually exist for these patterns
        existing_files = []
        for pattern in new_patterns:
            if pattern.startswith('**/'):
                search_pattern = str(self.base_path / pattern[3:])
                matches = glob.glob(search_pattern, recursive=True)
            else:
                search_pattern = str(self.base_path / pattern)
                matches = glob.glob(search_pattern)
            existing_files.extend(matches)
        
        if existing_files:
            self.log_result("hashFiles Pattern Fix", True, 
                          f"New patterns work correctly, found {len(existing_files)} files")
        else:
            self.log_result("hashFiles Pattern Fix", False, 
                          "New patterns don't match any existing files")

    def test_git_authentication_enhancement(self):
        """Test Fix 2: Git exit code 128 → Enhanced Git authentication"""
        print("\n🔧 Testing Git Authentication Enhancement...")
        
        with open(self.workflow_path, 'r') as f:
            content = f.read()
        
        # Check for enhanced Git configuration in both jobs
        required_git_configs = [
            "git config --global user.name",
            "git config --global user.email", 
            "git config --global credential.helper store",
            'echo "https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com" > ~/.git-credentials'
        ]
        
        # Check ai-review job
        ai_review_section = content[content.find('ai-review:'):content.find('build-and-publish:')]
        ai_review_configs = []
        for config in required_git_configs:
            if config in ai_review_section:
                ai_review_configs.append(config)
        
        # Check build-and-publish job  
        build_section = content[content.find('build-and-publish:'):]
        build_configs = []
        for config in required_git_configs:
            if config in build_section:
                build_configs.append(config)
        
        if len(ai_review_configs) >= 3:  # At least basic configs
            self.log_result("Git Auth in ai-review job", True, 
                          f"Found {len(ai_review_configs)}/4 configurations")
        else:
            self.log_result("Git Auth in ai-review job", False, 
                          f"Only found {len(ai_review_configs)}/4 configurations")
        
        if len(build_configs) >= 3:  # At least basic configs
            self.log_result("Git Auth in build-and-publish job", True, 
                          f"Found {len(build_configs)}/4 configurations")
        else:
            self.log_result("Git Auth in build-and-publish job", False, 
                          f"Only found {len(build_configs)}/4 configurations")
        
        # Check for Git verification step
        if "Verify Git Configuration" in content:
            self.log_result("Git Verification Step", True, "Git verification step added")
        else:
            self.log_result("Git Verification Step", False, "No Git verification step found")

    def test_android_setup_action_fix(self):
        """Test Fix 3: Android setup invalid inputs → Fixed action parameters"""
        print("\n🔧 Testing Android Setup Action Fix...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_data = yaml.safe_load(f)
            
            android_setup_found = False
            
            for job_name, job_data in workflow_data.get('jobs', {}).items():
                if 'steps' in job_data:
                    for step in job_data['steps']:
                        if step.get('uses', '').startswith('android-actions/setup-android@'):
                            android_setup_found = True
                            
                            # Check version is v3
                            action_version = step['uses'].split('@')[1]
                            if action_version == 'v3':
                                self.log_result("Android Action Version", True, f"Using {action_version}")
                            else:
                                self.log_result("Android Action Version", False, 
                                              f"Using {action_version}, expected v3")
                            
                            # Check parameters are correct
                            with_params = step.get('with', {})
                            
                            # Check cmdline-tools-version
                            if 'cmdline-tools-version' in with_params:
                                version = with_params['cmdline-tools-version']
                                self.log_result("cmdline-tools-version parameter", True, 
                                              f"Set to {version}")
                            else:
                                self.log_result("cmdline-tools-version parameter", False, 
                                              "Parameter missing")
                            
                            # Check accept-android-sdk-licenses
                            if 'accept-android-sdk-licenses' in with_params:
                                accept_licenses = with_params['accept-android-sdk-licenses']
                                self.log_result("accept-android-sdk-licenses parameter", True, 
                                              f"Set to {accept_licenses}")
                            else:
                                self.log_result("accept-android-sdk-licenses parameter", False, 
                                              "Parameter missing")
                            
                            # Check packages parameter
                            if 'packages' in with_params:
                                packages = with_params['packages']
                                # Check if it includes required packages
                                required_packages = ['platform-tools', 'platforms;android-', 'build-tools;']
                                packages_str = str(packages)
                                
                                missing_packages = []
                                for req_pkg in required_packages:
                                    if req_pkg not in packages_str:
                                        missing_packages.append(req_pkg)
                                
                                if not missing_packages:
                                    self.log_result("packages parameter", True, 
                                                  "Contains all required packages")
                                else:
                                    self.log_result("packages parameter", False, 
                                                  f"Missing packages: {missing_packages}")
                            else:
                                self.log_result("packages parameter", False, "Parameter missing")
            
            if not android_setup_found:
                self.log_result("Android Setup Action", False, 
                              "android-actions/setup-android action not found")
                
        except Exception as e:
            self.log_result("Android Setup Action Fix", False, f"Error checking action: {e}")

    def test_workflow_structure_validation(self):
        """Test Fix 4: Workflow structure validation"""
        print("\n🔧 Testing Workflow Structure Validation...")
        
        try:
            # Test YAML syntax
            with open(self.workflow_path, 'r') as f:
                workflow_data = yaml.safe_load(f)
            
            self.log_result("YAML Syntax", True, "Workflow YAML is valid")
            
            # Check job dependencies
            jobs = workflow_data.get('jobs', {})
            
            if 'ai-review' in jobs and 'build-and-publish' in jobs:
                build_job = jobs['build-and-publish']
                needs = build_job.get('needs', [])
                if isinstance(needs, str):
                    needs = [needs]
                
                if 'ai-review' in needs:
                    self.log_result("Job Dependencies", True, 
                                  "build-and-publish correctly depends on ai-review")
                else:
                    self.log_result("Job Dependencies", False, 
                                  "build-and-publish doesn't depend on ai-review")
                
                # Check conditional execution
                condition = build_job.get('if', '')
                if "review-passed == 'true'" in condition:
                    self.log_result("Conditional Execution", True, 
                                  "build-and-publish only runs if review passes")
                else:
                    self.log_result("Conditional Execution", False, 
                                  "build-and-publish condition not properly set")
            
            # Check permissions
            permissions = workflow_data.get('permissions', {})
            required_perms = ['contents', 'pull-requests', 'issues', 'checks']
            missing_perms = [p for p in required_perms if p not in permissions]
            
            if not missing_perms:
                self.log_result("Permissions", True, "All required permissions set")
            else:
                self.log_result("Permissions", False, f"Missing permissions: {missing_perms}")
                
        except yaml.YAMLError as e:
            self.log_result("YAML Syntax", False, f"YAML parsing error: {e}")
        except Exception as e:
            self.log_result("Workflow Structure", False, f"Error validating structure: {e}")

    def test_file_dependencies(self):
        """Test Fix 5: File dependencies validation"""
        print("\n🔧 Testing File Dependencies...")
        
        # Check required files exist
        required_files = [
            ('gradlew', 'Gradle wrapper script'),
            ('gradle.properties', 'Gradle properties'),
            ('build.gradle.kts', 'Main build script'),
            ('build-scripts/', 'Build scripts directory')
        ]
        
        all_files_exist = True
        for file_path, description in required_files:
            full_path = self.base_path / file_path
            if full_path.exists():
                self.log_result(f"File Dependency: {description}", True, f"{file_path} exists")
            else:
                self.log_result(f"File Dependency: {description}", False, f"{file_path} not found")
                all_files_exist = False
        
        # Check CleverFerret Android project structure
        cleverferret_path = self.base_path / "CleverFerret"
        if cleverferret_path.exists():
            self.log_result("CleverFerret Project", True, "CleverFerret directory exists")
            
            # Check for Android project files
            android_files = [
                'build.gradle.kts',
                'src/main/AndroidManifest.xml'
            ]
            
            for android_file in android_files:
                android_file_path = cleverferret_path / android_file
                if android_file_path.exists():
                    self.log_result(f"Android File: {android_file}", True, "File exists")
                else:
                    self.log_result(f"Android File: {android_file}", False, "File missing")
        else:
            self.log_result("CleverFerret Project", False, "CleverFerret directory not found")

    def run_validation(self):
        """Run all specific fix validations"""
        print("🎯 Testing Specific GitHub Actions Fixes")
        print("=" * 50)
        print("Validating the fixes mentioned in the review request:")
        print("1. hashFiles pattern fix")
        print("2. Git authentication enhancement") 
        print("3. Android setup action fix")
        print("4. Workflow structure validation")
        print("5. File dependencies check")
        print("=" * 50)
        
        # Run all tests
        self.test_hashfiles_pattern_fix()
        self.test_git_authentication_enhancement()
        self.test_android_setup_action_fix()
        self.test_workflow_structure_validation()
        self.test_file_dependencies()
        
        # Print summary
        print("\n" + "=" * 50)
        print("📊 SPECIFIC FIXES VALIDATION SUMMARY")
        print("=" * 50)
        
        total_tests = len(self.successes) + len(self.issues)
        success_rate = (len(self.successes) / total_tests * 100) if total_tests > 0 else 0
        
        print(f"Total Checks: {total_tests}")
        print(f"Passed: {len(self.successes)}")
        print(f"Failed: {len(self.issues)}")
        print(f"Success Rate: {success_rate:.1f}%")
        
        if self.issues:
            print(f"\n❌ ISSUES THAT NEED ATTENTION ({len(self.issues)}):")
            for issue in self.issues:
                print(f"  {issue}")
        
        if self.successes:
            print(f"\n✅ SUCCESSFUL FIXES ({len(self.successes)}):")
            for success in self.successes:
                print(f"  {success}")
        
        # Final verdict
        if not self.issues:
            print("\n🎉 ALL SPECIFIC FIXES VALIDATED SUCCESSFULLY!")
            print("The GitHub Actions workflow should now work without the reported errors.")
            return True
        else:
            print(f"\n⚠️ {len(self.issues)} ISSUES FOUND")
            print("Some fixes may need additional attention before the workflow will work properly.")
            return False

def main():
    """Main validation execution"""
    validator = SpecificFixesValidator()
    success = validator.run_validation()
    return 0 if success else 1

if __name__ == "__main__":
    sys.exit(main())
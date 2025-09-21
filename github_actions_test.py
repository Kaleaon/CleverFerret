#!/usr/bin/env python3
"""
GitHub Actions Workflow Validation Test
Tests the specific fixes applied to the ai-review.yml workflow
"""

import os
import sys
import yaml
import subprocess
import glob
from pathlib import Path

class GitHubActionsValidator:
    def __init__(self):
        self.base_path = Path("/app")
        self.workflow_path = self.base_path / ".github/workflows/ai-review.yml"
        self.tests_run = 0
        self.tests_passed = 0
        self.issues = []

    def log_test(self, name, passed, details=""):
        """Log test results"""
        self.tests_run += 1
        if passed:
            self.tests_passed += 1
            print(f"✅ {name}")
        else:
            print(f"❌ {name}")
            self.issues.append(f"{name}: {details}")
        
        if details:
            print(f"   {details}")

    def test_workflow_syntax(self):
        """Test 1: Validate YAML syntax and structure"""
        print("\n🔍 Testing Workflow YAML Syntax...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_data = yaml.safe_load(f)
            
            # Check basic structure
            required_keys = ['name', 'on', 'jobs', 'permissions']
            missing_keys = [key for key in required_keys if key not in workflow_data]
            
            if missing_keys:
                self.log_test("YAML Structure", False, f"Missing keys: {missing_keys}")
                return False
            
            self.log_test("YAML Syntax", True, "Valid YAML structure")
            return True
            
        except yaml.YAMLError as e:
            self.log_test("YAML Syntax", False, f"YAML parsing error: {e}")
            return False
        except FileNotFoundError:
            self.log_test("YAML Syntax", False, "Workflow file not found")
            return False

    def test_hashfiles_patterns(self):
        """Test 2: Validate hashFiles patterns and file existence"""
        print("\n🔍 Testing hashFiles Pattern Fix...")
        
        # Expected patterns from the fix
        patterns = ['**/*.gradle.kts', '**/gradle.properties', 'gradlew*']
        
        for pattern in patterns:
            # Use glob to find matching files
            if pattern.startswith('**/'):
                # For recursive patterns, search from base path
                search_pattern = str(self.base_path / pattern[3:])
                matches = glob.glob(search_pattern, recursive=True)
            else:
                # For non-recursive patterns
                search_pattern = str(self.base_path / pattern)
                matches = glob.glob(search_pattern)
            
            if matches:
                self.log_test(f"Pattern '{pattern}'", True, f"Found {len(matches)} files")
                # Show first few matches
                for match in matches[:3]:
                    print(f"     - {os.path.relpath(match, self.base_path)}")
                if len(matches) > 3:
                    print(f"     ... and {len(matches) - 3} more")
            else:
                self.log_test(f"Pattern '{pattern}'", False, "No matching files found")

    def test_git_authentication(self):
        """Test 3: Validate Git authentication configuration"""
        print("\n🔍 Testing Git Authentication Enhancement...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                content = f.read()
            
            # Check for Git configuration steps
            git_config_checks = [
                ('git config --global user.name', 'User name configuration'),
                ('git config --global user.email', 'User email configuration'),
                ('git config --global credential.helper store', 'Credential helper setup'),
                ('echo "https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com"', 'Token authentication'),
            ]
            
            for check, description in git_config_checks:
                if check in content:
                    self.log_test(f"Git Config: {description}", True)
                else:
                    self.log_test(f"Git Config: {description}", False, "Configuration not found")
            
            # Check if Git configuration appears in both jobs
            ai_review_section = content[content.find('jobs:'):content.find('build-and-publish:')]
            build_section = content[content.find('build-and-publish:'):]
            
            git_config_in_ai_review = 'git config --global' in ai_review_section
            git_config_in_build = 'git config --global' in build_section
            
            self.log_test("Git Config in ai-review job", git_config_in_ai_review)
            self.log_test("Git Config in build-and-publish job", git_config_in_build)
            
        except Exception as e:
            self.log_test("Git Authentication", False, f"Error checking configuration: {e}")

    def test_android_setup_action(self):
        """Test 4: Validate Android setup action parameters"""
        print("\n🔍 Testing Android Setup Action Fix...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_data = yaml.safe_load(f)
            
            # Find the Android setup step
            android_setup_found = False
            
            for job_name, job_data in workflow_data.get('jobs', {}).items():
                if 'steps' in job_data:
                    for step in job_data['steps']:
                        if step.get('uses', '').startswith('android-actions/setup-android@'):
                            android_setup_found = True
                            
                            # Check version
                            action_version = step['uses'].split('@')[1]
                            self.log_test("Android Action Version", action_version == 'v3', f"Using {action_version}")
                            
                            # Check required parameters
                            with_params = step.get('with', {})
                            
                            required_params = [
                                'cmdline-tools-version',
                                'accept-android-sdk-licenses', 
                                'packages'
                            ]
                            
                            for param in required_params:
                                if param in with_params:
                                    self.log_test(f"Android Setup: {param}", True, f"Value: {with_params[param]}")
                                else:
                                    self.log_test(f"Android Setup: {param}", False, "Parameter missing")
            
            if not android_setup_found:
                self.log_test("Android Setup Action", False, "android-actions/setup-android not found")
                
        except Exception as e:
            self.log_test("Android Setup Action", False, f"Error checking action: {e}")

    def test_job_dependencies(self):
        """Test 5: Validate job dependencies and permissions"""
        print("\n🔍 Testing Workflow Structure and Dependencies...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_data = yaml.safe_load(f)
            
            # Check permissions
            permissions = workflow_data.get('permissions', {})
            required_permissions = ['contents', 'pull-requests', 'issues', 'checks', 'statuses', 'actions']
            
            for perm in required_permissions:
                if perm in permissions:
                    self.log_test(f"Permission: {perm}", True, f"Value: {permissions[perm]}")
                else:
                    self.log_test(f"Permission: {perm}", False, "Permission missing")
            
            # Check job dependencies
            jobs = workflow_data.get('jobs', {})
            
            # build-and-publish should depend on ai-review
            if 'build-and-publish' in jobs:
                needs = jobs['build-and-publish'].get('needs', [])
                if isinstance(needs, str):
                    needs = [needs]
                
                self.log_test("Job Dependency: build-and-publish needs ai-review", 
                            'ai-review' in needs)
                
                # Check conditional execution
                condition = jobs['build-and-publish'].get('if', '')
                self.log_test("Conditional Execution", 
                            "review-passed == 'true'" in condition,
                            f"Condition: {condition}")
            
            # review-failed should also depend on ai-review
            if 'review-failed' in jobs:
                needs = jobs['review-failed'].get('needs', [])
                if isinstance(needs, str):
                    needs = [needs]
                
                self.log_test("Job Dependency: review-failed needs ai-review", 
                            'ai-review' in needs)
                
        except Exception as e:
            self.log_test("Job Dependencies", False, f"Error checking dependencies: {e}")

    def test_environment_variables(self):
        """Test 6: Validate environment variables and references"""
        print("\n🔍 Testing Environment Variables...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_data = yaml.safe_load(f)
            
            # Check global environment variables
            env_vars = workflow_data.get('env', {})
            expected_env_vars = ['JAVA_VERSION', 'ANDROID_API_LEVEL', 'ANDROID_BUILD_TOOLS', 'GRADLE_OPTS']
            
            for var in expected_env_vars:
                if var in env_vars:
                    self.log_test(f"Environment Variable: {var}", True, f"Value: {env_vars[var]}")
                else:
                    self.log_test(f"Environment Variable: {var}", False, "Variable missing")
            
            # Check for proper secret references
            with open(self.workflow_path, 'r') as f:
                content = f.read()
            
            secret_refs = [
                '${{ secrets.GITHUB_TOKEN }}',
                '${{ secrets.GEMINI_API_KEY }}'
            ]
            
            for secret_ref in secret_refs:
                if secret_ref in content:
                    self.log_test(f"Secret Reference: {secret_ref}", True)
                else:
                    self.log_test(f"Secret Reference: {secret_ref}", False, "Secret reference not found")
                    
        except Exception as e:
            self.log_test("Environment Variables", False, f"Error checking variables: {e}")

    def test_build_scripts_existence(self):
        """Test 7: Validate build scripts and dependencies exist"""
        print("\n🔍 Testing Build Scripts and Dependencies...")
        
        # Check for required files
        required_files = [
            'gradlew',
            'gradle.properties', 
            'build.gradle.kts',
            'build-scripts/simple-build.sh'
        ]
        
        for file_path in required_files:
            full_path = self.base_path / file_path
            if full_path.exists():
                self.log_test(f"Required File: {file_path}", True)
                
                # Check if script files are executable
                if file_path.endswith('.sh') or file_path == 'gradlew':
                    is_executable = os.access(full_path, os.X_OK)
                    self.log_test(f"Executable: {file_path}", is_executable)
            else:
                self.log_test(f"Required File: {file_path}", False, "File not found")

    def test_workflow_triggers(self):
        """Test 8: Validate workflow triggers"""
        print("\n🔍 Testing Workflow Triggers...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_data = yaml.safe_load(f)
            
            triggers = workflow_data.get('on', {})
            
            # Check push triggers
            if 'push' in triggers:
                push_branches = triggers['push'].get('branches', [])
                expected_branches = ['main', 'develop']
                
                for branch in expected_branches:
                    if branch in push_branches:
                        self.log_test(f"Push Trigger: {branch}", True)
                    else:
                        self.log_test(f"Push Trigger: {branch}", False, "Branch not in push triggers")
            
            # Check pull request triggers
            if 'pull_request' in triggers:
                pr_branches = triggers['pull_request'].get('branches', [])
                
                for branch in expected_branches:
                    if branch in pr_branches:
                        self.log_test(f"PR Trigger: {branch}", True)
                    else:
                        self.log_test(f"PR Trigger: {branch}", False, "Branch not in PR triggers")
            
            # Check concurrency settings
            if 'concurrency' in workflow_data:
                concurrency = workflow_data['concurrency']
                self.log_test("Concurrency Group", 'group' in concurrency)
                self.log_test("Cancel in Progress", concurrency.get('cancel-in-progress', False))
                
        except Exception as e:
            self.log_test("Workflow Triggers", False, f"Error checking triggers: {e}")

    def run_all_tests(self):
        """Run all validation tests"""
        print("🚀 Starting GitHub Actions Workflow Validation...")
        print("=" * 60)
        
        # Run all tests
        self.test_workflow_syntax()
        self.test_hashfiles_patterns()
        self.test_git_authentication()
        self.test_android_setup_action()
        self.test_job_dependencies()
        self.test_environment_variables()
        self.test_build_scripts_existence()
        self.test_workflow_triggers()
        
        # Print summary
        print("\n" + "=" * 60)
        print("📊 VALIDATION SUMMARY")
        print("=" * 60)
        print(f"Tests Run: {self.tests_run}")
        print(f"Tests Passed: {self.tests_passed}")
        print(f"Tests Failed: {self.tests_run - self.tests_passed}")
        print(f"Success Rate: {(self.tests_passed/self.tests_run)*100:.1f}%")
        
        if self.issues:
            print(f"\n❌ ISSUES FOUND ({len(self.issues)}):")
            for i, issue in enumerate(self.issues, 1):
                print(f"{i}. {issue}")
        else:
            print("\n✅ ALL TESTS PASSED - No issues found!")
        
        return len(self.issues) == 0

def main():
    """Main test execution"""
    validator = GitHubActionsValidator()
    success = validator.run_all_tests()
    
    if success:
        print("\n🎉 GitHub Actions workflow validation PASSED!")
        print("The fixes applied should resolve the reported issues.")
        return 0
    else:
        print("\n⚠️ GitHub Actions workflow validation found issues.")
        print("Some fixes may need additional attention.")
        return 1

if __name__ == "__main__":
    sys.exit(main())
#!/usr/bin/env python3
"""
Error Scenarios Validation Test
Tests that the specific errors mentioned in the review request have been fixed
"""

import os
import sys
import yaml
import glob
import subprocess
from pathlib import Path

class ErrorScenariosValidator:
    def __init__(self):
        self.base_path = Path("/app")
        self.workflow_path = self.base_path / ".github/workflows/ai-review.yml"
        self.error_tests = []

    def log_error_test(self, error_description, fix_description, is_fixed, details=""):
        """Log error scenario test results"""
        result = {
            'error': error_description,
            'fix': fix_description,
            'is_fixed': is_fixed,
            'details': details
        }
        self.error_tests.append(result)
        
        status = "✅ FIXED" if is_fixed else "❌ NOT FIXED"
        print(f"{status}: {error_description}")
        print(f"   Fix Applied: {fix_description}")
        if details:
            print(f"   Details: {details}")
        print()

    def test_hashfiles_gradle_error(self):
        """Test Error 1: hashFiles('**/*.gradle*') failed"""
        print("🔍 Testing Error 1: hashFiles('**/*.gradle*') failed")
        
        with open(self.workflow_path, 'r') as f:
            content = f.read()
        
        # Check that the problematic pattern is NOT present
        problematic_pattern = "hashFiles('**/*.gradle*')"
        has_old_pattern = problematic_pattern in content
        
        # Check that new specific patterns ARE present
        new_patterns = ["**/*.gradle.kts", "**/gradle.properties", "gradlew*"]
        has_new_patterns = any(pattern in content for pattern in new_patterns)
        
        # Verify the new patterns actually match files
        matching_files = []
        for pattern in new_patterns:
            if pattern.startswith('**/'):
                search_pattern = str(self.base_path / pattern[3:])
                matches = glob.glob(search_pattern, recursive=True)
            else:
                search_pattern = str(self.base_path / pattern)
                matches = glob.glob(search_pattern)
            matching_files.extend(matches)
        
        is_fixed = (not has_old_pattern) and has_new_patterns and len(matching_files) > 0
        
        details = f"Old pattern removed: {not has_old_pattern}, New patterns added: {has_new_patterns}, Files found: {len(matching_files)}"
        
        self.log_error_test(
            "hashFiles('**/*.gradle*') failed",
            "Fixed to use specific patterns: '**/*.gradle.kts', '**/gradle.properties', 'gradlew*'",
            is_fixed,
            details
        )

    def test_git_exit_code_128_error(self):
        """Test Error 2: Git exit code 128"""
        print("🔍 Testing Error 2: Git exit code 128")
        
        with open(self.workflow_path, 'r') as f:
            content = f.read()
        
        # Check for enhanced Git authentication components
        git_auth_components = [
            "git config --global credential.helper store",
            'echo "https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com" > ~/.git-credentials',
            "git config --global user.name",
            "git config --global user.email"
        ]
        
        found_components = []
        for component in git_auth_components:
            if component in content:
                found_components.append(component)
        
        # Check that Git configuration appears in both relevant jobs
        ai_review_section = content[content.find('ai-review:'):content.find('build-and-publish:')]
        build_section = content[content.find('build-and-publish:'):]
        
        git_in_ai_review = any(comp in ai_review_section for comp in git_auth_components)
        git_in_build = any(comp in build_section for comp in git_auth_components)
        
        # Check for Git verification step
        has_git_verification = "Verify Git Configuration" in content
        
        is_fixed = (len(found_components) >= 3 and git_in_ai_review and 
                   git_in_build and has_git_verification)
        
        details = f"Auth components: {len(found_components)}/4, In ai-review: {git_in_ai_review}, In build: {git_in_build}, Verification: {has_git_verification}"
        
        self.log_error_test(
            "Git exit code 128 (authentication failure)",
            "Enhanced Git authentication with credential.helper store and GITHUB_TOKEN",
            is_fixed,
            details
        )

    def test_android_setup_invalid_inputs_error(self):
        """Test Error 3: Android setup invalid inputs"""
        print("🔍 Testing Error 3: Android setup invalid inputs")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_data = yaml.safe_load(f)
            
            android_setup_configs = []
            
            # Find all android-actions/setup-android usages
            for job_name, job_data in workflow_data.get('jobs', {}).items():
                if 'steps' in job_data:
                    for step in job_data['steps']:
                        if step.get('uses', '').startswith('android-actions/setup-android@'):
                            android_setup_configs.append({
                                'job': job_name,
                                'version': step['uses'].split('@')[1],
                                'params': step.get('with', {})
                            })
            
            if not android_setup_configs:
                self.log_error_test(
                    "Android setup invalid inputs",
                    "Fixed action parameters for android-actions/setup-android@v3",
                    False,
                    "No android-actions/setup-android action found"
                )
                return
            
            # Check each configuration
            all_configs_valid = True
            config_details = []
            
            for config in android_setup_configs:
                # Check version is v3
                version_ok = config['version'] == 'v3'
                
                # Check required parameters
                required_params = ['cmdline-tools-version', 'accept-android-sdk-licenses', 'packages']
                params = config['params']
                
                missing_params = [p for p in required_params if p not in params]
                params_ok = len(missing_params) == 0
                
                # Check packages parameter contains required packages
                packages_str = str(params.get('packages', ''))
                required_packages = ['platform-tools', 'platforms;android-', 'build-tools;']
                packages_ok = all(req in packages_str for req in required_packages)
                
                config_valid = version_ok and params_ok and packages_ok
                all_configs_valid = all_configs_valid and config_valid
                
                config_details.append(f"Job {config['job']}: v{config['version']}, params: {len(params)}, packages: {packages_ok}")
            
            details = "; ".join(config_details)
            
            self.log_error_test(
                "Android setup invalid inputs",
                "Fixed action parameters for android-actions/setup-android@v3",
                all_configs_valid,
                details
            )
            
        except Exception as e:
            self.log_error_test(
                "Android setup invalid inputs",
                "Fixed action parameters for android-actions/setup-android@v3",
                False,
                f"Error checking configuration: {e}"
            )

    def test_workflow_yaml_syntax_issues(self):
        """Test for any remaining YAML syntax issues"""
        print("🔍 Testing Workflow YAML Syntax Issues")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_data = yaml.safe_load(f)
            
            # Check basic structure
            required_top_level = ['name', 'jobs', 'permissions']
            missing_keys = [key for key in required_top_level if key not in workflow_data and key != 'on']
            
            # Check for 'on' key (might be parsed as True)
            has_triggers = 'on' in workflow_data or True in workflow_data
            if not has_triggers:
                missing_keys.append('on')
            
            # Check jobs structure
            jobs = workflow_data.get('jobs', {})
            job_issues = []
            
            for job_name, job_data in jobs.items():
                if 'runs-on' not in job_data:
                    job_issues.append(f"{job_name} missing runs-on")
                if 'steps' not in job_data:
                    job_issues.append(f"{job_name} missing steps")
            
            is_valid = len(missing_keys) == 0 and len(job_issues) == 0
            
            details = f"Missing keys: {missing_keys}, Job issues: {job_issues}" if not is_valid else "YAML structure is valid"
            
            self.log_error_test(
                "Workflow YAML syntax and structure issues",
                "Validated and corrected YAML syntax and job structure",
                is_valid,
                details
            )
            
        except yaml.YAMLError as e:
            self.log_error_test(
                "Workflow YAML syntax and structure issues",
                "Validated and corrected YAML syntax and job structure",
                False,
                f"YAML parsing error: {e}"
            )

    def test_missing_dependencies_error(self):
        """Test for missing file dependencies that could cause errors"""
        print("🔍 Testing Missing Dependencies")
        
        # Check critical files that the workflow depends on
        critical_files = [
            ('gradlew', 'Gradle wrapper executable'),
            ('gradle.properties', 'Gradle properties file'),
            ('build.gradle.kts', 'Main build script'),
            ('settings.gradle.kts', 'Gradle settings'),
            ('build-scripts/simple-build.sh', 'Build script used in workflow'),
            ('CleverFerret/build.gradle.kts', 'Android module build script'),
            ('CleverFerret/src/main/AndroidManifest.xml', 'Android manifest')
        ]
        
        missing_files = []
        executable_issues = []
        
        for file_path, description in critical_files:
            full_path = self.base_path / file_path
            if not full_path.exists():
                missing_files.append(f"{file_path} ({description})")
            elif file_path.endswith('.sh') or file_path == 'gradlew':
                # Check if executable
                if not os.access(full_path, os.X_OK):
                    executable_issues.append(f"{file_path} not executable")
        
        is_fixed = len(missing_files) == 0 and len(executable_issues) == 0
        
        issues = missing_files + executable_issues
        details = f"Issues found: {issues}" if issues else "All required files present and properly configured"
        
        self.log_error_test(
            "Missing file dependencies causing build failures",
            "Verified all required files exist and have proper permissions",
            is_fixed,
            details
        )

    def run_error_scenarios_validation(self):
        """Run validation for all reported error scenarios"""
        print("🚨 GitHub Actions Error Scenarios Validation")
        print("=" * 60)
        print("Testing that the specific errors reported have been fixed:")
        print("1. hashFiles('**/*.gradle*') failed")
        print("2. Git exit code 128 (authentication)")
        print("3. Android setup invalid inputs")
        print("4. Workflow YAML syntax issues")
        print("5. Missing file dependencies")
        print("=" * 60)
        print()
        
        # Run all error scenario tests
        self.test_hashfiles_gradle_error()
        self.test_git_exit_code_128_error()
        self.test_android_setup_invalid_inputs_error()
        self.test_workflow_yaml_syntax_issues()
        self.test_missing_dependencies_error()
        
        # Print summary
        print("=" * 60)
        print("📊 ERROR SCENARIOS VALIDATION SUMMARY")
        print("=" * 60)
        
        total_errors = len(self.error_tests)
        fixed_errors = sum(1 for test in self.error_tests if test['is_fixed'])
        unfixed_errors = total_errors - fixed_errors
        
        print(f"Total Error Scenarios Tested: {total_errors}")
        print(f"Errors Fixed: {fixed_errors}")
        print(f"Errors Still Present: {unfixed_errors}")
        print(f"Fix Success Rate: {(fixed_errors/total_errors)*100:.1f}%")
        
        if unfixed_errors > 0:
            print(f"\n❌ UNFIXED ERRORS ({unfixed_errors}):")
            for test in self.error_tests:
                if not test['is_fixed']:
                    print(f"  • {test['error']}")
                    print(f"    Fix Attempted: {test['fix']}")
                    print(f"    Issue: {test['details']}")
                    print()
        
        if fixed_errors > 0:
            print(f"\n✅ SUCCESSFULLY FIXED ERRORS ({fixed_errors}):")
            for test in self.error_tests:
                if test['is_fixed']:
                    print(f"  • {test['error']}")
                    print(f"    Fix Applied: {test['fix']}")
                    print()
        
        # Final verdict
        if unfixed_errors == 0:
            print("🎉 ALL REPORTED ERRORS HAVE BEEN SUCCESSFULLY FIXED!")
            print("The GitHub Actions workflow should now run without the previously reported issues.")
            return True
        else:
            print(f"⚠️ {unfixed_errors} ERROR(S) STILL NEED ATTENTION")
            print("The workflow may still encounter some of the originally reported issues.")
            return False

def main():
    """Main error scenarios validation"""
    validator = ErrorScenariosValidator()
    success = validator.run_error_scenarios_validation()
    return 0 if success else 1

if __name__ == "__main__":
    sys.exit(main())
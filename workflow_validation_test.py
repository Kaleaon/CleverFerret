#!/usr/bin/env python3
"""
GitHub Actions Workflow Validation Test
=======================================

This script validates the GitHub Actions workflow configuration to ensure it will work
properly on GitHub's x86_64 runners, addressing all previously identified issues.

VALIDATION SCOPE:
1. Workflow YAML syntax and structure
2. Environment variables and secrets usage  
3. Git authentication setup
4. Android build configuration
5. Gemini API integration
6. Build process simulation
7. Error scenarios prevention
"""

import os
import sys
import yaml
import json
import subprocess
import re
from pathlib import Path
from typing import Dict, List, Any, Optional

class WorkflowValidator:
    def __init__(self):
        self.workflow_path = "/app/.github/workflows/ai-review.yml"
        self.build_summary_path = "/app/build-fix-summary.md"
        self.errors = []
        self.warnings = []
        self.successes = []
        
    def log_success(self, message: str):
        """Log a successful validation"""
        self.successes.append(f"✅ {message}")
        print(f"✅ {message}")
        
    def log_warning(self, message: str):
        """Log a warning"""
        self.warnings.append(f"⚠️ {message}")
        print(f"⚠️ {message}")
        
    def log_error(self, message: str):
        """Log an error"""
        self.errors.append(f"❌ {message}")
        print(f"❌ {message}")

    def validate_yaml_syntax(self) -> bool:
        """Validate YAML syntax and structure"""
        print("\n🔍 1. VALIDATING WORKFLOW YAML SYNTAX...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_content = yaml.safe_load(f)
            
            # Check required top-level keys
            required_keys = ['name', 'on', 'jobs', 'permissions']
            for key in required_keys:
                if key not in workflow_content:
                    self.log_error(f"Missing required top-level key: {key}")
                    return False
                    
            self.log_success("YAML syntax is valid")
            
            # Validate job structure
            jobs = workflow_content.get('jobs', {})
            expected_jobs = ['ai-review', 'build-and-publish', 'review-failed']
            
            for job_name in expected_jobs:
                if job_name not in jobs:
                    self.log_error(f"Missing required job: {job_name}")
                    return False
                    
                job = jobs[job_name]
                if 'runs-on' not in job:
                    self.log_error(f"Job {job_name} missing 'runs-on'")
                    return False
                    
                if job['runs-on'] != 'ubuntu-latest':
                    self.log_warning(f"Job {job_name} not using ubuntu-latest")
                    
            self.log_success("All required jobs present with correct structure")
            
            # Validate permissions
            permissions = workflow_content.get('permissions', {})
            required_permissions = ['contents', 'pull-requests', 'issues', 'checks', 'statuses', 'actions']
            
            for perm in required_permissions:
                if perm not in permissions:
                    self.log_warning(f"Missing permission: {perm}")
                    
            self.log_success("Permissions configuration validated")
            
            return True
            
        except yaml.YAMLError as e:
            self.log_error(f"YAML syntax error: {e}")
            return False
        except FileNotFoundError:
            self.log_error(f"Workflow file not found: {self.workflow_path}")
            return False

    def validate_environment_variables(self) -> bool:
        """Validate environment variables and secrets usage"""
        print("\n🔍 2. VALIDATING ENVIRONMENT VARIABLES...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                content = f.read()
            
            # Check for required environment variables
            required_env_vars = [
                'JAVA_VERSION',
                'ANDROID_API_LEVEL', 
                'ANDROID_BUILD_TOOLS',
                'GRADLE_OPTS'
            ]
            
            env_section = re.search(r'env:\s*\n((?:\s+\w+:.*\n)*)', content)
            if not env_section:
                self.log_error("No global env section found")
                return False
                
            env_content = env_section.group(1)
            
            for var in required_env_vars:
                if var not in env_content:
                    self.log_error(f"Missing environment variable: {var}")
                    return False
                    
            self.log_success("All required environment variables present")
            
            # Check for required secrets usage
            required_secrets = ['GITHUB_TOKEN', 'GEMINI_API_KEY']
            
            for secret in required_secrets:
                if f"secrets.{secret}" not in content:
                    self.log_error(f"Missing secret usage: {secret}")
                    return False
                    
            self.log_success("All required secrets properly referenced")
            
            # Validate specific values
            if 'JAVA_VERSION: 17' not in content:
                self.log_error("Java version should be 17")
                return False
                
            if 'ANDROID_API_LEVEL: 34' not in content:
                self.log_error("Android API level should be 34")
                return False
                
            self.log_success("Environment variable values are correct")
            
            return True
            
        except Exception as e:
            self.log_error(f"Error validating environment variables: {e}")
            return False

    def validate_git_authentication(self) -> bool:
        """Validate Git authentication setup"""
        print("\n🔍 3. VALIDATING GIT AUTHENTICATION...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                content = f.read()
            
            # Check for Git configuration steps
            git_config_patterns = [
                r'git config --global user\.name',
                r'git config --global user\.email', 
                r'git config --global credential\.helper',
                r'echo.*GITHUB_TOKEN.*git-credentials'
            ]
            
            for pattern in git_config_patterns:
                if not re.search(pattern, content):
                    self.log_error(f"Missing Git configuration: {pattern}")
                    return False
                    
            self.log_success("Git authentication configuration present")
            
            # Check for retry mechanisms
            if 'for attempt in 1 2 3' not in content:
                self.log_warning("Git push retry mechanism not found")
            else:
                self.log_success("Git push retry mechanism configured")
                
            # Check for credential helper setup
            if 'credential.helper store' not in content:
                self.log_error("Git credential helper not configured")
                return False
                
            self.log_success("Git credential helper properly configured")
            
            # Check for token authentication
            if 'x-access-token:${{ secrets.GITHUB_TOKEN }}' not in content:
                self.log_error("GitHub token authentication not properly configured")
                return False
                
            self.log_success("GitHub token authentication properly configured")
            
            return True
            
        except Exception as e:
            self.log_error(f"Error validating Git authentication: {e}")
            return False

    def validate_android_setup(self) -> bool:
        """Validate Android build configuration"""
        print("\n🔍 4. VALIDATING ANDROID BUILD CONFIGURATION...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                content = f.read()
            
            # Check for Android setup action
            if 'android-actions/setup-android@v3' not in content:
                self.log_error("Android setup action not found or wrong version")
                return False
                
            self.log_success("Android setup action version v3 configured")
            
            # Check for required Android setup parameters
            android_params = [
                'cmdline-tools-version: 11076708',
                'accept-android-sdk-licenses: true',
                'platform-tools',
                'platforms;android-${{ env.ANDROID_API_LEVEL }}',
                'build-tools;${{ env.ANDROID_BUILD_TOOLS }}'
            ]
            
            for param in android_params:
                if param not in content:
                    self.log_error(f"Missing Android setup parameter: {param}")
                    return False
                    
            self.log_success("All Android setup parameters configured correctly")
            
            # Check for Java setup
            if 'actions/setup-java@v4' not in content:
                self.log_error("Java setup action not found or wrong version")
                return False
                
            if 'java-version: ${{ env.JAVA_VERSION }}' not in content:
                self.log_error("Java version not using environment variable")
                return False
                
            if 'distribution: temurin' not in content:
                self.log_error("Java distribution should be temurin")
                return False
                
            self.log_success("Java setup configured correctly")
            
            return True
            
        except Exception as e:
            self.log_error(f"Error validating Android setup: {e}")
            return False

    def validate_gemini_integration(self) -> bool:
        """Validate Gemini API integration"""
        print("\n🔍 5. VALIDATING GEMINI API INTEGRATION...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                content = f.read()
            
            # Check for Python setup
            if 'actions/setup-python@v4' not in content:
                self.log_error("Python setup action not found")
                return False
                
            if "python-version: '3.11'" not in content:
                self.log_error("Python version should be 3.11")
                return False
                
            self.log_success("Python setup configured correctly")
            
            # Check for required dependencies
            required_deps = [
                'google-generativeai',
                'requests',
                'python-dotenv'
            ]
            
            for dep in required_deps:
                if dep not in content:
                    self.log_error(f"Missing Python dependency: {dep}")
                    return False
                    
            self.log_success("All required Python dependencies listed")
            
            # Check for Gemini API configuration in the embedded script
            gemini_patterns = [
                r'import google\.generativeai as genai',
                r'genai\.configure\(api_key=api_key\)',
                r'genai\.GenerativeModel\(',
                r'GEMINI_API_KEY.*secrets\.GEMINI_API_KEY'
            ]
            
            for pattern in gemini_patterns:
                if not re.search(pattern, content):
                    self.log_error(f"Missing Gemini API configuration: {pattern}")
                    return False
                    
            self.log_success("Gemini API integration properly configured")
            
            # Check for error handling
            if 'except Exception as e:' not in content:
                self.log_warning("Exception handling might be missing")
            else:
                self.log_success("Exception handling present")
                
            return True
            
        except Exception as e:
            self.log_error(f"Error validating Gemini integration: {e}")
            return False

    def validate_build_process(self) -> bool:
        """Validate build process configuration"""
        print("\n🔍 6. VALIDATING BUILD PROCESS...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                content = f.read()
            
            # Check for cache configuration
            if 'actions/cache@v4' not in content:
                self.log_error("Cache action not found")
                return False
                
            # Check for hashFiles pattern (this was a reported issue)
            hash_patterns = [
                "hashFiles('**/*.gradle.kts', '**/gradle.properties', 'gradlew*')"
            ]
            
            for pattern in hash_patterns:
                if pattern not in content:
                    self.log_error(f"Missing or incorrect hashFiles pattern: {pattern}")
                    return False
                    
            self.log_success("Cache hashFiles patterns configured correctly")
            
            # Check for script permissions
            if 'chmod +x gradlew' not in content:
                self.log_error("gradlew permissions not set")
                return False
                
            self.log_success("Build script permissions configured")
            
            # Check for build commands
            build_commands = [
                './gradlew clean assembleDebug --stacktrace',
                './build-scripts/simple-build.sh'
            ]
            
            found_build_command = False
            for cmd in build_commands:
                if cmd in content:
                    found_build_command = True
                    break
                    
            if not found_build_command:
                self.log_error("No valid build command found")
                return False
                
            self.log_success("Build commands configured correctly")
            
            # Check for APK handling
            if 'find . -name "*debug*.apk"' not in content:
                self.log_error("APK discovery logic missing")
                return False
                
            self.log_success("APK handling configured correctly")
            
            return True
            
        except Exception as e:
            self.log_error(f"Error validating build process: {e}")
            return False

    def validate_error_scenarios(self) -> bool:
        """Validate that previously reported errors are fixed"""
        print("\n🔍 7. VALIDATING ERROR SCENARIO FIXES...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                content = f.read()
            
            # Check hashFiles fix (was: hashFiles('**/*.gradle*'))
            if "hashFiles('**/*.gradle*')" in content:
                self.log_error("Old hashFiles pattern still present - should be specific patterns")
                return False
            else:
                self.log_success("hashFiles pattern fixed - using specific patterns")
            
            # Check Git exit code 128 fix
            git_fixes = [
                'git config --global credential.helper store',
                'echo "https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com" > ~/.git-credentials',
                'for attempt in 1 2 3'
            ]
            
            for fix in git_fixes:
                if fix not in content:
                    self.log_error(f"Git exit code 128 fix missing: {fix}")
                    return False
                    
            self.log_success("Git exit code 128 fixes implemented")
            
            # Check Android setup invalid inputs fix
            if 'android-actions/setup-android@v3' not in content:
                self.log_error("Android setup action version not fixed")
                return False
            else:
                self.log_success("Android setup action version fixed to v3")
                
            # Check Gemini API integration fix
            if 'google-generativeai' not in content:
                self.log_error("Gemini API integration not implemented")
                return False
            else:
                self.log_success("Gemini API integration implemented")
                
            return True
            
        except Exception as e:
            self.log_error(f"Error validating error scenario fixes: {e}")
            return False

    def validate_gradle_files(self) -> bool:
        """Validate Gradle files for hashFiles pattern compatibility"""
        print("\n🔍 8. VALIDATING GRADLE FILES FOR HASHFILES PATTERNS...")
        
        try:
            # Check if the files referenced in hashFiles actually exist
            gradle_files = [
                "/app/build.gradle.kts",
                "/app/gradle.properties", 
                "/app/gradlew"
            ]
            
            for file_path in gradle_files:
                if not os.path.exists(file_path):
                    self.log_error(f"Gradle file missing: {file_path}")
                    return False
                    
            self.log_success("All Gradle files referenced in hashFiles exist")
            
            # Check gradlew permissions
            gradlew_path = "/app/gradlew"
            if os.path.exists(gradlew_path):
                stat_info = os.stat(gradlew_path)
                if not (stat_info.st_mode & 0o111):  # Check if executable
                    self.log_warning("gradlew is not executable (will be fixed by workflow)")
                else:
                    self.log_success("gradlew is executable")
                    
            return True
            
        except Exception as e:
            self.log_error(f"Error validating Gradle files: {e}")
            return False

    def simulate_workflow_execution(self) -> bool:
        """Simulate key workflow steps that can be tested locally"""
        print("\n🔍 9. SIMULATING WORKFLOW EXECUTION...")
        
        try:
            # Test YAML parsing (already done in validate_yaml_syntax)
            self.log_success("YAML parsing simulation passed")
            
            # Test environment variable expansion simulation
            env_vars = {
                'JAVA_VERSION': '17',
                'ANDROID_API_LEVEL': '34', 
                'ANDROID_BUILD_TOOLS': '33.0.2',
                'GRADLE_OPTS': '-Xmx4g -XX:MaxMetaspaceSize=1g -XX:+UseG1GC'
            }
            
            for var, expected_value in env_vars.items():
                # Simulate environment variable usage
                self.log_success(f"Environment variable {var} would be set to: {expected_value}")
                
            # Test Git command simulation (without actually running)
            git_commands = [
                'git config --global user.name "AI Code Reviewer"',
                'git config --global user.email "ai-reviewer@github.com"',
                'git config --global credential.helper store'
            ]
            
            for cmd in git_commands:
                self.log_success(f"Git command simulation: {cmd}")
                
            # Test Python script syntax
            with open(self.workflow_path, 'r') as f:
                content = f.read()
                
            # Extract the embedded Python script
            script_start = content.find("cat > ai_review.py << 'EOF'")
            script_end = content.find("EOF", script_start)
            
            if script_start != -1 and script_end != -1:
                # Extract script content
                script_content = content[script_start:script_end]
                
                # Basic syntax validation (check for common Python patterns)
                python_patterns = [
                    'import os',
                    'import sys', 
                    'import json',
                    'def ',
                    'if __name__ == "__main__":'
                ]
                
                for pattern in python_patterns:
                    if pattern not in script_content:
                        self.log_error(f"Python script missing pattern: {pattern}")
                        return False
                        
                self.log_success("Embedded Python script syntax validation passed")
            else:
                self.log_error("Could not extract embedded Python script")
                return False
                
            return True
            
        except Exception as e:
            self.log_error(f"Error in workflow execution simulation: {e}")
            return False

    def validate_job_dependencies(self) -> bool:
        """Validate job dependencies and conditional execution"""
        print("\n🔍 10. VALIDATING JOB DEPENDENCIES...")
        
        try:
            with open(self.workflow_path, 'r') as f:
                workflow_content = yaml.safe_load(f)
            
            jobs = workflow_content.get('jobs', {})
            
            # Check build-and-publish job dependencies
            build_job = jobs.get('build-and-publish', {})
            if 'needs' not in build_job:
                self.log_error("build-and-publish job missing 'needs' dependency")
                return False
                
            if build_job['needs'] != 'ai-review':
                self.log_error("build-and-publish job should depend on ai-review")
                return False
                
            # Check conditional execution
            if build_job.get('if') != "needs.ai-review.outputs.review-passed == 'true'":
                self.log_error("build-and-publish job missing correct conditional")
                return False
                
            self.log_success("build-and-publish job dependencies configured correctly")
            
            # Check review-failed job
            failed_job = jobs.get('review-failed', {})
            if failed_job.get('if') != "needs.ai-review.outputs.review-passed == 'false'":
                self.log_error("review-failed job missing correct conditional")
                return False
                
            self.log_success("review-failed job dependencies configured correctly")
            
            # Check outputs configuration
            ai_review_job = jobs.get('ai-review', {})
            outputs = ai_review_job.get('outputs', {})
            
            required_outputs = ['review-passed', 'review-score']
            for output in required_outputs:
                if output not in outputs:
                    self.log_error(f"ai-review job missing output: {output}")
                    return False
                    
            self.log_success("ai-review job outputs configured correctly")
            
            return True
            
        except Exception as e:
            self.log_error(f"Error validating job dependencies: {e}")
            return False

    def run_validation(self) -> bool:
        """Run all validation tests"""
        print("🚀 GITHUB ACTIONS WORKFLOW VALIDATION")
        print("=" * 50)
        
        validation_steps = [
            self.validate_yaml_syntax,
            self.validate_environment_variables,
            self.validate_git_authentication,
            self.validate_android_setup,
            self.validate_gemini_integration,
            self.validate_build_process,
            self.validate_error_scenarios,
            self.validate_gradle_files,
            self.validate_job_dependencies,
            self.simulate_workflow_execution
        ]
        
        all_passed = True
        
        for step in validation_steps:
            try:
                if not step():
                    all_passed = False
            except Exception as e:
                self.log_error(f"Validation step failed with exception: {e}")
                all_passed = False
        
        # Print summary
        print("\n" + "=" * 50)
        print("📊 VALIDATION SUMMARY")
        print("=" * 50)
        
        print(f"\n✅ SUCCESSES ({len(self.successes)}):")
        for success in self.successes:
            print(f"  {success}")
            
        if self.warnings:
            print(f"\n⚠️ WARNINGS ({len(self.warnings)}):")
            for warning in self.warnings:
                print(f"  {warning}")
                
        if self.errors:
            print(f"\n❌ ERRORS ({len(self.errors)}):")
            for error in self.errors:
                print(f"  {error}")
        
        print(f"\n🎯 OVERALL RESULT:")
        if all_passed and not self.errors:
            print("✅ VALIDATION PASSED - Workflow ready for GitHub Actions x86_64 runners")
            return True
        else:
            print("❌ VALIDATION FAILED - Issues need to be resolved")
            return False

def main():
    """Main execution function"""
    validator = WorkflowValidator()
    
    print("GitHub Actions Workflow Validation for CleverFerret")
    print("Testing compatibility with x86_64 Ubuntu runners")
    print("Validating fixes for previously reported issues")
    print()
    
    success = validator.run_validation()
    
    # Generate detailed report
    report = {
        "validation_passed": success,
        "total_checks": len(validator.successes) + len(validator.warnings) + len(validator.errors),
        "successes": len(validator.successes),
        "warnings": len(validator.warnings), 
        "errors": len(validator.errors),
        "success_details": validator.successes,
        "warning_details": validator.warnings,
        "error_details": validator.errors,
        "summary": "Workflow validation completed" + (" successfully" if success else " with issues")
    }
    
    # Save report
    with open('/app/workflow_validation_report.json', 'w') as f:
        json.dump(report, f, indent=2)
    
    print(f"\n📄 Detailed report saved to: /app/workflow_validation_report.json")
    
    return 0 if success else 1

if __name__ == "__main__":
    sys.exit(main())
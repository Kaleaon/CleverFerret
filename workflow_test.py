#!/usr/bin/env python3
"""
GitHub Actions Workflow Validation Test Suite
Tests the ai-review.yml workflow configuration for syntax, logic, and integration issues.
"""

import yaml
import json
import ast
import re
import sys
import subprocess
from pathlib import Path
from typing import Dict, List, Any, Tuple

class WorkflowTester:
    def __init__(self, workflow_path: str = "/app/.github/workflows/ai-review.yml"):
        self.workflow_path = Path(workflow_path)
        self.tests_run = 0
        self.tests_passed = 0
        self.issues = []
        self.workflow_data = None
        
    def log_test(self, test_name: str, passed: bool, message: str = ""):
        """Log test results"""
        self.tests_run += 1
        if passed:
            self.tests_passed += 1
            print(f"✅ {test_name}: PASSED {message}")
        else:
            print(f"❌ {test_name}: FAILED {message}")
            self.issues.append(f"{test_name}: {message}")
    
    def test_yaml_syntax(self) -> bool:
        """Test 1: YAML Syntax Validation"""
        print("\n🔍 Testing YAML Syntax Validation...")
        
        try:
            with open(self.workflow_path, 'r', encoding='utf-8') as f:
                self.workflow_data = yaml.safe_load(f)
            
            self.log_test("YAML Parsing", True, "- Workflow file parses correctly")
            
            # Check required top-level keys
            required_keys = ['name', 'on', 'jobs']
            missing_keys = [key for key in required_keys if key not in self.workflow_data]
            
            if missing_keys:
                self.log_test("Required Keys", False, f"- Missing keys: {missing_keys}")
                return False
            else:
                self.log_test("Required Keys", True, "- All required top-level keys present")
            
            # Validate permissions structure
            if 'permissions' in self.workflow_data:
                permissions = self.workflow_data['permissions']
                expected_perms = ['contents', 'pull-requests', 'issues', 'checks', 'statuses']
                has_required_perms = all(perm in permissions for perm in expected_perms)
                
                self.log_test("Permissions", has_required_perms, 
                            f"- Required permissions: {has_required_perms}")
            
            return True
            
        except yaml.YAMLError as e:
            self.log_test("YAML Parsing", False, f"- YAML syntax error: {str(e)}")
            return False
        except Exception as e:
            self.log_test("YAML Parsing", False, f"- Unexpected error: {str(e)}")
            return False
    
    def test_git_configuration(self) -> bool:
        """Test 2: Git Configuration Testing"""
        print("\n🔍 Testing Git Configuration...")
        
        if not self.workflow_data:
            self.log_test("Git Config", False, "- Workflow data not loaded")
            return False
        
        # Find ai-review job
        jobs = self.workflow_data.get('jobs', {})
        ai_review_job = jobs.get('ai-review', {})
        
        if not ai_review_job:
            self.log_test("AI Review Job", False, "- ai-review job not found")
            return False
        
        steps = ai_review_job.get('steps', [])
        
        # Check for checkout step with token
        checkout_step = None
        git_config_step = None
        
        for step in steps:
            if step.get('uses', '').startswith('actions/checkout'):
                checkout_step = step
            elif 'Configure Git for AI Review' in step.get('name', ''):
                git_config_step = step
        
        # Validate checkout configuration
        if checkout_step:
            checkout_with = checkout_step.get('with', {})
            has_token = 'token' in checkout_with
            has_fetch_depth = 'fetch-depth' in checkout_with
            
            self.log_test("Checkout Token", has_token, 
                        f"- Token configured: {has_token}")
            self.log_test("Fetch Depth", has_fetch_depth, 
                        f"- Fetch depth set: {has_fetch_depth}")
        else:
            self.log_test("Checkout Step", False, "- Checkout step not found")
        
        # Validate git configuration step
        if git_config_step:
            git_commands = git_config_step.get('run', '')
            
            # Check for essential git configurations
            has_user_config = 'git config --global user.name' in git_commands
            has_email_config = 'git config --global user.email' in git_commands
            has_credential_helper = 'credential.helper' in git_commands
            has_token_auth = 'x-access-token' in git_commands
            
            self.log_test("Git User Config", has_user_config, 
                        f"- User name configured: {has_user_config}")
            self.log_test("Git Email Config", has_email_config, 
                        f"- User email configured: {has_email_config}")
            self.log_test("Git Credential Helper", has_credential_helper, 
                        f"- Credential helper configured: {has_credential_helper}")
            self.log_test("Git Token Auth", has_token_auth, 
                        f"- Token authentication configured: {has_token_auth}")
        else:
            self.log_test("Git Config Step", False, "- Git configuration step not found")
        
        return True
    
    def test_ai_review_integration(self) -> bool:
        """Test 3: AI Review Integration"""
        print("\n🔍 Testing AI Review Integration...")
        
        if not self.workflow_data:
            self.log_test("AI Integration", False, "- Workflow data not loaded")
            return False
        
        jobs = self.workflow_data.get('jobs', {})
        ai_review_job = jobs.get('ai-review', {})
        steps = ai_review_job.get('steps', [])
        
        # Find AI review step
        ai_review_step = None
        python_setup_step = None
        dependencies_step = None
        
        for step in steps:
            if 'AI Code Review Analysis' in step.get('name', ''):
                ai_review_step = step
            elif 'Set up Python' in step.get('name', ''):
                python_setup_step = step
            elif 'Install AI Review Dependencies' in step.get('name', ''):
                dependencies_step = step
        
        # Test Python setup
        if python_setup_step:
            python_version = python_setup_step.get('with', {}).get('python-version')
            self.log_test("Python Setup", python_version is not None, 
                        f"- Python version: {python_version}")
        else:
            self.log_test("Python Setup", False, "- Python setup step not found")
        
        # Test dependencies installation
        if dependencies_step:
            install_cmd = dependencies_step.get('run', '')
            has_emergent = 'emergentintegrations' in install_cmd
            has_requests = 'requests' in install_cmd
            
            self.log_test("Dependencies", has_emergent and has_requests, 
                        f"- Required packages: emergentintegrations={has_emergent}, requests={has_requests}")
        else:
            self.log_test("Dependencies", False, "- Dependencies installation step not found")
        
        # Test AI review script
        if ai_review_step:
            script_content = ai_review_step.get('run', '')
            
            # Extract Python script from heredoc
            python_script_match = re.search(r"cat > ai_review\.py << 'EOF'\n(.*?)\nEOF", 
                                          script_content, re.DOTALL)
            
            if python_script_match:
                python_script = python_script_match.group(1)
                
                # Test Python syntax
                try:
                    ast.parse(python_script)
                    self.log_test("Python Syntax", True, "- AI review script syntax is valid")
                except SyntaxError as e:
                    self.log_test("Python Syntax", False, f"- Syntax error: {str(e)}")
                
                # Test for required imports
                required_imports = ['emergentintegrations', 'subprocess', 'json', 'os']
                missing_imports = []
                
                for imp in required_imports:
                    if f"import {imp}" not in python_script and f"from {imp}" not in python_script:
                        missing_imports.append(imp)
                
                self.log_test("Required Imports", len(missing_imports) == 0, 
                            f"- Missing imports: {missing_imports}" if missing_imports else "- All required imports present")
                
                # Test for key functions
                has_git_command_func = 'def run_git_command' in python_script
                has_apply_fix_func = 'def apply_code_fix' in python_script
                has_commit_fixes_func = 'def commit_fixes' in python_script
                has_analyze_func = 'def analyze_code_changes' in python_script
                
                self.log_test("Git Command Function", has_git_command_func, 
                            f"- run_git_command function: {has_git_command_func}")
                self.log_test("Apply Fix Function", has_apply_fix_func, 
                            f"- apply_code_fix function: {has_apply_fix_func}")
                self.log_test("Commit Fixes Function", has_commit_fixes_func, 
                            f"- commit_fixes function: {has_commit_fixes_func}")
                self.log_test("Analyze Function", has_analyze_func, 
                            f"- analyze_code_changes function: {has_analyze_func}")
                
                # Test environment variable usage
                has_emergent_key = 'EMERGENT_LLM_KEY' in python_script
                has_github_token = 'GITHUB_TOKEN' in python_script
                
                self.log_test("Environment Variables", has_emergent_key and has_github_token, 
                            f"- EMERGENT_LLM_KEY: {has_emergent_key}, GITHUB_TOKEN: {has_github_token}")
                
            else:
                self.log_test("Python Script Extraction", False, "- Could not extract Python script from workflow")
        else:
            self.log_test("AI Review Step", False, "- AI Code Review Analysis step not found")
        
        return True
    
    def test_workflow_dependencies(self) -> bool:
        """Test 4: Workflow Dependencies"""
        print("\n🔍 Testing Workflow Dependencies...")
        
        if not self.workflow_data:
            self.log_test("Workflow Dependencies", False, "- Workflow data not loaded")
            return False
        
        jobs = self.workflow_data.get('jobs', {})
        
        # Check job dependencies
        ai_review_job = jobs.get('ai-review', {})
        build_job = jobs.get('build-and-publish', {})
        failed_job = jobs.get('review-failed', {})
        
        # Test ai-review job outputs
        ai_outputs = ai_review_job.get('outputs', {})
        has_review_passed = 'review-passed' in ai_outputs
        has_review_score = 'review-score' in ai_outputs
        
        self.log_test("AI Review Outputs", has_review_passed and has_review_score, 
                    f"- review-passed: {has_review_passed}, review-score: {has_review_score}")
        
        # Test build job dependencies
        if build_job:
            build_needs = build_job.get('needs', [])
            build_condition = build_job.get('if', '')
            
            needs_ai_review = 'ai-review' in build_needs if isinstance(build_needs, list) else build_needs == 'ai-review'
            has_pass_condition = 'review-passed' in build_condition and 'true' in build_condition
            
            self.log_test("Build Job Dependencies", needs_ai_review, 
                        f"- Depends on ai-review: {needs_ai_review}")
            self.log_test("Build Job Condition", has_pass_condition, 
                        f"- Conditional on review pass: {has_pass_condition}")
        else:
            self.log_test("Build Job", False, "- build-and-publish job not found")
        
        # Test failed job dependencies
        if failed_job:
            failed_needs = failed_job.get('needs', [])
            failed_condition = failed_job.get('if', '')
            
            needs_ai_review = 'ai-review' in failed_needs if isinstance(failed_needs, list) else failed_needs == 'ai-review'
            has_fail_condition = 'review-passed' in failed_condition and 'false' in failed_condition
            
            self.log_test("Failed Job Dependencies", needs_ai_review, 
                        f"- Depends on ai-review: {needs_ai_review}")
            self.log_test("Failed Job Condition", has_fail_condition, 
                        f"- Conditional on review fail: {has_fail_condition}")
        else:
            self.log_test("Failed Job", False, "- review-failed job not found")
        
        return True
    
    def test_error_handling(self) -> bool:
        """Test 5: Error Handling"""
        print("\n🔍 Testing Error Handling...")
        
        if not self.workflow_data:
            self.log_test("Error Handling", False, "- Workflow data not loaded")
            return False
        
        jobs = self.workflow_data.get('jobs', {})
        ai_review_job = jobs.get('ai-review', {})
        build_job = jobs.get('build-and-publish', {})
        
        # Test AI review error handling
        ai_steps = ai_review_job.get('steps', [])
        
        # Check for error handling in git operations
        git_error_handling = False
        retry_mechanisms = False
        fallback_logic = False
        
        for step in ai_steps:
            step_run = step.get('run', '')
            
            # Check for error handling patterns
            if '|| echo' in step_run or '2>/dev/null' in step_run or 'check=False' in step_run:
                git_error_handling = True
            
            # Check for fallback logic
            if 'git diff --name-only HEAD~1' in step_run and 'git diff --name-only "$BASE_SHA..$HEAD_SHA"' in step_run:
                fallback_logic = True
        
        self.log_test("Git Error Handling", git_error_handling, 
                    f"- Error handling patterns found: {git_error_handling}")
        self.log_test("Fallback Logic", fallback_logic, 
                    f"- Git diff fallback logic: {fallback_logic}")
        
        # Test build job error handling
        if build_job:
            build_steps = build_job.get('steps', [])
            
            for step in build_steps:
                step_run = step.get('run', '')
                
                # Check for retry mechanisms in push operations
                if 'for attempt in' in step_run and 'git push' in step_run:
                    retry_mechanisms = True
                    break
        
        self.log_test("Retry Mechanisms", retry_mechanisms, 
                    f"- Git push retry logic: {retry_mechanisms}")
        
        # Test artifact upload on failure
        artifact_steps = [step for step in ai_steps if step.get('uses', '').startswith('actions/upload-artifact')]
        has_always_upload = any(step.get('if') == 'always()' for step in artifact_steps)
        
        self.log_test("Artifact Upload on Failure", has_always_upload, 
                    f"- Always upload artifacts: {has_always_upload}")
        
        return True
    
    def test_security_considerations(self) -> bool:
        """Test 6: Security Considerations"""
        print("\n🔍 Testing Security Considerations...")
        
        if not self.workflow_data:
            self.log_test("Security", False, "- Workflow data not loaded")
            return False
        
        # Check for hardcoded secrets
        workflow_str = str(self.workflow_data)
        
        # Look for potential security issues
        has_hardcoded_secrets = False
        security_issues = []
        
        # Check for hardcoded API keys (this is actually present in the workflow)
        if 'sk-emergent-' in workflow_str:
            has_hardcoded_secrets = True
            security_issues.append("Hardcoded EMERGENT_LLM_KEY found")
        
        # Check for proper secret usage
        uses_github_secrets = '${{ secrets.GITHUB_TOKEN }}' in workflow_str
        
        self.log_test("GitHub Secrets Usage", uses_github_secrets, 
                    f"- Uses GitHub secrets: {uses_github_secrets}")
        
        if has_hardcoded_secrets:
            self.log_test("Hardcoded Secrets", False, 
                        f"- Security issues found: {', '.join(security_issues)}")
        else:
            self.log_test("Hardcoded Secrets", True, "- No hardcoded secrets detected")
        
        # Check permissions
        permissions = self.workflow_data.get('permissions', {})
        has_write_permissions = permissions.get('contents') == 'write'
        
        self.log_test("Write Permissions", has_write_permissions, 
                    f"- Has necessary write permissions: {has_write_permissions}")
        
        return True
    
    def run_all_tests(self) -> Dict[str, Any]:
        """Run all tests and return results"""
        print("🚀 Starting GitHub Actions Workflow Validation Tests")
        print("=" * 60)
        
        # Run all test categories
        self.test_yaml_syntax()
        self.test_git_configuration()
        self.test_ai_review_integration()
        self.test_workflow_dependencies()
        self.test_error_handling()
        self.test_security_considerations()
        
        # Calculate results
        success_rate = (self.tests_passed / self.tests_run * 100) if self.tests_run > 0 else 0
        
        results = {
            "tests_run": self.tests_run,
            "tests_passed": self.tests_passed,
            "success_rate": success_rate,
            "issues": self.issues,
            "overall_status": "PASSED" if success_rate >= 80 else "FAILED"
        }
        
        # Print summary
        print("\n" + "=" * 60)
        print("📊 TEST RESULTS SUMMARY")
        print("=" * 60)
        print(f"Tests Run: {self.tests_run}")
        print(f"Tests Passed: {self.tests_passed}")
        print(f"Success Rate: {success_rate:.1f}%")
        print(f"Overall Status: {results['overall_status']}")
        
        if self.issues:
            print(f"\n❌ Issues Found ({len(self.issues)}):")
            for i, issue in enumerate(self.issues, 1):
                print(f"  {i}. {issue}")
        
        return results

def main():
    """Main test execution"""
    tester = WorkflowTester()
    results = tester.run_all_tests()
    
    # Write results to file
    with open('/app/workflow_test_results.json', 'w') as f:
        json.dump(results, f, indent=2)
    
    # Exit with appropriate code
    return 0 if results['overall_status'] == 'PASSED' else 1

if __name__ == "__main__":
    sys.exit(main())
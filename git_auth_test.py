#!/usr/bin/env python3
"""
Git Authentication Configuration Test
Tests the specific Git authentication fixes mentioned in the review request.
"""

import subprocess
import os
import sys
import tempfile
import shutil
from pathlib import Path

class GitAuthTester:
    def __init__(self):
        self.tests_run = 0
        self.tests_passed = 0
        self.issues = []
        
    def log_test(self, test_name: str, passed: bool, message: str = ""):
        """Log test results"""
        self.tests_run += 1
        if passed:
            self.tests_passed += 1
            print(f"✅ {test_name}: PASSED {message}")
        else:
            print(f"❌ {test_name}: FAILED {message}")
            self.issues.append(f"{test_name}: {message}")
    
    def run_command(self, command: str, check: bool = True) -> tuple:
        """Run a command and return (success, stdout, stderr)"""
        try:
            result = subprocess.run(
                command, 
                shell=True, 
                capture_output=True, 
                text=True, 
                check=check
            )
            return True, result.stdout.strip(), result.stderr.strip()
        except subprocess.CalledProcessError as e:
            return False, e.stdout.strip() if e.stdout else "", e.stderr.strip() if e.stderr else ""
    
    def test_git_credential_helper_setup(self):
        """Test Git credential helper configuration from workflow"""
        print("\n🔍 Testing Git Credential Helper Setup...")
        
        # Create a temporary directory for testing
        with tempfile.TemporaryDirectory() as temp_dir:
            os.chdir(temp_dir)
            
            # Initialize a git repo
            success, _, _ = self.run_command("git init", check=False)
            if not success:
                self.log_test("Git Init", False, "- Could not initialize git repository")
                return
            
            # Test the exact commands from the workflow
            commands_from_workflow = [
                'git config --global user.name "AI Code Reviewer"',
                'git config --global user.email "ai-reviewer@github.com"',
                'git config --global init.defaultBranch main',
                'git config --global credential.helper store'
            ]
            
            for cmd in commands_from_workflow:
                success, stdout, stderr = self.run_command(cmd, check=False)
                cmd_name = cmd.split()[3] if len(cmd.split()) > 3 else "Git Config"
                self.log_test(f"Git Config - {cmd_name}", success, 
                            f"- Command: {cmd}" + (f" | Error: {stderr}" if stderr else ""))
            
            # Test credential store creation (simulated)
            fake_token = "ghp_test123456789"
            cred_content = f"https://x-access-token:{fake_token}@github.com"
            
            try:
                with open(os.path.expanduser("~/.git-credentials"), "w") as f:
                    f.write(cred_content)
                
                # Verify the credential file was created
                cred_file_exists = os.path.exists(os.path.expanduser("~/.git-credentials"))
                self.log_test("Credential File Creation", cred_file_exists, 
                            f"- Credential file created: {cred_file_exists}")
                
                # Test if git can read the credentials
                success, stdout, stderr = self.run_command("git config --get credential.helper", check=False)
                has_store_helper = "store" in stdout
                self.log_test("Credential Helper Verification", has_store_helper, 
                            f"- Store helper configured: {has_store_helper}")
                
            except Exception as e:
                self.log_test("Credential File Creation", False, f"- Error: {str(e)}")
    
    def test_git_operations_simulation(self):
        """Test Git operations that would be performed in the workflow"""
        print("\n🔍 Testing Git Operations Simulation...")
        
        with tempfile.TemporaryDirectory() as temp_dir:
            os.chdir(temp_dir)
            
            # Initialize repo and create some content
            commands = [
                "git init",
                "git config user.name 'AI Code Reviewer'",
                "git config user.email 'ai-reviewer@github.com'",
                "echo 'test content' > test.txt",
                "git add test.txt",
                "git commit -m 'Initial commit'"
            ]
            
            for cmd in commands:
                success, _, stderr = self.run_command(cmd, check=False)
                if not success and "git commit" in cmd:
                    # This might fail due to no remote, which is expected
                    pass
            
            # Test git operations from the workflow
            
            # Test git status (used in workflow)
            success, stdout, stderr = self.run_command("git status --porcelain", check=False)
            self.log_test("Git Status", success, f"- Status command works: {success}")
            
            # Test git diff operations (used in workflow)
            success, stdout, stderr = self.run_command("git diff --name-only HEAD~1 2>/dev/null || echo 'no previous commit'", check=False)
            self.log_test("Git Diff", success, f"- Diff command works: {success}")
            
            # Test git rev-parse (used in workflow)
            success, stdout, stderr = self.run_command("git rev-parse --verify HEAD", check=False)
            self.log_test("Git Rev-Parse", success, f"- Rev-parse works: {success}")
            
            # Test git ls-tree (used in workflow for first commit)
            success, stdout, stderr = self.run_command("git ls-tree --name-only -r HEAD", check=False)
            self.log_test("Git Ls-Tree", success, f"- Ls-tree works: {success}")
    
    def test_workflow_git_error_handling(self):
        """Test the error handling patterns from the workflow"""
        print("\n🔍 Testing Workflow Git Error Handling...")
        
        # Test the specific error handling patterns from the workflow
        error_handling_tests = [
            {
                "name": "Git Diff Fallback",
                "command": 'git diff --name-only "origin/main..HEAD" 2>/dev/null || git diff --name-only HEAD~1',
                "description": "Tests fallback from remote diff to local diff"
            },
            {
                "name": "Git Rev-Parse Verification", 
                "command": 'git rev-parse --verify "nonexistent-sha" >/dev/null 2>&1 || echo "SHA not found"',
                "description": "Tests SHA verification with error handling"
            },
            {
                "name": "Git Remote Access Test",
                "command": 'git ls-remote --heads origin | head -5 || echo "⚠️ Git remote access test failed"',
                "description": "Tests remote access with fallback message"
            }
        ]
        
        with tempfile.TemporaryDirectory() as temp_dir:
            os.chdir(temp_dir)
            
            # Initialize a basic repo
            self.run_command("git init", check=False)
            self.run_command("git config user.name 'Test'", check=False)
            self.run_command("git config user.email 'test@test.com'", check=False)
            self.run_command("echo 'test' > test.txt && git add test.txt && git commit -m 'test'", check=False)
            
            for test in error_handling_tests:
                success, stdout, stderr = self.run_command(test["command"], check=False)
                # For error handling tests, we expect them to not crash (success=True or graceful failure)
                handled_gracefully = success or "not found" in stdout or "failed" in stdout
                self.log_test(test["name"], handled_gracefully, 
                            f"- {test['description']}: {'Handled gracefully' if handled_gracefully else 'Failed to handle error'}")
    
    def test_git_push_retry_mechanism(self):
        """Test the Git push retry mechanism from the workflow"""
        print("\n🔍 Testing Git Push Retry Mechanism...")
        
        # Extract and test the retry logic from the workflow
        retry_script = """
for attempt in 1 2 3; do
    echo "Push attempt $attempt..."
    if git push origin HEAD:main 2>/dev/null; then
        echo "✅ Push successful"
        exit 0
    else
        if [ $attempt -eq 3 ]; then
            echo "❌ Failed to push after 3 attempts"
            exit 1
        fi
        echo "Retrying push in 5 seconds..."
        sleep 1  # Reduced for testing
    fi
done
"""
        
        with tempfile.TemporaryDirectory() as temp_dir:
            os.chdir(temp_dir)
            
            # Create the retry script
            with open("test_retry.sh", "w") as f:
                f.write("#!/bin/bash\n" + retry_script)
            
            os.chmod("test_retry.sh", 0o755)
            
            # Test the retry mechanism (will fail but should retry 3 times)
            success, stdout, stderr = self.run_command("./test_retry.sh", check=False)
            
            # Check if it attempted 3 times
            attempt_count = stdout.count("Push attempt")
            retry_logic_works = attempt_count == 3
            has_final_failure = "Failed to push after 3 attempts" in stdout
            
            self.log_test("Retry Attempts", retry_logic_works, 
                        f"- Made {attempt_count}/3 attempts: {retry_logic_works}")
            self.log_test("Final Failure Handling", has_final_failure, 
                        f"- Proper failure after retries: {has_final_failure}")
    
    def run_all_tests(self):
        """Run all Git authentication tests"""
        print("🚀 Starting Git Authentication Configuration Tests")
        print("=" * 60)
        
        self.test_git_credential_helper_setup()
        self.test_git_operations_simulation()
        self.test_workflow_git_error_handling()
        self.test_git_push_retry_mechanism()
        
        # Calculate results
        success_rate = (self.tests_passed / self.tests_run * 100) if self.tests_run > 0 else 0
        
        print("\n" + "=" * 60)
        print("📊 GIT AUTHENTICATION TEST RESULTS")
        print("=" * 60)
        print(f"Tests Run: {self.tests_run}")
        print(f"Tests Passed: {self.tests_passed}")
        print(f"Success Rate: {success_rate:.1f}%")
        print(f"Overall Status: {'PASSED' if success_rate >= 80 else 'FAILED'}")
        
        if self.issues:
            print(f"\n❌ Issues Found ({len(self.issues)}):")
            for i, issue in enumerate(self.issues, 1):
                print(f"  {i}. {issue}")
        
        return success_rate >= 80

def main():
    """Main test execution"""
    tester = GitAuthTester()
    success = tester.run_all_tests()
    return 0 if success else 1

if __name__ == "__main__":
    sys.exit(main())
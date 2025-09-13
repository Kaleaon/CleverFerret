#!/usr/bin/env python3
"""
Comprehensive Backend Testing for CleverFerret Universal Media Library
API Keys Management System

This test suite validates the Android app's backend components:
1. Database schema and migrations
2. API key storage and retrieval
3. Service integration with API keys
4. Repository layer functionality
5. Dependency injection setup
"""

import os
import sys
import subprocess
import json
import sqlite3
import tempfile
import shutil
from pathlib import Path
from typing import Dict, List, Optional, Tuple
import time

class AndroidBackendTester:
    """Test suite for Android app backend components"""
    
    def __init__(self):
        self.app_path = "/app"
        self.test_results = []
        self.errors = []
        self.warnings = []
        
    def log_result(self, test_name: str, status: str, message: str, details: str = ""):
        """Log test result"""
        result = {
            "test": test_name,
            "status": status,  # "PASS", "FAIL", "SKIP"
            "message": message,
            "details": details,
            "timestamp": time.time()
        }
        self.test_results.append(result)
        
        if status == "FAIL":
            self.errors.append(f"{test_name}: {message}")
        elif status == "SKIP":
            self.warnings.append(f"{test_name}: {message}")
            
        print(f"[{status}] {test_name}: {message}")
        if details:
            print(f"    Details: {details}")

    def run_gradle_command(self, command: str, timeout: int = 300) -> Tuple[bool, str, str]:
        """Run gradle command and return success status with output"""
        try:
            full_command = f"cd {self.app_path} && ./gradlew {command}"
            process = subprocess.run(
                full_command,
                shell=True,
                capture_output=True,
                text=True,
                timeout=timeout
            )
            
            return (
                process.returncode == 0,
                process.stdout,
                process.stderr
            )
        except subprocess.TimeoutExpired:
            return False, "", f"Command timed out after {timeout} seconds"
        except Exception as e:
            return False, "", str(e)

    def test_project_structure(self):
        """Test 1: Verify project structure and key files exist"""
        print("\n=== Testing Project Structure ===")
        
        required_files = [
            "CleverFerret/src/main/java/com/universalmedialibrary/data/local/model/APIKey.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/data/local/dao/APIKeyDao.kt", 
            "CleverFerret/src/main/java/com/universalmedialibrary/data/repository/APIKeyRepository.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/data/local/AppDatabase.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/di/ServicesModule.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/services/metadata/MetadataApiService.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/services/metadata/ComprehensiveMetadataService.kt"
        ]
        
        missing_files = []
        for file_path in required_files:
            full_path = os.path.join(self.app_path, file_path)
            if not os.path.exists(full_path):
                missing_files.append(file_path)
        
        if missing_files:
            self.log_result(
                "Project Structure",
                "FAIL",
                f"Missing {len(missing_files)} required files",
                f"Missing files: {', '.join(missing_files)}"
            )
        else:
            self.log_result(
                "Project Structure", 
                "PASS",
                "All required API Keys Management files present"
            )

    def test_database_schema(self):
        """Test 2: Verify database schema and migration"""
        print("\n=== Testing Database Schema ===")
        
        try:
            # Read AppDatabase.kt to verify schema
            db_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/data/local/AppDatabase.kt")
            
            with open(db_file, 'r') as f:
                content = f.read()
            
            # Check for APIKey entity in database
            if "APIKey::class" not in content:
                self.log_result(
                    "Database Schema - Entity Registration",
                    "FAIL", 
                    "APIKey entity not registered in AppDatabase"
                )
                return
            
            # Check for version 4
            if "version = 4" not in content:
                self.log_result(
                    "Database Schema - Version",
                    "FAIL",
                    "Database version not updated to 4"
                )
                return
                
            # Check for migration 3->4
            if "MIGRATION_3_4" not in content:
                self.log_result(
                    "Database Schema - Migration",
                    "FAIL",
                    "Migration 3->4 not found"
                )
                return
            
            # Check for api_keys table creation
            if "CREATE TABLE api_keys" not in content:
                self.log_result(
                    "Database Schema - Table Creation",
                    "FAIL",
                    "api_keys table creation not found in migration"
                )
                return
                
            # Check for unique index on provider
            if "CREATE UNIQUE INDEX index_api_keys_provider" not in content:
                self.log_result(
                    "Database Schema - Unique Index",
                    "FAIL",
                    "Unique index on provider field not found"
                )
                return
            
            self.log_result(
                "Database Schema",
                "PASS", 
                "Database schema properly configured with APIKey entity and migration"
            )
            
        except Exception as e:
            self.log_result(
                "Database Schema",
                "FAIL",
                f"Error reading database schema: {str(e)}"
            )

    def test_api_key_entity(self):
        """Test 3: Verify APIKey entity structure"""
        print("\n=== Testing APIKey Entity ===")
        
        try:
            entity_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/data/local/model/APIKey.kt")
            
            with open(entity_file, 'r') as f:
                content = f.read()
            
            # Check required fields
            required_fields = [
                "id: String",
                "keyName: String", 
                "keyValue: String",
                "isActive: Boolean",
                "lastValidated: Long?",
                "validationStatus: String?",
                "provider: String",
                "category: String",
                "isRequired: Boolean",
                "createdAt: Long",
                "updatedAt: Long"
            ]
            
            missing_fields = []
            for field in required_fields:
                if field not in content:
                    missing_fields.append(field)
            
            if missing_fields:
                self.log_result(
                    "APIKey Entity - Fields",
                    "FAIL",
                    f"Missing {len(missing_fields)} required fields",
                    f"Missing: {', '.join(missing_fields)}"
                )
                return
            
            # Check Room annotations
            if "@Entity(tableName = \"api_keys\")" not in content:
                self.log_result(
                    "APIKey Entity - Table Annotation",
                    "FAIL",
                    "Missing @Entity annotation with table name"
                )
                return
                
            if "@PrimaryKey" not in content:
                self.log_result(
                    "APIKey Entity - Primary Key",
                    "FAIL", 
                    "Missing @PrimaryKey annotation"
                )
                return
            
            # Check UUID usage
            if "UUID.randomUUID()" not in content:
                self.log_result(
                    "APIKey Entity - UUID",
                    "FAIL",
                    "Not using UUID for primary key generation"
                )
                return
            
            self.log_result(
                "APIKey Entity",
                "PASS",
                "APIKey entity properly structured with all required fields and annotations"
            )
            
        except Exception as e:
            self.log_result(
                "APIKey Entity",
                "FAIL",
                f"Error reading APIKey entity: {str(e)}"
            )

    def test_api_key_dao(self):
        """Test 4: Verify APIKeyDao operations"""
        print("\n=== Testing APIKeyDao ===")
        
        try:
            dao_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/data/local/dao/APIKeyDao.kt")
            
            with open(dao_file, 'r') as f:
                content = f.read()
            
            # Check required operations
            required_operations = [
                "insertAPIKey",
                "updateAPIKey", 
                "getAllActiveAPIKeys",
                "getAPIKeyByProvider",
                "getAPIKeysByCategory",
                "getAllAPIKeys",
                "updateAPIKeyValue",
                "updateValidationStatus",
                "deleteAPIKeyByProvider",
                "setAPIKeyActive",
                "getValidAPIKeysCountByCategory",
                "getAPIKeyValue",
                "getActiveAPIKeysMap"
            ]
            
            missing_operations = []
            for operation in required_operations:
                if f"fun {operation}" not in content and f"suspend fun {operation}" not in content:
                    missing_operations.append(operation)
            
            if missing_operations:
                self.log_result(
                    "APIKeyDao - Operations",
                    "FAIL",
                    f"Missing {len(missing_operations)} required operations",
                    f"Missing: {', '.join(missing_operations)}"
                )
                return
            
            # Check Room annotations
            if "@Dao" not in content:
                self.log_result(
                    "APIKeyDao - Annotation",
                    "FAIL",
                    "Missing @Dao annotation"
                )
                return
            
            # Check for proper SQL queries
            sql_checks = [
                "SELECT * FROM api_keys WHERE isActive = 1",
                "SELECT * FROM api_keys WHERE provider = :provider",
                "UPDATE api_keys SET keyValue = :keyValue",
                "UPDATE api_keys SET validationStatus = :status",
                "DELETE FROM api_keys WHERE provider = :provider"
            ]
            
            missing_queries = []
            for query in sql_checks:
                if query not in content:
                    missing_queries.append(query)
            
            if missing_queries:
                self.log_result(
                    "APIKeyDao - SQL Queries",
                    "FAIL", 
                    f"Missing {len(missing_queries)} expected SQL queries",
                    f"Missing: {', '.join(missing_queries)}"
                )
                return
            
            self.log_result(
                "APIKeyDao",
                "PASS",
                "APIKeyDao properly implemented with all required operations and queries"
            )
            
        except Exception as e:
            self.log_result(
                "APIKeyDao",
                "FAIL",
                f"Error reading APIKeyDao: {str(e)}"
            )

    def test_api_key_repository(self):
        """Test 5: Verify APIKeyRepository functionality"""
        print("\n=== Testing APIKeyRepository ===")
        
        try:
            repo_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/data/repository/APIKeyRepository.kt")
            
            with open(repo_file, 'r') as f:
                content = f.read()
            
            # Check dependency injection
            if "@Singleton" not in content or "@Inject" not in content:
                self.log_result(
                    "APIKeyRepository - DI Annotations",
                    "FAIL",
                    "Missing dependency injection annotations"
                )
                return
            
            # Check required methods
            required_methods = [
                "getAllAPIKeys",
                "getAllActiveAPIKeys",
                "getAPIKeyByProvider",
                "getAPIKeysByCategory", 
                "saveAPIKey",
                "deleteAPIKey",
                "updateValidationStatus",
                "getAPIKeyValue",
                "getActiveAPIKeysMap",
                "getValidAPIKeysCountByCategory",
                "initializeDefaultAPIKeys"
            ]
            
            missing_methods = []
            for method in required_methods:
                if f"fun {method}" not in content and f"suspend fun {method}" not in content:
                    missing_methods.append(method)
            
            if missing_methods:
                self.log_result(
                    "APIKeyRepository - Methods",
                    "FAIL",
                    f"Missing {len(missing_methods)} required methods",
                    f"Missing: {', '.join(missing_methods)}"
                )
                return
            
            # Check default API key initialization
            expected_providers = [
                "google_books", "goodreads", "hardcover", "amazon_access_key",
                "amazon_secret_key", "isbn_db", "comicvine", "listen_notes",
                "spotify_client_id", "spotify_client_secret", "taddy", 
                "tmdb", "omdb", "tvdb", "lastfm", "discogs_token"
            ]
            
            missing_providers = []
            for provider in expected_providers:
                if f'"{provider}"' not in content:
                    missing_providers.append(provider)
            
            if missing_providers:
                self.log_result(
                    "APIKeyRepository - Default Providers",
                    "FAIL",
                    f"Missing {len(missing_providers)} default API providers",
                    f"Missing: {', '.join(missing_providers)}"
                )
                return
            
            # Check display name mapping
            if "getDisplayNameForProvider" not in content:
                self.log_result(
                    "APIKeyRepository - Display Names",
                    "FAIL",
                    "Missing display name mapping function"
                )
                return
            
            self.log_result(
                "APIKeyRepository",
                "PASS",
                "APIKeyRepository properly implemented with all required methods and default configurations"
            )
            
        except Exception as e:
            self.log_result(
                "APIKeyRepository",
                "FAIL",
                f"Error reading APIKeyRepository: {str(e)}"
            )

    def test_dependency_injection(self):
        """Test 6: Verify dependency injection setup"""
        print("\n=== Testing Dependency Injection ===")
        
        try:
            di_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/di/ServicesModule.kt")
            
            with open(di_file, 'r') as f:
                content = f.read()
            
            # Check Hilt annotations
            if "@Module" not in content or "@InstallIn(SingletonComponent::class)" not in content:
                self.log_result(
                    "Dependency Injection - Module Annotations",
                    "FAIL",
                    "Missing Hilt module annotations"
                )
                return
            
            # Check required providers
            required_providers = [
                "provideAppDatabase",
                "provideAPIKeyDao", 
                "provideAPIKeyRepository",
                "provideMetadataApiService",
                "provideComprehensiveMetadataService"
            ]
            
            missing_providers = []
            for provider in required_providers:
                if f"fun {provider}" not in content:
                    missing_providers.append(provider)
            
            if missing_providers:
                self.log_result(
                    "Dependency Injection - Providers",
                    "FAIL",
                    f"Missing {len(missing_providers)} required providers",
                    f"Missing: {', '.join(missing_providers)}"
                )
                return
            
            # Check database migrations are included
            if "addMigrations" not in content or "MIGRATION_3_4" not in content:
                self.log_result(
                    "Dependency Injection - Database Migrations",
                    "FAIL",
                    "Database migrations not properly configured"
                )
                return
            
            # Check APIKeyRepository injection into services
            if "apiKeyRepository: APIKeyRepository" not in content:
                self.log_result(
                    "Dependency Injection - Service Integration",
                    "FAIL",
                    "APIKeyRepository not injected into metadata services"
                )
                return
            
            self.log_result(
                "Dependency Injection",
                "PASS",
                "Dependency injection properly configured with all required providers"
            )
            
        except Exception as e:
            self.log_result(
                "Dependency Injection",
                "FAIL",
                f"Error reading dependency injection setup: {str(e)}"
            )

    def test_metadata_service_integration(self):
        """Test 7: Verify metadata services use API keys"""
        print("\n=== Testing Metadata Service Integration ===")
        
        try:
            # Test MetadataApiService
            service_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/services/metadata/MetadataApiService.kt")
            
            with open(service_file, 'r') as f:
                content = f.read()
            
            # Check APIKeyRepository injection
            if "apiKeyRepository: APIKeyRepository" not in content:
                self.log_result(
                    "MetadataApiService - Repository Injection",
                    "FAIL",
                    "APIKeyRepository not injected into MetadataApiService"
                )
                return
            
            # Check API key usage
            if "apiKeyRepository.getAPIKeyValue" not in content:
                self.log_result(
                    "MetadataApiService - API Key Usage",
                    "FAIL",
                    "MetadataApiService not using API keys from repository"
                )
                return
            
            # Test ComprehensiveMetadataService
            comp_service_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/services/metadata/ComprehensiveMetadataService.kt")
            
            with open(comp_service_file, 'r') as f:
                comp_content = f.read()
            
            # Check APIKeyRepository injection
            if "apiKeyRepository: APIKeyRepository" not in comp_content:
                self.log_result(
                    "ComprehensiveMetadataService - Repository Injection",
                    "FAIL",
                    "APIKeyRepository not injected into ComprehensiveMetadataService"
                )
                return
            
            # Check API key usage
            if "apiKeyRepository.getActiveAPIKeysMap" not in comp_content:
                self.log_result(
                    "ComprehensiveMetadataService - API Key Usage",
                    "FAIL",
                    "ComprehensiveMetadataService not using API keys from repository"
                )
                return
            
            # Check graceful handling of missing keys
            if "apiKeys[" not in comp_content:
                self.log_result(
                    "ComprehensiveMetadataService - Key Handling",
                    "FAIL",
                    "Service not properly handling API key retrieval"
                )
                return
            
            self.log_result(
                "Metadata Service Integration",
                "PASS",
                "Both metadata services properly integrated with API key repository"
            )
            
        except Exception as e:
            self.log_result(
                "Metadata Service Integration",
                "FAIL",
                f"Error reading metadata services: {str(e)}"
            )

    def test_build_compilation(self):
        """Test 8: Verify project compiles successfully"""
        print("\n=== Testing Build Compilation ===")
        
        # Check if gradlew exists and is executable
        gradlew_path = os.path.join(self.app_path, "gradlew")
        if not os.path.exists(gradlew_path):
            self.log_result(
                "Build Compilation - Gradle Wrapper",
                "FAIL",
                "gradlew not found"
            )
            return
        
        # Make gradlew executable
        try:
            os.chmod(gradlew_path, 0o755)
        except Exception as e:
            self.log_result(
                "Build Compilation - Permissions",
                "FAIL",
                f"Could not make gradlew executable: {str(e)}"
            )
            return
        
        # Try to compile the project
        print("Attempting to compile project (this may take a few minutes)...")
        success, stdout, stderr = self.run_gradle_command("compileDebugKotlin", timeout=600)
        
        if not success:
            # Check for common issues
            error_details = stderr + stdout
            
            if "ANDROID_HOME" in error_details or "ANDROID_SDK_ROOT" in error_details:
                self.log_result(
                    "Build Compilation",
                    "SKIP",
                    "Android SDK not configured in test environment",
                    "This is expected in a non-Android development environment"
                )
            elif "No such file or directory" in error_details and "android" in error_details.lower():
                self.log_result(
                    "Build Compilation", 
                    "SKIP",
                    "Android development tools not available",
                    "This is expected in a non-Android development environment"
                )
            else:
                self.log_result(
                    "Build Compilation",
                    "FAIL",
                    "Project compilation failed",
                    f"Error: {error_details[:500]}..."
                )
        else:
            self.log_result(
                "Build Compilation",
                "PASS",
                "Project compiles successfully"
            )

    def test_api_key_categories(self):
        """Test 9: Verify API key categories and providers"""
        print("\n=== Testing API Key Categories ===")
        
        try:
            repo_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/data/repository/APIKeyRepository.kt")
            
            with open(repo_file, 'r') as f:
                content = f.read()
            
            # Expected categories and their providers
            expected_categories = {
                "BOOKS": ["google_books", "goodreads", "hardcover", "amazon_access_key", "amazon_secret_key", "isbn_db"],
                "COMICS_MANGA": ["comicvine"],
                "PODCASTS": ["listen_notes", "spotify_client_id", "spotify_client_secret", "taddy"],
                "MOVIES_TV": ["tmdb", "omdb", "tvdb"],
                "MUSIC": ["lastfm", "discogs_token"]
            }
            
            missing_categories = []
            for category, providers in expected_categories.items():
                if f'"{category}"' not in content:
                    missing_categories.append(category)
                    continue
                
                for provider in providers:
                    if f'"{provider}", "{category}"' not in content and f'Triple("{provider}", "{category}"' not in content:
                        missing_categories.append(f"{provider} in {category}")
            
            if missing_categories:
                self.log_result(
                    "API Key Categories",
                    "FAIL",
                    f"Missing {len(missing_categories)} category/provider mappings",
                    f"Missing: {', '.join(missing_categories)}"
                )
                return
            
            # Check for required API keys
            if 'isRequired = true' not in content:
                self.log_result(
                    "API Key Categories - Required Keys",
                    "FAIL",
                    "No API keys marked as required"
                )
                return
            
            # Verify ComicVine is marked as required (as per the code)
            if '"comicvine", "COMICS_MANGA", true' not in content:
                self.log_result(
                    "API Key Categories - ComicVine Required",
                    "FAIL",
                    "ComicVine API key not marked as required"
                )
                return
            
            self.log_result(
                "API Key Categories",
                "PASS",
                "All API key categories and providers properly configured"
            )
            
        except Exception as e:
            self.log_result(
                "API Key Categories",
                "FAIL",
                f"Error reading API key categories: {str(e)}"
            )

    def test_error_handling(self):
        """Test 10: Verify error handling in services"""
        print("\n=== Testing Error Handling ===")
        
        try:
            # Check MetadataApiService error handling
            service_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/services/metadata/MetadataApiService.kt")
            
            with open(service_file, 'r') as f:
                content = f.read()
            
            # Check for try-catch blocks
            if "try {" not in content or "catch" not in content:
                self.log_result(
                    "Error Handling - MetadataApiService",
                    "FAIL",
                    "No error handling found in MetadataApiService"
                )
                return
            
            # Check for graceful handling of missing API keys
            if "isNullOrEmpty()" not in content:
                self.log_result(
                    "Error Handling - Missing Keys",
                    "FAIL",
                    "No handling for missing API keys"
                )
                return
            
            # Check for demo data fallback
            if "createDemo" not in content:
                self.log_result(
                    "Error Handling - Demo Fallback",
                    "FAIL",
                    "No demo data fallback for missing API keys"
                )
                return
            
            # Check ComprehensiveMetadataService error handling
            comp_service_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/services/metadata/ComprehensiveMetadataService.kt")
            
            with open(comp_service_file, 'r') as f:
                comp_content = f.read()
            
            # Check for try-catch blocks in comprehensive service
            if comp_content.count("try {") < 3:  # Should have multiple try-catch blocks
                self.log_result(
                    "Error Handling - ComprehensiveMetadataService",
                    "FAIL",
                    "Insufficient error handling in ComprehensiveMetadataService"
                )
                return
            
            # Check for continue on error pattern
            if "// Continue with other sources" not in comp_content:
                self.log_result(
                    "Error Handling - Continue Pattern",
                    "FAIL",
                    "Services don't continue with other sources on error"
                )
                return
            
            self.log_result(
                "Error Handling",
                "PASS",
                "Proper error handling implemented in all services"
            )
            
        except Exception as e:
            self.log_result(
                "Error Handling",
                "FAIL",
                f"Error reading service error handling: {str(e)}"
            )

    def generate_test_report(self):
        """Generate comprehensive test report"""
        print("\n" + "="*60)
        print("CLEVERFERRET API KEYS MANAGEMENT - TEST REPORT")
        print("="*60)
        
        total_tests = len(self.test_results)
        passed_tests = len([r for r in self.test_results if r["status"] == "PASS"])
        failed_tests = len([r for r in self.test_results if r["status"] == "FAIL"])
        skipped_tests = len([r for r in self.test_results if r["status"] == "SKIP"])
        
        print(f"\nTEST SUMMARY:")
        print(f"Total Tests: {total_tests}")
        print(f"Passed: {passed_tests}")
        print(f"Failed: {failed_tests}")
        print(f"Skipped: {skipped_tests}")
        print(f"Success Rate: {(passed_tests/total_tests)*100:.1f}%")
        
        if failed_tests > 0:
            print(f"\nFAILED TESTS:")
            for error in self.errors:
                print(f"❌ {error}")
        
        if skipped_tests > 0:
            print(f"\nSKIPPED TESTS:")
            for warning in self.warnings:
                print(f"⚠️  {warning}")
        
        if passed_tests > 0:
            print(f"\nPASSED TESTS:")
            for result in self.test_results:
                if result["status"] == "PASS":
                    print(f"✅ {result['test']}: {result['message']}")
        
        print("\n" + "="*60)
        
        # Return overall status
        if failed_tests == 0:
            return "PASS"
        elif failed_tests <= 2 and passed_tests >= 6:
            return "PARTIAL"
        else:
            return "FAIL"

    def run_all_tests(self):
        """Run all backend tests"""
        print("Starting CleverFerret API Keys Management Backend Tests...")
        print("="*60)
        
        # Run all test methods
        self.test_project_structure()
        self.test_database_schema()
        self.test_api_key_entity()
        self.test_api_key_dao()
        self.test_api_key_repository()
        self.test_dependency_injection()
        self.test_metadata_service_integration()
        self.test_build_compilation()
        self.test_api_key_categories()
        self.test_error_handling()
        
        # Generate final report
        overall_status = self.generate_test_report()
        
        return overall_status, self.test_results, self.errors, self.warnings

def main():
    """Main test execution"""
    tester = AndroidBackendTester()
    
    try:
        overall_status, results, errors, warnings = tester.run_all_tests()
        
        # Exit with appropriate code
        if overall_status == "PASS":
            print("\n🎉 All critical tests passed!")
            sys.exit(0)
        elif overall_status == "PARTIAL":
            print("\n⚠️  Some tests failed but core functionality appears working")
            sys.exit(1)
        else:
            print("\n❌ Critical tests failed")
            sys.exit(2)
            
    except Exception as e:
        print(f"\n💥 Test execution failed: {str(e)}")
        sys.exit(3)

if __name__ == "__main__":
    main()
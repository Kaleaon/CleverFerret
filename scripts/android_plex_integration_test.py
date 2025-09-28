#!/usr/bin/env python3
"""
Android Plex Integration Testing for CleverFerret Universal Media Library

This test suite validates the Android Plex integration implementation:
1. PlexIntegrationService functionality and architecture
2. PlexApi interface and data models structure  
3. Integration dependencies (CalibreIntegrationService, CloudStorageService, BookServicesIntegration)
4. IntegrationManager coordination
5. Dependency injection in ServicesModule
6. Navigation and UI structure (PlexIntegrationScreen, ViewModel)
7. Build and compilation validation
8. Kotlin syntax and annotations
"""

import os
import sys
import subprocess
import json
import time
from pathlib import Path
from typing import Dict, List, Optional, Tuple

class AndroidPlexIntegrationTester:
    """Test suite for Android Plex integration components"""
    
    def __init__(self):
        self.app_path = "/home/runner/work/CleverFerret/CleverFerret"
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

    def test_plex_integration_service(self):
        """Test 1: Verify PlexIntegrationService functionality"""
        print("\n=== Testing PlexIntegrationService ===")
        
        try:
            service_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/plex/PlexIntegrationService.kt")
            
            if not os.path.exists(service_file):
                self.log_result(
                    "PlexIntegrationService - File Exists",
                    "FAIL",
                    "PlexIntegrationService.kt not found"
                )
                return
            
            with open(service_file, 'r') as f:
                content = f.read()
            
            # Check class structure and annotations
            if "@Singleton" not in content:
                self.log_result(
                    "PlexIntegrationService - Singleton Annotation",
                    "FAIL",
                    "Missing @Singleton annotation"
                )
                return
            
            if "@Inject constructor" not in content:
                self.log_result(
                    "PlexIntegrationService - Dependency Injection",
                    "FAIL",
                    "Missing @Inject constructor"
                )
                return
            
            # Check required dependencies
            required_dependencies = [
                "@ApplicationContext private val context: Context",
                "private val contentAnalyzer: SmartContentAnalyzer"
            ]
            
            missing_deps = []
            for dep in required_dependencies:
                if dep not in content:
                    missing_deps.append(dep)
            
            if missing_deps:
                self.log_result(
                    "PlexIntegrationService - Dependencies",
                    "FAIL",
                    f"Missing {len(missing_deps)} required dependencies",
                    f"Missing: {', '.join(missing_deps)}"
                )
                return
            
            # Check StateFlow implementation
            if "MutableStateFlow" not in content or "StateFlow" not in content:
                self.log_result(
                    "PlexIntegrationService - StateFlow",
                    "FAIL",
                    "Missing StateFlow implementation for state management"
                )
                return
            
            # Check core methods
            required_methods = [
                "connectToServer",
                "enhanceLibraryMetadata", 
                "findDuplicateContent",
                "createSmartCollections",
                "syncAllLibraries",
                "checkAllConnections",
                "getLibraryStats"
            ]
            
            missing_methods = []
            for method in required_methods:
                if f"suspend fun {method}" not in content and f"fun {method}" not in content:
                    missing_methods.append(method)
            
            if missing_methods:
                self.log_result(
                    "PlexIntegrationService - Core Methods",
                    "FAIL",
                    f"Missing {len(missing_methods)} core methods",
                    f"Missing: {', '.join(missing_methods)}"
                )
                return
            
            # Check Retrofit integration
            if "Retrofit.Builder()" not in content:
                self.log_result(
                    "PlexIntegrationService - Retrofit Integration",
                    "FAIL",
                    "Missing Retrofit integration for Plex API"
                )
                return
            
            # Check error handling
            if content.count("try {") < 5:  # Should have multiple try-catch blocks
                self.log_result(
                    "PlexIntegrationService - Error Handling",
                    "FAIL",
                    "Insufficient error handling in service methods"
                )
                return
            
            # Check AI integration
            if "contentAnalyzer" not in content:
                self.log_result(
                    "PlexIntegrationService - AI Integration",
                    "FAIL",
                    "SmartContentAnalyzer not used in service"
                )
                return
            
            self.log_result(
                "PlexIntegrationService",
                "PASS",
                "PlexIntegrationService properly implemented with all required functionality"
            )
            
        except Exception as e:
            self.log_result(
                "PlexIntegrationService",
                "FAIL",
                f"Error reading PlexIntegrationService: {str(e)}"
            )

    def test_plex_api_interface(self):
        """Test 2: Verify PlexApi interface and data models"""
        print("\n=== Testing PlexApi Interface ===")
        
        try:
            api_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/plex/PlexApi.kt")
            
            if not os.path.exists(api_file):
                self.log_result(
                    "PlexApi - File Exists",
                    "FAIL",
                    "PlexApi.kt not found"
                )
                return
            
            with open(api_file, 'r') as f:
                content = f.read()
            
            # Check interface declaration
            if "interface PlexApi" not in content:
                self.log_result(
                    "PlexApi - Interface Declaration",
                    "FAIL",
                    "PlexApi interface not properly declared"
                )
                return
            
            # Check required API endpoints
            required_endpoints = [
                "@GET(\"/\")",  # Server info
                "@GET(\"/library/sections\")",  # Libraries
                "@GET(\"/library/sections/{key}/all\")",  # Library items
                "@GET(\"/library/metadata/{key}\")",  # Item details
                "@PUT(\"/library/metadata/{key}\")",  # Update metadata
                "@POST(\"/library/sections/{key}/collection\")",  # Create collection
                "@GET(\"/status/sessions\")",  # Current sessions
                "@GET(\"/library/recentlyAdded\")",  # Recently added
                "@POST(\"/playlists\")"  # Create playlist
            ]
            
            missing_endpoints = []
            for endpoint in required_endpoints:
                if endpoint not in content:
                    missing_endpoints.append(endpoint)
            
            if missing_endpoints:
                self.log_result(
                    "PlexApi - API Endpoints",
                    "FAIL",
                    f"Missing {len(missing_endpoints)} required API endpoints",
                    f"Missing: {', '.join(missing_endpoints)}"
                )
                return
            
            # Check data models
            required_models = [
                "data class PlexServerInfo",
                "data class PlexLibrariesResponse",
                "data class PlexLibraryItemsResponse",
                "data class PlexMediaItem",
                "data class PlexMedia",
                "data class PlexPart",
                "data class PlexStream",
                "data class PlexGenre",
                "data class PlexSession",
                "data class PlexUser",
                "data class PlexPlayer"
            ]
            
            missing_models = []
            for model in required_models:
                if model not in content:
                    missing_models.append(model)
            
            if missing_models:
                self.log_result(
                    "PlexApi - Data Models",
                    "FAIL",
                    f"Missing {len(missing_models)} required data models",
                    f"Missing: {', '.join(missing_models)}"
                )
                return
            
            # Check suspend functions for coroutines
            if content.count("suspend fun") < 8:
                self.log_result(
                    "PlexApi - Suspend Functions",
                    "FAIL",
                    "Not enough suspend functions for async operations"
                )
                return
            
            # Check Retrofit annotations
            retrofit_annotations = ["@Path", "@Query", "@GET", "@POST", "@PUT"]
            missing_annotations = []
            for annotation in retrofit_annotations:
                if annotation not in content:
                    missing_annotations.append(annotation)
            
            if missing_annotations:
                self.log_result(
                    "PlexApi - Retrofit Annotations",
                    "FAIL",
                    f"Missing {len(missing_annotations)} Retrofit annotations",
                    f"Missing: {', '.join(missing_annotations)}"
                )
                return
            
            self.log_result(
                "PlexApi Interface",
                "PASS",
                "PlexApi interface and data models properly structured"
            )
            
        except Exception as e:
            self.log_result(
                "PlexApi Interface",
                "FAIL",
                f"Error reading PlexApi: {str(e)}"
            )

    def test_integration_dependencies(self):
        """Test 3: Verify integration service dependencies"""
        print("\n=== Testing Integration Dependencies ===")
        
        integration_services = [
            ("CalibreIntegrationService", "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/calibre/CalibreIntegrationService.kt"),
            ("CloudStorageService", "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/cloud/CloudStorageService.kt"),
            ("BookServicesIntegration", "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/books/BookServicesIntegration.kt")
        ]
        
        all_services_valid = True
        
        for service_name, service_path in integration_services:
            try:
                full_path = os.path.join(self.app_path, service_path)
                
                if not os.path.exists(full_path):
                    self.log_result(
                        f"Integration Dependencies - {service_name}",
                        "FAIL",
                        f"{service_name} file not found"
                    )
                    all_services_valid = False
                    continue
                
                with open(full_path, 'r') as f:
                    content = f.read()
                
                # Check basic structure
                if "@Singleton" not in content:
                    self.log_result(
                        f"Integration Dependencies - {service_name} Singleton",
                        "FAIL",
                        f"{service_name} missing @Singleton annotation"
                    )
                    all_services_valid = False
                    continue
                
                if "@Inject constructor" not in content:
                    self.log_result(
                        f"Integration Dependencies - {service_name} DI",
                        "FAIL",
                        f"{service_name} missing dependency injection"
                    )
                    all_services_valid = False
                    continue
                
                # Check StateFlow usage
                if "StateFlow" not in content:
                    self.log_result(
                        f"Integration Dependencies - {service_name} StateFlow",
                        "FAIL",
                        f"{service_name} missing StateFlow state management"
                    )
                    all_services_valid = False
                    continue
                
                # Check APIKeyRepository injection (for services that need it)
                if service_name in ["CloudStorageService", "BookServicesIntegration"]:
                    if "apiKeyRepository: APIKeyRepository" not in content:
                        self.log_result(
                            f"Integration Dependencies - {service_name} API Keys",
                            "FAIL",
                            f"{service_name} missing APIKeyRepository injection"
                        )
                        all_services_valid = False
                        continue
                
            except Exception as e:
                self.log_result(
                    f"Integration Dependencies - {service_name}",
                    "FAIL",
                    f"Error reading {service_name}: {str(e)}"
                )
                all_services_valid = False
        
        if all_services_valid:
            self.log_result(
                "Integration Dependencies",
                "PASS",
                "All integration services properly implemented with required structure"
            )

    def test_integration_manager(self):
        """Test 4: Verify IntegrationManager coordination"""
        print("\n=== Testing IntegrationManager ===")
        
        try:
            manager_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/IntegrationManager.kt")
            
            if not os.path.exists(manager_file):
                self.log_result(
                    "IntegrationManager - File Exists",
                    "FAIL",
                    "IntegrationManager.kt not found"
                )
                return
            
            with open(manager_file, 'r') as f:
                content = f.read()
            
            # Check class structure
            if "@Singleton" not in content:
                self.log_result(
                    "IntegrationManager - Singleton",
                    "FAIL",
                    "Missing @Singleton annotation"
                )
                return
            
            # Check all service dependencies
            required_services = [
                "private val plexService: PlexIntegrationService",
                "private val calibreService: CalibreIntegrationService", 
                "private val cloudService: CloudStorageService",
                "private val bookServices: BookServicesIntegration"
            ]
            
            missing_services = []
            for service in required_services:
                if service not in content:
                    missing_services.append(service)
            
            if missing_services:
                self.log_result(
                    "IntegrationManager - Service Dependencies",
                    "FAIL",
                    f"Missing {len(missing_services)} service dependencies",
                    f"Missing: {', '.join(missing_services)}"
                )
                return
            
            # Check coordination methods
            required_methods = [
                "initializeIntegrations",
                "syncAllServices",
                "getUnifiedLibraryStats",
                "clearError"
            ]
            
            missing_methods = []
            for method in required_methods:
                if f"suspend fun {method}" not in content and f"fun {method}" not in content:
                    missing_methods.append(method)
            
            if missing_methods:
                self.log_result(
                    "IntegrationManager - Coordination Methods",
                    "FAIL",
                    f"Missing {len(missing_methods)} coordination methods",
                    f"Missing: {', '.join(missing_methods)}"
                )
                return
            
            # Check service status checking
            status_checks = [
                "plexService.checkAllConnections()",
                "calibreService.checkConnections()",
                "cloudService.checkAllConnections()",
                "bookServices.checkServices()"
            ]
            
            missing_checks = []
            for check in status_checks:
                if check not in content:
                    missing_checks.append(check)
            
            if missing_checks:
                self.log_result(
                    "IntegrationManager - Status Checks",
                    "FAIL",
                    f"Missing {len(missing_checks)} service status checks",
                    f"Missing: {', '.join(missing_checks)}"
                )
                return
            
            # Check unified stats aggregation
            if "UnifiedLibraryStats" not in content:
                self.log_result(
                    "IntegrationManager - Unified Stats",
                    "FAIL",
                    "Missing unified library statistics aggregation"
                )
                return
            
            self.log_result(
                "IntegrationManager",
                "PASS",
                "IntegrationManager properly coordinates all integration services"
            )
            
        except Exception as e:
            self.log_result(
                "IntegrationManager",
                "FAIL",
                f"Error reading IntegrationManager: {str(e)}"
            )

    def test_dependency_injection_setup(self):
        """Test 5: Verify dependency injection in ServicesModule"""
        print("\n=== Testing Dependency Injection Setup ===")
        
        try:
            di_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/di/ServicesModule.kt")
            
            if not os.path.exists(di_file):
                self.log_result(
                    "Dependency Injection - File Exists",
                    "FAIL",
                    "ServicesModule.kt not found"
                )
                return
            
            with open(di_file, 'r') as f:
                content = f.read()
            
            # Check integration service providers
            required_providers = [
                "providePlexIntegrationService",
                "provideCalibreIntegrationService",
                "provideCloudStorageService", 
                "provideBookServicesIntegration",
                "provideIntegrationManager",
                "provideSmartContentAnalyzer"
            ]
            
            missing_providers = []
            for provider in required_providers:
                if f"fun {provider}" not in content:
                    missing_providers.append(provider)
            
            if missing_providers:
                self.log_result(
                    "Dependency Injection - Integration Providers",
                    "FAIL",
                    f"Missing {len(missing_providers)} integration service providers",
                    f"Missing: {', '.join(missing_providers)}"
                )
                return
            
            # Check proper dependency wiring
            dependency_checks = [
                "PlexIntegrationService(context, contentAnalyzer)",
                "CalibreIntegrationService(context, apiKeyRepository)",
                "CloudStorageService(context, apiKeyRepository)",
                "BookServicesIntegration(context, apiKeyRepository)",
                "IntegrationManager(context, plexService, calibreService, cloudService, bookServices)"
            ]
            
            missing_wiring = []
            for check in dependency_checks:
                if check not in content:
                    missing_wiring.append(check)
            
            if missing_wiring:
                self.log_result(
                    "Dependency Injection - Service Wiring",
                    "FAIL",
                    f"Missing {len(missing_wiring)} service dependency wirings",
                    f"Missing: {', '.join(missing_wiring)}"
                )
                return
            
            # Check @Singleton annotations
            if content.count("@Singleton") < 6:  # Should have at least 6 singleton services
                self.log_result(
                    "Dependency Injection - Singleton Scope",
                    "FAIL",
                    "Not enough @Singleton annotations for integration services"
                )
                return
            
            self.log_result(
                "Dependency Injection Setup",
                "PASS",
                "All integration services properly configured in dependency injection"
            )
            
        except Exception as e:
            self.log_result(
                "Dependency Injection Setup",
                "FAIL",
                f"Error reading ServicesModule: {str(e)}"
            )

    def test_ui_integration(self):
        """Test 6: Verify UI integration (Screen and ViewModel)"""
        print("\n=== Testing UI Integration ===")
        
        # Test PlexIntegrationScreen
        try:
            screen_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/ui/integration/PlexIntegrationScreen.kt")
            
            if not os.path.exists(screen_file):
                self.log_result(
                    "UI Integration - Screen File",
                    "FAIL",
                    "PlexIntegrationScreen.kt not found"
                )
                return
            
            with open(screen_file, 'r') as f:
                screen_content = f.read()
            
            # Check Compose structure
            if "@Composable" not in screen_content:
                self.log_result(
                    "UI Integration - Composable",
                    "FAIL",
                    "PlexIntegrationScreen not marked as @Composable"
                )
                return
            
            # Check ViewModel integration
            if "PlexIntegrationViewModel" not in screen_content:
                self.log_result(
                    "UI Integration - ViewModel Integration",
                    "FAIL",
                    "PlexIntegrationViewModel not used in screen"
                )
                return
            
            # Check state collection
            if "collectAsState()" not in screen_content:
                self.log_result(
                    "UI Integration - State Collection",
                    "FAIL",
                    "State not properly collected from ViewModel"
                )
                return
            
            # Check UI components
            ui_components = [
                "ConnectionStatusCard",
                "ServerManagementSection",
                "AddPlexServerDialog",
                "ResultCard"
            ]
            
            missing_components = []
            for component in ui_components:
                if component not in screen_content:
                    missing_components.append(component)
            
            if missing_components:
                self.log_result(
                    "UI Integration - UI Components",
                    "FAIL",
                    f"Missing {len(missing_components)} UI components",
                    f"Missing: {', '.join(missing_components)}"
                )
                return
            
        except Exception as e:
            self.log_result(
                "UI Integration - Screen",
                "FAIL",
                f"Error reading PlexIntegrationScreen: {str(e)}"
            )
            return
        
        # Test PlexIntegrationViewModel
        try:
            viewmodel_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/ui/integration/PlexIntegrationViewModel.kt")
            
            if not os.path.exists(viewmodel_file):
                self.log_result(
                    "UI Integration - ViewModel File",
                    "FAIL",
                    "PlexIntegrationViewModel.kt not found"
                )
                return
            
            with open(viewmodel_file, 'r') as f:
                viewmodel_content = f.read()
            
            # Check ViewModel structure
            if "@HiltViewModel" not in viewmodel_content:
                self.log_result(
                    "UI Integration - Hilt ViewModel",
                    "FAIL",
                    "PlexIntegrationViewModel not marked as @HiltViewModel"
                )
                return
            
            # Check service injection
            if "PlexIntegrationService" not in viewmodel_content:
                self.log_result(
                    "UI Integration - Service Injection",
                    "FAIL",
                    "PlexIntegrationService not injected into ViewModel"
                )
                return
            
            # Check ViewModel methods
            viewmodel_methods = [
                "connectToServer",
                "enhanceLibraryMetadata",
                "findDuplicateContent", 
                "createSmartCollections",
                "syncAllLibraries",
                "getLibraryAnalytics"
            ]
            
            missing_methods = []
            for method in viewmodel_methods:
                if f"fun {method}" not in viewmodel_content:
                    missing_methods.append(method)
            
            if missing_methods:
                self.log_result(
                    "UI Integration - ViewModel Methods",
                    "FAIL",
                    f"Missing {len(missing_methods)} ViewModel methods",
                    f"Missing: {', '.join(missing_methods)}"
                )
                return
            
            # Check coroutine usage
            if "viewModelScope.launch" not in viewmodel_content:
                self.log_result(
                    "UI Integration - Coroutines",
                    "FAIL",
                    "ViewModel not using coroutines properly"
                )
                return
            
            self.log_result(
                "UI Integration",
                "PASS",
                "PlexIntegrationScreen and ViewModel properly implemented"
            )
            
        except Exception as e:
            self.log_result(
                "UI Integration - ViewModel",
                "FAIL",
                f"Error reading PlexIntegrationViewModel: {str(e)}"
            )

    def test_navigation_integration(self):
        """Test 7: Verify navigation integration"""
        print("\n=== Testing Navigation Integration ===")
        
        try:
            main_activity_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/MainActivity.kt")
            
            if not os.path.exists(main_activity_file):
                self.log_result(
                    "Navigation Integration - MainActivity",
                    "FAIL",
                    "MainActivity.kt not found"
                )
                return
            
            with open(main_activity_file, 'r') as f:
                content = f.read()
            
            # Check PlexIntegrationScreen import
            if "import com.universalmedialibrary.ui.integration.PlexIntegrationScreen" not in content:
                self.log_result(
                    "Navigation Integration - Import",
                    "FAIL",
                    "PlexIntegrationScreen not imported in MainActivity"
                )
                return
            
            # Check navigation route
            if "settings/integrations/plex" not in content:
                self.log_result(
                    "Navigation Integration - Route",
                    "FAIL",
                    "Plex integration route not found in navigation"
                )
                return
            
            # Check composable declaration
            if "PlexIntegrationScreen()" not in content:
                self.log_result(
                    "Navigation Integration - Composable",
                    "FAIL",
                    "PlexIntegrationScreen not used in navigation composable"
                )
                return
            
            self.log_result(
                "Navigation Integration",
                "PASS",
                "Plex integration properly integrated into app navigation"
            )
            
        except Exception as e:
            self.log_result(
                "Navigation Integration",
                "FAIL",
                f"Error reading MainActivity: {str(e)}"
            )

    def test_build_dependencies(self):
        """Test 8: Verify build dependencies"""
        print("\n=== Testing Build Dependencies ===")
        
        try:
            build_file = os.path.join(self.app_path, "CleverFerret/build.gradle.kts")
            
            if not os.path.exists(build_file):
                self.log_result(
                    "Build Dependencies - Build File",
                    "FAIL",
                    "build.gradle.kts not found"
                )
                return
            
            with open(build_file, 'r') as f:
                content = f.read()
            
            # Check Plex integration dependencies
            required_dependencies = [
                "com.squareup.retrofit2:retrofit",
                "com.squareup.retrofit2:converter-gson",
                "com.squareup.retrofit2:converter-simplexml",
                "com.squareup.okhttp3:logging-interceptor",
                "com.google.dagger:hilt-android",
                "androidx.hilt:hilt-navigation-compose"
            ]
            
            missing_dependencies = []
            for dep in required_dependencies:
                if dep not in content:
                    missing_dependencies.append(dep)
            
            if missing_dependencies:
                self.log_result(
                    "Build Dependencies - Required Dependencies",
                    "FAIL",
                    f"Missing {len(missing_dependencies)} required dependencies",
                    f"Missing: {', '.join(missing_dependencies)}"
                )
                return
            
            # Check cloud storage dependencies (for integration)
            cloud_dependencies = [
                "com.dropbox.core:dropbox-core-sdk",
                "com.google.api-client:google-api-client-android",
                "com.google.apis:google-api-services-drive"
            ]
            
            missing_cloud = []
            for dep in cloud_dependencies:
                if dep not in content:
                    missing_cloud.append(dep)
            
            if missing_cloud:
                self.log_result(
                    "Build Dependencies - Cloud Dependencies",
                    "FAIL",
                    f"Missing {len(missing_cloud)} cloud storage dependencies",
                    f"Missing: {', '.join(missing_cloud)}"
                )
                return
            
            # Check Kotlin and Compose versions
            if "kotlin-kapt" not in content:
                self.log_result(
                    "Build Dependencies - Kotlin KAPT",
                    "FAIL",
                    "Kotlin KAPT plugin not configured"
                )
                return
            
            if "androidx.compose.ui:ui" not in content:
                self.log_result(
                    "Build Dependencies - Compose UI",
                    "FAIL",
                    "Compose UI dependencies not found"
                )
                return
            
            self.log_result(
                "Build Dependencies",
                "PASS",
                "All required dependencies for Plex integration are present"
            )
            
        except Exception as e:
            self.log_result(
                "Build Dependencies",
                "FAIL",
                f"Error reading build.gradle.kts: {str(e)}"
            )

    def test_kotlin_syntax_validation(self):
        """Test 9: Validate Kotlin syntax and annotations"""
        print("\n=== Testing Kotlin Syntax Validation ===")
        
        kotlin_files = [
            "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/plex/PlexIntegrationService.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/plex/PlexApi.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/ui/integration/PlexIntegrationViewModel.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/ui/integration/PlexIntegrationScreen.kt",
            "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/IntegrationManager.kt"
        ]
        
        syntax_errors = []
        
        for file_path in kotlin_files:
            try:
                full_path = os.path.join(self.app_path, file_path)
                
                if not os.path.exists(full_path):
                    syntax_errors.append(f"{file_path}: File not found")
                    continue
                
                with open(full_path, 'r') as f:
                    content = f.read()
                
                # Basic syntax checks
                if content.count('{') != content.count('}'):
                    syntax_errors.append(f"{file_path}: Mismatched braces")
                
                if content.count('(') != content.count(')'):
                    syntax_errors.append(f"{file_path}: Mismatched parentheses")
                
                # Check for proper package declaration
                if not content.startswith("package com.universalmedialibrary"):
                    syntax_errors.append(f"{file_path}: Missing or incorrect package declaration")
                
                # Check for proper imports
                if "import" not in content:
                    syntax_errors.append(f"{file_path}: No imports found")
                
                # Check for proper class/interface declaration
                if "class " not in content and "interface " not in content and "@Composable" not in content:
                    syntax_errors.append(f"{file_path}: No class, interface, or composable declaration found")
                
            except Exception as e:
                syntax_errors.append(f"{file_path}: Error reading file - {str(e)}")
        
        if syntax_errors:
            self.log_result(
                "Kotlin Syntax Validation",
                "FAIL",
                f"Found {len(syntax_errors)} syntax issues",
                f"Issues: {'; '.join(syntax_errors)}"
            )
        else:
            self.log_result(
                "Kotlin Syntax Validation",
                "PASS",
                "All Kotlin files have valid syntax structure"
            )

    def test_architecture_compliance(self):
        """Test 10: Verify architecture compliance"""
        print("\n=== Testing Architecture Compliance ===")
        
        try:
            # Check service layer separation
            service_files = [
                "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/plex/PlexIntegrationService.kt",
                "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/calibre/CalibreIntegrationService.kt",
                "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/cloud/CloudStorageService.kt",
                "CleverFerret/src/main/java/com/universalmedialibrary/services/integration/books/BookServicesIntegration.kt"
            ]
            
            # Check UI layer separation
            ui_files = [
                "CleverFerret/src/main/java/com/universalmedialibrary/ui/integration/PlexIntegrationScreen.kt",
                "CleverFerret/src/main/java/com/universalmedialibrary/ui/integration/PlexIntegrationViewModel.kt"
            ]
            
            # Check data layer separation
            data_files = [
                "CleverFerret/src/main/java/com/universalmedialibrary/data/repository/APIKeyRepository.kt",
                "CleverFerret/src/main/java/com/universalmedialibrary/data/local/dao/APIKeyDao.kt"
            ]
            
            architecture_issues = []
            
            # Verify service layer doesn't directly access UI
            for service_file in service_files:
                full_path = os.path.join(self.app_path, service_file)
                if os.path.exists(full_path):
                    with open(full_path, 'r') as f:
                        content = f.read()
                    
                    if "import androidx.compose" in content:
                        architecture_issues.append(f"{service_file}: Service layer importing Compose UI")
                    
                    if "import com.universalmedialibrary.ui" in content:
                        architecture_issues.append(f"{service_file}: Service layer importing UI layer")
            
            # Verify UI layer uses ViewModels
            for ui_file in ui_files:
                full_path = os.path.join(self.app_path, ui_file)
                if os.path.exists(full_path):
                    with open(full_path, 'r') as f:
                        content = f.read()
                    
                    if "Screen.kt" in ui_file and "ViewModel" not in content:
                        architecture_issues.append(f"{ui_file}: Screen not using ViewModel")
                    
                    if "ViewModel.kt" in ui_file and "ViewModel()" not in content:
                        architecture_issues.append(f"{ui_file}: ViewModel not extending ViewModel class")
            
            # Check dependency injection usage
            di_file = os.path.join(self.app_path, "CleverFerret/src/main/java/com/universalmedialibrary/di/ServicesModule.kt")
            if os.path.exists(di_file):
                with open(di_file, 'r') as f:
                    di_content = f.read()
                
                if "@Module" not in di_content:
                    architecture_issues.append("ServicesModule: Missing @Module annotation")
                
                if "@InstallIn" not in di_content:
                    architecture_issues.append("ServicesModule: Missing @InstallIn annotation")
            
            if architecture_issues:
                self.log_result(
                    "Architecture Compliance",
                    "FAIL",
                    f"Found {len(architecture_issues)} architecture violations",
                    f"Issues: {'; '.join(architecture_issues)}"
                )
            else:
                self.log_result(
                    "Architecture Compliance",
                    "PASS",
                    "Architecture properly follows Android MVVM pattern with clean separation"
                )
                
        except Exception as e:
            self.log_result(
                "Architecture Compliance",
                "FAIL",
                f"Error checking architecture compliance: {str(e)}"
            )

    def generate_test_report(self):
        """Generate comprehensive test report"""
        print("\n" + "="*70)
        print("ANDROID PLEX INTEGRATION - TEST REPORT")
        print("="*70)
        
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
        
        print("\n" + "="*70)
        
        # Return overall status
        if failed_tests == 0:
            return "PASS"
        elif failed_tests <= 2 and passed_tests >= 7:
            return "PARTIAL"
        else:
            return "FAIL"

    def run_all_tests(self):
        """Run all Plex integration tests"""
        print("Starting Android Plex Integration Tests...")
        print("="*70)
        
        # Run all test methods
        self.test_plex_integration_service()
        self.test_plex_api_interface()
        self.test_integration_dependencies()
        self.test_integration_manager()
        self.test_dependency_injection_setup()
        self.test_ui_integration()
        self.test_navigation_integration()
        self.test_build_dependencies()
        self.test_kotlin_syntax_validation()
        self.test_architecture_compliance()
        
        # Generate final report
        overall_status = self.generate_test_report()
        
        return overall_status, self.test_results, self.errors, self.warnings

def main():
    """Main test execution"""
    tester = AndroidPlexIntegrationTester()
    
    try:
        overall_status, results, errors, warnings = tester.run_all_tests()
        
        # Exit with appropriate code
        if overall_status == "PASS":
            print("\n🎉 All Plex integration tests passed!")
            sys.exit(0)
        elif overall_status == "PARTIAL":
            print("\n⚠️  Some tests failed but core Plex integration appears functional")
            sys.exit(1)
        else:
            print("\n❌ Critical Plex integration tests failed")
            sys.exit(2)
            
    except Exception as e:
        print(f"\n💥 Test execution failed: {str(e)}")
        sys.exit(3)

if __name__ == "__main__":
    main()
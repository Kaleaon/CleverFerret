#!/usr/bin/env python3
"""
Compilation Error Detector for CleverFerret Android Project
Identifies structural issues that would prevent compilation
"""

import os
import re
from pathlib import Path

class CompilationErrorDetector:
    def __init__(self, project_root):
        self.project_root = Path(project_root)
        # Detect module from settings.gradle.kts include(":<module>")
        settings_file = self.project_root / "settings.gradle.kts"
        module_name = None
        if settings_file.exists():
            try:
                content = settings_file.read_text()
                # naive parse to first include(":NAME")
                import re as _re
                m = _re.search(r'include\(\s*"\s*:(.+?)\s*"\s*\)', content)
                if m:
                    module_name = m.group(1)
            except Exception:
                module_name = None
        if not module_name:
            module_name = "app" if (self.project_root / "app").exists() else "CleverFerret"
        self.android_dir = self.project_root / module_name
        self.source_dir = self.android_dir / "src/main/java/com/universalmedialibrary"
        self.errors = []
        self.warnings = []
        
    def find_all_kotlin_files(self):
        """Find all Kotlin files in the project"""
        return list(self.source_dir.rglob("*.kt"))
    
    def check_imports(self, file_path):
        """Check for problematic imports"""
        issues = []
        
        try:
            with open(file_path, 'r') as f:
                content = f.read()
            
            lines = content.split('\n')
            for i, line in enumerate(lines, 1):
                line = line.strip()
                if line.startswith('import '):
                    import_path = line.replace('import ', '').replace(';', '')
                    
                    # Check for common problematic imports
                    if 'org.videolan.libvlc' in import_path:
                        issues.append(f"Line {i}: VLC import may cause compilation error if library not available: {import_path}")
                    
                    # Check for missing internal imports
                    if import_path.startswith('com.universalmedialibrary'):
                        # Extract the class name
                        class_name = import_path.split('.')[-1]
                        
                        # Check if this could be a missing file
                        if not self.check_class_exists(import_path):
                            issues.append(f"Line {i}: Potentially missing class: {import_path}")
                    
                    # Check for deprecated or problematic external imports
                    problematic_imports = [
                        'org.apache.lucene:lucene-analyzers-common:9.7.0',  # Version we fixed
                        'edu.stanford.nlp',  # Heavy library we removed
                        'com.github.barteksc:android-pdf-viewer:3.2.0-beta.1'  # Beta we fixed
                    ]
                    
                    for prob_import in problematic_imports:
                        if prob_import in import_path:
                            issues.append(f"Line {i}: Problematic import (should be updated): {import_path}")
        
        except Exception as e:
            issues.append(f"Error reading file: {e}")
            
        return issues
    
    def check_class_exists(self, import_path):
        """Check if an imported class actually exists"""
        # Convert import path to file path
        path_parts = import_path.replace('com.universalmedialibrary.', '').split('.')
        
        # Try to find the file
        potential_file = self.source_dir
        for part in path_parts[:-1]:
            potential_file = potential_file / part
        
        class_name = path_parts[-1]
        potential_file = potential_file / f"{class_name}.kt"
        
        return potential_file.exists()
    
    def check_missing_functions(self, file_path):
        """Check for missing function implementations"""
        issues = []
        
        try:
            with open(file_path, 'r') as f:
                content = f.read()
            
            # Look for incomplete function declarations
            incomplete_functions = re.findall(r'fun\s+(\w+)\s*\([^)]*\)\s*:\s*\w+\s*(?=\n|$)', content)
            for func in incomplete_functions:
                if '= TODO()' in content or 'throw NotImplementedError' in content:
                    issues.append(f"Incomplete function: {func}")
            
            # Look for missing class implementations
            if 'TODO()' in content:
                todo_lines = [i+1 for i, line in enumerate(content.split('\n')) if 'TODO()' in line]
                issues.append(f"TODO implementations at lines: {todo_lines}")
                
        except Exception as e:
            issues.append(f"Error checking functions: {e}")
            
        return issues
    
    def check_syntax_issues(self, file_path):
        """Check for basic syntax issues"""
        issues = []
        
        try:
            with open(file_path, 'r') as f:
                content = f.read()
            
            lines = content.split('\n')
            
            # Check for unclosed braces
            open_braces = content.count('{')
            close_braces = content.count('}')
            if open_braces != close_braces:
                issues.append(f"Mismatched braces: {open_braces} open, {close_braces} close")
            
            # Check for unclosed parentheses  
            open_parens = content.count('(')
            close_parens = content.count(')')
            if open_parens != close_parens:
                issues.append(f"Mismatched parentheses: {open_parens} open, {close_parens} close")
            
            # Check for common Kotlin syntax errors
            for i, line in enumerate(lines, 1):
                line_stripped = line.strip()
                
                # Check for missing semicolons where needed (rare in Kotlin but can happen)
                if line_stripped.endswith('import') and not line_stripped.endswith(';'):
                    if i < len(lines) and not lines[i].strip().startswith('import'):
                        issues.append(f"Line {i}: Potentially incomplete import statement")
                
                # Check for invalid variable declarations
                if re.match(r'^\s*(val|var)\s+\w+\s*$', line_stripped):
                    issues.append(f"Line {i}: Incomplete variable declaration: {line_stripped}")
                    
        except Exception as e:
            issues.append(f"Error checking syntax: {e}")
            
        return issues
    
    def check_missing_annotations(self, file_path):
        """Check for missing required annotations"""
        issues = []
        
        try:
            with open(file_path, 'r') as f:
                content = f.read()
            
            # Check for missing @Composable annotations
            if 'fun ' in content and '@Composable' not in content:
                # Look for functions that return compose UI
                composable_indicators = ['Column', 'Row', 'Box', 'Scaffold', 'LazyColumn', 'Text(']
                for indicator in composable_indicators:
                    if indicator in content:
                        issues.append(f"Potential missing @Composable annotation (contains {indicator})")
                        break
            
            # Check for missing @HiltViewModel
            if 'class ' in content and 'ViewModel' in content and '@HiltViewModel' not in content:
                issues.append(f"Potential missing @HiltViewModel annotation")
            
            # Check for missing @Singleton
            if 'class ' in content and '@Inject constructor' in content and '@Singleton' not in content:
                if 'Service' in str(file_path):
                    issues.append(f"Potential missing @Singleton annotation for service")
                    
        except Exception as e:
            issues.append(f"Error checking annotations: {e}")
            
        return issues
    
    def analyze_file(self, file_path):
        """Analyze a single file for compilation issues"""
        file_issues = {
            'file': str(file_path.relative_to(self.project_root)),
            'imports': self.check_imports(file_path),
            'functions': self.check_missing_functions(file_path),
            'syntax': self.check_syntax_issues(file_path),
            'annotations': self.check_missing_annotations(file_path)
        }
        
        return file_issues
    
    def run_analysis(self):
        """Run complete compilation error analysis"""
        print("🔍 Analyzing CleverFerret for Compilation Errors...")
        print("=" * 60)
        
        kotlin_files = self.find_all_kotlin_files()
        print(f"Found {len(kotlin_files)} Kotlin files to analyze")
        print()
        
        total_issues = 0
        critical_files = []
        
        for file_path in kotlin_files:
            file_analysis = self.analyze_file(file_path)
            
            # Count issues
            issue_count = (len(file_analysis['imports']) + 
                          len(file_analysis['functions']) + 
                          len(file_analysis['syntax']) + 
                          len(file_analysis['annotations']))
            
            if issue_count > 0:
                total_issues += issue_count
                critical_files.append((file_analysis['file'], issue_count))
                
                print(f"📁 {file_analysis['file']}")
                print(f"   Issues found: {issue_count}")
                
                if file_analysis['imports']:
                    print("   🔗 Import Issues:")
                    for issue in file_analysis['imports']:
                        print(f"      • {issue}")
                
                if file_analysis['functions']:
                    print("   ⚙️ Function Issues:")
                    for issue in file_analysis['functions']:
                        print(f"      • {issue}")
                
                if file_analysis['syntax']:
                    print("   ❌ Syntax Issues:")
                    for issue in file_analysis['syntax']:
                        print(f"      • {issue}")
                
                if file_analysis['annotations']:
                    print("   📝 Annotation Issues:")
                    for issue in file_analysis['annotations']:
                        print(f"      • {issue}")
                
                print()
        
        # Summary
        print("=" * 60)
        print(f"📊 ANALYSIS SUMMARY")
        print(f"Total files analyzed: {len(kotlin_files)}")
        print(f"Files with issues: {len(critical_files)}")
        print(f"Total issues found: {total_issues}")
        
        if critical_files:
            print(f"\n🚨 MOST CRITICAL FILES:")
            critical_files.sort(key=lambda x: x[1], reverse=True)
            for file_name, issue_count in critical_files[:10]:
                print(f"   {issue_count:2d} issues: {file_name}")
        
        print(f"\n{'🎉 No compilation issues found!' if total_issues == 0 else '⚠️  Compilation issues need fixing'}")
        
        return total_issues == 0

def main():
    import sys
    project_root = sys.argv[1] if len(sys.argv) > 1 else "/workspace"
    detector = CompilationErrorDetector(project_root)
    success = detector.run_analysis()
    return 0 if success else 1

if __name__ == "__main__":
    import sys
    sys.exit(main())
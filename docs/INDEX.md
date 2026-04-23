# CleverFerret Documentation Index

**Last Updated:** December 31, 2024  
**Version:** 1.6.5 (Build 32)

Complete index of all documentation for the CleverFerret Universal Media Library Android application.

---

## 📖 Getting Started

- [README](../README.md) - Project overview and quick start
- [REPOSITORY_STATUS_REPORT](REPOSITORY_STATUS_REPORT.md) - **NEW** Comprehensive repository status and readiness report
- [FEATURES_STATUS](FEATURES_STATUS.md) - Comprehensive feature status (enabled/disabled/planned)
- [IMPROVEMENTS_SUMMARY](IMPROVEMENTS_SUMMARY.md) - Recent improvements and reorganization
- [FEATURES](FEATURES.md) - Supported file formats and key features
- [ROADMAP](ROADMAP.md) - Planned features and development priorities
- [Build Toolchain Versions](BUILD_TOOLCHAIN_VERSIONS.md) - Canonical AGP/Kotlin/KSP/Gradle version sources and upgrade steps
- [Post-Recovery State](POST_RECOVERY_STATE.md) - Branch source-of-truth and safe contribution workflow
- [Branch Protection Guide](governance/BRANCH_PROTECTION.md) - Protection rules and CODEOWNERS governance

---

## 🧭 Frontend Workspace Decision

- **Decision:** Frontend is currently inactive.
- **Action taken:** Moved `frontend/` to `archive/frontend/` and removed dependency artifacts from version control.
- **When reactivating:** recreate `frontend/` with source directories and scripts (`dev`, `build`, `test`) under a single package manager.
- **Expected commands on reactivation:**
  - `mkdir -p frontend/src frontend/tests`
  - `cd frontend`
  - `npm init -y` *(or equivalent for yarn/pnpm)*
  - `npm install`
  - `npm run dev`
  - `npm run build`
  - `npm test`

---

## 🔒 Security

- [Security Practices](security/SECURITY_PRACTICES.md) - **NEW** Security guidelines and best practices
- [Security Documentation](security/) - Security-related documentation

---

## 🔍 Code Review & Quality

- [Code Review](CODE_REVIEW.md) - **NEW** Comprehensive code review and recommendations

---

## 🏗️ Architecture & Design

- [ARCHITECTURE](ARCHITECTURE.md) - System architecture and design patterns
- [THEMING](THEMING.md) - Theming system and customization

---

## ✨ Features Documentation

### Reading & Documents
- [Comprehensive File Format Support](features/COMPREHENSIVE_FILE_FORMAT_SUPPORT.md) - All supported reading formats
- [File Browsing Features](features/FILE_BROWSING_FEATURES.md) - File browser capabilities
- [Page Turning Improvements](features/PAGE_TURNING_IMPROVEMENTS.md) - Reading experience enhancements
- [Comprehensive MoonReader Features](features/COMPREHENSIVE_MOONREADER_FEATURES.md) - MoonReader-inspired features
- [MoonReader Improvements](features/MOONREADER_IMPROVEMENTS.md) - Additional reading improvements

### Audio & Media
- [Audiobook Maker](AUDIOBOOK_MAKER.md) - Create and manage audiobooks

---

## 🔧 Implementation Guides

### Parser Implementation
- [Parser Implementation Summary](implementation/PARSER_IMPLEMENTATION_SUMMARY.md) - Document parser architecture
- [Parser Integration Guide](implementation/PARSER_INTEGRATION_GUIDE.md) - Integration with UnifiedReaderService
- [File Format Parser Integration](implementation/FILE_FORMAT_PARSER_INTEGRATION.md) - Parser integration details
- [JNI Implementation Guide](implementation/JNI_IMPLEMENTATION_GUIDE.md) - Native code integration (historical reference)
- [Pure Kotlin Implementation](implementation/PURE_KOTLIN_IMPLEMENTATION.md) - Pure Kotlin parser approach

### Feature Implementation
- [Implementation Complete](implementation/IMPLEMENTATION_COMPLETE.md) - Completed implementation report
- [Final Implementation Summary](implementation/FINAL_IMPLEMENTATION_SUMMARY.md) - Final summary of parser work
- [Radio Implementation](implementation/RADIO_IMPLEMENTATION.md) - Radio feature implementation
- [Centralized Search Implementation](implementation/CENTRALIZED_SEARCH_IMPLEMENTATION.md) - Search functionality

---

## 📋 Planning & Roadmap

- [TODO](planning/TODO.md) - Detailed task list and roadmap
- [Kotlin Conversion TODO](planning/KOTLIN_CONVERSION_TODO.md) - Pure Kotlin conversion plan
- [Improvements Needed](planning/IMPROVEMENTS_NEEDED.md) - PWA and app improvements list

---

## 🔍 Analysis & Research References

- [Calibre Droid Analysis](archive/CALIBRE_DROID_ANALYSIS.md) - Historical reference for Calibre integration analysis
- [Radio APK Analysis](archive/RADIO_APK_ANALYSIS.md) - Historical reference for FM Radio APK analysis

---

## 📦 Completed Work References (Archive)

### Bug Fixes & Reviews
- [Comprehensive Bugfix Report](archive/completed/COMPREHENSIVE_BUGFIX_REPORT.md) - Major bug fixes
- [PR Review Findings](archive/completed/PR_REVIEW_FINDINGS.md) - Pull request review notes
- [PR Review Summary](archive/completed/PR_REVIEW_SUMMARY.md) - PR review summary

### UI Improvements
- [UI Navigation Final Report](UI_Navigation_Final_Report.md) - Navigation system improvements
- [UI Visualizer Fixes Completed](UI_Visualizer_Fixes_Completed.md) - Audio visualizer fixes
- [UI Visualizer Fixes Plan](UI_Visualizer_Fixes_Plan.md) - Visualizer improvement plan

### APK Fixes
- [APK High Priority Fixes Completed](APK_HIGH_PRIORITY_FIXES_COMPLETED.md) - Critical APK fixes
- [APK TODO Fixes](APK_TODO_FIXES.md) - Remaining APK improvements

### PWA Enhancement
- [PWA Enhancement Summary](archive/completed/PWA_ENHANCEMENT_SUMMARY.md) - Progressive Web App improvements

### Historical Archives
- [Advanced Features](archive/ADVANCED_FEATURES.md) - Historical reference on complex capabilities
- [Audio Improvements Summary](archive/AUDIO_IMPROVEMENTS_SUMMARY.md) - Historical reference on audio feature work
- [Bugfix Summary](archive/BUGFIX_SUMMARY.md) - Historical bug-fix reference
- [Debugging Analysis](archive/DEBUGGING_ANALYSIS.md) - Historical debugging notes and findings
- [Design Improvements Summary](archive/DESIGN_IMPROVEMENTS_SUMMARY.md) - Historical UI/UX reference
- [Fixes Summary](archive/FIXES_SUMMARY.md) - Historical general-fixes reference
- [Implementation Guide](archive/IMPLEMENTATION_GUIDE.md) - Historical implementation reference
- [Implementation Summary](archive/IMPLEMENTATION_SUMMARY.md) - Historical implementation reference
- [Memory Leak Fixes Changelog](archive/MEMORY_LEAK_FIXES_CHANGELOG.md) - Historical memory-leak fix reference

### Review Package (Historical References)
- [Review Package README](reviews/README.md) - Historical review package index
- [Executive Summary](reviews/EXECUTIVE_SUMMARY.md) - Historical review summary
- [UI Design Review](reviews/ui_design_review.md) - Historical UI audit reference
- [Fixes Applied](reviews/fixes_applied.md) - Historical record of applied review fixes
- [Recommendations](reviews/recommendations.md) - Historical recommendation set
- [Dimension Token Audit](reviews/dimension-token-audit.md) - Historical design token audit

---

## 🔒 Security

- [Security Documentation](security/) - Security-related documentation

---

## 🖼️ Assets

- [Images](images/) - Screenshots and diagrams

---

## 📱 Related Projects

### PWA Demo
- [PWA Demo Theming Guide](../pwa-demo/THEMING_GUIDE.md) - PWA theming documentation
- [PWA Demo Code Review Summary](../pwa-demo/CODE_REVIEW_SUMMARY.md) - PWA code review

---

## 🗂️ Documentation Organization

### By Status
- **Active Features**: See [FEATURES_STATUS](FEATURES_STATUS.md)
- **In Development**: See [ROADMAP](ROADMAP.md) and [planning/TODO](planning/TODO.md)
- **Completed**: See [archive/completed/](archive/completed/)
- **Historical References**: See [archive/](archive/) and [reviews/](reviews/)

### By Category
- **User Documentation**: README, FEATURES, FEATURES_STATUS
- **Developer Documentation**: ARCHITECTURE, implementation guides
- **Planning**: ROADMAP, TODO, planning documents
- **Historical**: archive/ directory

---

## 🔗 External Resources

- **Repository**: https://github.com/Kaleaon/CleverFerret
- **Issues**: Track bugs and feature requests on GitHub
- **Pull Requests**: Contribute improvements

---

## 📝 Contributing to Documentation

When adding new documentation:

1. **Features**: Place in `docs/features/`
2. **Implementation Guides**: Place in `docs/implementation/`
3. **Planning Documents**: Place in `docs/planning/`
4. **Completed Work**: Place in `docs/archive/completed/`
5. **Research/Analysis**: Place in `docs/archive/`
6. **Update this index**: Add entry in appropriate section
7. **Update cross-references**: Update links in related documents

---

## 📊 Documentation Statistics

- **Total Documentation Files**: 45+ markdown files
- **Implementation Guides**: 9 files
- **Feature Documentation**: 5 files
- **Planning Documents**: 3 files
- **Archived Documents**: 15+ files
- **Last Major Update**: December 30, 2024

---

*This index is maintained to help developers and users navigate the extensive CleverFerret documentation. If you find broken links or missing documents, please report them as issues.*

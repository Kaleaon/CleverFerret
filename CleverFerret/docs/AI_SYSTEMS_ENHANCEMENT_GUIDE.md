# CleverFerret AI Systems Enhancement - Current Implementation Guide

## Overview

This guide reflects the **current** AI service implementation in CleverFerret after the AI chat/automation cleanup. It intentionally documents only services that exist in `services/ai` today.

## Current AI Service Set

The following services/providers are present under `CleverFerret/src/main/java/com/universalmedialibrary/services/ai/`:

- `AIProvider.kt` - Shared provider interface.
- `AIServiceManager.kt` - Selects active provider from settings and applies API keys.
- `AIMetadataService.kt` - AI-assisted metadata workflows.
- `AIReadingProgressService.kt` - Reading analytics/context workflows.
- `AILibraryBrowserService.kt` - AI-assisted library browsing helpers.
- `GeminiAIProvider.kt` - Gemini provider implementation.
- `OpenAIProvider.kt` - OpenAI provider implementation.
- `OpenRouterProvider.kt` - OpenRouter provider implementation.
- `LocalLLMProvider.kt` - Local model provider implementation.
- `GrokAnalysisService.kt` - Analysis workflows.
- `GeminiTTSService.kt` - Gemini text-to-speech integration.
- `TranslationService.kt` - Translation workflows.

## Removed Services (Intentional)

The following files were intentionally removed in commit `d396a435` ("Remove AI chat and add Landseek link") and are **not** part of the active system:

- `AIBackupAutomationService.kt`
- `AIBookDiscussionService.kt`
- `AIReadingAgentService.kt`
- `AIBackupWorker.kt`
- `AIContentCacheService.kt`
- `AIDataModels.kt`
- `AILogStorageService.kt`
- `AIRateLimitService.kt`
- `AIToolsService.kt`
- `ConversationModeService.kt`
- `EnhancedAIContentCacheService.kt`
- `StreamingChatService.kt`


## Failure Trace Mapping (Historical `error.NonExistentClass`)

From `compile_log.txt`, KSP previously reported unresolved constructor parameter types for three now-removed services:

- `AIBackupAutomationService(android.content.Context,error.NonExistentClass,error.NonExistentClass,error.NonExistentClass)`
- `AIBookDiscussionService(android.content.Context,AIReadingProgressService,ReadingAnalyticsDao,error.NonExistentClass)`
- `AIReadingAgentService(android.content.Context,AIReadingProgressService,AIBookDiscussionService,AILibraryBrowserService,error.NonExistentClass)`

Resolution applied in current codebase:

1. **Removed dependency path (refactor-by-removal)**: these services were intentionally deleted and are no longer part of `src/main/java` (instead of restoring missing classes).
2. **DI cleanup**: active Hilt modules provide only surviving AI services/types; no `@Provides`/`@Binds` entries reference the removed services.
3. **Regression guard**: CI includes an explicit KSP gate step so unresolved types surface immediately.

## Dependency Injection Notes

- `ServicesModule` provides active AI services via currently existing types (`AIServiceManager`, `AIMetadataService`, `AIReadingProgressService`).
- No active `@Provides`/`@Binds` entries reference the removed backup/discussion/reading-agent services.

## Architecture Snapshot

```text
AI Features
├── AIServiceManager
│   ├── GeminiAIProvider
│   ├── OpenAIProvider
│   └── API key + provider settings
├── AIMetadataService
├── AIReadingProgressService
├── AILibraryBrowserService
├── GrokAnalysisService
├── GeminiTTSService
└── TranslationService
```

## Verification Checklist

Use this checklist when validating AI service consistency:

1. Run a clean generated-state build:
   - `./gradlew clean :CleverFerret:kspDebugKotlin`
2. Confirm removed services are not referenced:
   - Search for `AIBackupAutomationService`, `AIBookDiscussionService`, `AIReadingAgentService` across `src/main/java`.
3. Confirm DI wiring still resolves to existing service types.

## Troubleshooting

If KSP fails before project evaluation with a Java parsing message such as `IllegalArgumentException: 25.0.1`, verify that the build JDK is a supported stable version for the current Kotlin/Gradle toolchain (typically Java 17 or 21 for Android projects), then rerun KSP.

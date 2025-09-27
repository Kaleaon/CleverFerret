# CleverFerret Architecture Overview

## Technology Stack
- **Language**: Kotlin
- **UI Framework**: Jetpack Compose with Material 3
- **Architecture**: MVVM with Hilt dependency injection
- **Database**: Room (SQLite)
- **Async**: Kotlin Coroutines and Flow
- **Build System**: Gradle 8.8 with Android Gradle Plugin 8.4.1

## Application Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        UI Layer                             │
│  ┌─────────────────┐  ┌─────────────────┐                  │
│  │  MainActivity   │  │  Compose UI     │                  │
│  │                 │  │  Components     │                  │
│  └─────────────────┘  └─────────────────┘                  │
└─────────────────────────────────────────────────────────────┘
                               │
┌─────────────────────────────────────────────────────────────┐
│                    Domain Layer                             │
│  ┌─────────────────┐  ┌─────────────────┐                  │
│  │   ViewModels    │  │   Use Cases     │                  │
│  │                 │  │                 │                  │
│  └─────────────────┘  └─────────────────┘                  │
└─────────────────────────────────────────────────────────────┘
                               │
┌─────────────────────────────────────────────────────────────┐
│                     Data Layer                              │
│  ┌─────────────────┐  ┌─────────────────┐                  │
│  │  Room Database  │  │   Repositories  │                  │
│  │     (SQLite)    │  │                 │                  │
│  └─────────────────┘  └─────────────────┘                  │
└─────────────────────────────────────────────────────────────┘
```

## Core Components

### Data Layer
- **Room Database**: Local storage for media library data
- **Repositories**: Data access abstraction layer
- **DAOs**: Database access objects for CRUD operations

### Domain Layer
- **ViewModels**: UI state management
- **Use Cases**: Business logic encapsulation

### UI Layer
- **MainActivity**: Single activity architecture
- **Compose UI**: Declarative UI components
- **Material 3**: Modern Android design system

### Dependency Injection
- **Hilt**: Compile-time dependency injection
- **Modules**: Service and data provision configuration

## Key Features
1. **Universal Media Library**: Books, music, movies, podcasts
2. **Material You**: Dynamic theming support
3. **Modern Architecture**: Clean, testable, maintainable code
4. **Local-First**: Works offline with Room database

## Build Configuration
- **Target SDK**: 34 (Android 14)
- **Min SDK**: 26 (Android 8.0) 
- **Kotlin**: 1.9.23
- **Compose BOM**: 2024.05.00
- **Hilt**: 2.51.1
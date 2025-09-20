# 🤖 AI Development Assistant Guide for CleverFerret

## Overview

This guide helps AI development tools (Jules, Copilot, Gemini, Firebase AI, etc.) understand and work effectively with the CleverFerret Universal Media Library project.

## 🏗️ Universal Build System - Key Innovation

CleverFerret features a **revolutionary Universal Build System** that automatically:
- Detects host architecture (ARM64, x86_64, ARM32, x86)
- Fixes AAPT2 compatibility issues
- Generates multi-architecture APKs
- Provides self-healing build processes

### Essential Commands for AI Tools

```bash
# 🔍 System Information & Diagnostics
./build-scripts/universal-build.sh info          # Show architecture and tools status
./gradlew diagnose                                # Complete system diagnostics
./gradlew architectureInfo                        # Architecture-specific information

# 🔨 Building (Recommended for AI tools)
./build-scripts/simple-build.sh build debug      # Reliable debug build
./build-scripts/simple-build.sh build release    # Reliable release build
./build-scripts/universal-build.sh test-env      # Test build environment

# 🧪 Testing
./gradlew testDebugUnitTest                       # Run unit tests
./gradlew lintDebug                               # Run code analysis

# 🧹 Maintenance
./build-scripts/universal-build.sh clean         # Clean build environment
./build-scripts/universal-build.sh full-build    # Complete clean + build
```

## 📱 Project Architecture

### Technology Stack
- **Language**: Kotlin
- **UI Framework**: Jetpack Compose + Material 3
- **Architecture**: MVVM
- **Dependency Injection**: Hilt
- **Database**: Room + SQLite
- **Media Playback**: Media3 ExoPlayer
- **Build System**: Universal Build System (custom)

### Package Structure
```
CleverFerret/src/main/java/com/universalmedialibrary/
├── ui/                 # Jetpack Compose UI components and screens
├── data/              # Room database entities, DAOs, and repositories
├── domain/            # Business logic, use cases, and domain models
├── di/                # Hilt dependency injection modules
├── players/           # Media player implementations
├── utils/             # Utility functions and extensions
└── MainActivity.kt    # Main application entry point
```

## 🎯 AI Development Guidelines

### For Code Generation
1. **Always use Kotlin idiomatic patterns**
2. **Follow MVVM architecture** with proper separation of concerns
3. **Use Jetpack Compose** for all UI development
4. **Implement proper state management** with Compose state hoisting
5. **Use Hilt for dependency injection** consistently
6. **Consider multi-architecture compatibility** in all suggestions

### For Build System Interactions
- **Never use direct gradle commands** for building - use Universal Build System scripts
- **Use `./build-scripts/simple-build.sh`** for most reliable builds
- **Run diagnostics first** when troubleshooting: `./gradlew diagnose`
- **Check architecture compatibility** with: `./build-scripts/universal-build.sh info`

### For UI Development
```kotlin
// ✅ Good - Jetpack Compose with Material 3
@Composable
fun MediaLibraryScreen(
    viewModel: MediaLibraryViewModel = hiltViewModel(),
    onNavigateToPlayer: (MediaItem) -> Unit
) {
    val uiState by viewModel.uiState.collectAsState()
    
    LazyColumn {
        items(uiState.mediaItems) { item ->
            MediaCard(
                item = item,
                onClick = { onNavigateToPlayer(item) }
            )
        }
    }
}
```

### For Database Operations
```kotlin
// ✅ Good - Room with coroutines
@Entity(tableName = "media_items")
data class MediaItem(
    @PrimaryKey val id: String,
    val title: String,
    val type: MediaType,
    val filePath: String,
    val metadata: String
)

@Dao
interface MediaItemDao {
    @Query("SELECT * FROM media_items WHERE type = :type")
    fun getMediaByType(type: MediaType): Flow<List<MediaItem>>
    
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMediaItem(item: MediaItem)
}
```

## 🔧 Common Development Scenarios

### Adding New Features
1. **UI Changes**: Work in `ui/` package with Jetpack Compose
2. **Data Layer**: Add entities in `data/` package with Room
3. **Business Logic**: Implement use cases in `domain/` package
4. **Dependency Injection**: Configure modules in `di/` package

### Media Player Integration
```kotlin
// ✅ Good - Media3 ExoPlayer integration
@HiltViewModel
class MediaPlayerViewModel @Inject constructor(
    private val exoPlayer: ExoPlayer
) : ViewModel() {
    
    fun playMedia(mediaItem: MediaItem) {
        val mediaItem = MediaItem.Builder()
            .setUri(mediaItem.filePath)
            .build()
        
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.prepare()
        exoPlayer.play()
    }
}
```

### Build System Integration
```kotlin
// ✅ Good - Access build information at runtime
class BuildInfoProvider @Inject constructor() {
    
    fun getArchitectureInfo(): String {
        return BuildConfig.HOST_ARCHITECTURE
    }
    
    fun isUniversalBuildSystem(): Boolean {
        return BuildConfig.ANDROID_TOOLS_CONFIGURED
    }
}
```

## 🚨 Common Issues & Solutions

### AAPT2 Process Failed
```bash
# AI Tool Response: Run these commands
./build-scripts/simple-build.sh fix
./build-scripts/simple-build.sh build debug
```

### Build Memory Issues
```bash
# AI Tool Response: Increase memory and rebuild
export GRADLE_OPTS="-Xmx6g -XX:MaxMetaspaceSize=2g"
./build-scripts/universal-build.sh build
```

### Architecture Detection Issues
```bash
# AI Tool Response: Check system status
./build-scripts/universal-build.sh info
./gradlew architectureInfo
```

## 📚 Documentation References

When providing assistance, reference these key documents:
- **README.md**: Project overview and quick start
- **docs/BUILD_SYSTEM.md**: Technical deep dive into Universal Build System
- **docs/TROUBLESHOOTING.md**: Common issues and solutions
- **UNIVERSAL_BUILD_STATUS.md**: Production readiness status

## 🎯 AI Tool Specific Tips

### For Jules (Google AI)
- Always start with `./build-scripts/universal-build.sh info`
- Use workspace commands from `.jules/workspace.json`
- Reference `.jules/dev-environment.md` for context

### For GitHub Copilot
- Focus on Kotlin idiomatic patterns
- Suggest Jetpack Compose best practices
- Consider multi-architecture implications

### For Gemini
- Provide architectural guidance
- Help with complex debugging scenarios
- Suggest performance optimizations

### For Firebase AI
- Integrate ML Kit for metadata extraction
- Use Crashlytics for multi-architecture monitoring
- Implement smart content categorization

## 🌟 Success Patterns

### Code Quality
- Use sealed classes for state management
- Implement proper coroutine usage
- Follow single responsibility principle
- Write comprehensive tests

### Architecture
- Maintain clear separation between layers
- Use repository pattern for data access
- Implement proper error handling
- Consider offline-first approach

### Performance
- Optimize for different device architectures
- Implement efficient media loading
- Use proper memory management
- Consider battery optimization

## 📞 Getting Help

When AI tools encounter issues:
1. **Run diagnostics**: `./gradlew diagnose`
2. **Check build system**: `./build-scripts/universal-build.sh info`
3. **Review documentation**: Check `docs/` directory
4. **Test environment**: `./build-scripts/universal-build.sh test-env`

Remember: The Universal Build System is designed to be self-healing and should resolve most architecture-related issues automatically!
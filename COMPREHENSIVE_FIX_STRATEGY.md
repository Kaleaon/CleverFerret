# Comprehensive Error Fix Strategy

## Current State
- **Total Errors:** 781 remaining (121 fixed)
- **Progress:** 13.4% complete
- **Strategy:** Complex problems first, no stubbing

## Error Categories (Hardest First)

### 1. @Composable Context Errors (86 errors) - HIGHEST PRIORITY
**Difficulty:** High  
**Impact:** High (blocks UI compilation)  
**Pattern:** Functions calling @Composable without being @Composable themselves

**Solution Strategy:**
```kotlin
// Pattern A: Missing @Composable annotation
fun MyScreen() { // ❌ Missing @Composable
    Text("Hello")
}
// Fix: Add @Composable
@Composable
fun MyScreen() { // ✅ Fixed
    Text("Hello")
}

// Pattern B: Extract non-composable logic
@Composable
fun MyScreen(viewModel: MyViewModel) {
    val data = viewModel.fetchData() // ❌ If fetchData is not suspend
}
// Fix: Call in LaunchedEffect or extract
@Composable
fun MyScreen(viewModel: MyViewModel) {
    val data by viewModel.dataFlow.collectAsState()
}
```

### 2. Metadata Service Redeclarations (32 errors) - HIGH PRIORITY
**Difficulty:** High (architectural decisions)
**Files:** RealMetadataService.kt (~28), MetadataApiService.kt (~4)

**Solution Strategy:**
- Identify canonical model location (MetadataServiceModels.kt)
- Remove duplicates from implementation files
- Update references to use canonical models

### 3. Type Inference Failures (34 errors) - MEDIUM PRIORITY  
**Pattern:** Kotlin can't infer generic type parameters

**Solution Strategy:**
```kotlin
// Pattern: Explicit type specification needed
val result = mapOf("key" to value)[key] ?: return // ❌ Type inference fails
val result: Type = mapOf("key" to value).get(key) ?: return // ✅ Fixed
```

### 4. Missing Constructor Parameters (55+ errors) - MEDIUM PRIORITY
**Files:** WebFictionService, PodcastEpisode, etc.

**Pattern:** Code uses parameters that don't exist in model

**Solution:** Either add fields to entity or remove from calls

## Batch 4 Plan

### Phase 1: Quick Wins (2-3 hours, ~40 errors)
1. Type inference explicit types (34 errors)
2. Simple redeclarations (6 errors)

### Phase 2: @Composable Refactoring (4-6 hours, ~86 errors)
1. Add @Composable annotations where needed
2. Extract non-composable logic
3. Fix call chains

### Phase 3: Metadata Consolidation (3-4 hours, ~30 errors)
1. Consolidate model definitions
2. Update all references
3. Remove duplicates

## Target: 150+ errors fixed (leaving ~600)

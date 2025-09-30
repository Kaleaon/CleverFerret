// EXAMPLE: How to integrate PlexAuthScreen into navigation
// This file shows the changes needed to add Plex authentication to the app

// ============================================================
// 1. Add to your Navigation Graph (e.g., in MainActivity.kt)
// ============================================================

@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    
    NavHost(navController = navController, startDestination = "home") {
        // Existing routes...
        composable("home") { HomeScreen(navController) }
        composable("settings") { SettingsScreen(navController) }
        
        // ADD THIS: Plex authentication route
        composable("plex_auth") {
            PlexAuthScreen(navController = navController)
        }
        
        // ADD THIS: Plex sync screen (optional)
        composable("plex_sync") {
            PlexSyncScreen(navController = navController)
        }
    }
}

// ============================================================
// 2. Add menu item in Settings Screen
// ============================================================

@Composable
fun SettingsScreen(navController: NavController) {
    LazyColumn {
        // Existing settings...
        
        // ADD THIS: Plex integration section
        item {
            SettingsSection(title = "Integrations")
        }
        
        item {
            SettingItem(
                title = "Plex Account",
                description = "Connect to Plex Media Server",
                icon = Icons.Default.VideoLibrary,
                onClick = { navController.navigate("plex_auth") }
            )
        }
        
        item {
            SettingItem(
                title = "Plex Sync",
                description = "Sync progress and ratings",
                icon = Icons.Default.CloudSync,
                onClick = { navController.navigate("plex_sync") }
            )
        }
    }
}

// ============================================================
// 3. Add to Main Navigation Drawer (if using drawer)
// ============================================================

@Composable
fun AppNavigationDrawer(navController: NavController) {
    ModalNavigationDrawer(
        drawerContent = {
            // Existing items...
            
            // ADD THIS: Plex section
            NavigationDrawerItem(
                icon = { Icon(Icons.Default.VideoLibrary, contentDescription = null) },
                label = { Text("Plex") },
                selected = false,
                onClick = { navController.navigate("plex_auth") }
            )
        }
    ) {
        // App content
    }
}

// ============================================================
// 4. Check authentication status at startup
// ============================================================

@HiltViewModel
class MainViewModel @Inject constructor(
    private val authService: PlexAuthService
) : ViewModel() {
    
    val isPlexAuthenticated: StateFlow<Boolean> = 
        MutableStateFlow(authService.isAuthenticated())
    
    fun checkPlexAuth() {
        viewModelScope.launch {
            if (authService.isAuthenticated()) {
                // User is authenticated - could auto-sync
                // plexSyncService.syncAllServers()
            }
        }
    }
}

// ============================================================
// 5. Handle deep links (optional)
// ============================================================

// In AndroidManifest.xml, add:
/*
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="cleverferret" android:host="plex" android:path="/auth" />
</intent-filter>
*/

// In your Activity:
override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    
    // Handle deep link
    intent?.data?.let { uri ->
        if (uri.host == "plex" && uri.path == "/auth") {
            // Navigate to Plex auth screen
            // navController.navigate("plex_auth")
        }
    }
}

// ============================================================
// 6. Display Plex items in library view
// ============================================================

@Composable
fun LibraryScreen(viewModel: LibraryViewModel) {
    val items by viewModel.mediaItems.collectAsState()
    
    LazyColumn {
        items(items) { item ->
            MediaItemCard(
                item = item,
                // ADD THIS: Show Plex icon for Plex items
                badge = if (item.filePath.startsWith("plex://")) {
                    { PlexBadge() }
                } else null
            )
        }
    }
}

@Composable
fun PlexBadge() {
    Surface(
        color = MaterialTheme.colorScheme.primaryContainer,
        shape = RoundedCornerShape(4.dp)
    ) {
        Row(
            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = Icons.Default.VideoLibrary,
                contentDescription = null,
                modifier = Modifier.size(12.dp)
            )
            Spacer(modifier = Modifier.width(4.dp))
            Text(
                text = "Plex",
                style = MaterialTheme.typography.labelSmall
            )
        }
    }
}

// ============================================================
// 7. Background sync setup (optional)
// ============================================================

@HiltWorker
class PlexSyncWorker @AssistedInject constructor(
    @Assisted appContext: Context,
    @Assisted params: WorkerParameters,
    private val plexSyncService: PlexSyncService,
    private val authService: PlexAuthService
) : CoroutineWorker(appContext, params) {
    
    override suspend fun doWork(): Result {
        return try {
            if (authService.isAuthenticated()) {
                plexSyncService.syncAllServers()
                Result.success()
            } else {
                Result.success() // Skip if not authenticated
            }
        } catch (e: Exception) {
            Result.retry()
        }
    }
}

// Schedule periodic sync
fun schedulePeriodicSync(context: Context) {
    val syncRequest = PeriodicWorkRequestBuilder<PlexSyncWorker>(
        15, TimeUnit.MINUTES // Sync every 15 minutes
    ).setConstraints(
        Constraints.Builder()
            .setRequiredNetworkType(NetworkType.CONNECTED)
            .build()
    ).build()
    
    WorkManager.getInstance(context)
        .enqueueUniquePeriodicWork(
            "plex_sync",
            ExistingPeriodicWorkPolicy.KEEP,
            syncRequest
        )
}

// ============================================================
// 8. Display sync status in UI
// ============================================================

@Composable
fun PlexSyncStatusCard(viewModel: PlexSyncViewModel) {
    val syncStatus by viewModel.syncStatus.collectAsState()
    
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(modifier = Modifier.padding(16.dp)) {
            when (val status = syncStatus) {
                is PlexSyncStatus.Idle -> {
                    Text("Plex sync ready")
                }
                is PlexSyncStatus.Syncing -> {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        CircularProgressIndicator(modifier = Modifier.size(16.dp))
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(status.message)
                    }
                }
                is PlexSyncStatus.Success -> {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            Icons.Default.CheckCircle,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(status.message)
                    }
                }
                is PlexSyncStatus.Error -> {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            Icons.Default.Error,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.error
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(status.message)
                    }
                }
            }
        }
    }
}

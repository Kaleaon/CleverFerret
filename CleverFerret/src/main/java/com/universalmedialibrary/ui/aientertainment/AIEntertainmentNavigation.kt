package com.universalmedialibrary.ui.aientertainment

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavGraphBuilder
import androidx.navigation.NavHostController
import androidx.navigation.NavType
import androidx.navigation.compose.composable
import androidx.navigation.navArgument
import androidx.navigation.navigation

/**
 * Navigation routes for AI Entertainment (SynthChat) feature
 */
object AIEntertainmentRoutes {
    const val ROOT = "ai_entertainment"
    
    const val LOGIN = "ai_entertainment/login"
    const val REGISTER = "ai_entertainment/register"
    const val CHARACTERS = "ai_entertainment/characters"
    const val CHAT = "ai_entertainment/chat/{characterId}"
    const val CHARACTER_EDIT = "ai_entertainment/character/edit/{characterId}"
    const val CHARACTER_NEW = "ai_entertainment/character/new"
    const val ROOMS = "ai_entertainment/rooms"
    const val PERSONALITY = "ai_entertainment/personality/{characterId}"
    const val DOCUMENT_IMPORT = "ai_entertainment/import"
    
    fun chatRoute(characterId: Long) = "ai_entertainment/chat/$characterId"
    fun characterEditRoute(characterId: Long) = "ai_entertainment/character/edit/$characterId"
    fun personalityRoute(characterId: Long) = "ai_entertainment/personality/$characterId"
}

/**
 * Entry screen that checks auth status and redirects appropriately
 */
@Composable
fun AIEntertainmentEntryScreen(
    navController: NavHostController,
    viewModel: LoginViewModel = hiltViewModel()
) {
    val currentUser by viewModel.currentUser.collectAsState()
    val isLoggedIn = currentUser != null
    
    LaunchedEffect(isLoggedIn) {
        if (isLoggedIn) {
            navController.navigate(AIEntertainmentRoutes.CHARACTERS) {
                popUpTo("ai-entertainment") { inclusive = true }
            }
        } else {
            navController.navigate(AIEntertainmentRoutes.LOGIN) {
                popUpTo("ai-entertainment") { inclusive = true }
            }
        }
    }
    
    // Show loading while checking auth
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(SynthColors.background),
        contentAlignment = androidx.compose.ui.Alignment.Center
    ) {
        CircularProgressIndicator(color = SynthColors.primary)
    }
}

/**
 * Add AI Entertainment navigation routes directly to the NavHost
 * (not as a nested navigation graph, but as top-level composables)
 * 
 * This version is designed to be integrated into an existing MediaAppNavHost
 */
fun NavGraphBuilder.aiEntertainmentNavGraph(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit = {}
) {
    // Login Screen
    composable(AIEntertainmentRoutes.LOGIN) {
        LoginScreen(
            onNavigateToRegister = {
                navController.navigate(AIEntertainmentRoutes.REGISTER)
            },
            onNavigateToCharacters = {
                navController.navigate(AIEntertainmentRoutes.CHARACTERS) {
                    popUpTo(AIEntertainmentRoutes.LOGIN) { inclusive = true }
                }
            }
        )
    }
    
    // Register Screen
    composable(AIEntertainmentRoutes.REGISTER) {
        RegisterScreen(
            onNavigateToLogin = {
                navController.popBackStack()
            },
            onNavigateToCharacters = {
                navController.navigate(AIEntertainmentRoutes.CHARACTERS) {
                    popUpTo(AIEntertainmentRoutes.LOGIN) { inclusive = true }
                }
            }
        )
    }
    
    // Characters Screen (Main Hub)
    composable(AIEntertainmentRoutes.CHARACTERS) {
        CharactersScreen(
            onNavigateToChat = { characterId ->
                navController.navigate(AIEntertainmentRoutes.chatRoute(characterId))
            },
            onNavigateToCharacterEdit = { characterId ->
                if (characterId != null) {
                    navController.navigate(AIEntertainmentRoutes.characterEditRoute(characterId))
                } else {
                    navController.navigate(AIEntertainmentRoutes.CHARACTER_NEW)
                }
            },
            onNavigateToRooms = {
                navController.navigate(AIEntertainmentRoutes.ROOMS)
            },
            onNavigateToImport = {
                navController.navigate(AIEntertainmentRoutes.DOCUMENT_IMPORT)
            },
            onNavigateToLogin = {
                navController.navigate(AIEntertainmentRoutes.LOGIN) {
                    popUpTo(AIEntertainmentRoutes.CHARACTERS) { inclusive = true }
                }
            }
        )
    }
    
    // Chat Screen
    composable(
        route = AIEntertainmentRoutes.CHAT,
        arguments = listOf(navArgument("characterId") { type = NavType.LongType })
    ) { backStackEntry ->
        val characterId = backStackEntry.arguments?.getLong("characterId") ?: return@composable
        
        ChatScreen(
            characterId = characterId,
            onNavigateBack = { navController.popBackStack() },
            onNavigateToCharacterEdit = {
                navController.navigate(AIEntertainmentRoutes.characterEditRoute(characterId))
            },
            onNavigateToPersonality = {
                navController.navigate(AIEntertainmentRoutes.personalityRoute(characterId))
            }
        )
    }
    
    // Character Edit Screen
    composable(
        route = AIEntertainmentRoutes.CHARACTER_EDIT,
        arguments = listOf(navArgument("characterId") { type = NavType.LongType })
    ) { backStackEntry ->
        val characterId = backStackEntry.arguments?.getLong("characterId")
        
        CharacterEditScreen(
            characterId = characterId,
            onNavigateBack = { navController.popBackStack() }
        )
    }
    
    // New Character Screen
    composable(AIEntertainmentRoutes.CHARACTER_NEW) {
        CharacterEditScreen(
            characterId = null,
            onNavigateBack = { navController.popBackStack() }
        )
    }
    
    // Rooms Screen
    composable(AIEntertainmentRoutes.ROOMS) {
        RoomsScreen(
            onNavigateBack = { navController.popBackStack() }
        )
    }
    
    // Personality Screen
    composable(
        route = AIEntertainmentRoutes.PERSONALITY,
        arguments = listOf(navArgument("characterId") { type = NavType.LongType })
    ) { backStackEntry ->
        val characterId = backStackEntry.arguments?.getLong("characterId") ?: return@composable
        
        PersonalityScreen(
            characterId = characterId,
            onNavigateBack = { navController.popBackStack() }
        )
    }
    
    // Document Import Screen
    composable(AIEntertainmentRoutes.DOCUMENT_IMPORT) {
        DocumentImportScreen(
            onNavigateBack = { navController.popBackStack() },
            onCharacterCreated = { characterId ->
                navController.navigate(AIEntertainmentRoutes.chatRoute(characterId)) {
                    popUpTo(AIEntertainmentRoutes.DOCUMENT_IMPORT) { inclusive = true }
                }
            }
        )
    }
}

/**
 * Add AI Entertainment as a nested navigation graph
 * (Use this version if you want the entire AI Entertainment section
 * to be a self-contained navigation sub-graph)
 */
fun NavGraphBuilder.aiEntertainmentNestedNavGraph(
    navController: NavHostController,
    onExitToMainApp: () -> Unit = { navController.popBackStack() }
) {
    navigation(
        startDestination = AIEntertainmentRoutes.LOGIN,
        route = AIEntertainmentRoutes.ROOT
    ) {
        aiEntertainmentNavGraph(navController)
    }
}

/**
 * Standalone AI Entertainment composable that can be embedded directly
 * without navigation setup (useful for integration into existing screens)
 */
@Composable
fun AIEntertainmentHub(
    onBackPressed: () -> Unit = {}
) {
    val navController = androidx.navigation.compose.rememberNavController()
    
    // This can be used if you want to embed the AI Entertainment 
    // section within an existing navigation structure
    androidx.navigation.compose.NavHost(
        navController = navController,
        startDestination = AIEntertainmentRoutes.CHARACTERS
    ) {
        aiEntertainmentNavGraph(navController = navController)
    }
}

package com.universalmedialibrary.ui.onboarding

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.Security
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.media.viewmodels.OnboardingViewModel
import com.universalmedialibrary.utils.PermissionsHandler
import com.universalmedialibrary.utils.rememberPermissionsHandler

/**
 * Onboarding / First-Run Experience
 * 
 * Introduces new users to CleverFerret's key features:
 * - Universal media management
 * - Best visualizer on Android
 * - 13 professional widgets
 * - MX Player gestures
 * - Moon Reader e-reader
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun OnboardingScreen(
    onComplete: () -> Unit,
    viewModel: OnboardingViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    var currentPage by remember { mutableIntStateOf(0) }
    val pages = remember { getOnboardingPages() }
    var permissionsRequested by remember { mutableStateOf(false) }
    var pendingCompletion by remember { mutableStateOf(false) }

    val handleFinish = {
        viewModel.completeOnboarding(onComplete)
    }

    val permissionState = rememberPermissionsHandler(
        onAllPermissionsGranted = {
            viewModel.triggerInitialScan()
            if (pendingCompletion) {
                handleFinish()
            }
        },
        onPermissionsDenied = {
            if (pendingCompletion) {
                handleFinish()
            }
        }
    )

    val requestPermissionsOrComplete = {
        val hasStorage = PermissionsHandler.hasStoragePermissions(context) ||
            permissionState.hasStoragePermissions ||
            permissionState.hasAllPermissions
        if (!hasStorage && !permissionsRequested) {
            permissionsRequested = true
            pendingCompletion = true
            permissionState.requestPermissions()
        } else {
            handleFinish()
        }
    }
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
    ) {
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Skip button
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.End
            ) {
                TextButton(onClick = requestPermissionsOrComplete) {
                    Text("Skip")
                }
            }
            
            // Current page
            Box(modifier = Modifier.weight(1f)) {
                val hasStorage = PermissionsHandler.hasStoragePermissions(context) ||
                    permissionState.hasStoragePermissions ||
                    permissionState.hasAllPermissions
                OnboardingPage(
                    page = pages[currentPage],
                    isPermissionPage = currentPage == 1,
                    hasStoragePermission = hasStorage,
                    onRequestPermission = {
                        permissionsRequested = true
                        permissionState.requestPermissions()
                    }
                )
            }
            
            // Page indicator
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.Center
            ) {
                repeat(pages.size) { index ->
                    Box(
                        modifier = Modifier
                            .padding(4.dp)
                            .size(if (index == currentPage) 12.dp else 8.dp)
                            .clip(CircleShape)
                            .background(
                                if (index == currentPage)
                                    MaterialTheme.colorScheme.primary
                                else
                                    MaterialTheme.colorScheme.onSurface.copy(alpha = 0.3f)
                            )
                    )
                }
            }
            
            // Next/Get Started button
            Button(
                onClick = {
                    if (currentPage < pages.size - 1) {
                        // Go to next page
                        currentPage++
                    } else {
                        // Complete onboarding
                        requestPermissionsOrComplete()
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 24.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = MaterialTheme.colorScheme.primary
                )
            ) {
                Text(
                    text = if (currentPage < pages.size - 1) "Next" else "Get Started",
                    fontSize = 16.sp,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(8.dp)
                )
            }
        }
    }
}

@Composable
private fun OnboardingPage(
    page: OnboardingPageData,
    isPermissionPage: Boolean = false,
    hasStoragePermission: Boolean = false,
    onRequestPermission: () -> Unit = {}
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        // Icon
        Box(
            modifier = Modifier
                .size(120.dp)
                .clip(CircleShape)
                .background(
                    Brush.linearGradient(
                        colors = listOf(
                            page.color.copy(alpha = 0.3f),
                            page.color.copy(alpha = 0.1f)
                        )
                    )
                ),
            contentAlignment = Alignment.Center
        ) {
            Icon(
                imageVector = page.icon,
                contentDescription = "Media image",
                modifier = Modifier.size(64.dp),
                tint = page.color
            )
        }
        
        Spacer(modifier = Modifier.height(32.dp))
        
        // Title
        Text(
            text = page.title,
            fontSize = 28.sp,
            fontWeight = FontWeight.Bold,
            textAlign = TextAlign.Center,
            color = MaterialTheme.colorScheme.onBackground
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        // Description
        Text(
            text = page.description,
            fontSize = 16.sp,
            textAlign = TextAlign.Center,
            color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.7f),
            lineHeight = 24.sp
        )
        
        if (page.features.isNotEmpty()) {
            Spacer(modifier = Modifier.height(24.dp))
            
            // Feature bullets
            Column(
                horizontalAlignment = Alignment.Start,
                modifier = Modifier.padding(horizontal = 16.dp)
            ) {
                page.features.forEach { feature ->
                    Row(
                        modifier = Modifier.padding(vertical = 4.dp),
                        verticalAlignment = Alignment.Top
                    ) {
                        Icon(
                            imageVector = Icons.Default.CheckCircle,
                            contentDescription = "Media image",
                            modifier = Modifier.size(20.dp),
                            tint = page.color
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Text(
                            text = feature,
                            fontSize = 14.sp,
                            color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.8f)
                        )
                    }
                }
            }
        }

        if (isPermissionPage) {
            Spacer(modifier = Modifier.height(24.dp))
            if (!hasStoragePermission) {
                Button(
                    onClick = onRequestPermission,
                    colors = ButtonDefaults.buttonColors(
                        containerColor = page.color
                    )
                ) {
                    Icon(
                        imageVector = Icons.Default.Security,
                        contentDescription = null,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Grant Storage Access")
                }
            } else {
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.Default.CheckCircle,
                        contentDescription = "Access granted",
                        tint = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = "Storage access granted",
                        color = MaterialTheme.colorScheme.primary,
                        fontWeight = FontWeight.Medium
                    )
                }
            }
        }
    }
}

private data class OnboardingPageData(
    val title: String,
    val description: String,
    val icon: ImageVector,
    val color: Color,
    val features: List<String> = emptyList()
)

private fun getOnboardingPages(): List<OnboardingPageData> {
    return listOf(
        // Welcome
        OnboardingPageData(
            title = "Welcome to CleverFerret",
            description = "The universal media manager that organizes all your media in one beautiful app.",
            icon = Icons.Default.Home,
            color = Color(0xFF6200EE),
            features = listOf(
                "All your media in one app",
                "Audio, video, books, comics & more",
                "Free & open source"
            )
        ),
        
        // Permissions
        OnboardingPageData(
            title = "Grant Permissions",
            description = "CleverFerret needs access to your media files to discover and organize your library.",
            icon = Icons.Default.Security,
            color = Color(0xFF9C27B0),
            features = listOf(
                "Storage access (for scanning media)",
                "Notifications (for playback controls)"
            )
        ),

        // Ready
        OnboardingPageData(
            title = "You're All Set!",
            description = "Your library is ready. Account services can be configured anytime in Settings.",
            icon = Icons.Default.CheckCircle,
            color = Color(0xFF4CAF50),
            features = listOf(
                "Discover your local media library",
                "Connect external accounts in Settings"
            )
        )
    )
}

package com.universalmedialibrary.ui.books

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.OpenInNew
import androidx.compose.material.icons.filled.Share
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.barcode.BookPurchaseLinksService

/**
 * Purchase Links Dialog
 * 
 * Displays available purchase links for books scanned via barcode
 * but not yet available in the library.
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PurchaseLinksDialog(
    bookTitle: String,
    isbn: String?,
    onDismiss: () -> Unit,
    onOpenLink: (BookPurchaseLinksService.PurchaseLink) -> Unit,
    onShareLink: (BookPurchaseLinksService.PurchaseLink) -> Unit,
    purchaseLinks: List<BookPurchaseLinksService.PurchaseLink>,
    modifier: Modifier = Modifier
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        modifier = modifier
    ) {
        Surface(
            shape = MaterialTheme.shapes.large,
            tonalElevation = 6.dp
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(24.dp)
            ) {
                // Header
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Where to Get This Book",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                    IconButton(onClick = onDismiss) {
                        Icon(Icons.Default.Close, contentDescription = "Close")
                    }
                }
                
                Spacer(modifier = Modifier.height(8.dp))
                
                // Book info
                Text(
                    text = bookTitle,
                    style = MaterialTheme.typography.titleMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                if (isbn != null) {
                    Text(
                        text = "ISBN: $isbn",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Info card
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Text(
                        text = "📚 This book was scanned but not yet added to your library. " +
                                "Here are some places where you can get a digital copy:",
                        modifier = Modifier.padding(12.dp),
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Purchase links list
                if (purchaseLinks.isEmpty()) {
                    Text(
                        text = "No purchase links available for this book.",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                } else {
                    // Section: Free & Open Source
                    val freeLinks = purchaseLinks.filter {
                        it.platform in setOf(
                            BookPurchaseLinksService.PurchasePlatform.OPEN_LIBRARY,
                            BookPurchaseLinksService.PurchasePlatform.INTERNET_ARCHIVE,
                            BookPurchaseLinksService.PurchasePlatform.PROJECT_GUTENBERG
                        )
                    }
                    
                    val commercialLinks = purchaseLinks.filter {
                        it !in freeLinks
                    }
                    
                    LazyColumn(
                        modifier = Modifier
                            .fillMaxWidth()
                            .heightIn(max = 400.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        if (freeLinks.isNotEmpty()) {
                            item {
                                Text(
                                    text = "Free & Open Source",
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Bold,
                                    color = MaterialTheme.colorScheme.primary
                                )
                            }
                            items(freeLinks) { link ->
                                PurchaseLinkItem(
                                    link = link,
                                    onOpenLink = { onOpenLink(link) },
                                    onShareLink = { onShareLink(link) }
                                )
                            }
                            
                            if (commercialLinks.isNotEmpty()) {
                                item {
                                    Spacer(modifier = Modifier.height(8.dp))
                                    Text(
                                        text = "Commercial Stores",
                                        style = MaterialTheme.typography.titleSmall,
                                        fontWeight = FontWeight.Bold,
                                        color = MaterialTheme.colorScheme.secondary
                                    )
                                }
                            }
                        }
                        
                        items(commercialLinks) { link ->
                            PurchaseLinkItem(
                                link = link,
                                onOpenLink = { onOpenLink(link) },
                                onShareLink = { onShareLink(link) }
                            )
                        }
                    }
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Close button
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.End
                ) {
                    TextButton(onClick = onDismiss) {
                        Text("Close")
                    }
                }
            }
        }
    }
}

@Composable
private fun PurchaseLinkItem(
    link: BookPurchaseLinksService.PurchaseLink,
    onOpenLink: () -> Unit,
    onShareLink: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .clickable(onClick = onOpenLink)
                .padding(12.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                modifier = Modifier.weight(1f),
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = link.displayName,
                    style = MaterialTheme.typography.bodyLarge
                )
            }
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                IconButton(
                    onClick = onShareLink,
                    modifier = Modifier.size(36.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.Share,
                        contentDescription = "Share link",
                        modifier = Modifier.size(18.dp)
                    )
                }
                
                IconButton(
                    onClick = onOpenLink,
                    modifier = Modifier.size(36.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.OpenInNew,
                        contentDescription = "Open link",
                        modifier = Modifier.size(18.dp)
                    )
                }
            }
        }
    }
}

package com.universalmedialibrary.ui.metadata.review

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.DoneAll
import androidx.compose.material.icons.filled.Edit
import androidx.compose.material.icons.filled.Info
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.data.local.entity.StagedMetadataCandidate

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MetadataReviewQueueScreen(
    state: MetadataReviewQueueUiState,
    onBackClick: () -> Unit,
    onFilterChange: (ConfidenceFilter) -> Unit,
    onApproveCandidate: (Long) -> Unit,
    onApproveAll: () -> Unit,
    onDiscardCandidate: (Long) -> Unit,
    onDiscardAll: () -> Unit,
    onSelectCandidateForEdit: (StagedMetadataCandidate?) -> Unit,
    onSaveAndApproveEdited: (StagedMetadataCandidate) -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Metadata Review Queue") },
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    if (state.candidateDiffs.isNotEmpty()) {
                        IconButton(onClick = onApproveAll) {
                            Icon(Icons.Default.DoneAll, contentDescription = "Approve All")
                        }
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Filter Bar
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                ConfidenceFilter.values().forEach { filter ->
                    FilterChip(
                        selected = state.filter == filter,
                        onClick = { onFilterChange(filter) },
                        label = {
                            Text(
                                when (filter) {
                                    ConfidenceFilter.ALL -> "All"
                                    ConfidenceFilter.HIGH -> "High (≥80%)"
                                    ConfidenceFilter.MEDIUM -> "Med (50-79%)"
                                    ConfidenceFilter.LOW -> "Low (<50%)"
                                }
                            )
                        }
                    )
                }
            }

            // Batch Actions Header
            if (state.candidateDiffs.isNotEmpty()) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 4.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "${state.candidateDiffs.size} Pending Candidate(s)",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                            Button(
                                onClick = onApproveAll,
                                colors = ButtonDefaults.buttonColors(containerColor = MaterialTheme.colorScheme.primary)
                            ) {
                                Icon(Icons.Default.Check, contentDescription = null)
                                Spacer(modifier = Modifier.width(4.dp))
                                Text("Approve All")
                            }
                            OutlinedButton(
                                onClick = onDiscardAll,
                                colors = ButtonDefaults.outlinedButtonColors(contentColor = MaterialTheme.colorScheme.error)
                            ) {
                                Icon(Icons.Default.Close, contentDescription = null)
                                Spacer(modifier = Modifier.width(4.dp))
                                Text("Discard All")
                            }
                        }
                    }
                }
            }

            // Content List
            if (state.isLoading) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator()
                }
            } else if (state.candidateDiffs.isEmpty()) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(32.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Icon(
                            imageVector = Icons.Default.Info,
                            contentDescription = null,
                            modifier = Modifier.size(64.dp),
                            tint = MaterialTheme.colorScheme.outline
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            text = "No pending metadata candidates",
                            style = MaterialTheme.typography.titleLarge
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "Automated enrichments and AI suggestions will appear here for review.",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    items(
                        items = state.candidateDiffs,
                        key = { it.candidate.candidateId }
                    ) { diffItem ->
                        CandidateDiffCard(
                            item = diffItem,
                            onApprove = { onApproveCandidate(diffItem.candidate.candidateId) },
                            onDiscard = { onDiscardCandidate(diffItem.candidate.candidateId) },
                            onEdit = { onSelectCandidateForEdit(diffItem.candidate) }
                        )
                    }
                }
            }
        }
    }

    // Edit Candidate Dialog
    state.selectedCandidateForEdit?.let { candidate ->
        EditCandidateDialog(
            candidate = candidate,
            onDismiss = { onSelectCandidateForEdit(null) },
            onSaveAndApprove = onSaveAndApproveEdited
        )
    }
}

@Composable
fun CandidateDiffCard(
    item: CandidateDiffItem,
    onApprove: () -> Unit,
    onDiscard: () -> Unit,
    onEdit: () -> Unit
) {
    val confidencePct = (item.candidate.confidenceScore * 100).toInt()
    val badgeColor = when {
        item.candidate.confidenceScore >= 0.80f -> Color(0xFF2E7D32)
        item.candidate.confidenceScore >= 0.50f -> Color(0xFFED6C02)
        else -> Color(0xFFD32F2F)
    }

    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            // Header
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = item.mediaItemName,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "Source: ${item.candidate.source}",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Surface(
                    color = badgeColor,
                    shape = MaterialTheme.shapes.small
                ) {
                    Text(
                        text = "$confidencePct% Match",
                        modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
                        style = MaterialTheme.typography.labelMedium,
                        color = Color.White
                    )
                }
            }

            Spacer(modifier = Modifier.height(12.dp))
            HorizontalDivider()
            Spacer(modifier = Modifier.height(12.dp))

            // Field Diffs Comparison Table
            Text(
                text = "Proposed Field Changes (Diff)",
                style = MaterialTheme.typography.labelLarge,
                color = MaterialTheme.colorScheme.primary
            )
            Spacer(modifier = Modifier.height(8.dp))

            item.fieldDiffs.forEach { diff ->
                FieldDiffRow(diff = diff)
                Spacer(modifier = Modifier.height(6.dp))
            }

            Spacer(modifier = Modifier.height(12.dp))

            // Action Buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.End,
                verticalAlignment = Alignment.CenterVertically
            ) {
                IconButton(onClick = onEdit) {
                    Icon(Icons.Default.Edit, contentDescription = "Edit Candidate")
                }
                OutlinedButton(
                    onClick = onDiscard,
                    colors = ButtonDefaults.outlinedButtonColors(contentColor = MaterialTheme.colorScheme.error)
                ) {
                    Text("Discard")
                }
                Spacer(modifier = Modifier.width(8.dp))
                Button(onClick = onApprove) {
                    Text("Approve")
                }
            }
        }
    }
}

@Composable
fun FieldDiffRow(diff: FieldDiff) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clip(MaterialTheme.shapes.extraSmall)
            .background(
                if (diff.isDifferent) MaterialTheme.colorScheme.surfaceVariant
                else Color.Transparent
            )
            .padding(6.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = "${diff.fieldName}:",
            style = MaterialTheme.typography.bodySmall,
            fontWeight = FontWeight.Bold,
            modifier = Modifier.width(100.dp)
        )
        Column(modifier = Modifier.weight(1f)) {
            if (diff.currentValue != null) {
                Text(
                    text = "Current: ${diff.currentValue}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            Text(
                text = "Proposed: ${diff.proposedValue ?: "<empty>"}",
                style = MaterialTheme.typography.bodySmall,
                fontWeight = FontWeight.SemiBold,
                color = if (diff.isDifferent) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurface
            )
        }
    }
}

@Composable
fun EditCandidateDialog(
    candidate: StagedMetadataCandidate,
    onDismiss: () -> Unit,
    onSaveAndApprove: (StagedMetadataCandidate) -> Unit
) {
    var title by remember { mutableStateOf(candidate.title ?: "") }
    var summary by remember { mutableStateOf(candidate.summary ?: "") }
    var year by remember { mutableStateOf(candidate.year?.toString() ?: "") }
    var tags by remember { mutableStateOf(candidate.tags ?: "") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Edit Metadata Candidate") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                OutlinedTextField(
                    value = title,
                    onValueChange = { title = it },
                    label = { Text("Title") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = year,
                    onValueChange = { year = it },
                    label = { Text("Year") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = summary,
                    onValueChange = { summary = it },
                    label = { Text("Summary / Plot") },
                    modifier = Modifier.fillMaxWidth(),
                    maxLines = 4
                )
                OutlinedTextField(
                    value = tags,
                    onValueChange = { tags = it },
                    label = { Text("Tags (comma separated)") },
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    val updated = candidate.copy(
                        title = title.ifBlank { null },
                        year = year.toIntOrNull(),
                        summary = summary.ifBlank { null },
                        tags = tags.ifBlank { null }
                    )
                    onSaveAndApprove(updated)
                }
            ) {
                Text("Save & Approve")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

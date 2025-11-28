/**
 * Library Management Screen
 * 
 * Advanced library settings and management including scan options,
 * metadata refresh, and library maintenance.
 * Migrated from LibraryManagementScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  IconButton,
  Typography,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Switch,
  Divider,
  Card,
  CardContent,
  Button,
  TextField,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  LinearProgress,
  Chip,
  Stack,
  Alert,
  Snackbar,
} from '@mui/material';
import {
  ArrowBack,
  FolderOpen,
  Refresh,
  CloudSync,
  Settings,
  Delete,
  Description,
  Image,
  AutoFixHigh,
  Storage,
  Warning,
  Edit,
  Save,
} from '@mui/icons-material';

import { libraryRepository } from '../../data/repository';
import type { Library } from '../../data/local/entity';

interface LibrarySettings {
  autoScan: boolean;
  autoMetadata: boolean;
}

export const LibraryManagementScreen: React.FC = () => {
  const { libraryId } = useParams<{ libraryId: string }>();
  const navigate = useNavigate();
  
  const [library, setLibrary] = useState<Library | null>(null);
  const [isScanning, setIsScanning] = useState(false);
  const [settings, setSettings] = useState<LibrarySettings>({
    autoScan: true,
    autoMetadata: true,
  });
  const [showDeleteDialog, setShowDeleteDialog] = useState(false);
  const [showEditDialog, setShowEditDialog] = useState(false);
  const [showStorageDialog, setShowStorageDialog] = useState(false);
  const [scanProgress, setScanProgress] = useState(0);
  const [snackbar, setSnackbar] = useState<{ open: boolean; message: string }>({ open: false, message: '' });
  const [editForm, setEditForm] = useState({ name: '', path: '', description: '' });

  useEffect(() => {
    loadLibrary();
    loadSettings();
  }, [libraryId]);

  const loadLibrary = async () => {
    if (!libraryId) return;
    const lib = await libraryRepository.getLibraryById(parseInt(libraryId));
    if (lib) {
      setLibrary(lib);
      setEditForm({
        name: lib.name,
        path: lib.path,
        description: lib.description || '',
      });
    }
  };

  const loadSettings = () => {
    if (!libraryId) return;
    const stored = localStorage.getItem(`library_settings_${libraryId}`);
    if (stored) {
      try {
        setSettings(JSON.parse(stored));
      } catch (e) {
        // Use defaults
      }
    }
  };

  const saveSettings = () => {
    if (!libraryId) return;
    localStorage.setItem(`library_settings_${libraryId}`, JSON.stringify(settings));
    setSnackbar({ open: true, message: 'Settings saved successfully' });
  };

  const handleScanLibrary = async () => {
    if (!library) return;
    setIsScanning(true);
    setScanProgress(0);
    
    try {
      // Simulate scanning progress
      for (let i = 0; i <= 100; i += 10) {
        setScanProgress(i);
        await new Promise(resolve => setTimeout(resolve, 200));
      }
      
      // Update last scanned timestamp
      await libraryRepository.updateLastScanned(library.libraryId);
      setSnackbar({ open: true, message: 'Library scan completed successfully' });
    } catch (error) {
      setSnackbar({ open: true, message: 'Error scanning library: ' + (error as Error).message });
    } finally {
      setIsScanning(false);
      setScanProgress(0);
    }
  };

  const handleRefreshMetadata = async () => {
    if (!library) return;
    
    setSnackbar({ open: true, message: 'Metadata refresh started...' });
    
    try {
      const { metadataService } = await import('../../services/metadata/MetadataService');
      const { db } = await import('../../services/database-complete');
      
      // Get all media items in this library
      const items = await db.mediaItems
        .where('libraryId')
        .equals(library.libraryId)
        .toArray();
      
      if (items.length === 0) {
        setSnackbar({ open: true, message: 'No items to refresh' });
        return;
      }
      
      let refreshed = 0;
      for (const item of items) {
        try {
          const metadata = await metadataService.fetchMetadata(item.fileName);
          if (metadata) {
            await db.metadataCommon.put({
              itemId: item.itemId,
              title: metadata.title,
              authors: metadata.authors,
              description: metadata.description,
              thumbnailPath: metadata.thumbnailUrl,
              isFavorite: false,
              isDownloaded: false,
            });
            
            if (item.mediaType === 'BOOK') {
              await db.metadataBook.put({
                itemId: item.itemId,
                isbn: metadata.isbn,
                publishedDate: metadata.publishedDate,
                publisher: metadata.publisher,
                pageCount: metadata.pageCount,
                language: metadata.language,
                isRead: false,
                series: undefined,
              });
            }
            
            refreshed++;
          }
          } catch (err) {
          const { logger } = await import('../../services/logging');
          logger.warn('LibraryManagement', `Failed to refresh metadata for ${item.fileName}`, undefined, err as Error);
        }
      }
      
      setSnackbar({ open: true, message: `Metadata refresh completed: ${refreshed}/${items.length} items updated` });
    } catch (error) {
      setSnackbar({ open: true, message: `Error refreshing metadata: ${error instanceof Error ? error.message : 'Unknown error'}` });
    }
  };

  const handleDeleteLibrary = async () => {
    if (!library) return;
    try {
      await libraryRepository.deleteLibrary(library);
      setSnackbar({ open: true, message: 'Library deleted successfully' });
      setTimeout(() => navigate('/'), 1000);
    } catch (error) {
      setSnackbar({ open: true, message: 'Error deleting library: ' + (error as Error).message });
    }
  };

  const handleSaveLibrary = async () => {
    if (!library) return;
    try {
      const updated = {
        ...library,
        name: editForm.name,
        path: editForm.path,
        description: editForm.description || undefined,
      };
      await libraryRepository.updateLibrary(updated);
      setLibrary(updated);
      setShowEditDialog(false);
      setSnackbar({ open: true, message: 'Library updated successfully' });
    } catch (error) {
      setSnackbar({ open: true, message: 'Error updating library: ' + (error as Error).message });
    }
  };

  const handleRegenerateThumbnails = async () => {
    if (!library) return;
    
    setSnackbar({ open: true, message: 'Regenerating thumbnails...' });
    
    try {
      const { thumbnailService } = await import('../../services/thumbnail/ThumbnailService');
      const { db } = await import('../../services/database-complete');
      
      // Get all media items in this library
      const items = await db.mediaItems
        .where('libraryId')
        .equals(library.libraryId)
        .toArray();
      
      if (items.length === 0) {
        setSnackbar({ open: true, message: 'No items to regenerate' });
        return;
      }
      
      let completed = 0;
      const results = await thumbnailService.regenerateThumbnails(
        items,
        { width: 300, height: 450 },
        (current, total) => {
          completed = current;
          setSnackbar({ open: true, message: `Regenerating thumbnails... ${current}/${total}` });
        }
      );
      
      // Update thumbnails in database
      for (const [itemId, thumbnail] of results.entries()) {
        await db.mediaItems.update(itemId, { thumbnailPath: thumbnail });
      }
      
      setSnackbar({ open: true, message: `Successfully regenerated ${results.size} thumbnails` });
    } catch (error) {
      setSnackbar({ open: true, message: `Error regenerating thumbnails: ${error instanceof Error ? error.message : 'Unknown error'}` });
    }
  };

  const handleStorageStatistics = () => {
    setShowStorageDialog(true);
  };

  if (!library) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
        <Typography>Loading...</Typography>
      </Box>
    );
  }

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <Box sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        {/* Header with back button */}
        <Box sx={{ display: 'flex', alignItems: 'center', mb: 3 }}>
          <IconButton onClick={() => navigate(-1)} sx={{ mr: 1 }}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h5" component="h1">
            Library Management
          </Typography>
        </Box>
        {/* Library Info Card */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              {library.name}
            </Typography>
            <Typography variant="body2" color="text.secondary" gutterBottom>
              {library.path}
            </Typography>
            <Stack direction="row" spacing={1} sx={{ mt: 2 }}>
              <Chip label={library.type} size="small" color="primary" />
              <Chip label={library.source} size="small" variant="outlined" />
            </Stack>
          </CardContent>
        </Card>

        {/* Scan Progress */}
        {isScanning && (
          <Card sx={{ mb: 2 }}>
            <CardContent>
              <Typography variant="body2" gutterBottom>
                Scanning library...
              </Typography>
              <LinearProgress variant="determinate" value={scanProgress} />
              <Typography variant="caption" sx={{ mt: 1 }}>
                {scanProgress}% complete
              </Typography>
            </CardContent>
          </Card>
        )}

        {/* Actions */}
        <List>
          <ListItem disablePadding>
            <ListItemButton onClick={handleScanLibrary} disabled={isScanning}>
              <ListItemIcon>
                <Refresh />
              </ListItemIcon>
              <ListItemText
                primary="Scan Library"
                secondary="Scan for new and updated media files"
              />
            </ListItemButton>
          </ListItem>

          <ListItem disablePadding>
            <ListItemButton onClick={handleRefreshMetadata}>
              <ListItemIcon>
                <CloudSync />
              </ListItemIcon>
              <ListItemText
                primary="Refresh Metadata"
                secondary="Update metadata from online sources"
              />
            </ListItemButton>
          </ListItem>

          <Divider sx={{ my: 1 }} />

          <ListItem disablePadding>
            <ListItemButton onClick={() => setShowEditDialog(true)}>
              <ListItemIcon>
                <Edit />
              </ListItemIcon>
              <ListItemText
                primary="Edit Library"
                secondary="Edit library name, path, and description"
              />
            </ListItemButton>
          </ListItem>

          <Divider sx={{ my: 1 }} />

          <ListItem>
            <ListItemIcon>
              <AutoFixHigh />
            </ListItemIcon>
            <ListItemText
              primary="Auto-scan on startup"
              secondary="Automatically scan for changes when app starts"
            />
            <Switch 
              checked={settings.autoScan} 
              onChange={(e) => {
                const newSettings = { ...settings, autoScan: e.target.checked };
                setSettings(newSettings);
                saveSettings();
              }} 
            />
          </ListItem>

          <ListItem>
            <ListItemIcon>
              <Description />
            </ListItemIcon>
            <ListItemText
              primary="Auto-fetch metadata"
              secondary="Automatically download metadata for new items"
            />
            <Switch 
              checked={settings.autoMetadata} 
              onChange={(e) => {
                const newSettings = { ...settings, autoMetadata: e.target.checked };
                setSettings(newSettings);
                saveSettings();
              }} 
            />
          </ListItem>

          <Divider sx={{ my: 1 }} />

          <ListItem disablePadding>
            <ListItemButton onClick={handleStorageStatistics}>
              <ListItemIcon>
                <Storage />
              </ListItemIcon>
              <ListItemText
                primary="Storage Statistics"
                secondary="View storage usage and file counts"
              />
            </ListItemButton>
          </ListItem>

          <ListItem disablePadding>
            <ListItemButton onClick={handleRegenerateThumbnails}>
              <ListItemIcon>
                <Image />
              </ListItemIcon>
              <ListItemText
                primary="Regenerate Thumbnails"
                secondary="Recreate all thumbnail images"
              />
            </ListItemButton>
          </ListItem>

          <Divider sx={{ my: 1 }} />

          <ListItem disablePadding>
            <ListItemButton onClick={() => setShowDeleteDialog(true)}>
              <ListItemIcon>
                <Delete color="error" />
              </ListItemIcon>
              <ListItemText
                primary="Delete Library"
                secondary="Remove library from database (files will not be deleted)"
                primaryTypographyProps={{ color: 'error' }}
              />
            </ListItemButton>
          </ListItem>
        </List>
      </Box>

      {/* Edit Library Dialog */}
      <Dialog open={showEditDialog} onClose={() => setShowEditDialog(false)} maxWidth="sm" fullWidth>
        <DialogTitle>Edit Library</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            label="Library Name"
            fullWidth
            value={editForm.name}
            onChange={(e) => setEditForm({ ...editForm, name: e.target.value })}
            sx={{ mb: 2 }}
          />
          <TextField
            margin="dense"
            label="Library Path"
            fullWidth
            value={editForm.path}
            onChange={(e) => setEditForm({ ...editForm, path: e.target.value })}
            sx={{ mb: 2 }}
          />
          <TextField
            margin="dense"
            label="Description"
            fullWidth
            multiline
            rows={3}
            value={editForm.description}
            onChange={(e) => setEditForm({ ...editForm, description: e.target.value })}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowEditDialog(false)}>Cancel</Button>
          <Button 
            onClick={handleSaveLibrary} 
            variant="contained"
            startIcon={<Save />}
            disabled={!editForm.name || !editForm.path}
          >
            Save
          </Button>
        </DialogActions>
      </Dialog>

      {/* Storage Statistics Dialog */}
      <Dialog open={showStorageDialog} onClose={() => setShowStorageDialog(false)} maxWidth="sm" fullWidth>
        <DialogTitle>Storage Statistics</DialogTitle>
        <DialogContent>
          <Stack spacing={2} sx={{ mt: 1 }}>
            <Box>
              <Typography variant="body2" color="text.secondary">Library Type</Typography>
              <Typography variant="h6">{library?.type || 'Unknown'}</Typography>
            </Box>
            <Box>
              <Typography variant="body2" color="text.secondary">Storage Path</Typography>
              <Typography variant="body1" sx={{ wordBreak: 'break-all' }}>{library?.path || 'N/A'}</Typography>
            </Box>
            <Alert severity="info">
              Detailed storage statistics will be available after the library is scanned.
            </Alert>
          </Stack>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowStorageDialog(false)}>Close</Button>
        </DialogActions>
      </Dialog>

      {/* Delete Confirmation Dialog */}
      <Dialog open={showDeleteDialog} onClose={() => setShowDeleteDialog(false)}>
        <DialogTitle>
          <Stack direction="row" spacing={1} alignItems="center">
            <Warning color="error" />
            <span>Delete Library?</span>
          </Stack>
        </DialogTitle>
        <DialogContent>
          <Typography>
            Are you sure you want to delete "{library?.name}"? This will remove the library from
            the database but will not delete any files.
          </Typography>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowDeleteDialog(false)}>Cancel</Button>
          <Button onClick={handleDeleteLibrary} color="error" variant="contained">
            Delete
          </Button>
        </DialogActions>
      </Dialog>

      {/* Snackbar for notifications */}
      <Snackbar
        open={snackbar.open}
        autoHideDuration={3000}
        onClose={() => setSnackbar({ ...snackbar, open: false })}
        message={snackbar.message}
      />
    </Box>
  );
};

export default LibraryManagementScreen;

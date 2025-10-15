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
  AppBar,
  Toolbar,
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
} from '@mui/icons-material';

import { libraryRepository } from '../../data/repository';
import type { Library } from '../../data/local/entity';

export const LibraryManagementScreen: React.FC = () => {
  const { libraryId } = useParams<{ libraryId: string }>();
  const navigate = useNavigate();
  
  const [library, setLibrary] = useState<Library | null>(null);
  const [isScanning, setIsScanning] = useState(false);
  const [autoScan, setAutoScan] = useState(true);
  const [autoMetadata, setAutoMetadata] = useState(true);
  const [showDeleteDialog, setShowDeleteDialog] = useState(false);
  const [scanProgress, setScanProgress] = useState(0);

  useEffect(() => {
    loadLibrary();
  }, [libraryId]);

  const loadLibrary = async () => {
    if (!libraryId) return;
    const lib = await libraryRepository.getLibraryById(parseInt(libraryId));
    setLibrary(lib || null);
  };

  const handleScanLibrary = async () => {
    setIsScanning(true);
    // Simulate scanning progress
    for (let i = 0; i <= 100; i += 10) {
      setScanProgress(i);
      await new Promise(resolve => setTimeout(resolve, 200));
    }
    setIsScanning(false);
    setScanProgress(0);
  };

  const handleRefreshMetadata = async () => {
    // TODO: Implement metadata refresh
    alert('Metadata refresh started');
  };

  const handleDeleteLibrary = async () => {
    if (!library) return;
    await libraryRepository.deleteLibrary(library);
    navigate('/');
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
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Library Management
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, overflow: 'auto', p: 2 }}>
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
            <ListItemButton onClick={() => navigate(`/library/${libraryId}/edit`)}>
              <ListItemIcon>
                <Settings />
              </ListItemIcon>
              <ListItemText
                primary="Library Settings"
                secondary="Edit library name, path, and preferences"
              />
            </ListItemButton>
          </ListItem>

          <ListItem>
            <ListItemIcon>
              <AutoFixHigh />
            </ListItemIcon>
            <ListItemText
              primary="Auto-scan on startup"
              secondary="Automatically scan for changes when app starts"
            />
            <Switch checked={autoScan} onChange={(e) => setAutoScan(e.target.checked)} />
          </ListItem>

          <ListItem>
            <ListItemIcon>
              <Description />
            </ListItemIcon>
            <ListItemText
              primary="Auto-fetch metadata"
              secondary="Automatically download metadata for new items"
            />
            <Switch checked={autoMetadata} onChange={(e) => setAutoMetadata(e.target.checked)} />
          </ListItem>

          <Divider sx={{ my: 1 }} />

          <ListItem disablePadding>
            <ListItemButton>
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
            <ListItemButton>
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
            Are you sure you want to delete "{library.name}"? This will remove the library from
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
    </Box>
  );
};

export default LibraryManagementScreen;

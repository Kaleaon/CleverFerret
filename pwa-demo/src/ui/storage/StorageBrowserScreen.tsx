/**
 * Storage Browser Screen
 * 
 * File system browser for selecting media files and folders.
 * Migrated from StorageBrowserScreen.kt
 */

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  IconButton,
  Typography,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Breadcrumbs,
  Link,
  Button,
  Snackbar,
  Alert,
} from '@mui/material';
import {
  ArrowBack,
  Folder,
  InsertDriveFile,
  ArrowUpward,
  CheckCircle,
} from '@mui/icons-material';

interface FileEntry {
  name: string;
  path: string;
  isDirectory: boolean;
  size?: number;
}

export const StorageBrowserScreen: React.FC = () => {
  const navigate = useNavigate();
  const [currentPath, setCurrentPath] = useState('/');
  const [selectedPath, setSelectedPath] = useState<string | null>(null);
  const [snackbar, setSnackbar] = useState<{ open: boolean; message: string; severity?: 'success' | 'error' | 'info' }>({ open: false, message: '' });

  // Mock file entries
  const entries: FileEntry[] = [
    { name: 'Documents', path: '/Documents', isDirectory: true },
    { name: 'Downloads', path: '/Downloads', isDirectory: true },
    { name: 'Books', path: '/Books', isDirectory: true },
    { name: 'example.epub', path: '/example.epub', isDirectory: false, size: 1024000 },
  ];

  const pathParts = currentPath.split('/').filter(Boolean);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      {/* Header */}
      <Box sx={{ display: 'flex', alignItems: 'center', p: 2, borderBottom: 1, borderColor: 'divider', bgcolor: 'background.paper' }}>
        <IconButton onClick={() => navigate(-1)} sx={{ mr: 1 }}>
          <ArrowBack />
        </IconButton>
        <Typography variant="h5" component="h1" sx={{ flexGrow: 1 }}>
          File Browser
        </Typography>
        <Button
          variant="contained"
          disabled={!selectedPath}
          onClick={() => {
            if (selectedPath) {
              setSnackbar({ open: true, message: `Selected: ${selectedPath}`, severity: 'success' });
              // TODO: Process selected file
            }
          }}
        >
          Select
        </Button>
      </Box>

      <Box sx={{ p: 2, bgcolor: 'background.paper', borderBottom: 1, borderColor: 'divider' }}>
        <Breadcrumbs>
          <Link component="button" variant="body2" onClick={() => setCurrentPath('/')}>
            Root
          </Link>
          {pathParts.map((part, index) => (
            <Link
              key={index}
              component="button"
              variant="body2"
              onClick={() => setCurrentPath('/' + pathParts.slice(0, index + 1).join('/'))}
            >
              {part}
            </Link>
          ))}
        </Breadcrumbs>
      </Box>

      <List sx={{ flex: 1, overflow: 'auto' }}>
        {currentPath !== '/' && (
          <ListItem disablePadding>
            <ListItemButton onClick={() => setCurrentPath(currentPath.split('/').slice(0, -1).join('/') || '/')}>
              <ListItemIcon>
                <ArrowUpward />
              </ListItemIcon>
              <ListItemText primary=".." />
            </ListItemButton>
          </ListItem>
        )}
        {entries.map((entry) => (
          <ListItem key={entry.path} disablePadding>
            <ListItemButton
              selected={selectedPath === entry.path}
              onClick={() => {
                if (entry.isDirectory) {
                  setCurrentPath(entry.path);
                } else {
                  setSelectedPath(entry.path);
                }
              }}
            >
              <ListItemIcon>
                {entry.isDirectory ? <Folder /> : <InsertDriveFile />}
              </ListItemIcon>
              <ListItemText
                primary={entry.name}
                secondary={entry.size ? `${(entry.size / 1024).toFixed(1)} KB` : undefined}
              />
              {selectedPath === entry.path && <CheckCircle color="primary" />}
            </ListItemButton>
          </ListItem>
        ))}
      </List>

      <Snackbar
        open={snackbar.open}
        autoHideDuration={3000}
        onClose={() => setSnackbar({ ...snackbar, open: false })}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
      >
        <Alert onClose={() => setSnackbar({ ...snackbar, open: false })} severity={snackbar.severity || 'info'} sx={{ width: '100%' }}>
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default StorageBrowserScreen;

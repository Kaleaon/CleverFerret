/**
 * Import/Export Screen
 * Migrated from ImportExportScreen.kt
 */

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  List,
  ListItem,
  ListItemButton,
  ListItemText,
  ListItemIcon,
  Button,
  LinearProgress,
} from '@mui/material';
import {
  ArrowBack,
  FileUpload,
  FileDownload,
  Description,
} from '@mui/icons-material';

export const ImportExportScreen: React.FC = () => {
  const navigate = useNavigate();
  const [importing, setImporting] = useState(false);
  const [exporting, setExporting] = useState(false);

  const handleExport = () => {
    setExporting(true);
    setTimeout(() => setExporting(false), 2000);
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Import/Export</Typography>
        </Toolbar>
      </AppBar>

      <List sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        <ListItem>
          <ListItemButton onClick={handleExport}>
            <ListItemIcon><FileDownload /></ListItemIcon>
            <ListItemText primary="Export Library" secondary="Export your library data to a backup file" />
          </ListItemButton>
        </ListItem>

        <ListItem>
          <ListItemButton>
            <ListItemIcon><FileUpload /></ListItemIcon>
            <ListItemText primary="Import Library" secondary="Import library data from a backup file" />
          </ListItemButton>
        </ListItem>

        <ListItem>
          <ListItemButton>
            <ListItemIcon><Description /></ListItemIcon>
            <ListItemText primary="Export Metadata" secondary="Export all metadata to JSON" />
          </ListItemButton>
        </ListItem>
      </List>

      {(importing || exporting) && <LinearProgress />}
    </Box>
  );
};

export default ImportExportScreen;

/**
 * Import/Export Settings Screen
 * 
 * Backup and restore library data.
 * Migrated from ImportExportScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Card,
  CardContent,
  Button,
  List,
  ListItem,
  ListItemText,
  ListItemSecondaryAction,
  FormGroup,
  FormControlLabel,
  Checkbox,
  Alert,
  CircularProgress,
  Chip,
} from '@mui/material';
import {
  ArrowBack,
  CloudUpload,
  CloudDownload,
  Delete,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';

export const ImportExportSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [backups, setBackups] = useState<any[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  // Export options
  const [includeMetadata, setIncludeMetadata] = useState(true);
  const [includeProgress, setIncludeProgress] = useState(true);
  const [includeBookmarks, setIncludeBookmarks] = useState(true);
  const [includeCollections, setIncludeCollections] = useState(true);

  const handleExport = async () => {
    setIsLoading(true);
    try {
      const jsonData = await db.exportToJSON();
      const blob = new Blob([jsonData], { type: 'application/json' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `cleverferret_backup_${Date.now()}.json`;
      a.click();
      URL.revokeObjectURL(url);

      setMessage({ type: 'success', text: 'Database exported successfully' });
    } catch (err) {
      setMessage({ type: 'error', text: 'Failed to export database' });
    } finally {
      setIsLoading(false);
    }
  };

  const handleImport = () => {
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'application/json';
    input.onchange = async (e) => {
      const file = (e.target as HTMLInputElement).files?.[0];
      if (!file) return;

      setIsLoading(true);
      try {
        const text = await file.text();
        await db.importFromJSON(text);
        setMessage({ type: 'success', text: 'Database imported successfully' });
      } catch (err) {
        setMessage({ type: 'error', text: 'Failed to import database' });
      } finally {
        setIsLoading(false);
      }
    };
    input.click();
  };

  const formatFileSize = (bytes: number): string => {
    if (bytes === 0) return '0 B';
    const k = 1024;
    const sizes = ['B', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return Math.round(bytes / Math.pow(k, i) * 10) / 10 + ' ' + sizes[i];
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Import / Export
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {message && (
          <Alert severity={message.type} onClose={() => setMessage(null)} sx={{ mb: 2 }}>
            {message.text}
          </Alert>
        )}

        {/* Export Section */}
        <Card sx={{ mb: 3 }}>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Export Library
            </Typography>
            <Typography variant="body2" color="text.secondary" paragraph>
              Export your library data to a backup file. This includes all libraries, media items,
              and metadata.
            </Typography>

            <FormGroup sx={{ mb: 2 }}>
              <FormControlLabel
                control={
                  <Checkbox
                    checked={includeMetadata}
                    onChange={(e) => setIncludeMetadata(e.target.checked)}
                  />
                }
                label="Include Metadata"
              />
              <FormControlLabel
                control={
                  <Checkbox
                    checked={includeProgress}
                    onChange={(e) => setIncludeProgress(e.target.checked)}
                  />
                }
                label="Include Reading Progress"
              />
              <FormControlLabel
                control={
                  <Checkbox
                    checked={includeBookmarks}
                    onChange={(e) => setIncludeBookmarks(e.target.checked)}
                  />
                }
                label="Include Bookmarks"
              />
              <FormControlLabel
                control={
                  <Checkbox
                    checked={includeCollections}
                    onChange={(e) => setIncludeCollections(e.target.checked)}
                  />
                }
                label="Include Collections"
              />
            </FormGroup>

            <Button
              variant="contained"
              startIcon={<CloudUpload />}
              onClick={handleExport}
              disabled={isLoading}
              fullWidth
            >
              Export Database
            </Button>
          </CardContent>
        </Card>

        {/* Import Section */}
        <Card>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Import Library
            </Typography>
            <Typography variant="body2" color="text.secondary" paragraph>
              Restore your library from a backup file. This will merge with existing data.
            </Typography>

            <Button
              variant="outlined"
              startIcon={<CloudDownload />}
              onClick={handleImport}
              disabled={isLoading}
              fullWidth
            >
              Import from Backup
            </Button>
          </CardContent>
        </Card>

        {isLoading && (
          <Box sx={{ display: 'flex', justifyContent: 'center', mt: 3 }}>
            <CircularProgress />
          </Box>
        )}
      </Box>
    </Box>
  );
};

export default ImportExportSettingsScreen;

/**
 * Media Open Screen - Media opening dialog
 * Migrated from MediaOpenScreen.kt
 * Handles file opening from file associations
 */

import React, { useState, useEffect, useRef } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import {
  Box,
  IconButton,
  Typography,
  List,
  ListItem,
  ListItemButton,
  ListItemText,
  ListItemIcon,
  TextField,
  Button,
  Alert,
  CircularProgress,
} from '@mui/material';
import {
  ArrowBack,
  Folder,
  Link as LinkIcon,
  CloudUpload,
  InsertDriveFile,
} from '@mui/icons-material';
import { processFileHandle, getRouteForFileType, type FileHandle } from '../../services/fileHandler';

export const MediaOpenScreen: React.FC = () => {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const [url, setUrl] = useState('');
  const [fileHandle, setFileHandle] = useState<FileHandle | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [processing, setProcessing] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    // Check if file was passed via launch
    const fileParam = searchParams.get('file');
    if (fileParam) {
      // File was passed - would need to be handled by service worker
      setError('File opening from system not yet fully implemented. Please use file picker.');
    }
  }, [searchParams]);

  const handleFileSelect = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (!file) return;

    setProcessing(true);
    setError(null);

    try {
      const result = processFileHandle(file);
      if (result.success && result.file && result.route) {
        setFileHandle(result.file);
        // Navigate to appropriate viewer
        navigate(result.route, { state: { file: result.file } });
      } else {
        setError(result.error || 'Failed to process file');
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Unknown error');
    } finally {
      setProcessing(false);
    }
  };

  const handleBrowseFiles = () => {
    navigate('/storage');
  };

  const handleOpenUrl = () => {
    if (url.trim()) {
      // TODO: Implement URL opening
      setError('URL opening not yet implemented');
    }
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      {/* Header */}
      <Box sx={{ display: 'flex', alignItems: 'center', p: 2, borderBottom: 1, borderColor: 'divider' }}>
        <IconButton onClick={() => navigate(-1)} sx={{ mr: 1 }}>
          <ArrowBack />
        </IconButton>
        <Typography variant="h5" component="h1" sx={{ flexGrow: 1 }}>
          Open Media
        </Typography>
      </Box>

      <Box sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        {error && (
          <Alert severity="error" onClose={() => setError(null)} sx={{ mb: 2 }}>
            {error}
          </Alert>
        )}

        {processing && (
          <Box sx={{ display: 'flex', justifyContent: 'center', my: 3 }}>
            <CircularProgress />
          </Box>
        )}

        {fileHandle && (
          <Alert severity="success" sx={{ mb: 2 }}>
            File loaded: {fileHandle.name}
          </Alert>
        )}

        <TextField
          fullWidth
          label="URL or Path"
          value={url}
          onChange={(e) => setUrl(e.target.value)}
          placeholder="https://... or /path/to/file"
          sx={{ mb: 2 }}
          disabled={processing}
        />
        <Button 
          variant="contained" 
          fullWidth 
          disabled={!url || processing}
          onClick={handleOpenUrl}
          sx={{ mb: 3 }}
        >
          Open URL
        </Button>

        <List>
          <ListItem disablePadding>
            <ListItemButton onClick={handleBrowseFiles} disabled={processing}>
              <ListItemIcon><Folder /></ListItemIcon>
              <ListItemText 
                primary="Browse Files" 
                secondary="Choose from local storage" 
              />
            </ListItemButton>
          </ListItem>
          <ListItem disablePadding>
            <ListItemButton 
              onClick={() => fileInputRef.current?.click()} 
              disabled={processing}
            >
              <ListItemIcon><CloudUpload /></ListItemIcon>
              <ListItemText 
                primary="Select File" 
                secondary="Choose a file from your device" 
              />
            </ListItemButton>
          </ListItem>
        </List>

        <input
          ref={fileInputRef}
          type="file"
          style={{ display: 'none' }}
          onChange={handleFileSelect}
          accept=".epub,.pdf,.mobi,.azw,.azw3,.cbr,.cbz,.cbt,.cb7,.mp3,.m4a,.m4b,.flac,.wav,.ogg,.opus,.wma,.mp4,.mkv,.mov,.avi,.webm,.jpg,.jpeg,.png,.gif,.txt,.md,.rtf,.json,.db,.sqlite"
          multiple={false}
        />
      </Box>
    </Box>
  );
};

export default MediaOpenScreen;

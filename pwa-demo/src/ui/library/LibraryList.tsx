/**
 * Library List Screen
 * 
 * Displays all media libraries with filtering and management options.
 * Migrated from LibraryListScreen.kt in MainActivity.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  Grid,
  Card,
  CardContent,
  CardActionArea,
  Typography,
  IconButton,
  Fab,
  AppBar,
  Toolbar,
  Menu,
  MenuItem,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  Button,
  Select,
  FormControl,
  InputLabel,
} from '@mui/material';
import {
  Add as AddIcon,
  Settings as SettingsIcon,
  Build as MaintenanceIcon,
  Collections as CollectionsIcon,
  MoreVert as MoreIcon,
  Book as BookIcon,
  Movie as MovieIcon,
  MusicNote as MusicIcon,
} from '@mui/icons-material';

import { libraryRepository } from '../../data/repository';
import type { Library } from '../../data/local/entity';

export const LibraryListScreen: React.FC = () => {
  const navigate = useNavigate();
  const [libraries, setLibraries] = useState<Library[]>([]);
  const [showCreateDialog, setShowCreateDialog] = useState(false);
  const [menuAnchor, setMenuAnchor] = useState<null | HTMLElement>(null);

  // Form state
  const [newLibraryName, setNewLibraryName] = useState('');
  const [newLibraryType, setNewLibraryType] = useState('BOOK');
  const [newLibraryPath, setNewLibraryPath] = useState('');

  useEffect(() => {
    loadLibraries();
  }, []);

  const loadLibraries = async () => {
    const libs = await libraryRepository.getAllActiveLibraries();
    setLibraries(libs);
  };

  const handleCreateLibrary = async () => {
    if (newLibraryName && newLibraryPath) {
      await libraryRepository.createLibrary({
        name: newLibraryName,
        type: newLibraryType,
        path: newLibraryPath,
        source: 'LOCAL',
        description: undefined,
      });
      setShowCreateDialog(false);
      setNewLibraryName('');
      setNewLibraryPath('');
      loadLibraries();
    }
  };

  const getLibraryIcon = (type: string) => {
    switch (type.toUpperCase()) {
      case 'BOOK':
        return <BookIcon sx={{ fontSize: 48 }} />;
      case 'MOVIE':
        return <MovieIcon sx={{ fontSize: 48 }} />;
      case 'MUSIC':
        return <MusicIcon sx={{ fontSize: 48 }} />;
      default:
        return <BookIcon sx={{ fontSize: 48 }} />;
    }
  };

  const getLibraryColor = (type: string) => {
    switch (type.toUpperCase()) {
      case 'BOOK':
        return '#4CAF50';
      case 'MOVIE':
        return '#2196F3';
      case 'MUSIC':
        return '#9C27B0';
      default:
        return '#757575';
    }
  };

  return (
    <Box sx={{ flexGrow: 1 }}>
      <AppBar position="static">
        <Toolbar>
          <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
            Libraries
          </Typography>
          <IconButton color="inherit" onClick={() => navigate('/settings')}>
            <SettingsIcon />
          </IconButton>
          <IconButton color="inherit" onClick={() => navigate('/maintenance')}>
            <MaintenanceIcon />
          </IconButton>
          <IconButton color="inherit" onClick={() => navigate('/collections')}>
            <CollectionsIcon />
          </IconButton>
          <IconButton color="inherit" onClick={(e) => setMenuAnchor(e.currentTarget)}>
            <MoreIcon />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Menu
        anchorEl={menuAnchor}
        open={Boolean(menuAnchor)}
        onClose={() => setMenuAnchor(null)}
      >
        <MenuItem onClick={() => navigate('/settings/opds')}>OPDS Server</MenuItem>
        <MenuItem onClick={() => navigate('/servers')}>Server Integration</MenuItem>
        <MenuItem onClick={() => navigate('/theme_preview')}>Themes</MenuItem>
      </Menu>

      <Box sx={{ p: 3 }}>
        <Grid container spacing={3}>
          {libraries.map((library) => (
            <Grid item xs={12} sm={6} md={4} lg={3} key={library.libraryId}>
              <Card>
                <CardActionArea onClick={() => navigate(`/library/${library.libraryId}`)}>
                  <Box
                    sx={{
                      height: 120,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      bgcolor: getLibraryColor(library.type),
                      color: 'white',
                    }}
                  >
                    {getLibraryIcon(library.type)}
                  </Box>
                  <CardContent>
                    <Typography variant="h6" noWrap>
                      {library.name}
                    </Typography>
                    <Typography variant="body2" color="text.secondary">
                      {library.type} Library
                    </Typography>
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>

        {libraries.length === 0 && (
          <Box
            sx={{
              textAlign: 'center',
              py: 8,
            }}
          >
            <Typography variant="h5" gutterBottom>
              No Libraries Yet
            </Typography>
            <Typography variant="body1" color="text.secondary" gutterBottom>
              Create your first library to get started
            </Typography>
            <Button
              variant="contained"
              startIcon={<AddIcon />}
              onClick={() => setShowCreateDialog(true)}
              sx={{ mt: 2 }}
            >
              Create Library
            </Button>
          </Box>
        )}
      </Box>

      <Fab
        color="primary"
        aria-label="add"
        sx={{ position: 'fixed', bottom: 16, right: 16 }}
        onClick={() => setShowCreateDialog(true)}
      >
        <AddIcon />
      </Fab>

      {/* Create Library Dialog */}
      <Dialog
        open={showCreateDialog}
        onClose={() => setShowCreateDialog(false)}
        maxWidth="sm"
        fullWidth
      >
        <DialogTitle>Create New Library</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            label="Library Name"
            fullWidth
            value={newLibraryName}
            onChange={(e) => setNewLibraryName(e.target.value)}
          />
          <FormControl fullWidth margin="dense">
            <InputLabel>Library Type</InputLabel>
            <Select
              value={newLibraryType}
              onChange={(e) => setNewLibraryType(e.target.value)}
            >
              <MenuItem value="BOOK">Books</MenuItem>
              <MenuItem value="MOVIE">Movies</MenuItem>
              <MenuItem value="MUSIC">Music</MenuItem>
              <MenuItem value="TV_SHOW">TV Shows</MenuItem>
              <MenuItem value="PODCAST">Podcasts</MenuItem>
              <MenuItem value="AUDIOBOOK">Audiobooks</MenuItem>
            </Select>
          </FormControl>
          <TextField
            margin="dense"
            label="Library Path"
            fullWidth
            value={newLibraryPath}
            onChange={(e) => setNewLibraryPath(e.target.value)}
            helperText="Path to your media files"
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowCreateDialog(false)}>Cancel</Button>
          <Button
            onClick={handleCreateLibrary}
            variant="contained"
            disabled={!newLibraryName || !newLibraryPath}
          >
            Create
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default LibraryListScreen;

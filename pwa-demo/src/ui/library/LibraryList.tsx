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
        dateModified: Date.now(),
        isActive: true,
      });
      setShowCreateDialog(false);
      setNewLibraryName('');
      setNewLibraryPath('');
      loadLibraries();
    }
  };

  const getLibraryIcon = (type: string) => {
    const iconProps = { sx: { fontSize: 48 } };
    switch (type.toUpperCase()) {
      case 'BOOK':
        return <BookIcon {...iconProps} />;
      case 'MOVIE':
        return <MovieIcon {...iconProps} />;
      case 'MUSIC':
        return <MusicIcon {...iconProps} />;
      default:
        return <BookIcon {...iconProps} />;
    }
  };

  // Removed getLibraryColor - using theme colors instead

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

      <Menu anchorEl={menuAnchor} open={Boolean(menuAnchor)} onClose={() => setMenuAnchor(null)}>
        <MenuItem onClick={() => navigate('/settings/opds')}>OPDS Server</MenuItem>
        <MenuItem onClick={() => navigate('/servers')}>Server Integration</MenuItem>
        <MenuItem onClick={() => navigate('/theme_preview')}>Themes</MenuItem>
      </Menu>

      <Box sx={{ p: 3 }}>
        <Grid container spacing={3}>
          {libraries.map((library) => (
            <Grid item xs={12} sm={6} md={4} lg={3} key={library.libraryId}>
              <Card
                sx={{
                  position: 'relative',
                  '&:hover': {
                    boxShadow: 6,
                  },
                }}
              >
                <CardActionArea onClick={() => navigate(`/library/${library.libraryId}`)}>
                  <Box
                    sx={{
                      height: 120,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      bgcolor: 'primary.main',
                      color: 'primary.contrastText',
                      position: 'relative',
                      overflow: 'hidden',
                      '&::before': {
                        content: '""',
                        position: 'absolute',
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        bgcolor: 'action.hover',
                        opacity: 0.1,
                      },
                    }}
                  >
                    <Box
                      sx={{
                        position: 'relative',
                        zIndex: 1,
                        p: 2,
                        borderRadius: '50%',
                        bgcolor: 'rgba(255, 255, 255, 0.2)',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                      }}
                    >
                      {React.cloneElement(getLibraryIcon(library.type), {
                        sx: { fontSize: 48, color: 'inherit' },
                      })}
                    </Box>
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
                <IconButton
                  onClick={(e) => {
                    e.stopPropagation();
                    navigate(`/library/${library.libraryId}/management`);
                  }}
                  sx={{
                    position: 'absolute',
                    top: 8,
                    right: 8,
                    bgcolor: 'background.paper',
                    '&:hover': {
                      bgcolor: 'action.hover',
                    },
                  }}
                >
                  <SettingsIcon />
                </IconButton>
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
            <Select value={newLibraryType} onChange={(e) => setNewLibraryType(e.target.value)}>
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

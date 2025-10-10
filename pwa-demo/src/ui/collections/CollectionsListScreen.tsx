/**
 * Collections List Screen
 * 
 * Browse and manage all collections.
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Grid,
  Card,
  CardContent,
  CardActionArea,
  Fab,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  Button,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  Chip,
} from '@mui/material';
import {
  ArrowBack,
  Add,
  Collections,
  PlaylistPlay,
  ViewList,
  MenuBook,
  Visibility,
  Folder,
  AutoAwesome,
} from '@mui/icons-material';

import { collectionRepository } from '../../data/repository';
import type { UnifiedCollection, CollectionType } from '../../data/local/entity';

export const CollectionsListScreen: React.FC = () => {
  const navigate = useNavigate();
  const [collections, setCollections] = useState<UnifiedCollection[]>([]);
  const [showCreateDialog, setShowCreateDialog] = useState(false);
  const [newName, setNewName] = useState('');
  const [newType, setNewType] = useState<CollectionType>('USER_DEFINED' as CollectionType);
  const [newDescription, setNewDescription] = useState('');

  useEffect(() => {
    loadCollections();
  }, []);

  const loadCollections = async () => {
    const colls = await collectionRepository.getCollections();
    setCollections(colls);
  };

  const handleCreate = async () => {
    if (!newName) return;

    await collectionRepository.createCollection(newName, newType, newDescription || undefined);
    setShowCreateDialog(false);
    setNewName('');
    setNewDescription('');
    loadCollections();
  };

  const getCollectionIcon = (type: string) => {
    switch (type) {
      case 'PLAYLIST':
        return <PlaylistPlay sx={{ fontSize: 48 }} />;
      case 'SERIES':
        return <ViewList sx={{ fontSize: 48 }} />;
      case 'READING_LIST':
        return <MenuBook sx={{ fontSize: 48 }} />;
      case 'WATCH_LIST':
        return <Visibility sx={{ fontSize: 48 }} />;
      case 'SMART':
        return <AutoAwesome sx={{ fontSize: 48 }} />;
      default:
        return <Folder sx={{ fontSize: 48 }} />;
    }
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Collections
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 3 }}>
        <Grid container spacing={2}>
          {collections.map((collection) => (
            <Grid item xs={12} sm={6} md={4} key={collection.collectionId}>
              <Card>
                <CardActionArea
                  onClick={() => navigate(`/collection_detail/${collection.collectionId}`)}
                >
                  <Box
                    sx={{
                      height: 120,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      bgcolor: 'primary.main',
                      color: 'white',
                    }}
                  >
                    {getCollectionIcon(collection.type.toString())}
                  </Box>
                  <CardContent>
                    <Typography variant="h6" noWrap>
                      {collection.name}
                    </Typography>
                    <Typography variant="body2" color="text.secondary">
                      {collection.type.replace(/_/g, ' ')} • {collection.itemCount} items
                    </Typography>
                    {collection.isPinned && (
                      <Chip label="Pinned" size="small" color="primary" sx={{ mt: 1 }} />
                    )}
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>

        {collections.length === 0 && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <Collections sx={{ fontSize: 80, color: 'text.secondary', mb: 2 }} />
            <Typography variant="h6" gutterBottom>
              No Collections
            </Typography>
            <Typography variant="body2" color="text.secondary" gutterBottom>
              Create collections to organize your media
            </Typography>
            <Button
              variant="contained"
              startIcon={<Add />}
              onClick={() => setShowCreateDialog(true)}
              sx={{ mt: 2 }}
            >
              Create Collection
            </Button>
          </Box>
        )}
      </Box>

      <Fab
        color="primary"
        sx={{ position: 'fixed', bottom: 16, right: 16 }}
        onClick={() => setShowCreateDialog(true)}
      >
        <Add />
      </Fab>

      {/* Create Dialog */}
      <Dialog
        open={showCreateDialog}
        onClose={() => setShowCreateDialog(false)}
        maxWidth="sm"
        fullWidth
      >
        <DialogTitle>Create Collection</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            label="Collection Name"
            fullWidth
            value={newName}
            onChange={(e) => setNewName(e.target.value)}
          />
          <FormControl fullWidth margin="dense">
            <InputLabel>Collection Type</InputLabel>
            <Select
              value={newType}
              onChange={(e) => setNewType(e.target.value as CollectionType)}
            >
              <MenuItem value="PLAYLIST">Playlist</MenuItem>
              <MenuItem value="SERIES">Series</MenuItem>
              <MenuItem value="READING_LIST">Reading List</MenuItem>
              <MenuItem value="WATCH_LIST">Watch List</MenuItem>
              <MenuItem value="USER_DEFINED">Custom</MenuItem>
            </Select>
          </FormControl>
          <TextField
            margin="dense"
            label="Description (optional)"
            fullWidth
            multiline
            rows={3}
            value={newDescription}
            onChange={(e) => setNewDescription(e.target.value)}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowCreateDialog(false)}>Cancel</Button>
          <Button onClick={handleCreate} variant="contained" disabled={!newName}>
            Create
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default CollectionsListScreen;

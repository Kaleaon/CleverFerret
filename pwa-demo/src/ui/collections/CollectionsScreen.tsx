/**
 * Collections Screen - Collection management
 * Migrated from CollectionsScreen.kt
 */

import React, { useState, useEffect } from 'react';
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
  Fab,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  Button,
} from '@mui/material';
import { ArrowBack, Add, Collections as CollectionsIcon } from '@mui/icons-material';

import { db } from '../../services/database-complete';
import { CollectionType, SortField, SortOrder } from '../../data/local/entity';

export const CollectionsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [collections, setCollections] = useState<any[]>([]);
  const [showAddDialog, setShowAddDialog] = useState(false);
  const [newCollectionName, setNewCollectionName] = useState('');

  useEffect(() => {
    loadCollections();
  }, []);

  const loadCollections = async () => {
    const cols = await db.unifiedCollections.toArray();
    setCollections(cols);
  };

  const handleCreateCollection = async () => {
    if (!newCollectionName) return;
    await db.unifiedCollections.add({
      collectionId: 0,
      name: newCollectionName,
      description: '',
      type: CollectionType.USER_DEFINED,
      sortBy: SortField.DATE_ADDED,
      sortOrder: SortOrder.DESCENDING,
      isSmartCollection: false,
      isVisible: true,
      isPinned: false,
      createdAt: Date.now(),
      lastModified: Date.now(),
      itemCount: 0,
    });
    setNewCollectionName('');
    setShowAddDialog(false);
    loadCollections();
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
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

      <List sx={{ flex: 1, overflow: 'auto' }}>
        {collections.map((col) => (
          <ListItem key={col.collectionId} disablePadding>
            <ListItemButton onClick={() => navigate(`/collection/${col.collectionId}`)}>
              <ListItemIcon>
                <CollectionsIcon />
              </ListItemIcon>
              <ListItemText primary={col.name} secondary={col.description} />
            </ListItemButton>
          </ListItem>
        ))}
      </List>

      <Fab
        color="primary"
        sx={{ position: 'fixed', bottom: 16, right: 16 }}
        onClick={() => setShowAddDialog(true)}
      >
        <Add />
      </Fab>

      <Dialog open={showAddDialog} onClose={() => setShowAddDialog(false)}>
        <DialogTitle>New Collection</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            label="Collection Name"
            fullWidth
            value={newCollectionName}
            onChange={(e) => setNewCollectionName(e.target.value)}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowAddDialog(false)}>Cancel</Button>
          <Button onClick={handleCreateCollection} variant="contained">
            Create
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default CollectionsScreen;

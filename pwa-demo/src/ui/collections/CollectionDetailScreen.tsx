/**
 * Collection Detail Screen
 * 
 * Shows items in a collection with reordering and management.
 * Migrated from CollectionDetailScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Grid,
  Card,
  CardMedia,
  CardContent,
  CardActionArea,
  Button,
  Menu,
  MenuItem,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
  Snackbar,
  Alert,
} from '@mui/material';
import {
  ArrowBack,
  MoreVert,
  Edit,
  Delete,
  Share,
  PlayArrow,
} from '@mui/icons-material';

import { collectionRepository, mediaRepository } from '../../data/repository';
import type { UnifiedCollection, MediaItem } from '../../data/local/entity';

export const CollectionDetailScreen: React.FC = () => {
  const { collectionId } = useParams<{ collectionId: string }>();
  const navigate = useNavigate();

  const [collection, setCollection] = useState<UnifiedCollection | null>(null);
  const [items, setItems] = useState<MediaItem[]>([]);
  const [menuAnchor, setMenuAnchor] = useState<null | HTMLElement>(null);
  const [showDeleteDialog, setShowDeleteDialog] = useState(false);
  const [snackbar, setSnackbar] = useState<{ open: boolean; message: string; severity?: 'success' | 'error' | 'info' }>({ open: false, message: '' });

  useEffect(() => {
    if (collectionId) {
      loadCollection(parseInt(collectionId));
    }
  }, [collectionId]);

  const loadCollection = async (id: number) => {
    const coll = await collectionRepository.getCollection(id);
    setCollection(coll || null);

    if (coll) {
      const collectionItems = await collectionRepository.getItemsInCollection(id);
      setItems(collectionItems);
    }
  };

  const handleDeleteCollection = async () => {
    if (!collectionId) return;
    setShowDeleteDialog(true);
  };

  const confirmDeleteCollection = async () => {
    if (!collectionId) return;
    setShowDeleteDialog(false);
    try {
      await collectionRepository.deleteCollection(parseInt(collectionId));
      setSnackbar({ open: true, message: 'Collection deleted successfully', severity: 'success' });
      setTimeout(() => navigate(-1), 1000);
    } catch (error) {
      const { logger } = await import('../../services/logging');
      logger.error('Collection', 'Failed to delete collection', undefined, error as Error);
      setSnackbar({ open: true, message: 'Failed to delete collection', severity: 'error' });
    }
  };

  const handleRemoveItem = async (itemId: number) => {
    if (!collectionId) return;

    await collectionRepository.removeItem(parseInt(collectionId), itemId);
    loadCollection(parseInt(collectionId));
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            {collection?.name || 'Collection'}
          </Typography>
          <IconButton color="inherit" onClick={(e) => setMenuAnchor(e.currentTarget)}>
            <MoreVert />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Menu
        anchorEl={menuAnchor}
        open={Boolean(menuAnchor)}
        onClose={() => setMenuAnchor(null)}
      >
        <MenuItem onClick={() => navigate(`/collection/edit/${collectionId}`)}>
          <Edit sx={{ mr: 1 }} />
          Edit Collection
        </MenuItem>
        <MenuItem onClick={() => {}}>
          <Share sx={{ mr: 1 }} />
          Share
        </MenuItem>
        <MenuItem onClick={handleDeleteCollection}>
          <Delete sx={{ mr: 1 }} />
          Delete
        </MenuItem>
      </Menu>

      <Box sx={{ p: 3 }}>
        {collection?.description && (
          <Typography variant="body1" color="text.secondary" sx={{ mb: 3 }}>
            {collection.description}
          </Typography>
        )}

        <Typography variant="subtitle2" color="text.secondary" sx={{ mb: 2 }}>
          {items.length} items
        </Typography>

        <Grid container spacing={2}>
          {items.map((item) => (
            <Grid item xs={6} sm={4} md={3} lg={2} key={item.itemId}>
              <Card>
                <CardActionArea onClick={() => navigate(`/detail/${item.itemId}`)}>
                  {item.hasThumbnail && item.thumbnailPath && (
                    <CardMedia
                      component="img"
                      height="200"
                      image={item.thumbnailPath}
                      alt={item.fileName}
                    />
                  )}
                  <CardContent>
                    <Typography variant="subtitle2" noWrap>
                      {item.fileName.replace(/\.[^/.]+$/, '')}
                    </Typography>
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>

        {items.length === 0 && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <Typography variant="h6" color="text.secondary">
              Collection is empty
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Add items to this collection
            </Typography>
          </Box>
        )}
      </Box>

      <Dialog open={showDeleteDialog} onClose={() => setShowDeleteDialog(false)}>
        <DialogTitle>Delete Collection</DialogTitle>
        <DialogContent>
          <DialogContentText>
            Are you sure you want to delete this collection? This action cannot be undone.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowDeleteDialog(false)}>Cancel</Button>
          <Button onClick={confirmDeleteCollection} color="error" variant="contained">
            Delete
          </Button>
        </DialogActions>
      </Dialog>

      <Snackbar
        open={snackbar.open}
        autoHideDuration={4000}
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

export default CollectionDetailScreen;

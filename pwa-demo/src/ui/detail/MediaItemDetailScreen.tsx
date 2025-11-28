/**
 * Media Item Detail Screen
 * 
 * Shows comprehensive information about a media item including
 * metadata, progress, and actions.
 * Migrated from MediaItemDetailScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  Card,
  CardMedia,
  CardContent,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Button,
  LinearProgress,
  Chip,
  Grid,
  Dialog,
  DialogTitle,
  DialogContent,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  CircularProgress,
  Alert,
  Snackbar,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Favorite,
  FavoriteBorder,
  Edit,
  CloudDownload,
  PlaylistAdd,
  Share,
  Star,
  CheckCircle,
  Error as ErrorIcon,
  Book,
  Movie,
  MusicNote,
  InsertDriveFile,
} from '@mui/icons-material';

import { mediaRepository, collectionRepository } from '../../data/repository';
import type { MediaItem, MetadataCommon, UnifiedCollection } from '../../data/local/entity';

export const MediaItemDetailScreen: React.FC = () => {
  const { itemId } = useParams<{ itemId: string }>();
  const navigate = useNavigate();

  const [mediaItem, setMediaItem] = useState<MediaItem | null>(null);
  const [metadata, setMetadata] = useState<MetadataCommon | null>(null);
  const [collections, setCollections] = useState<UnifiedCollection[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [isFavorite, setIsFavorite] = useState(false);
  const [showCollectionDialog, setShowCollectionDialog] = useState(false);
  const [fetchingMetadata, setFetchingMetadata] = useState(false);
  const [snackbar, setSnackbar] = useState<{ open: boolean; message: string; severity?: 'success' | 'error' | 'info' }>({ open: false, message: '' });

  useEffect(() => {
    if (itemId) {
      loadMediaItem(parseInt(itemId));
    }
  }, [itemId]);

  const loadMediaItem = async (id: number) => {
    setIsLoading(true);
    setError(null);

    try {
      const { mediaItem: item, metadata: meta } = await mediaRepository.getMediaItemWithMetadata(id);
      
      if (!item) {
        setError('Media item not found');
        return;
      }

      setMediaItem(item);
      setMetadata(meta || null);
      setIsFavorite(meta?.isFavorite || false);

      // Load collections
      const colls = await collectionRepository.getCollections();
      setCollections(colls);
    } catch (err: any) {
      setError(err.message || 'Failed to load media item');
    } finally {
      setIsLoading(false);
    }
  };

  const handleToggleFavorite = async () => {
    if (!metadata || !itemId) return;

    const newFavorite = !isFavorite;
    setIsFavorite(newFavorite);

    await mediaRepository.saveCommonMetadata({
      ...metadata,
      isFavorite: newFavorite,
    });
  };

  const handleFetchMetadata = async () => {
    if (!itemId || !mediaItem) return;

    setFetchingMetadata(true);
    try {
      setSnackbar({ open: true, message: 'Fetching metadata...', severity: 'info' });
      
      const { metadataService } = await import('../../services/metadata/MetadataService');
      const fetchedMetadata = await metadataService.fetchMetadata(mediaItem.fileName);
      
      if (fetchedMetadata) {
        // Update metadata in database
        if (mediaItem.mediaType === 'BOOK') {
          await db.metadataBook.put({
            itemId: parseInt(itemId),
            ...fetchedMetadata,
            isRead: false,
          });
        }
        
        await db.metadataCommon.put({
          itemId: parseInt(itemId),
          title: fetchedMetadata.title,
          authors: fetchedMetadata.authors,
          description: fetchedMetadata.description,
          thumbnailPath: fetchedMetadata.thumbnailUrl,
          isFavorite: false,
          isDownloaded: false,
        });

        // Reload media item
        await loadMediaItem(parseInt(itemId));
        setSnackbar({ open: true, message: 'Metadata fetched successfully', severity: 'success' });
      } else {
        setSnackbar({ open: true, message: 'No metadata found', severity: 'warning' });
      }
    } catch (err) {
      console.error('Failed to fetch metadata:', err);
      setSnackbar({ open: true, message: `Failed to fetch metadata: ${err instanceof Error ? err.message : 'Unknown error'}`, severity: 'error' });
    } finally {
      setFetchingMetadata(false);
    }
  };

  const handleAddToCollection = async (collectionId: number) => {
    if (!itemId) return;

    try {
      await collectionRepository.addItem(collectionId, parseInt(itemId));
      setShowCollectionDialog(false);
      alert('Added to collection successfully');
    } catch (err) {
      console.error('Failed to add to collection:', err);
    }
  };

  const getMediaIcon = (type: string) => {
    switch (type.toUpperCase()) {
      case 'BOOK':
        return <Book sx={{ fontSize: 80 }} />;
      case 'MOVIE':
      case 'VIDEO':
        return <Movie sx={{ fontSize: 80 }} />;
      case 'MUSIC':
      case 'AUDIO':
        return <MusicNote sx={{ fontSize: 80 }} />;
      default:
        return <InsertDriveFile sx={{ fontSize: 80 }} />;
    }
  };

  const formatFileSize = (bytes: number): string => {
    if (bytes === 0) return '0 B';
    const k = 1024;
    const sizes = ['B', 'KB', 'MB', 'GB', 'TB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return Math.round(bytes / Math.pow(k, i) * 10) / 10 + ' ' + sizes[i];
  };

  const formatDate = (timestamp: number): string => {
    return new Date(timestamp).toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
    });
  };

  if (isLoading) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
        <CircularProgress />
      </Box>
    );
  }

  if (error || !mediaItem) {
    return (
      <Box sx={{ p: 3 }}>
        <Alert severity="error" sx={{ mb: 2 }}>
          {error || 'Media item not found'}
        </Alert>
        <Button onClick={() => navigate(-1)}>Go Back</Button>
      </Box>
    );
  }

  return (
    <Box sx={{ pb: 10 }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }} noWrap>
            {metadata?.title || mediaItem.fileName}
          </Typography>
          <IconButton color="inherit" onClick={() => setShowCollectionDialog(true)}>
            <PlaylistAdd />
          </IconButton>
          <IconButton color="inherit" onClick={handleFetchMetadata} disabled={fetchingMetadata}>
            {fetchingMetadata ? <CircularProgress size={24} color="inherit" /> : <CloudDownload />}
          </IconButton>
          <IconButton color="inherit" onClick={handleToggleFavorite}>
            {isFavorite ? <Favorite /> : <FavoriteBorder />}
          </IconButton>
          <IconButton color="inherit" onClick={() => navigate(`/metadata/${itemId}`)}>
            <Edit />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 3 }}>
        {/* Cover/Thumbnail */}
        <Card sx={{ mb: 3 }}>
          {metadata?.coverImagePath ? (
            <CardMedia
              component="img"
              height="400"
              image={metadata.coverImagePath}
              alt={metadata.title}
            />
          ) : (
            <Box
              sx={{
                height: 400,
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                bgcolor: 'primary.main',
                color: 'primary.contrastText',
              }}
            >
              {getMediaIcon(mediaItem.mediaType)}
            </Box>
          )}
        </Card>

        {/* Title and Info */}
        <Box sx={{ mb: 3 }}>
          <Typography variant="h4" gutterBottom fontWeight="bold">
            {metadata?.title || mediaItem.fileName.replace(/\.[^/.]+$/, '')}
          </Typography>
          {metadata?.originalTitle && (
            <Typography variant="h6" color="text.secondary" gutterBottom>
              {metadata.originalTitle}
            </Typography>
          )}
          <Box sx={{ display: 'flex', gap: 1, mt: 1, flexWrap: 'wrap' }}>
            <Chip label={mediaItem.mediaType} color="primary" />
            {metadata?.rating && (
              <Chip
                icon={<Star sx={{ fontSize: 16 }} />}
                label={metadata.rating.toFixed(1)}
                variant="outlined"
              />
            )}
          </Box>
        </Box>

        {/* Summary */}
        {metadata?.summary && (
          <Card sx={{ mb: 3 }}>
            <CardContent>
              <Typography variant="h6" gutterBottom fontWeight="600">
                Summary
              </Typography>
              <Typography variant="body1" color="text.secondary">
                {metadata.summary}
              </Typography>
            </CardContent>
          </Card>
        )}

        {/* File Information */}
        <Card sx={{ mb: 3 }}>
          <CardContent>
            <Typography variant="h6" gutterBottom fontWeight="600">
              File Information
            </Typography>
            <Grid container spacing={2}>
              <Grid item xs={6}>
                <Typography variant="body2" color="text.secondary">
                  Format
                </Typography>
                <Typography variant="body1">{mediaItem.fileExtension.toUpperCase()}</Typography>
              </Grid>
              <Grid item xs={6}>
                <Typography variant="body2" color="text.secondary">
                  Size
                </Typography>
                <Typography variant="body1">{formatFileSize(mediaItem.fileSize)}</Typography>
              </Grid>
              <Grid item xs={12}>
                <Typography variant="body2" color="text.secondary">
                  Location
                </Typography>
                <Typography variant="body1" noWrap>
                  {mediaItem.filePath}
                </Typography>
              </Grid>
              <Grid item xs={6}>
                <Typography variant="body2" color="text.secondary">
                  Added
                </Typography>
                <Typography variant="body1">{formatDate(mediaItem.dateAdded)}</Typography>
              </Grid>
              <Grid item xs={6}>
                <Typography variant="body2" color="text.secondary">
                  Last Modified
                </Typography>
                <Typography variant="body1">{formatDate(mediaItem.lastModified)}</Typography>
              </Grid>
            </Grid>
          </CardContent>
        </Card>

        {/* Additional Metadata */}
        {(metadata?.year || metadata?.language || metadata?.country) && (
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom fontWeight="600">
                Additional Information
              </Typography>
              <Grid container spacing={2}>
                {metadata?.year && (
                  <Grid item xs={6}>
                    <Typography variant="body2" color="text.secondary">
                      Year
                    </Typography>
                    <Typography variant="body1">{metadata.year}</Typography>
                  </Grid>
                )}
                {metadata?.language && (
                  <Grid item xs={6}>
                    <Typography variant="body2" color="text.secondary">
                      Language
                    </Typography>
                    <Typography variant="body1">{metadata.language}</Typography>
                  </Grid>
                )}
                {metadata?.country && (
                  <Grid item xs={6}>
                    <Typography variant="body2" color="text.secondary">
                      Country
                    </Typography>
                    <Typography variant="body1">{metadata.country}</Typography>
                  </Grid>
                )}
              </Grid>
            </CardContent>
          </Card>
        )}
      </Box>

      {/* Bottom Actions */}
      <Box
        sx={{
          position: 'fixed',
          bottom: 0,
          left: 0,
          right: 0,
          bgcolor: 'background.paper',
          borderTop: 1,
          borderColor: 'divider',
          p: 2,
        }}
      >
        <Box sx={{ display: 'flex', gap: 2 }}>
          <Button
            variant="contained"
            startIcon={<PlayArrow />}
            fullWidth
            onClick={() => navigate(`/open/${itemId}`)}
          >
            Open
          </Button>
          <Button variant="outlined" startIcon={<Share />} fullWidth>
            Share
          </Button>
        </Box>
      </Box>

      {/* Add to Collection Dialog */}
      <Dialog
        open={showCollectionDialog}
        onClose={() => setShowCollectionDialog(false)}
        maxWidth="sm"
        fullWidth
      >
        <DialogTitle>Add to Collection</DialogTitle>
        <DialogContent>
          {collections.length === 0 ? (
            <Typography>No collections found. Create a collection first.</Typography>
          ) : (
            <List>
              {collections.map((collection) => (
                <ListItem key={collection.collectionId} disablePadding>
                  <ListItemButton onClick={() => handleAddToCollection(collection.collectionId)}>
                    <ListItemText
                      primary={collection.name}
                      secondary={`${collection.type} • ${collection.itemCount} items`}
                    />
                  </ListItemButton>
                </ListItem>
              ))}
            </List>
          )}
        </DialogContent>
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

export default MediaItemDetailScreen;

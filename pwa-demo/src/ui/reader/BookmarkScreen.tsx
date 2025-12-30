/**
 * Bookmark Screen
 *
 * View and manage bookmarks for a book.
 * Migrated from BookmarkScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  List,
  ListItem,
  ListItemButton,
  ListItemText,
  ListItemIcon,
  Card,
  CardContent,
  Chip,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
  Snackbar,
  Alert,
} from '@mui/material';
import { ArrowBack, Bookmark as BookmarkIcon, Delete } from '@mui/icons-material';

import { bookmarkRepository } from '../../data/repository';
import type { Bookmark } from '../../data/local/entity';

export const BookmarkScreen: React.FC = () => {
  const { itemId } = useParams<{ itemId: string }>();
  const navigate = useNavigate();
  const [bookmarks, setBookmarks] = useState<Bookmark[]>([]);
  const [deleteBookmarkId, setDeleteBookmarkId] = useState<number | null>(null);
  const [snackbar, setSnackbar] = useState<{
    open: boolean;
    message: string;
    severity?: 'success' | 'error' | 'info';
  }>({ open: false, message: '' });

  useEffect(() => {
    if (itemId) {
      loadBookmarks(parseInt(itemId));
    }
  }, [itemId]);

  const loadBookmarks = async (id: number) => {
    const marks = await bookmarkRepository.getBookmarksForItem(id);
    setBookmarks(marks);
  };

  const handleDeleteBookmark = async (bookmarkId: number) => {
    setDeleteBookmarkId(bookmarkId);
  };

  const confirmDeleteBookmark = async () => {
    if (deleteBookmarkId === null) return;

    try {
      await bookmarkRepository.deleteBookmark(deleteBookmarkId);
      if (itemId) {
        loadBookmarks(parseInt(itemId));
      }
      setSnackbar({ open: true, message: 'Bookmark deleted successfully', severity: 'success' });
    } catch (error) {
      const { logger } = await import('../../services/logging');
      logger.error('Bookmark', 'Failed to delete bookmark', undefined, error as Error);
      setSnackbar({ open: true, message: 'Failed to delete bookmark', severity: 'error' });
    } finally {
      setDeleteBookmarkId(null);
    }
  };

  const formatDate = (timestamp: number): string => {
    return new Date(timestamp).toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Bookmarks ({bookmarks.length})
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {bookmarks.map((bookmark) => (
          <Card key={bookmark.bookmarkId} sx={{ mb: 2 }}>
            <CardContent>
              <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start' }}>
                <Box sx={{ flex: 1 }}>
                  <Box sx={{ display: 'flex', gap: 1, mb: 1 }}>
                    <Chip
                      label={bookmark.bookmarkType}
                      size="small"
                      color={bookmark.bookmarkType === 'MANUAL' ? 'primary' : 'default'}
                    />
                    {bookmark.page && (
                      <Chip label={`Page ${bookmark.page}`} size="small" variant="outlined" />
                    )}
                    {bookmark.chapter && (
                      <Chip label={bookmark.chapter} size="small" variant="outlined" />
                    )}
                  </Box>

                  {bookmark.title && (
                    <Typography variant="subtitle1" gutterBottom>
                      {bookmark.title}
                    </Typography>
                  )}

                  {bookmark.description && (
                    <Typography variant="body2" color="text.secondary" paragraph>
                      {bookmark.description}
                    </Typography>
                  )}

                  {(bookmark.contextBefore || bookmark.contextAfter) && (
                    <Typography
                      variant="body2"
                      sx={{
                        fontStyle: 'italic',
                        borderLeft: 3,
                        borderColor: 'primary.main',
                        pl: 2,
                        py: 1,
                      }}
                    >
                      "{bookmark.contextBefore}
                      {bookmark.contextAfter}"
                    </Typography>
                  )}

                  <Typography
                    variant="caption"
                    color="text.secondary"
                    sx={{ mt: 1, display: 'block' }}
                  >
                    {formatDate(bookmark.dateCreated)}
                  </Typography>
                </Box>

                <IconButton color="error" onClick={() => handleDeleteBookmark(bookmark.bookmarkId)}>
                  <Delete />
                </IconButton>
              </Box>
            </CardContent>
          </Card>
        ))}

        {bookmarks.length === 0 && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <BookmarkIcon sx={{ fontSize: 80, color: 'text.secondary', mb: 2 }} />
            <Typography variant="h6" color="text.secondary">
              No Bookmarks
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Create bookmarks while reading
            </Typography>
          </Box>
        )}
      </Box>

      <Dialog open={deleteBookmarkId !== null} onClose={() => setDeleteBookmarkId(null)}>
        <DialogTitle>Delete Bookmark</DialogTitle>
        <DialogContent>
          <DialogContentText>Are you sure you want to delete this bookmark?</DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setDeleteBookmarkId(null)}>Cancel</Button>
          <Button onClick={confirmDeleteBookmark} color="error" variant="contained">
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
        <Alert
          onClose={() => setSnackbar({ ...snackbar, open: false })}
          severity={snackbar.severity || 'info'}
          sx={{ width: '100%' }}
        >
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default BookmarkScreen;

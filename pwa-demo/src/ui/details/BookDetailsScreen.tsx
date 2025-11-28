/**
 * Book Details Screen - Detailed book information view
 * Migrated from BookDetailsScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Card,
  CardMedia,
  CardContent,
  Chip,
  Stack,
  Button,
  Divider,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Edit,
  Share,
  Favorite,
  Star,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { MediaItem } from '../../data/local/entity';
import { getImageUrlWithFallback } from '../../utils/imageUtils';

export const BookDetailsScreen: React.FC = () => {
  const { bookId } = useParams<{ bookId: string }>();
  const navigate = useNavigate();
  const [book, setBook] = useState<MediaItem | null>(null);

  useEffect(() => {
    if (bookId) {
      db.mediaItems.get(parseInt(bookId)).then(item => setBook(item || null));
    }
  }, [bookId]);

  if (!book) return null;

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Book Details
          </Typography>
          <IconButton color="inherit"><Share /></IconButton>
          <IconButton color="inherit"><Edit /></IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, overflow: 'auto', p: 3 }}>
        <Stack direction={{ xs: 'column', md: 'row' }} spacing={3}>
          <Card sx={{ width: { xs: '100%', md: 300 } }}>
            <CardMedia 
              component="img" 
              image={getImageUrlWithFallback(book.thumbnailPath, book.mediaType, book.fileName)} 
              alt={book.fileName} 
            />
          </Card>

          <Box sx={{ flex: 1 }}>
            <Typography variant="h4" gutterBottom>{book.fileName}</Typography>
            <Typography variant="h6" color="text.secondary" gutterBottom>Author Name</Typography>
            
            <Stack direction="row" spacing={1} sx={{ mb: 2 }}>
              <Chip icon={<Star />} label="4.5" />
              <Chip label="Fiction" />
              <Chip label="Classic" />
            </Stack>

            <Typography variant="body1" paragraph>
              Book description will appear here. This includes summary, plot, and other details about the book.
            </Typography>

            <Divider sx={{ my: 2 }} />

            <Typography variant="subtitle2" gutterBottom>Details</Typography>
            <Typography variant="body2">Pages: 350</Typography>
            <Typography variant="body2">Publisher: Example Press</Typography>
            <Typography variant="body2">Published: 2020</Typography>
            <Typography variant="body2">ISBN: 978-0-123456-78-9</Typography>

            <Stack direction="row" spacing={2} sx={{ mt: 3 }}>
              <Button variant="contained" startIcon={<PlayArrow />} onClick={() => navigate(`/reader/${bookId}`)}>
                Read
              </Button>
              <Button variant="outlined" startIcon={<Favorite />}>
                Add to Favorites
              </Button>
            </Stack>
          </Box>
        </Stack>
      </Box>
    </Box>
  );
};

export default BookDetailsScreen;

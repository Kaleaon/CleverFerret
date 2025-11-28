/**
 * Enhanced Bookshelf Screen - Enhanced bookshelf view with grid/list modes
 * Migrated from EnhancedBookshelfScreen.kt
 */

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  ToggleButtonGroup,
  ToggleButton,
  Grid,
  Card,
  CardMedia,
  CardContent,
  TextField,
  InputAdornment,
  Chip,
  Stack,
} from '@mui/material';
import {
  ArrowBack,
  ViewModule,
  ViewList,
  Search,
  FilterList,
} from '@mui/icons-material';
import { getImageUrlWithFallback } from '../../utils/imageUtils';

import { db } from '../../services/database-complete';

export const EnhancedBookshelfScreen: React.FC = () => {
  const navigate = useNavigate();
  const [viewMode, setViewMode] = useState<'grid' | 'list'>('grid');
  const [searchQuery, setSearchQuery] = useState('');
  const [books, setBooks] = useState<any[]>([]);

  useEffect(() => {
    loadBooks();
  }, []);

  const loadBooks = async () => {
    const items = await db.mediaItems.where('mediaType').equals('BOOK').limit(20).toArray();
    setBooks(items);
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>Bookshelf</Typography>
          <ToggleButtonGroup value={viewMode} exclusive onChange={(_, v) => v && setViewMode(v)} size="small">
            <ToggleButton value="grid"><ViewModule /></ToggleButton>
            <ToggleButton value="list"><ViewList /></ToggleButton>
          </ToggleButtonGroup>
          <IconButton color="inherit"><FilterList /></IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        <TextField
          fullWidth
          placeholder="Search books..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          InputProps={{
            startAdornment: (
              <InputAdornment position="start">
                <Search />
              </InputAdornment>
            ),
          }}
        />
      </Box>

      <Box sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        <Grid container spacing={2}>
          {books.map((book) => (
            <Grid item xs={viewMode === 'grid' ? 6 : 12} sm={viewMode === 'grid' ? 4 : 12} md={viewMode === 'grid' ? 3 : 12} key={book.itemId}>
              <Card onClick={() => navigate(`/book/${book.itemId}`)}>
                <CardMedia 
                  component="img" 
                  height={viewMode === 'grid' ? 200 : 120} 
                  image={getImageUrlWithFallback(book.thumbnailPath, book.mediaType, book.fileName)} 
                  alt={book.fileName} 
                />
                <CardContent>
                  <Typography variant="subtitle2" noWrap>{book.fileName}</Typography>
                  <Stack direction="row" spacing={1} sx={{ mt: 1 }}>
                    <Chip label="Book" size="small" />
                  </Stack>
                </CardContent>
              </Card>
            </Grid>
          ))}
        </Grid>
      </Box>
    </Box>
  );
};

export default EnhancedBookshelfScreen;

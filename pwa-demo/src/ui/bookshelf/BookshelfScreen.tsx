/**
 * Bookshelf Screen
 * 
 * Beautiful bookshelf view for ebook library.
 * Migrated from BookshelfScreen.kt
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
  TextField,
  InputAdornment,
  ToggleButtonGroup,
  ToggleButton,
  Chip,
  LinearProgress,
} from '@mui/material';
import {
  ArrowBack,
  Search,
  GridView,
  ViewList,
  Sort,
  MenuBook,
} from '@mui/icons-material';

import { mediaRepository } from '../../data/repository';
import type { MediaItem } from '../../data/local/entity';

export const BookshelfScreen: React.FC = () => {
  const { libraryId } = useParams<{ libraryId: string }>();
  const navigate = useNavigate();

  const [books, setBooks] = useState<MediaItem[]>([]);
  const [filteredBooks, setFilteredBooks] = useState<MediaItem[]>([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [viewMode, setViewMode] = useState<'grid' | 'list'>('grid');
  const [sortBy, setSortBy] = useState<'title' | 'date' | 'author'>('title');

  useEffect(() => {
    if (libraryId) {
      loadBooks(parseInt(libraryId));
    }
  }, [libraryId]);

  useEffect(() => {
    filterBooks();
  }, [books, searchQuery, sortBy]);

  const loadBooks = async (libId: number) => {
    const items = await mediaRepository.getMediaItemsByLibrary(libId);
    setBooks(items);
  };

  const filterBooks = () => {
    let filtered = books;

    if (searchQuery) {
      const query = searchQuery.toLowerCase();
      filtered = filtered.filter((book) =>
        book.fileName.toLowerCase().includes(query)
      );
    }

    // Sort
    filtered = [...filtered].sort((a, b) => {
      switch (sortBy) {
        case 'title':
          return a.fileName.localeCompare(b.fileName);
        case 'date':
          return b.dateAdded - a.dateAdded;
        default:
          return 0;
      }
    });

    setFilteredBooks(filtered);
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Bookshelf
          </Typography>
          <ToggleButtonGroup
            value={viewMode}
            exclusive
            onChange={(_, value) => value && setViewMode(value)}
            size="small"
          >
            <ToggleButton value="grid">
              <GridView />
            </ToggleButton>
            <ToggleButton value="list">
              <ViewList />
            </ToggleButton>
          </ToggleButtonGroup>
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
          sx={{ mb: 2 }}
        />

        <Box sx={{ mb: 2 }}>
          <Chip label={`${filteredBooks.length} books`} sx={{ mr: 1 }} />
        </Box>

        <Grid container spacing={2}>
          {filteredBooks.map((book) => (
            <Grid
              item
              xs={viewMode === 'grid' ? 6 : 12}
              sm={viewMode === 'grid' ? 4 : 12}
              md={viewMode === 'grid' ? 3 : 12}
              lg={viewMode === 'grid' ? 2 : 12}
              key={book.itemId}
            >
              <Card>
                <CardActionArea onClick={() => navigate(`/reader/${book.itemId}`)}>
                  {book.hasThumbnail && book.thumbnailPath ? (
                    <CardMedia
                      component="img"
                      height={viewMode === 'grid' ? 250 : 150}
                      image={book.thumbnailPath}
                      alt={book.fileName}
                    />
                  ) : (
                    <Box
                      sx={{
                        height: viewMode === 'grid' ? 250 : 150,
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        bgcolor: 'primary.main',
                        color: 'white',
                      }}
                    >
                      <MenuBook sx={{ fontSize: 60 }} />
                    </Box>
                  )}
                  <CardContent>
                    <Typography variant="subtitle2" noWrap>
                      {book.fileName.replace(/\.[^/.]+$/, '')}
                    </Typography>
                    <Typography variant="caption" color="text.secondary">
                      {book.fileExtension.toUpperCase()}
                    </Typography>
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>

        {filteredBooks.length === 0 && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <MenuBook sx={{ fontSize: 80, color: 'text.secondary', mb: 2 }} />
            <Typography variant="h6" color="text.secondary">
              {searchQuery ? 'No books found' : 'Bookshelf is empty'}
            </Typography>
          </Box>
        )}
      </Box>
    </Box>
  );
};

export default BookshelfScreen;

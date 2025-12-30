/**
 * Ebook Reader Screen - Alternative ebook reader
 * Migrated from EbookReaderScreen.kt
 */

import React from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Box, AppBar, Toolbar, IconButton, Typography } from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const EbookReaderScreen: React.FC = () => {
  const { bookId } = useParams();
  const navigate = useNavigate();

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Ebook Reader</Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, p: 3, overflow: 'auto' }}>
        <Typography variant="body1">
          Alternative ebook reader interface. Content will be rendered here.
        </Typography>
      </Box>
    </Box>
  );
};

export default EbookReaderScreen;

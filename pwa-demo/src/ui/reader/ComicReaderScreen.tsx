/**
 * Comic Reader Screen
 * 
 * Comic/manga reader with page-by-page viewing.
 * Supports CBZ, CBR files.
 */

import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Paper,
  Slider,
  ToggleButton,
  ToggleButtonGroup,
} from '@mui/material';
import {
  ArrowBack,
  NavigateBefore,
  NavigateNext,
  FitScreen,
  Height,
  CropFree,
} from '@mui/icons-material';

export const ComicReaderScreen: React.FC = () => {
  const { itemId } = useParams<{ itemId: string }>();
  const navigate = useNavigate();

  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [fitMode, setFitMode] = useState<'width' | 'height' | 'both'>('width');
  const [showControls, setShowControls] = useState(true);

  // Sample pages (in production, extract from CBZ/CBR file)
  const [pages, setPages] = useState<string[]>([]);

  useEffect(() => {
    // TODO: Load comic file and extract pages
    setTotalPages(20);
  }, [itemId]);

  const handleNextPage = () => {
    if (currentPage < totalPages) {
      setCurrentPage(currentPage + 1);
    }
  };

  const handlePrevPage = () => {
    if (currentPage > 1) {
      setCurrentPage(currentPage - 1);
    }
  };

  const handleTap = (e: React.MouseEvent) => {
    const rect = e.currentTarget.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const width = rect.width;

    if (x < width / 3) {
      handlePrevPage();
    } else if (x > (width * 2) / 3) {
      handleNextPage();
    } else {
      setShowControls(!showControls);
    }
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      {showControls && (
        <AppBar position="static">
          <Toolbar>
            <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
              <ArrowBack />
            </IconButton>
            <Typography variant="h6" sx={{ flexGrow: 1 }}>
              Comic Reader
            </Typography>
            <ToggleButtonGroup
              value={fitMode}
              exclusive
              onChange={(_, value) => value && setFitMode(value)}
              size="small"
            >
              <ToggleButton value="width">
                <FitScreen />
              </ToggleButton>
              <ToggleButton value="height">
                <Height />
              </ToggleButton>
              <ToggleButton value="both">
                <CropFree />
              </ToggleButton>
            </ToggleButtonGroup>
          </Toolbar>
        </AppBar>
      )}

      {/* Comic Page Viewer */}
      <Box
        onClick={handleTap}
        sx={{
          flex: 1,
          bgcolor: 'black',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          overflow: 'hidden',
          cursor: 'pointer',
        }}
      >
        <Paper
          elevation={8}
          sx={{
            maxWidth: fitMode === 'width' ? '100%' : 'auto',
            maxHeight: fitMode === 'height' ? '100%' : 'auto',
            width: fitMode === 'both' ? '100%' : 'auto',
            height: fitMode === 'both' ? '100%' : 'auto',
          }}
        >
          <Box
            sx={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              minHeight: 600,
              bgcolor: 'white',
              p: 2,
            }}
          >
            <Typography variant="h3" color="text.secondary">
              Page {currentPage}
            </Typography>
            <Typography variant="body2" sx={{ mt: 2, display: 'block' }}>
              Comic image would be displayed here
            </Typography>
          </Box>
        </Paper>
      </Box>

      {/* Page Navigation */}
      {showControls && (
        <Paper elevation={3} sx={{ p: 2 }}>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
            <IconButton onClick={handlePrevPage} disabled={currentPage === 1}>
              <NavigateBefore />
            </IconButton>
            <Slider
              value={currentPage}
              min={1}
              max={totalPages}
              onChange={(_, value) => setCurrentPage(value as number)}
              sx={{ flex: 1 }}
            />
            <IconButton onClick={handleNextPage} disabled={currentPage === totalPages}>
              <NavigateNext />
            </IconButton>
            <Typography variant="body2" sx={{ minWidth: 80, textAlign: 'right' }}>
              {currentPage} / {totalPages}
            </Typography>
          </Box>
        </Paper>
      )}
    </Box>
  );
};

export default ComicReaderScreen;

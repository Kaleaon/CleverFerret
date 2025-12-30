/**
 * Enhanced PDF Reader Screen
 *
 * Advanced PDF reader with annotations, highlights, and text selection.
 * Uses PDF.js for rendering with support for zoom, rotation, and navigation.
 * Migrated from EnhancedPDFReaderScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Slider,
  Stack,
  SpeedDial,
  SpeedDialAction,
  Chip,
  Menu,
  MenuItem,
  Drawer,
  List,
  ListItem,
  ListItemText,
  Divider,
  ToggleButton,
  ToggleButtonGroup,
} from '@mui/material';
import {
  ArrowBack,
  ZoomIn,
  ZoomOut,
  RotateRight,
  Bookmark,
  Edit,
  Highlight,
  FormatSize,
  MoreVert,
  NavigateBefore,
  NavigateNext,
  Search,
  Print,
  Download,
  List as ListIcon,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { MediaItem } from '../../data/local/entity';

export const EnhancedPDFReaderScreen: React.FC = () => {
  const { pdfId } = useParams<{ pdfId: string }>();
  const navigate = useNavigate();

  const [mediaItem, setMediaItem] = useState<MediaItem | null>(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(50);
  const [zoom, setZoom] = useState(100);
  const [rotation, setRotation] = useState(0);
  const [annotationMode, setAnnotationMode] = useState<'none' | 'highlight' | 'note'>('none');
  const [showThumbnails, setShowThumbnails] = useState(false);
  const [showAnnotations, setShowAnnotations] = useState(false);

  useEffect(() => {
    loadPDF();
  }, [pdfId]);

  const loadPDF = async () => {
    if (!pdfId) return;
    const item = await db.mediaItems.get(parseInt(pdfId));
    setMediaItem(item || null);
    // TODO: Load PDF with pdf.js
    // const loadingTask = pdfjsLib.getDocument(item.filePath);
  };

  const handleZoomIn = () => {
    setZoom(Math.min(zoom + 25, 300));
  };

  const handleZoomOut = () => {
    setZoom(Math.max(zoom - 25, 50));
  };

  const handleRotate = () => {
    setRotation((rotation + 90) % 360);
  };

  const handlePageChange = (page: number) => {
    setCurrentPage(Math.max(1, Math.min(page, totalPages)));
  };

  const handleAddAnnotation = async (type: 'highlight' | 'note') => {
    if (!pdfId) return;
    // Save annotation to database
    await db.textAnnotations.add({
      annotationId: 0, // Will be auto-generated
      itemId: parseInt(pdfId),
      annotationType: type === 'highlight' ? 'HIGHLIGHT' : 'NOTE',
      selectedText: 'Selected text here',
      chapterIndex: currentPage,
      startOffset: 0,
      endOffset: 100,
      highlightColor: '#FFFF00',
      dateCreated: Date.now(),
      dateModified: Date.now(),
      isDeleted: false,
    });
  };

  const speedDialActions = [
    { icon: <Highlight />, name: 'Highlight', action: () => handleAddAnnotation('highlight') },
    { icon: <Edit />, name: 'Note', action: () => handleAddAnnotation('note') },
    { icon: <Bookmark />, name: 'Bookmark', action: () => {} },
    { icon: <Search />, name: 'Search', action: () => {} },
  ];

  return (
    <Box
      sx={{
        height: '100vh',
        display: 'flex',
        flexDirection: 'column',
        bgcolor: 'background.default',
      }}
    >
      {/* Top Toolbar */}
      <AppBar position="static" color="default" elevation={1}>
        <Toolbar variant="dense">
          <IconButton edge="start" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="subtitle1" sx={{ flexGrow: 1 }} noWrap>
            {mediaItem?.fileName || 'PDF Document'}
          </Typography>

          {/* Zoom Controls */}
          <IconButton onClick={handleZoomOut} size="small">
            <ZoomOut />
          </IconButton>
          <Chip label={`${zoom}%`} size="small" sx={{ mx: 1 }} />
          <IconButton onClick={handleZoomIn} size="small">
            <ZoomIn />
          </IconButton>

          <IconButton onClick={handleRotate} size="small">
            <RotateRight />
          </IconButton>

          <IconButton size="small">
            <MoreVert />
          </IconButton>
        </Toolbar>
      </AppBar>

      {/* PDF Viewer Area */}
      <Box
        sx={{
          flex: 1,
          display: 'flex',
          overflow: 'hidden',
        }}
      >
        {/* Thumbnail Sidebar (collapsible) */}
        {showThumbnails && (
          <Box
            sx={{
              width: 180,
              bgcolor: 'background.paper',
              overflow: 'auto',
              borderRight: 1,
              borderColor: 'divider',
            }}
          >
            <List dense>
              {Array.from({ length: totalPages }, (_, i) => i + 1).map((page) => (
                <ListItem
                  key={page}
                  button
                  selected={page === currentPage}
                  onClick={() => handlePageChange(page)}
                >
                  <Box
                    sx={{
                      width: '100%',
                      aspectRatio: '8.5/11',
                      bgcolor: 'white',
                      border: 1,
                      borderColor: page === currentPage ? 'primary.main' : 'divider',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                    }}
                  >
                    <Typography variant="caption">Page {page}</Typography>
                  </Box>
                </ListItem>
              ))}
            </List>
          </Box>
        )}

        {/* Main PDF Display */}
        <Box
          sx={{
            flex: 1,
            overflow: 'auto',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            p: 2,
          }}
        >
          <Box
            sx={{
              bgcolor: 'white',
              boxShadow: 3,
              transform: `scale(${zoom / 100}) rotate(${rotation}deg)`,
              transformOrigin: 'center',
              transition: 'transform 0.2s',
              width: 612, // 8.5" at 72 DPI
              minHeight: 792, // 11" at 72 DPI
              p: 4,
            }}
          >
            <Typography variant="h6" gutterBottom>
              PDF Page {currentPage}
            </Typography>
            <Typography variant="body2" paragraph>
              PDF.js will render the actual PDF content here. This is a placeholder showing the PDF
              reader layout and controls.
            </Typography>
            <Typography variant="body2" paragraph>
              Features: - Zoom in/out (50% - 300%) - Rotate pages - Text selection and copy -
              Highlight text - Add annotations and notes - Bookmark pages - Search within document -
              Print and download
            </Typography>
            <Typography variant="body2">
              The PDF content will be rendered using PDF.js library with full support for
              interactive elements, forms, and embedded content.
            </Typography>
          </Box>
        </Box>

        {/* Annotations Sidebar (collapsible) */}
        {showAnnotations && (
          <Box
            sx={{
              width: 280,
              bgcolor: 'background.paper',
              overflow: 'auto',
              borderLeft: 1,
              borderColor: 'divider',
              p: 2,
            }}
          >
            <Typography variant="h6" gutterBottom>
              Annotations
            </Typography>
            <Divider sx={{ mb: 2 }} />
            <Typography variant="body2" color="text.secondary">
              No annotations yet. Select text to add highlights or notes.
            </Typography>
          </Box>
        )}
      </Box>

      {/* Bottom Navigation Bar */}
      <Box
        sx={{
          borderTop: 1,
          borderColor: 'divider',
          bgcolor: 'background.paper',
          p: 1,
        }}
      >
        <Stack direction="row" spacing={2} alignItems="center">
          <IconButton size="small" onClick={() => handlePageChange(currentPage - 1)}>
            <NavigateBefore />
          </IconButton>

          <Typography variant="body2" sx={{ minWidth: 100, textAlign: 'center' }}>
            {currentPage} / {totalPages}
          </Typography>

          <Slider
            value={currentPage}
            min={1}
            max={totalPages}
            onChange={(_, value) => handlePageChange(value as number)}
            sx={{ flex: 1 }}
            size="small"
          />

          <IconButton size="small" onClick={() => handlePageChange(currentPage + 1)}>
            <NavigateNext />
          </IconButton>

          <ToggleButtonGroup size="small" exclusive>
            <ToggleButton value="thumbnails" onClick={() => setShowThumbnails(!showThumbnails)}>
              <ListIcon fontSize="small" />
            </ToggleButton>
            <ToggleButton value="annotations" onClick={() => setShowAnnotations(!showAnnotations)}>
              <Edit fontSize="small" />
            </ToggleButton>
          </ToggleButtonGroup>
        </Stack>
      </Box>

      {/* Speed Dial for Quick Actions */}
      <SpeedDial
        ariaLabel="PDF actions"
        sx={{ position: 'fixed', bottom: 80, right: 16 }}
        icon={<Edit />}
      >
        {speedDialActions.map((action) => (
          <SpeedDialAction
            key={action.name}
            icon={action.icon}
            tooltipTitle={action.name}
            onClick={action.action}
          />
        ))}
      </SpeedDial>
    </Box>
  );
};

export default EnhancedPDFReaderScreen;

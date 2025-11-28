/**
 * PDF Reader Screen
 * 
 * PDF viewer with zoom, rotation, and page navigation.
 * Uses PDF.js library.
 */

import React, { useState, useEffect, useRef } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Fab,
  Paper,
  Slider,
  ButtonGroup,
  Button,
} from '@mui/material';
import {
  ArrowBack,
  ZoomIn,
  ZoomOut,
  RotateRight,
  NavigateBefore,
  NavigateNext,
  Search,
  Download,
} from '@mui/icons-material';
import { pdfReaderService, type PDFDocument } from '../../services/readers/PDFReaderService';
import { db } from '../../services/database-complete';
import type { MediaItem } from '../../data/local/entity';
import { CircularProgress, Alert, Button } from '@mui/material';

export const PDFReaderScreen: React.FC = () => {
  const { itemId } = useParams<{ itemId: string }>();
  const navigate = useNavigate();

  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [zoom, setZoom] = useState(100);
  const [rotation, setRotation] = useState(0);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [pdfDocument, setPdfDocument] = useState<PDFDocument | null>(null);
  const [pageCanvas, setPageCanvas] = useState<HTMLCanvasElement | null>(null);
  const canvasRef = React.useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    loadPDF();
  }, [itemId]);

  const loadPDF = async () => {
    if (!itemId) {
      setError('No PDF ID provided');
      setIsLoading(false);
      return;
    }

    setIsLoading(true);
    setError(null);

    try {
      const item = await db.mediaItems.get(parseInt(itemId));
      if (!item) {
        throw new Error('PDF not found');
      }

      let file: File | Blob | ArrayBuffer | string;
      if (item.filePath) {
        file = item.filePath;
      } else if (item.fileData) {
        file = new Blob([item.fileData], { type: 'application/pdf' });
      } else {
        throw new Error('No file data available');
      }

      const doc = await pdfReaderService.loadPDF(file);
      setPdfDocument(doc);
      setTotalPages(doc.numPages);
      await renderPage(1);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load PDF');
      console.error('Load PDF error:', err);
    } finally {
      setIsLoading(false);
    }
  };

  const renderPage = async (pageNumber: number) => {
    if (!pdfDocument) return;

    try {
      const page = await pdfReaderService.getPage(pdfDocument, pageNumber);
      const canvas = canvasRef.current || document.createElement('canvas');
      const renderedCanvas = await page.render({ scale: zoom / 100, canvas });
      setPageCanvas(renderedCanvas);
      setCurrentPage(pageNumber);
    } catch (err) {
      setError(`Failed to render page: ${err instanceof Error ? err.message : 'Unknown error'}`);
    }
  };

  useEffect(() => {
    if (pdfDocument && currentPage) {
      renderPage(currentPage);
    }
  }, [zoom, pdfDocument]);

  const handleZoomIn = () => setZoom(Math.min(zoom + 25, 300));
  const handleZoomOut = () => setZoom(Math.max(zoom - 25, 50));
  const handleRotate = () => setRotation((rotation + 90) % 360);
  const handlePrevPage = () => {
    if (currentPage > 1) {
      renderPage(currentPage - 1);
    }
  };
  const handleNextPage = () => {
    if (currentPage < totalPages) {
      renderPage(currentPage + 1);
    }
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            PDF Reader
          </Typography>
          <IconButton color="inherit">
            <Search />
          </IconButton>
          <IconButton color="inherit">
            <Download />
          </IconButton>
        </Toolbar>
      </AppBar>

      {isLoading ? (
        <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', justifyContent: 'center', alignItems: 'center', gap: 2 }}>
          <CircularProgress />
          <Typography>Loading PDF...</Typography>
        </Box>
      ) : error ? (
        <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', justifyContent: 'center', alignItems: 'center', gap: 2, p: 3 }}>
          <Alert severity="error">{error}</Alert>
          <Button variant="contained" onClick={() => navigate(-1)}>Go Back</Button>
        </Box>
      ) : (
        <Box sx={{ flex: 1, overflow: 'auto', bgcolor: '#525252', p: 2, display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
          <Paper
            elevation={4}
            sx={{
              transform: `rotate(${rotation}deg)`,
              transformOrigin: 'center',
              transition: 'transform 0.3s',
            }}
          >
            <canvas
              ref={canvasRef}
              style={{
                maxWidth: '100%',
                height: 'auto',
                display: 'block',
              }}
            />
          </Paper>
        </Box>
      )}

      {/* Controls */}
      <Paper elevation={3} sx={{ p: 2 }}>
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 2, flexWrap: 'wrap' }}>
          {/* Page Navigation */}
          <ButtonGroup size="small">
            <Button onClick={handlePrevPage} disabled={currentPage === 1}>
              <NavigateBefore />
            </Button>
            <Button disabled>
              {currentPage} / {totalPages}
            </Button>
            <Button onClick={handleNextPage} disabled={currentPage === totalPages}>
              <NavigateNext />
            </Button>
          </ButtonGroup>

          {/* Zoom Controls */}
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 1, flex: 1, minWidth: 200 }}>
            <IconButton size="small" onClick={handleZoomOut}>
              <ZoomOut />
            </IconButton>
            <Slider
              value={zoom}
              min={50}
              max={300}
              step={25}
              onChange={(_, value) => {
                setZoom(value as number);
                // Page will re-render via useEffect
              }}
              sx={{ flex: 1 }}
            />
            <IconButton size="small" onClick={handleZoomIn}>
              <ZoomIn />
            </IconButton>
            <Typography variant="body2" sx={{ minWidth: 50 }}>
              {zoom}%
            </Typography>
          </Box>

          {/* Rotation */}
          <IconButton onClick={handleRotate}>
            <RotateRight />
          </IconButton>
        </Box>
      </Paper>
    </Box>
  );
};

export default PDFReaderScreen;

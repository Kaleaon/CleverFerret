/**
 * Document Reader Screen
 * Migrated from DocumentReaderScreen.kt
 */

import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
} from '@mui/material';
import {
  ArrowBack,
  Edit,
  Share,
  Print,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';

export const DocumentReaderScreen: React.FC = () => {
  const { docId } = useParams();
  const navigate = useNavigate();
  const [document, setDocument] = useState<any>(null);

  useEffect(() => {
    if (docId) {
      db.mediaItems.get(parseInt(docId)).then(setDocument);
    }
  }, [docId]);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>{document?.fileName || 'Document'}</Typography>
          <IconButton color="inherit" onClick={() => navigate(`/document/edit/${docId}`)}>
            <Edit />
          </IconButton>
          <IconButton color="inherit"><Share /></IconButton>
          <IconButton color="inherit"><Print /></IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, overflow: 'auto', p: 3, bgcolor: 'white', color: 'black' }}>
        <Typography variant="body1">
          Document content will be displayed here. This screen provides a clean reading experience for text documents, markdown files, and other text-based formats.
        </Typography>
      </Box>
    </Box>
  );
};

export default DocumentReaderScreen;

/**
 * Document Editor Screen
 * Migrated from DocumentEditorScreen.kt
 */

import React, { useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Box, AppBar, Toolbar, IconButton, Typography, TextField } from '@mui/material';
import { ArrowBack, Save, Undo, Redo } from '@mui/icons-material';

export const DocumentEditorScreen: React.FC = () => {
  const { docId } = useParams();
  const navigate = useNavigate();
  const [content, setContent] = useState('');

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Document Editor
          </Typography>
          <IconButton color="inherit">
            <Undo />
          </IconButton>
          <IconButton color="inherit">
            <Redo />
          </IconButton>
          <IconButton color="inherit">
            <Save />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, p: 2 }}>
        <TextField
          fullWidth
          multiline
          value={content}
          onChange={(e) => setContent(e.target.value)}
          placeholder="Start typing..."
          sx={{ '& .MuiInputBase-root': { height: '100%' } }}
        />
      </Box>
    </Box>
  );
};

export default DocumentEditorScreen;

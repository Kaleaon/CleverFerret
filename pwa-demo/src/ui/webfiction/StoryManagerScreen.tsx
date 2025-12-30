/**
 * Story Manager Screen
 * Migrated from StoryManagerScreen.kt
 */

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  List,
  ListItem,
  ListItemButton,
  ListItemText,
  Chip,
  Stack,
} from '@mui/material';
import { ArrowBack, Book } from '@mui/icons-material';

export const StoryManagerScreen: React.FC = () => {
  const navigate = useNavigate();

  const stories = [
    { id: 1, title: 'Example Story 1', chapters: 25, status: 'complete' },
    { id: 2, title: 'Example Story 2', chapters: 10, status: 'ongoing' },
  ];

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Story Manager</Typography>
        </Toolbar>
      </AppBar>

      <List>
        {stories.map((story) => (
          <ListItem key={story.id} disablePadding>
            <ListItemButton>
              <Book sx={{ mr: 2 }} />
              <ListItemText
                primary={story.title}
                secondary={
                  <Stack direction="row" spacing={1} sx={{ mt: 1 }}>
                    <Chip label={`${story.chapters} chapters`} size="small" />
                    <Chip
                      label={story.status}
                      size="small"
                      color={story.status === 'complete' ? 'success' : 'default'}
                    />
                  </Stack>
                }
              />
            </ListItemButton>
          </ListItem>
        ))}
      </List>
    </Box>
  );
};

export default StoryManagerScreen;

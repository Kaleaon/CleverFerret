/**
 * OPDS Settings Screen
 * Migrated from OpdsSettingsScreen.kt
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
  ListItemText,
  TextField,
  Button,
  Fab,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
} from '@mui/material';
import { ArrowBack, Add, Delete } from '@mui/icons-material';

export const OpdsSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [catalogs, setCatalogs] = useState([
    { id: 1, name: 'Standard Ebooks', url: 'https://standardebooks.org/opds' },
  ]);
  const [showAddDialog, setShowAddDialog] = useState(false);
  const [newCatalogName, setNewCatalogName] = useState('');
  const [newCatalogUrl, setNewCatalogUrl] = useState('');

  const handleAdd = () => {
    if (newCatalogName && newCatalogUrl) {
      setCatalogs([...catalogs, { id: Date.now(), name: newCatalogName, url: newCatalogUrl }]);
      setNewCatalogName('');
      setNewCatalogUrl('');
      setShowAddDialog(false);
    }
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">OPDS Catalogs</Typography>
        </Toolbar>
      </AppBar>

      <List sx={{ flex: 1, overflow: 'auto' }}>
        {catalogs.map((cat) => (
          <ListItem
            key={cat.id}
            secondaryAction={
              <IconButton
                edge="end"
                onClick={() => setCatalogs(catalogs.filter((c) => c.id !== cat.id))}
              >
                <Delete />
              </IconButton>
            }
          >
            <ListItemText primary={cat.name} secondary={cat.url} />
          </ListItem>
        ))}
      </List>

      <Fab
        color="primary"
        sx={{ position: 'fixed', bottom: 16, right: 16 }}
        onClick={() => setShowAddDialog(true)}
      >
        <Add />
      </Fab>

      <Dialog open={showAddDialog} onClose={() => setShowAddDialog(false)}>
        <DialogTitle>Add OPDS Catalog</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            label="Name"
            fullWidth
            value={newCatalogName}
            onChange={(e) => setNewCatalogName(e.target.value)}
            sx={{ mb: 2 }}
          />
          <TextField
            margin="dense"
            label="URL"
            fullWidth
            value={newCatalogUrl}
            onChange={(e) => setNewCatalogUrl(e.target.value)}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowAddDialog(false)}>Cancel</Button>
          <Button onClick={handleAdd} variant="contained">
            Add
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default OpdsSettingsScreen;

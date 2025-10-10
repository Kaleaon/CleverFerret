/**
 * API Keys Settings Screen
 * 
 * Manage external service API keys.
 * Migrated from APIKeysManagerScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Card,
  CardContent,
  TextField,
  Button,
  List,
  ListItem,
  Chip,
  Alert,
} from '@mui/material';
import {
  ArrowBack,
  Save,
  Visibility,
  VisibilityOff,
  CheckCircle,
  Error,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { APIKey } from '../../data/local/entity';

export const APIKeysScreen: React.FC = () => {
  const navigate = useNavigate();
  const [apiKeys, setApiKeys] = useState<APIKey[]>([]);
  const [showKeys, setShowKeys] = useState<Record<number, boolean>>({});
  const [editedKeys, setEditedKeys] = useState<Record<number, string>>({});
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  const apiKeyProviders = [
    { provider: 'google_books', displayName: 'Google Books API', category: 'METADATA' },
    { provider: 'tmdb', displayName: 'TMDB (Movies)', category: 'METADATA' },
    { provider: 'omdb', displayName: 'OMDB (Movies)', category: 'METADATA' },
    { provider: 'spotify', displayName: 'Spotify', category: 'METADATA' },
    { provider: 'musicbrainz', displayName: 'MusicBrainz', category: 'METADATA' },
    { provider: 'lastfm', displayName: 'Last.fm', category: 'METADATA' },
  ];

  useEffect(() => {
    loadAPIKeys();
  }, []);

  const loadAPIKeys = async () => {
    const keys = await db.apiKeys.toArray();
    setApiKeys(keys);

    // Initialize if no keys exist
    if (keys.length === 0) {
      for (const provider of apiKeyProviders) {
        await db.apiKeys.add({
          keyId: 0,
          provider: provider.provider,
          keyValue: '',
          displayName: provider.displayName,
          description: `API key for ${provider.displayName}`,
          isActive: false,
          validationStatus: 'UNKNOWN',
          lastValidated: undefined,
          usageCount: 0,
          dailyLimit: undefined,
          monthlyLimit: undefined,
          currentDailyUsage: 0,
          currentMonthlyUsage: 0,
          category: provider.category,
          requiredPermissions: undefined,
          dateAdded: Date.now(),
          lastUsed: undefined,
          lastError: undefined,
        });
      }
      loadAPIKeys();
    }
  };

  const handleSave = async () => {
    try {
      for (const [keyId, value] of Object.entries(editedKeys)) {
        await db.apiKeys.update(parseInt(keyId), {
          keyValue: value,
          isActive: value.trim().length > 0,
        });
      }
      setMessage({ type: 'success', text: 'API keys saved successfully' });
      setEditedKeys({});
      loadAPIKeys();
    } catch (err) {
      setMessage({ type: 'error', text: 'Failed to save API keys' });
    }
  };

  const toggleShowKey = (keyId: number) => {
    setShowKeys({ ...showKeys, [keyId]: !showKeys[keyId] });
  };

  const handleKeyChange = (keyId: number, value: string) => {
    setEditedKeys({ ...editedKeys, [keyId]: value });
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            API Keys
          </Typography>
          <IconButton color="inherit" onClick={handleSave} disabled={Object.keys(editedKeys).length === 0}>
            <Save />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {message && (
          <Alert severity={message.type} onClose={() => setMessage(null)} sx={{ mb: 2 }}>
            {message.text}
          </Alert>
        )}

        <Alert severity="info" sx={{ mb: 2 }}>
          API keys enable metadata fetching from external services. Your keys are stored locally and
          never shared.
        </Alert>

        {apiKeys.map((apiKey) => (
          <Card key={apiKey.keyId} sx={{ mb: 2 }}>
            <CardContent>
              <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 2 }}>
                <Box>
                  <Typography variant="h6">{apiKey.displayName}</Typography>
                  <Typography variant="body2" color="text.secondary">
                    {apiKey.description}
                  </Typography>
                </Box>
                <Chip
                  size="small"
                  label={apiKey.isActive ? 'Active' : 'Inactive'}
                  color={apiKey.isActive ? 'success' : 'default'}
                  icon={apiKey.isActive ? <CheckCircle /> : <Error />}
                />
              </Box>

              <TextField
                fullWidth
                label="API Key"
                type={showKeys[apiKey.keyId] ? 'text' : 'password'}
                value={editedKeys[apiKey.keyId] ?? apiKey.keyValue}
                onChange={(e) => handleKeyChange(apiKey.keyId, e.target.value)}
                InputProps={{
                  endAdornment: (
                    <IconButton onClick={() => toggleShowKey(apiKey.keyId)} edge="end">
                      {showKeys[apiKey.keyId] ? <VisibilityOff /> : <Visibility />}
                    </IconButton>
                  ),
                }}
              />

              {apiKey.lastUsed && (
                <Typography variant="caption" color="text.secondary" sx={{ mt: 1, display: 'block' }}>
                  Last used: {new Date(apiKey.lastUsed).toLocaleDateString()}
                </Typography>
              )}
            </CardContent>
          </Card>
        ))}
      </Box>
    </Box>
  );
};

export default APIKeysScreen;

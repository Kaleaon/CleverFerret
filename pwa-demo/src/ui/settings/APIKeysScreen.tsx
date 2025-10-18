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
  OpenInNew,
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
    {
      provider: 'google_books',
      displayName: 'Google Books API',
      category: 'METADATA',
      url: 'https://console.cloud.google.com/apis/library/books.googleapis.com',
      description: 'Get book metadata, covers, and descriptions',
    },
    {
      provider: 'tmdb',
      displayName: 'TMDB (Movies)',
      category: 'METADATA',
      url: 'https://www.themoviedb.org/settings/api',
      description: 'Movie and TV show metadata, posters, and cast information',
    },
    {
      provider: 'omdb',
      displayName: 'OMDB (Movies)',
      category: 'METADATA',
      url: 'http://www.omdbapi.com/apikey.aspx',
      description: 'Alternative movie database with ratings and plot summaries',
    },
    {
      provider: 'spotify',
      displayName: 'Spotify',
      category: 'METADATA',
      url: 'https://developer.spotify.com/dashboard/applications',
      description: 'Music metadata, album art, and artist information',
    },
    {
      provider: 'musicbrainz',
      displayName: 'MusicBrainz',
      category: 'METADATA',
      url: 'https://musicbrainz.org/doc/MusicBrainz_API',
      description: 'Open music encyclopedia with detailed music metadata',
    },
    {
      provider: 'lastfm',
      displayName: 'Last.fm',
      category: 'METADATA',
      url: 'https://www.last.fm/api/account/create',
      description: 'Music scrobbling, recommendations, and listening statistics',
    },
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
          provider: provider.provider,
          keyValue: '',
          displayName: provider.displayName,
          description: provider.description,
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
        } as any);
      }
      loadAPIKeys();
    }
  };

  const getProviderInfo = (provider: string) => {
    return apiKeyProviders.find(p => p.provider === provider);
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

        {apiKeys.map((apiKey) => {
          const providerInfo = getProviderInfo(apiKey.provider);
          return (
            <Card key={apiKey.keyId} sx={{ mb: 2 }}>
              <CardContent>
                <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 2 }}>
                  <Box sx={{ flex: 1 }}>
                    <Typography variant="h6">{apiKey.displayName}</Typography>
                    <Typography variant="body2" color="text.secondary">
                      {apiKey.description}
                    </Typography>
                    {providerInfo?.url && (
                      <Button
                        size="small"
                        startIcon={<OpenInNew />}
                        href={providerInfo.url}
                        target="_blank"
                        rel="noopener noreferrer"
                        sx={{ mt: 1 }}
                      >
                        Get API Key
                      </Button>
                    )}
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
                  placeholder="Enter your API key here..."
                  helperText={providerInfo?.url ? 'Click "Get API Key" above to obtain your key' : ''}
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
          );
        })}
      </Box>
    </Box>
  );
};

export default APIKeysScreen;

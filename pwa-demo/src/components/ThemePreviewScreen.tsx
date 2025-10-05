// Theme Preview Screen - showcases all available themes
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Grid,
  Card,
  CardContent,
  Button,
  Paper,
  Chip,
  Avatar,
  Rating,
} from '@mui/material';
import {
  ArrowBack as ArrowBackIcon,
  Check as CheckIcon,
  Book as BookIcon,
  Movie as MovieIcon,
  MusicNote as MusicIcon,
} from '@mui/icons-material';
import { getAllUnifiedThemes, type UnifiedThemeName } from '../themes/unified-themes';
import { useAppStore } from '../store/app-store';
import { ThemeProvider } from '@mui/material/styles';

const ThemeCard: React.FC<{
  themeName: UnifiedThemeName;
  isSelected: boolean;
  onSelect: () => void;
}> = ({ themeName, isSelected, onSelect }) => {
  const themeConfig = getAllUnifiedThemes().find((t) => t.name === themeName);
  if (!themeConfig) return null;

  const theme = themeConfig.theme;

  return (
    <ThemeProvider theme={theme}>
      <Card
        sx={{
          cursor: 'pointer',
          position: 'relative',
          border: isSelected ? '3px solid' : '2px solid transparent',
          borderColor: isSelected ? theme.palette.primary.main : 'transparent',
          transition: 'all 0.3s ease',
          '&:hover': {
            transform: 'translateY(-4px)',
            boxShadow: `0 8px 24px ${theme.palette.primary.main}40`,
          },
        }}
        onClick={onSelect}
      >
        {/* Theme Header */}
        <Box
          sx={{
            background: `linear-gradient(135deg, ${theme.palette.background.default} 0%, ${theme.palette.background.paper} 100%)`,
            p: 3,
            borderBottom: `1px solid ${theme.palette.divider}`,
            position: 'relative',
          }}
        >
          <Typography
            variant="h5"
            sx={{
              fontWeight: 600,
              color: theme.palette.text.primary,
              mb: 1,
            }}
          >
            {themeConfig.displayName}
          </Typography>
          <Typography
            variant="body2"
            sx={{
              color: theme.palette.text.secondary,
              fontSize: '0.875rem',
            }}
          >
            {themeConfig.description}
          </Typography>

          {/* Selected indicator */}
          {isSelected && (
            <Box
              sx={{
                position: 'absolute',
                top: 16,
                right: 16,
                bgcolor: theme.palette.primary.main,
                color: theme.palette.primary.contrastText,
                borderRadius: '50%',
                width: 32,
                height: 32,
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
              }}
            >
              <CheckIcon sx={{ fontSize: 20 }} />
            </Box>
          )}
        </Box>

        {/* Theme Preview Content */}
        <CardContent
          sx={{
            bgcolor: theme.palette.background.default,
            p: 2,
          }}
        >
          {/* Color Palette */}
          <Box sx={{ mb: 2 }}>
            <Typography
              variant="caption"
              sx={{
                color: theme.palette.text.secondary,
                textTransform: 'uppercase',
                letterSpacing: 1,
                fontSize: '0.7rem',
              }}
            >
              Color Palette
            </Typography>
            <Box sx={{ display: 'flex', gap: 1, mt: 1 }}>
              <Box
                sx={{
                  width: 40,
                  height: 40,
                  bgcolor: theme.palette.primary.main,
                  borderRadius: 1,
                  border: '1px solid rgba(255,255,255,0.1)',
                }}
              />
              <Box
                sx={{
                  width: 40,
                  height: 40,
                  bgcolor: theme.palette.background.paper,
                  borderRadius: 1,
                  border: '1px solid rgba(255,255,255,0.1)',
                }}
              />
              <Box
                sx={{
                  width: 40,
                  height: 40,
                  bgcolor: theme.palette.text.primary,
                  borderRadius: 1,
                  border: '1px solid rgba(255,255,255,0.1)',
                }}
              />
              <Box
                sx={{
                  width: 40,
                  height: 40,
                  bgcolor: theme.palette.text.secondary,
                  borderRadius: 1,
                  border: '1px solid rgba(255,255,255,0.1)',
                }}
              />
            </Box>
          </Box>

          {/* Sample UI Elements */}
          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 1 }}>
            <Button
              variant="contained"
              size="small"
              sx={{
                bgcolor: theme.palette.primary.main,
                color: theme.palette.primary.contrastText,
                fontWeight: 600,
                '&:hover': {
                  bgcolor: theme.palette.primary.dark,
                },
              }}
            >
              Sample Button
            </Button>

            <Box sx={{ display: 'flex', gap: 1 }}>
              <Chip
                icon={<BookIcon sx={{ fontSize: 16 }} />}
                label="Books"
                size="small"
                sx={{
                  bgcolor: 'rgba(255,255,255,0.05)',
                  color: theme.palette.text.primary,
                }}
              />
              <Chip
                icon={<MovieIcon sx={{ fontSize: 16 }} />}
                label="Movies"
                size="small"
                sx={{
                  bgcolor: 'rgba(255,255,255,0.05)',
                  color: theme.palette.text.primary,
                }}
              />
            </Box>

            <Rating
              value={4.5}
              readOnly
              size="small"
              sx={{
                color: theme.palette.primary.main,
              }}
            />
          </Box>
        </CardContent>
      </Card>
    </ThemeProvider>
  );
};

export const ThemePreviewScreen: React.FC = () => {
  const navigate = useNavigate();
  const { selectedTheme, setTheme } = useAppStore();
  const [previewTheme, setPreviewTheme] = useState<UnifiedThemeName>(selectedTheme);
  const themes = getAllUnifiedThemes();

  const handleApplyTheme = () => {
    setTheme(previewTheme);
    navigate(-1);
  };

  return (
    <Box sx={{ minHeight: '100vh', bgcolor: 'background.default' }}>
      {/* Header */}
      <AppBar position="static" elevation={0}>
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBackIcon />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1, ml: 2 }}>
            Choose Your Theme
          </Typography>
          <Button
            variant="contained"
            onClick={handleApplyTheme}
            disabled={previewTheme === selectedTheme}
            sx={{
              bgcolor: 'primary.main',
              color: 'black',
              fontWeight: 600,
            }}
          >
            Apply Theme
          </Button>
        </Toolbar>
      </AppBar>

      {/* Content */}
      <Box sx={{ p: 3 }}>
        <Paper sx={{ p: 3, mb: 3, bgcolor: 'background.paper', border: '1px solid #2d3136' }}>
          <Typography variant="h5" gutterBottom sx={{ fontWeight: 300 }}>
            12 Beautiful Themes
          </Typography>
          <Typography variant="body1" color="text.secondary">
            Choose from our carefully crafted color schemes, synchronized across PWA and Android.
            Each theme features modern dark mode design with unique accent colors and subtle animations.
          </Typography>
        </Paper>

        {/* Theme Grid */}
        <Grid container spacing={3}>
          {themes.map((theme) => (
            <Grid item xs={12} sm={6} md={4} key={theme.name}>
              <ThemeCard
                themeName={theme.name}
                isSelected={previewTheme === theme.name}
                onSelect={() => setPreviewTheme(theme.name)}
              />
            </Grid>
          ))}
        </Grid>

        {/* Current Selection Info */}
        {previewTheme !== selectedTheme && (
          <Paper
            sx={{
              mt: 3,
              p: 2,
              bgcolor: 'primary.main',
              color: 'black',
              border: 'none',
            }}
          >
            <Typography variant="body1" sx={{ fontWeight: 600 }}>
              Preview: {themes.find((t) => t.name === previewTheme)?.displayName}
            </Typography>
            <Typography variant="body2">
              Click "Apply Theme" to make this your default theme
            </Typography>
          </Paper>
        )}
      </Box>
    </Box>
  );
};
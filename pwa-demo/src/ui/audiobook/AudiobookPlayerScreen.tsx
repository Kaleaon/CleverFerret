/**
 * Audiobook Player Screen
 * 
 * Specialized audiobook player with chapter navigation, bookmarks, and sleep timer.
 * Migrated from AudiobookPlayerScreen.kt
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
  Card,
  CardMedia,
  Stack,
  Chip,
  List,
  ListItem,
  ListItemButton,
  ListItemText,
  Drawer,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Pause,
  SkipNext,
  SkipPrevious,
  Forward30,
  Replay30,
  Speed,
  Bookmark,
  Timer,
  List as ListIcon,
  MoreVert,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { MediaItem } from '../../data/local/entity';

export const AudiobookPlayerScreen: React.FC = () => {
  const { audiobookId } = useParams<{ audiobookId: string }>();
  const navigate = useNavigate();
  
  const [mediaItem, setMediaItem] = useState<MediaItem | null>(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);
  const [playbackSpeed, setPlaybackSpeed] = useState(1.0);
  const [showChapters, setShowChapters] = useState(false);
  const [currentChapter, setCurrentChapter] = useState(1);

  // Mock chapters data
  const chapters = [
    { id: 1, title: 'Chapter 1: Introduction', start: 0, duration: 300 },
    { id: 2, title: 'Chapter 2: The Beginning', start: 300, duration: 450 },
    { id: 3, title: 'Chapter 3: Rising Action', start: 750, duration: 600 },
  ];

  useEffect(() => {
    loadAudiobookData();
  }, [audiobookId]);

  const loadAudiobookData = async () => {
    if (!audiobookId) return;
    const item = await db.mediaItems.get(parseInt(audiobookId));
    setMediaItem(item || null);
    // Load reading progress
    const progress = await db.readingProgress
      .where('itemId')
      .equals(parseInt(audiobookId))
      .first();
    if (progress) {
      setCurrentTime(progress.currentPosition);
    }
  };

  const handlePlayPause = () => {
    setIsPlaying(!isPlaying);
    // TODO: Implement actual playback control
  };

  const handleSeek = (value: number) => {
    setCurrentTime(value);
    // TODO: Implement actual seek
  };

  const handleSpeedChange = () => {
    const speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];
    const currentIndex = speeds.indexOf(playbackSpeed);
    const nextIndex = (currentIndex + 1) % speeds.length;
    setPlaybackSpeed(speeds[nextIndex]);
  };

  const formatTime = (seconds: number): string => {
    const hrs = Math.floor(seconds / 3600);
    const mins = Math.floor((seconds % 3600) / 60);
    const secs = Math.floor(seconds % 60);
    if (hrs > 0) {
      return `${hrs}:${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    }
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column', bgcolor: '#f5f5f5' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Audiobook Player
          </Typography>
          <IconButton color="inherit">
            <MoreVert />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', p: 3, overflow: 'auto' }}>
        {/* Book Cover */}
        <Card sx={{ width: '100%', maxWidth: 300, mx: 'auto', mb: 3, borderRadius: 2 }}>
          <CardMedia
            component="img"
            image={mediaItem?.thumbnailPath || '/placeholder-book.png'}
            alt="Book cover"
            sx={{ aspectRatio: '2/3' }}
          />
        </Card>

        {/* Book Info */}
        <Typography variant="h5" sx={{ fontWeight: 'bold', mb: 1, textAlign: 'center' }}>
          {mediaItem?.fileName || 'Unknown Audiobook'}
        </Typography>
        <Typography variant="body2" color="text.secondary" sx={{ mb: 1, textAlign: 'center' }}>
          Author Name
        </Typography>
        <Chip
          label={`Chapter ${currentChapter} of ${chapters.length}`}
          size="small"
          sx={{ alignSelf: 'center', mb: 3 }}
        />

        {/* Progress Bar */}
        <Box sx={{ mb: 2 }}>
          <Slider
            value={currentTime}
            max={duration}
            onChange={(_, value) => handleSeek(value as number)}
            sx={{ color: 'primary.main' }}
          />
          <Stack direction="row" justifyContent="space-between" sx={{ fontSize: '0.875rem', color: 'text.secondary' }}>
            <span>{formatTime(currentTime)}</span>
            <span>{formatTime(duration)}</span>
          </Stack>
        </Box>

        {/* Playback Controls */}
        <Stack direction="row" spacing={2} alignItems="center" justifyContent="center" sx={{ mb: 2 }}>
          <IconButton onClick={() => handleSeek(currentTime - 30)}>
            <Replay30 />
          </IconButton>
          <IconButton>
            <SkipPrevious />
          </IconButton>
          <IconButton
            onClick={handlePlayPause}
            sx={{
              bgcolor: 'primary.main',
              color: 'white',
              width: 56,
              height: 56,
              '&:hover': { bgcolor: 'primary.dark' },
            }}
          >
            {isPlaying ? <Pause /> : <PlayArrow />}
          </IconButton>
          <IconButton>
            <SkipNext />
          </IconButton>
          <IconButton onClick={() => handleSeek(currentTime + 30)}>
            <Forward30 />
          </IconButton>
        </Stack>

        {/* Additional Controls */}
        <Stack direction="row" spacing={2} justifyContent="center" sx={{ mb: 2 }}>
          <Chip
            icon={<Speed />}
            label={`${playbackSpeed}x`}
            onClick={handleSpeedChange}
            variant="outlined"
          />
          <Chip
            icon={<ListIcon />}
            label="Chapters"
            onClick={() => setShowChapters(true)}
            variant="outlined"
          />
          <Chip icon={<Timer />} label="Sleep Timer" variant="outlined" />
          <Chip icon={<Bookmark />} label="Bookmark" variant="outlined" />
        </Stack>
      </Box>

      {/* Chapters Drawer */}
      <Drawer anchor="bottom" open={showChapters} onClose={() => setShowChapters(false)}>
        <Box sx={{ p: 2 }}>
          <Typography variant="h6" sx={{ mb: 2 }}>
            Chapters
          </Typography>
          <List>
            {chapters.map((chapter) => (
              <ListItem key={chapter.id} disablePadding>
                <ListItemButton
                  selected={currentChapter === chapter.id}
                  onClick={() => {
                    setCurrentChapter(chapter.id);
                    setCurrentTime(chapter.start);
                    setShowChapters(false);
                  }}
                >
                  <ListItemText
                    primary={chapter.title}
                    secondary={`${formatTime(chapter.start)} - ${formatTime(chapter.duration)}`}
                  />
                </ListItemButton>
              </ListItem>
            ))}
          </List>
        </Box>
      </Drawer>
    </Box>
  );
};

export default AudiobookPlayerScreen;

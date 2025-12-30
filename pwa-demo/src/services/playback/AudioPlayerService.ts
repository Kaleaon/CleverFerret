/**
 * Audio Player Service
 *
 * Manages audio playback using HTML5 Audio API and Media Session API.
 * Provides playlist management, queue handling, and playback controls.
 */

export class AudioPlayerService {
  private audio: HTMLAudioElement;
  private playlist: AudioTrack[] = [];
  private currentIndex: number = 0;
  private isShuffled: boolean = false;
  private repeatMode: RepeatMode = 'none';
  private listeners: Map<string, Set<(...args: any[]) => void>> = new Map();

  constructor() {
    this.audio = new Audio();
    this.setupAudioListeners();
    this.setupMediaSession();
  }

  /**
   * Setup audio element event listeners
   */
  private setupAudioListeners(): void {
    this.audio.addEventListener('play', () => this.emit('play'));
    this.audio.addEventListener('pause', () => this.emit('pause'));
    this.audio.addEventListener('ended', () => this.handleTrackEnd());
    this.audio.addEventListener('timeupdate', () => {
      this.emit('timeupdate', {
        currentTime: this.audio.currentTime,
        duration: this.audio.duration,
        progress: this.audio.currentTime / this.audio.duration,
      });
    });
    this.audio.addEventListener('error', (e) => {
      this.emit('error', e);
    });
    this.audio.addEventListener('loadedmetadata', () => {
      this.emit('loadedmetadata', {
        duration: this.audio.duration,
      });
    });
  }

  /**
   * Setup Media Session API for OS-level controls
   */
  private setupMediaSession(): void {
    if ('mediaSession' in navigator) {
      navigator.mediaSession.setActionHandler('play', () => this.play());
      navigator.mediaSession.setActionHandler('pause', () => this.pause());
      navigator.mediaSession.setActionHandler('previoustrack', () => this.previous());
      navigator.mediaSession.setActionHandler('nexttrack', () => this.next());
      navigator.mediaSession.setActionHandler('seekbackward', () =>
        this.seek(this.audio.currentTime - 10),
      );
      navigator.mediaSession.setActionHandler('seekforward', () =>
        this.seek(this.audio.currentTime + 10),
      );
    }
  }

  /**
   * Update Media Session metadata
   */
  private updateMediaSession(): void {
    if ('mediaSession' in navigator && this.currentTrack) {
      const track = this.currentTrack;
      navigator.mediaSession.metadata = new MediaMetadata({
        title: track.title,
        artist: track.artist,
        album: track.album,
        artwork: track.coverUrl
          ? [{ src: track.coverUrl, sizes: '512x512', type: 'image/jpeg' }]
          : [],
      });
    }
  }

  /**
   * Load and play a track
   */
  async loadTrack(track: AudioTrack, autoplay: boolean = true): Promise<void> {
    this.audio.src = track.url;
    this.audio.load();
    this.updateMediaSession();

    if (autoplay) {
      await this.play();
    }
  }

  /**
   * Play current track
   */
  async play(): Promise<void> {
    try {
      await this.audio.play();
    } catch (error) {
      console.error('Play error:', error);
      this.emit('error', error);
    }
  }

  /**
   * Pause playback
   */
  pause(): void {
    this.audio.pause();
  }

  /**
   * Toggle play/pause
   */
  async togglePlayPause(): Promise<void> {
    if (this.audio.paused) {
      await this.play();
    } else {
      this.pause();
    }
  }

  /**
   * Seek to position
   */
  seek(time: number): void {
    this.audio.currentTime = Math.max(0, Math.min(time, this.audio.duration));
  }

  /**
   * Set volume (0-1)
   */
  setVolume(volume: number): void {
    this.audio.volume = Math.max(0, Math.min(1, volume));
    this.emit('volumechange', volume);
  }

  /**
   * Set playback speed
   */
  setPlaybackRate(rate: number): void {
    this.audio.playbackRate = Math.max(0.25, Math.min(4, rate));
    this.emit('ratechange', rate);
  }

  /**
   * Load playlist
   */
  loadPlaylist(tracks: AudioTrack[], startIndex: number = 0): void {
    this.playlist = tracks;
    this.currentIndex = startIndex;
    this.emit('trackchange', this.currentTrack);
    if (this.currentTrack) {
      this.loadTrack(this.currentTrack, true);
    }
  }

  /**
   * Play next track
   */
  async next(): Promise<void> {
    if (this.repeatMode === 'one') {
      await this.seek(0);
      await this.play();
      return;
    }

    if (this.currentIndex < this.playlist.length - 1) {
      this.currentIndex++;
    } else if (this.repeatMode === 'all') {
      this.currentIndex = 0;
    } else {
      return; // End of playlist
    }

    this.emit('trackchange', this.currentTrack);
    if (this.currentTrack) {
      await this.loadTrack(this.currentTrack, true);
    }
  }

  /**
   * Play previous track
   */
  async previous(): Promise<void> {
    if (this.audio.currentTime > 3) {
      // If more than 3 seconds into track, restart it
      await this.seek(0);
    } else if (this.currentIndex > 0) {
      this.currentIndex--;
      this.emit('trackchange', this.currentTrack);
      if (this.currentTrack) {
        await this.loadTrack(this.currentTrack, true);
      }
    }
  }

  /**
   * Handle track end
   */
  private async handleTrackEnd(): Promise<void> {
    this.emit('trackend');
    await this.next();
  }

  /**
   * Set repeat mode
   */
  setRepeatMode(mode: RepeatMode): void {
    this.repeatMode = mode;
    this.emit('repeatchange', mode);
  }

  /**
   * Set shuffle mode
   */
  setShuffle(shuffle: boolean): void {
    this.isShuffled = shuffle;
    if (shuffle) {
      this.shufflePlaylist();
    }
    this.emit('shufflechange', shuffle);
  }

  /**
   * Shuffle playlist
   */
  private shufflePlaylist(): void {
    const currentTrack = this.currentTrack;
    for (let i = this.playlist.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [this.playlist[i], this.playlist[j]] = [this.playlist[j], this.playlist[i]];
    }
    // Keep current track at current position
    if (currentTrack) {
      const newIndex = this.playlist.findIndex((t) => t.id === currentTrack.id);
      if (newIndex !== -1 && newIndex !== this.currentIndex) {
        [this.playlist[this.currentIndex], this.playlist[newIndex]] = [
          this.playlist[newIndex],
          this.playlist[this.currentIndex],
        ];
      }
    }
  }

  /**
   * Get current track
   */
  get currentTrack(): AudioTrack | undefined {
    return this.playlist[this.currentIndex];
  }

  /**
   * Get current playback state
   */
  getState(): PlaybackState {
    return {
      isPlaying: !this.audio.paused,
      currentTime: this.audio.currentTime,
      duration: this.audio.duration,
      volume: this.audio.volume,
      playbackRate: this.audio.playbackRate,
      currentTrack: this.currentTrack,
      playlist: this.playlist,
      currentIndex: this.currentIndex,
      repeatMode: this.repeatMode,
      isShuffled: this.isShuffled,
    };
  }

  /**
   * Event emitter
   */
  private emit(event: string, data?: any): void {
    const callbacks = this.listeners.get(event);
    if (callbacks) {
      callbacks.forEach((callback) => callback(data));
    }
  }

  /**
   * Subscribe to events
   */
  on(event: string, callback: (...args: any[]) => void): () => void {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, new Set());
    }
    this.listeners.get(event)!.add(callback);

    // Return unsubscribe function
    return () => {
      const callbacks = this.listeners.get(event);
      if (callbacks) {
        callbacks.delete(callback);
      }
    };
  }

  /**
   * Cleanup
   */
  destroy(): void {
    this.pause();
    this.audio.src = '';
    this.listeners.clear();
  }
}

/**
 * Audio track interface
 */
export interface AudioTrack {
  id: number;
  url: string;
  title: string;
  artist?: string;
  album?: string;
  coverUrl?: string;
  duration?: number;
}

/**
 * Playback state
 */
export interface PlaybackState {
  isPlaying: boolean;
  currentTime: number;
  duration: number;
  volume: number;
  playbackRate: number;
  currentTrack?: AudioTrack;
  playlist: AudioTrack[];
  currentIndex: number;
  repeatMode: RepeatMode;
  isShuffled: boolean;
}

/**
 * Repeat mode
 */
export type RepeatMode = 'none' | 'one' | 'all';

// Export singleton instance
export const audioPlayerService = new AudioPlayerService();

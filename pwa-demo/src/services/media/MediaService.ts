/**
 * Media Service - Media file handling and playback
 * Migrated from Android MediaService
 */

export interface MediaMetadata {
  title?: string;
  artist?: string;
  album?: string;
  artwork?: string;
  duration?: number;
}

export class MediaService {
  private currentAudio: HTMLAudioElement | null = null;
  private currentVideo: HTMLVideoElement | null = null;

  createAudioElement(src: string): HTMLAudioElement {
    if (this.currentAudio) {
      this.currentAudio.pause();
      this.currentAudio.src = '';
    }

    this.currentAudio = new Audio(src);
    this.currentAudio.preload = 'metadata';
    return this.currentAudio;
  }

  createVideoElement(src: string): HTMLVideoElement {
    if (this.currentVideo) {
      this.currentVideo.pause();
      this.currentVideo.src = '';
    }

    this.currentVideo = document.createElement('video');
    this.currentVideo.src = src;
    this.currentVideo.preload = 'metadata';
    return this.currentVideo;
  }

  async play(element: HTMLAudioElement | HTMLVideoElement): Promise<void> {
    try {
      await element.play();
    } catch (error) {
      console.error('Playback failed:', error);
      throw error;
    }
  }

  pause(element: HTMLAudioElement | HTMLVideoElement): void {
    element.pause();
  }

  stop(element: HTMLAudioElement | HTMLVideoElement): void {
    element.pause();
    element.currentTime = 0;
  }

  seek(element: HTMLAudioElement | HTMLVideoElement, timeInSeconds: number): void {
    element.currentTime = timeInSeconds;
  }

  setVolume(element: HTMLAudioElement | HTMLVideoElement, volume: number): void {
    element.volume = Math.max(0, Math.min(1, volume));
  }

  setPlaybackRate(element: HTMLAudioElement | HTMLVideoElement, rate: number): void {
    element.playbackRate = Math.max(0.25, Math.min(4, rate));
  }

  updateMediaSession(metadata: MediaMetadata): void {
    if ('mediaSession' in navigator) {
      navigator.mediaSession.metadata = new MediaMetadata({
        title: metadata.title || 'Unknown Title',
        artist: metadata.artist || 'Unknown Artist',
        album: metadata.album || 'Unknown Album',
        artwork: metadata.artwork
          ? [{ src: metadata.artwork, sizes: '512x512', type: 'image/png' }]
          : [],
      });
    }
  }

  setMediaSessionHandlers(handlers: {
    play?: () => void;
    pause?: () => void;
    previoustrack?: () => void;
    nexttrack?: () => void;
    seekbackward?: () => void;
    seekforward?: () => void;
  }): void {
    if ('mediaSession' in navigator) {
      const actions: (keyof typeof handlers)[] = [
        'play',
        'pause',
        'previoustrack',
        'nexttrack',
        'seekbackward',
        'seekforward',
      ];
      actions.forEach((action) => {
        const handler = handlers[action];
        if (handler) {
          try {
            navigator.mediaSession.setActionHandler(action, handler);
          } catch (error) {
            console.warn(`${action} not supported`);
          }
        }
      });
    }
  }

  cleanup(): void {
    if (this.currentAudio) {
      this.currentAudio.pause();
      this.currentAudio.src = '';
      this.currentAudio = null;
    }
    if (this.currentVideo) {
      this.currentVideo.pause();
      this.currentVideo.src = '';
      this.currentVideo = null;
    }
  }
}

export default new MediaService();

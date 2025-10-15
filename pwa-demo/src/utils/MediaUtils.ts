/**
 * Media file utilities
 * Media detection, metadata extraction, and format validation
 */

export interface MediaMetadata {
  type: 'audio' | 'video' | 'image' | 'document';
  duration?: number;
  width?: number;
  height?: number;
  size: number;
  mimeType: string;
  filename: string;
}

export class MediaUtils {
  /**
   * Detect media type from file
   */
  static detectMediaType(file: File): 'audio' | 'video' | 'image' | 'document' | 'unknown' {
    const type = file.type.toLowerCase();
    
    if (type.startsWith('audio/')) return 'audio';
    if (type.startsWith('video/')) return 'video';
    if (type.startsWith('image/')) return 'image';
    
    const ext = file.name.split('.').pop()?.toLowerCase();
    if (ext && ['pdf', 'epub', 'mobi', 'azw', 'txt', 'doc', 'docx'].includes(ext)) {
      return 'document';
    }
    
    return 'unknown';
  }

  /**
   * Extract metadata from media file
   */
  static async extractMetadata(file: File): Promise<MediaMetadata> {
    const type = this.detectMediaType(file);
    const metadata: MediaMetadata = {
      type: type === 'unknown' ? 'document' : type,
      size: file.size,
      mimeType: file.type,
      filename: file.name,
    };

    // Extract dimensions for images
    if (type === 'image') {
      const dims = await this.getImageDimensions(file);
      metadata.width = dims.width;
      metadata.height = dims.height;
    }

    // Extract duration for audio/video
    if (type === 'audio' || type === 'video') {
      const duration = await this.getMediaDuration(file);
      metadata.duration = duration;
      
      if (type === 'video') {
        const dims = await this.getVideoDimensions(file);
        metadata.width = dims.width;
        metadata.height = dims.height;
      }
    }

    return metadata;
  }

  /**
   * Get image dimensions
   */
  static async getImageDimensions(file: File): Promise<{ width: number; height: number }> {
    return new Promise((resolve, reject) => {
      const img = new Image();
      const url = URL.createObjectURL(file);
      
      img.onload = () => {
        URL.revokeObjectURL(url);
        resolve({ width: img.naturalWidth, height: img.naturalHeight });
      };
      
      img.onerror = () => {
        URL.revokeObjectURL(url);
        reject(new Error('Failed to load image'));
      };
      
      img.src = url;
    });
  }

  /**
   * Get video dimensions
   */
  static async getVideoDimensions(file: File): Promise<{ width: number; height: number }> {
    return new Promise((resolve, reject) => {
      const video = document.createElement('video');
      const url = URL.createObjectURL(file);
      
      video.onloadedmetadata = () => {
        URL.revokeObjectURL(url);
        resolve({ width: video.videoWidth, height: video.videoHeight });
      };
      
      video.onerror = () => {
        URL.revokeObjectURL(url);
        reject(new Error('Failed to load video'));
      };
      
      video.src = url;
    });
  }

  /**
   * Get media duration (audio/video)
   */
  static async getMediaDuration(file: File): Promise<number> {
    return new Promise((resolve) => {
      const isVideo = file.type.startsWith('video/');
      const element = document.createElement(isVideo ? 'video' : 'audio');
      const url = URL.createObjectURL(file);
      
      element.onloadedmetadata = () => {
        URL.revokeObjectURL(url);
        resolve(element.duration || 0);
      };
      
      element.onerror = () => {
        URL.revokeObjectURL(url);
        resolve(0);
      };
      
      element.src = url;
    });
  }

  /**
   * Check if browser can play media format
   */
  static canPlay(mimeType: string): boolean {
    const audio = document.createElement('audio');
    const video = document.createElement('video');
    
    const audioSupport = audio.canPlayType(mimeType);
    const videoSupport = video.canPlayType(mimeType);
    
    return audioSupport !== '' || videoSupport !== '';
  }

  /**
   * Get supported audio formats
   */
  static getSupportedAudioFormats(): string[] {
    const audio = document.createElement('audio');
    const formats = [
      'audio/mpeg',
      'audio/mp4',
      'audio/ogg',
      'audio/wav',
      'audio/webm',
      'audio/flac',
    ];
    
    return formats.filter((format) => audio.canPlayType(format) !== '');
  }

  /**
   * Get supported video formats
   */
  static getSupportedVideoFormats(): string[] {
    const video = document.createElement('video');
    const formats = [
      'video/mp4',
      'video/webm',
      'video/ogg',
    ];
    
    return formats.filter((format) => video.canPlayType(format) !== '');
  }

  /**
   * Format duration (seconds to HH:MM:SS)
   */
  static formatDuration(seconds: number): string {
    const hrs = Math.floor(seconds / 3600);
    const mins = Math.floor((seconds % 3600) / 60);
    const secs = Math.floor(seconds % 60);
    
    if (hrs > 0) {
      return `${hrs}:${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    }
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  }
}

/**
 * Thumbnail Service - Generate thumbnails for media files
 * Migrated from Android ThumbnailService
 */

export class ThumbnailService {
  async generateVideoThumbnail(videoFile: File, timeInSeconds: number = 1): Promise<string> {
    return new Promise((resolve, reject) => {
      const video = document.createElement('video');
      video.preload = 'metadata';
      video.muted = true;

      video.onloadedmetadata = () => {
        video.currentTime = Math.min(timeInSeconds, video.duration / 2);
      };

      video.onseeked = () => {
        const canvas = document.createElement('canvas');
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;

        const ctx = canvas.getContext('2d');
        if (!ctx) {
          reject(new Error('Canvas context not available'));
          return;
        }

        ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
        const thumbnail = canvas.toDataURL('image/jpeg', 0.7);

        video.src = '';
        resolve(thumbnail);
      };

      video.onerror = () => {
        reject(new Error('Failed to load video'));
      };

      video.src = URL.createObjectURL(videoFile);
    });
  }

  async generateImageThumbnail(
    imageFile: File,
    maxWidth: number = 200,
    maxHeight: number = 200,
  ): Promise<string> {
    return new Promise((resolve, reject) => {
      const img = new Image();

      img.onload = () => {
        const canvas = document.createElement('canvas');
        let { width, height } = img;

        if (width > height) {
          if (width > maxWidth) {
            height *= maxWidth / width;
            width = maxWidth;
          }
        } else {
          if (height > maxHeight) {
            width *= maxHeight / height;
            height = maxHeight;
          }
        }

        canvas.width = width;
        canvas.height = height;

        const ctx = canvas.getContext('2d');
        if (!ctx) {
          reject(new Error('Canvas context not available'));
          return;
        }

        ctx.drawImage(img, 0, 0, width, height);
        const thumbnail = canvas.toDataURL('image/jpeg', 0.8);

        URL.revokeObjectURL(img.src);
        resolve(thumbnail);
      };

      img.onerror = () => {
        reject(new Error('Failed to load image'));
      };

      img.src = URL.createObjectURL(imageFile);
    });
  }

  async generatePDFThumbnail(pdfFile: File): Promise<string> {
    // Placeholder - requires pdf.js integration
    return 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==';
  }

  async cacheThumb(itemId: number, thumbnail: string): Promise<void> {
    // Cache thumbnail in IndexedDB
    try {
      localStorage.setItem(`thumbnail-${itemId}`, thumbnail);
    } catch (error) {
      console.error('Failed to cache thumbnail:', error);
    }
  }

  async getCachedThumbnail(itemId: number): Promise<string | null> {
    try {
      return localStorage.getItem(`thumbnail-${itemId}`);
    } catch (error) {
      console.error('Failed to get cached thumbnail:', error);
      return null;
    }
  }
}

export default new ThumbnailService();

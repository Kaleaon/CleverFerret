/**
 * Sharing Service - Web Share API wrapper
 * Migrated from Android Sharing Service
 */

export interface ShareData {
  title?: string;
  text?: string;
  url?: string;
  files?: File[];
}

export class SharingService {
  canShare(): boolean {
    return 'share' in navigator;
  }

  canShareFiles(): boolean {
    return 'share' in navigator && 'canShare' in navigator && navigator.canShare({ files: [] });
  }

  async share(data: ShareData): Promise<boolean> {
    if (!this.canShare()) {
      console.warn('Web Share API not supported');
      return false;
    }

    try {
      await navigator.share(data);
      return true;
    } catch (error) {
      if (error instanceof Error && error.name === 'AbortError') {
        console.log('Share cancelled by user');
      } else {
        console.error('Share failed:', error);
      }
      return false;
    }
  }

  async shareBook(title: string, author: string, url: string): Promise<boolean> {
    return this.share({
      title: `${title} by ${author}`,
      text: `Check out this book: ${title}`,
      url,
    });
  }

  async sharePlaylist(name: string, url: string): Promise<boolean> {
    return this.share({
      title: `Playlist: ${name}`,
      text: `Check out my playlist: ${name}`,
      url,
    });
  }

  async shareFile(file: File, title?: string): Promise<boolean> {
    if (!this.canShareFiles()) {
      console.warn('File sharing not supported');
      return false;
    }

    return this.share({
      title: title || file.name,
      files: [file],
    });
  }

  copyToClipboard(text: string): Promise<void> {
    return navigator.clipboard.writeText(text);
  }
}

export default new SharingService();

/**
 * Plex Integration Service
 * Migrated from Android Plex Service
 */

export interface PlexServer {
  name: string;
  host: string;
  port: number;
  token: string;
  secure: boolean;
}

export interface PlexLibrary {
  key: string;
  title: string;
  type: string;
}

export interface PlexMediaItem {
  key: string;
  title: string;
  type: string;
  thumb?: string;
  rating?: number;
  year?: number;
}

export class PlexService {
  private server: PlexServer | null = null;

  setServer(server: PlexServer): void {
    this.server = server;
    localStorage.setItem('plex-server', JSON.stringify(server));
  }

  getServer(): PlexServer | null {
    if (this.server) return this.server;
    
    const stored = localStorage.getItem('plex-server');
    if (stored) {
      this.server = JSON.parse(stored);
      return this.server;
    }
    return null;
  }

  private getBaseUrl(): string {
    if (!this.server) throw new Error('Plex server not configured');
    const protocol = this.server.secure ? 'https' : 'http';
    return `${protocol}://${this.server.host}:${this.server.port}`;
  }

  async testConnection(): Promise<boolean> {
    if (!this.server) return false;
    
    try {
      const url = `${this.getBaseUrl()}/identity?X-Plex-Token=${this.server.token}`;
      const response = await fetch(url);
      return response.ok;
    } catch (error) {
      console.error('Plex connection test failed:', error);
      return false;
    }
  }

  async getLibraries(): Promise<PlexLibrary[]> {
    const url = `${this.getBaseUrl()}/library/sections?X-Plex-Token=${this.server?.token}`;
    
    try {
      const response = await fetch(url);
      const xml = await response.text();
      const parser = new DOMParser();
      const xmlDoc = parser.parseFromString(xml, 'text/xml');
      
      const directories = Array.from(xmlDoc.querySelectorAll('Directory'));
      return directories.map(dir => ({
        key: dir.getAttribute('key') || '',
        title: dir.getAttribute('title') || '',
        type: dir.getAttribute('type') || '',
      }));
    } catch (error) {
      console.error('Failed to get Plex libraries:', error);
      return [];
    }
  }

  async getLibraryContent(libraryKey: string): Promise<PlexMediaItem[]> {
    const url = `${this.getBaseUrl()}/library/sections/${libraryKey}/all?X-Plex-Token=${this.server?.token}`;
    
    try {
      const response = await fetch(url);
      const xml = await response.text();
      const parser = new DOMParser();
      const xmlDoc = parser.parseFromString(xml, 'text/xml');
      
      const videos = Array.from(xmlDoc.querySelectorAll('Video'));
      return videos.map(video => ({
        key: video.getAttribute('key') || '',
        title: video.getAttribute('title') || '',
        type: video.getAttribute('type') || '',
        thumb: video.getAttribute('thumb') || undefined,
        rating: parseFloat(video.getAttribute('rating') || '0'),
        year: parseInt(video.getAttribute('year') || '0'),
      }));
    } catch (error) {
      console.error('Failed to get library content:', error);
      return [];
    }
  }

  async syncItem(itemKey: string): Promise<void> {
    console.log('Syncing Plex item:', itemKey);
    // Placeholder for sync logic
  }
}

export default new PlexService();

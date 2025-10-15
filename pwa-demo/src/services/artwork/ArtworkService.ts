/**
 * Artwork Service - Fetch artwork from various sources
 * Migrated from Android Artwork Service
 */

export interface ArtworkSource {
  url: string;
  width: number;
  height: number;
  provider: string;
}

export class ArtworkService {
  private readonly coverArtArchiveUrl = 'https://coverartarchive.org';
  private readonly tmdbBaseUrl = 'https://image.tmdb.org/t/p';

  async fetchBookCover(isbn: string): Promise<ArtworkSource[]> {
    const sources: ArtworkSource[] = [];

    // Open Library Covers API
    try {
      const url = `https://covers.openlibrary.org/b/isbn/${isbn}-L.jpg`;
      const response = await fetch(url, { method: 'HEAD' });
      if (response.ok) {
        sources.push({
          url,
          width: 0,
          height: 0,
          provider: 'OpenLibrary',
        });
      }
    } catch (error) {
      console.error('OpenLibrary fetch failed:', error);
    }

    return sources;
  }

  async fetchAlbumArt(artistName: string, albumName: string): Promise<ArtworkSource[]> {
    // Placeholder - would integrate with MusicBrainz/Cover Art Archive
    return [];
  }

  async fetchMoviePoster(tmdbId: string): Promise<ArtworkSource[]> {
    // Placeholder - would use TMDB API with proper API key
    const sizes = ['w185', 'w342', 'w500', 'w780', 'original'];
    return sizes.map((size, index) => ({
      url: `${this.tmdbBaseUrl}/${size}/placeholder.jpg`,
      width: index * 200,
      height: index * 300,
      provider: 'TMDB',
    }));
  }

  async downloadAndCache(artworkUrl: string, itemId: number): Promise<string> {
    try {
      const response = await fetch(artworkUrl);
      const blob = await response.blob();
      
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.onloadend = () => {
          const base64 = reader.result as string;
          localStorage.setItem(`artwork-${itemId}`, base64);
          resolve(base64);
        };
        reader.onerror = reject;
        reader.readAsDataURL(blob);
      });
    } catch (error) {
      console.error('Failed to download artwork:', error);
      throw error;
    }
  }

  getCachedArtwork(itemId: number): string | null {
    return localStorage.getItem(`artwork-${itemId}`);
  }

  clearCache(): void {
    const keys = Object.keys(localStorage).filter(k => k.startsWith('artwork-'));
    keys.forEach(key => localStorage.removeItem(key));
  }
}

export default new ArtworkService();

/**
 * Web Comic Service - Download and manage web comics
 * Supports multiple comic formats and sites including:
 * - Schlock Mercenary
 * - Questionable Content
 * - Generic web comics with RSS feeds
 */

export interface Comic {
  id: string;
  title: string;
  author: string;
  url: string;
  site: 'schlock' | 'qc' | 'generic';
  description?: string;
  strips: ComicStrip[];
  lastUpdated: Date;
  totalStrips?: number;
  rssUrl?: string;
  archiveUrl?: string;
}

export interface ComicStrip {
  number: number;
  title: string;
  imageUrl: string;
  altText?: string;
  publishDate: Date;
  url: string;
  transcript?: string;
  cached?: boolean;
}

export interface ComicMetadata {
  title: string;
  author: string;
  description: string;
  firstStripUrl: string;
  latestStripUrl: string;
  archiveUrl?: string;
  rssUrl?: string;
}

export class WebComicService {
  private readonly CORS_PROXY = 'https://api.allorigins.win/raw?url=';

  /**
   * Fetch comic metadata and strips
   */
  async fetchComic(url: string): Promise<Comic> {
    const site = this.detectSite(url);

    switch (site) {
      case 'schlock':
        return this.fetchSchlockMercenary(url);
      case 'qc':
        return this.fetchQuestionableContent(url);
      default:
        return this.fetchGenericComic(url);
    }
  }

  /**
   * Detect comic site from URL
   */
  private detectSite(url: string): 'schlock' | 'qc' | 'generic' {
    try {
      const hostname = new URL(url).hostname;
      if (hostname.includes('schlockmercenary.com')) return 'schlock';
      if (hostname.includes('questionablecontent.net')) return 'qc';
      return 'generic';
    } catch (e) {
      return 'generic';
    }
  }

  /**
   * Fetch Schlock Mercenary comic
   * Archive structure: https://www.schlockmercenary.com/YYYY-MM-DD
   * RSS: http://www.schlockmercenary.com/rss/
   */
  private async fetchSchlockMercenary(url: string): Promise<Comic> {
    try {
      // Fetch the main page to get metadata
      const response = await fetch(this.CORS_PROXY + encodeURIComponent(url));
      const html = await response.text();

      // Parse basic metadata
      const titleMatch = html.match(/<title>(.*?)<\/title>/i);
      const title = titleMatch
        ? titleMatch[1].replace(' - Schlock Mercenary', '')
        : 'Schlock Mercenary';

      // Get RSS feed for latest strips
      const rssUrl = 'http://www.schlockmercenary.com/rss/';
      const strips = await this.parseSchlockRSS(rssUrl);

      return {
        id: 'schlock-' + Date.now(),
        title: 'Schlock Mercenary',
        author: 'Howard Tayler',
        url: 'https://www.schlockmercenary.com/',
        site: 'schlock',
        description: 'The Toughs are a mercenary company. Follow their adventures!',
        strips,
        lastUpdated: new Date(),
        rssUrl,
        archiveUrl: 'https://www.schlockmercenary.com/archives/',
      };
    } catch (error) {
      console.error('Error fetching Schlock Mercenary:', error);
      throw new Error('Failed to fetch Schlock Mercenary comic');
    }
  }

  /**
   * Parse Schlock Mercenary RSS feed
   */
  private async parseSchlockRSS(rssUrl: string): Promise<ComicStrip[]> {
    try {
      const response = await fetch(this.CORS_PROXY + encodeURIComponent(rssUrl));
      const xml = await response.text();

      const parser = new DOMParser();
      const doc = parser.parseFromString(xml, 'text/xml');
      const items = doc.querySelectorAll('item');

      const strips: ComicStrip[] = [];
      items.forEach((item, index) => {
        const title = item.querySelector('title')?.textContent || '';
        const link = item.querySelector('link')?.textContent || '';
        const pubDate = item.querySelector('pubDate')?.textContent || '';
        const description = item.querySelector('description')?.textContent || '';

        // Extract image URL from description
        const imgMatch = description.match(/<img[^>]+src="([^">]+)"/);
        const imageUrl = imgMatch ? imgMatch[1] : '';

        if (imageUrl && link) {
          strips.push({
            number: index + 1,
            title,
            imageUrl,
            url: link,
            publishDate: new Date(pubDate),
            cached: false,
          });
        }
      });

      return strips;
    } catch (error) {
      console.error('Error parsing Schlock RSS:', error);
      return [];
    }
  }

  /**
   * Fetch Questionable Content comic
   * Archive structure: https://www.questionablecontent.net/view.php?comic=XXXX
   * RSS: https://www.questionablecontent.net/QCRSS.xml
   */
  private async fetchQuestionableContent(url: string): Promise<Comic> {
    try {
      const rssUrl = 'https://www.questionablecontent.net/QCRSS.xml';
      const strips = await this.parseQCRSS(rssUrl);

      return {
        id: 'qc-' + Date.now(),
        title: 'Questionable Content',
        author: 'Jeph Jacques',
        url: 'https://www.questionablecontent.net/',
        site: 'qc',
        description: 'A slice-of-life webcomic about romance, robots, and coffee.',
        strips,
        lastUpdated: new Date(),
        rssUrl,
        archiveUrl: 'https://www.questionablecontent.net/archive.php',
      };
    } catch (error) {
      console.error('Error fetching Questionable Content:', error);
      throw new Error('Failed to fetch Questionable Content comic');
    }
  }

  /**
   * Parse Questionable Content RSS feed
   */
  private async parseQCRSS(rssUrl: string): Promise<ComicStrip[]> {
    try {
      const response = await fetch(this.CORS_PROXY + encodeURIComponent(rssUrl));
      const xml = await response.text();

      const parser = new DOMParser();
      const doc = parser.parseFromString(xml, 'text/xml');
      const items = doc.querySelectorAll('item');

      const strips: ComicStrip[] = [];
      items.forEach((item, index) => {
        const title = item.querySelector('title')?.textContent || '';
        const link = item.querySelector('link')?.textContent || '';
        const pubDate = item.querySelector('pubDate')?.textContent || '';
        const description = item.querySelector('description')?.textContent || '';

        // Extract image URL and comic number from description
        const imgMatch = description.match(/<img[^>]+src="([^">]+)"/);
        const imageUrl = imgMatch ? imgMatch[1] : '';

        // Extract comic number from link
        const numMatch = link.match(/comic=(\d+)/);
        const number = numMatch ? parseInt(numMatch[1]) : index + 1;

        if (imageUrl && link) {
          strips.push({
            number,
            title,
            imageUrl,
            url: link,
            publishDate: new Date(pubDate),
            cached: false,
          });
        }
      });

      return strips.reverse(); // Oldest first
    } catch (error) {
      console.error('Error parsing QC RSS:', error);
      return [];
    }
  }

  /**
   * Fetch generic web comic (attempts to find RSS feed)
   */
  private async fetchGenericComic(url: string): Promise<Comic> {
    try {
      const response = await fetch(this.CORS_PROXY + encodeURIComponent(url));
      const html = await response.text();

      // Try to find RSS feed link
      const rssMatch = html.match(/<link[^>]+type="application\/rss\+xml"[^>]+href="([^">]+)"/i);
      const rssUrl = rssMatch ? rssMatch[1] : null;

      // Parse title
      const titleMatch = html.match(/<title>(.*?)<\/title>/i);
      const title = titleMatch ? titleMatch[1] : 'Web Comic';

      let strips: ComicStrip[] = [];
      if (rssUrl) {
        strips = await this.parseGenericRSS(rssUrl);
      }

      return {
        id: 'generic-' + Date.now(),
        title,
        author: 'Unknown',
        url,
        site: 'generic',
        strips,
        lastUpdated: new Date(),
        rssUrl: rssUrl || undefined,
      };
    } catch (error) {
      console.error('Error fetching generic comic:', error);
      throw new Error('Failed to fetch web comic. Make sure the URL is correct.');
    }
  }

  /**
   * Parse generic RSS feed
   */
  private async parseGenericRSS(rssUrl: string): Promise<ComicStrip[]> {
    try {
      const response = await fetch(this.CORS_PROXY + encodeURIComponent(rssUrl));
      const xml = await response.text();

      const parser = new DOMParser();
      const doc = parser.parseFromString(xml, 'text/xml');
      const items = doc.querySelectorAll('item');

      const strips: ComicStrip[] = [];
      items.forEach((item, index) => {
        const title = item.querySelector('title')?.textContent || '';
        const link = item.querySelector('link')?.textContent || '';
        const pubDate = item.querySelector('pubDate')?.textContent || '';
        const description = item.querySelector('description')?.textContent || '';

        // Try to extract image URL
        const imgMatch = description.match(/<img[^>]+src="([^">]+)"/);
        const imageUrl = imgMatch ? imgMatch[1] : '';

        if (link) {
          strips.push({
            number: index + 1,
            title,
            imageUrl,
            url: link,
            publishDate: pubDate ? new Date(pubDate) : new Date(),
            cached: false,
          });
        }
      });

      return strips;
    } catch (error) {
      console.error('Error parsing generic RSS:', error);
      return [];
    }
  }

  /**
   * Download and cache a comic strip image
   */
  async cacheStripImage(strip: ComicStrip): Promise<Blob> {
    try {
      const response = await fetch(this.CORS_PROXY + encodeURIComponent(strip.imageUrl));
      return await response.blob();
    } catch (error) {
      console.error('Error caching strip image:', error);
      throw new Error('Failed to cache comic strip image');
    }
  }

  /**
   * Download multiple strips in sequence
   */
  async downloadStrips(
    comic: Comic,
    startIndex: number,
    endIndex: number,
    onProgress?: (current: number, total: number) => void,
  ): Promise<void> {
    const strips = comic.strips.slice(startIndex, endIndex + 1);
    const total = strips.length;

    for (let i = 0; i < strips.length; i++) {
      try {
        await this.cacheStripImage(strips[i]);
        strips[i].cached = true;

        if (onProgress) {
          onProgress(i + 1, total);
        }

        // Small delay to avoid overwhelming the server
        await new Promise((resolve) => setTimeout(resolve, 500));
      } catch (error) {
        console.error(`Failed to download strip ${strips[i].number}:`, error);
      }
    }
  }

  /**
   * Check for new strips
   */
  async checkForUpdates(comic: Comic): Promise<number> {
    try {
      const freshComic = await this.fetchComic(comic.url);
      const newStrips = freshComic.strips.length - comic.strips.length;
      return Math.max(0, newStrips);
    } catch (error) {
      console.error('Failed to check for updates:', error);
      return 0;
    }
  }

  /**
   * Get strip by number
   */
  getStripByNumber(comic: Comic, number: number): ComicStrip | undefined {
    return comic.strips.find((strip) => strip.number === number);
  }

  /**
   * Get next strip
   */
  getNextStrip(comic: Comic, currentNumber: number): ComicStrip | undefined {
    const currentIndex = comic.strips.findIndex((s) => s.number === currentNumber);
    if (currentIndex === -1 || currentIndex === comic.strips.length - 1) {
      return undefined;
    }
    return comic.strips[currentIndex + 1];
  }

  /**
   * Get previous strip
   */
  getPreviousStrip(comic: Comic, currentNumber: number): ComicStrip | undefined {
    const currentIndex = comic.strips.findIndex((s) => s.number === currentNumber);
    if (currentIndex <= 0) {
      return undefined;
    }
    return comic.strips[currentIndex - 1];
  }
}

export default new WebComicService();

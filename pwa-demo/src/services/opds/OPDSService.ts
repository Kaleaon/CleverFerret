/**
 * OPDS Service - OPDS catalog browsing and downloading
 * Migrated from Android OPDS Service
 */

export interface OPDSCatalog {
  title: string;
  url: string;
  entries: OPDSEntry[];
}

export interface OPDSEntry {
  id: string;
  title: string;
  author?: string;
  summary?: string;
  links: OPDSLink[];
  thumbnail?: string;
}

export interface OPDSLink {
  href: string;
  type: string;
  rel: string;
}

export class OPDSService {
  private catalogs: Map<string, OPDSCatalog> = new Map();

  async fetchCatalog(url: string): Promise<OPDSCatalog> {
    try {
      const response = await fetch(url);
      const xmlText = await response.text();
      const parser = new DOMParser();
      const xmlDoc = parser.parseFromString(xmlText, 'text/xml');

      const feed = xmlDoc.querySelector('feed');
      if (!feed) {
        throw new Error('Invalid OPDS catalog');
      }

      const title = feed.querySelector('title')?.textContent || 'Unknown Catalog';

      const entries = Array.from(xmlDoc.querySelectorAll('entry')).map((entry) => {
        const id = entry.querySelector('id')?.textContent || '';
        const entryTitle = entry.querySelector('title')?.textContent || 'Untitled';
        const author = entry.querySelector('author name')?.textContent || undefined;
        const summary =
          entry.querySelector('summary')?.textContent ||
          entry.querySelector('content')?.textContent ||
          undefined;

        const links = Array.from(entry.querySelectorAll('link')).map((link) => ({
          href: link.getAttribute('href') || '',
          type: link.getAttribute('type') || '',
          rel: link.getAttribute('rel') || '',
        }));

        const thumbnail = links.find((l) => l.rel === 'http://opds-spec.org/image/thumbnail')?.href;

        return { id, title: entryTitle, author, summary, links, thumbnail };
      });

      const catalog: OPDSCatalog = { title, url, entries };
      this.catalogs.set(url, catalog);
      return catalog;
    } catch (error) {
      console.error('Failed to fetch OPDS catalog:', error);
      throw error;
    }
  }

  async downloadBook(entry: OPDSEntry): Promise<Blob | null> {
    const downloadLink = entry.links.find(
      (l) =>
        l.type.includes('epub') ||
        l.type.includes('pdf') ||
        l.rel === 'http://opds-spec.org/acquisition',
    );

    if (!downloadLink) {
      console.error('No download link found');
      return null;
    }

    try {
      const response = await fetch(downloadLink.href);
      return await response.blob();
    } catch (error) {
      console.error('Failed to download book:', error);
      return null;
    }
  }

  async searchCatalog(catalogUrl: string, query: string): Promise<OPDSEntry[]> {
    const searchUrl = `${catalogUrl}?q=${encodeURIComponent(query)}`;
    try {
      const catalog = await this.fetchCatalog(searchUrl);
      return catalog.entries;
    } catch (error) {
      console.error('Search failed:', error);
      return [];
    }
  }

  getCachedCatalog(url: string): OPDSCatalog | undefined {
    return this.catalogs.get(url);
  }
}

export default new OPDSService();

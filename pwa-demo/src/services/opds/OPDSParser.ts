/**
 * OPDS Parser
 *
 * Parses OPDS (Open Publication Distribution System) feeds
 */

import { logger } from '../logging';

export interface OPDSEntry {
  id: string;
  title: string;
  author?: string;
  summary?: string;
  coverUrl?: string;
  downloadUrl?: string;
  downloadType?: string;
  published?: string;
  updated?: string;
  language?: string;
  categories?: string[];
}

export interface OPDSFeed {
  title: string;
  id: string;
  updated?: string;
  entries: OPDSEntry[];
  links: OPDSLink[];
  nextPageUrl?: string;
}

export interface OPDSLink {
  rel: string;
  href: string;
  type?: string;
  title?: string;
}

class OPDSParserService {
  /**
   * Parse OPDS feed from URL
   */
  async parseFeed(url: string): Promise<OPDSFeed> {
    logger.info('OPDSParser', `Parsing OPDS feed: ${url}`);

    try {
      const response = await fetch(url, {
        headers: {
          Accept: 'application/atom+xml,application/xml,text/xml',
        },
      });

      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }

      const xml = await response.text();
      return this.parseXML(xml, url);
    } catch (error) {
      logger.error('OPDSParser', `Failed to parse feed: ${url}`, undefined, error as Error);
      throw error;
    }
  }

  /**
   * Parse OPDS XML
   */
  private parseXML(xml: string, baseUrl: string): OPDSFeed {
    const parser = new DOMParser();
    const doc = parser.parseFromString(xml, 'text/xml');

    // Check for parsing errors
    const parseError = doc.querySelector('parsererror');
    if (parseError) {
      throw new Error('Invalid XML');
    }

    const feed = doc.querySelector('feed');
    if (!feed) {
      throw new Error('No feed element found');
    }

    const title = this.getTextContent(feed, 'title') || 'Untitled Feed';
    const id = this.getTextContent(feed, 'id') || baseUrl;
    const updated = this.getTextContent(feed, 'updated');

    // Parse entries
    const entryElements = feed.querySelectorAll('entry');
    const entries: OPDSEntry[] = Array.from(entryElements).map((entry) =>
      this.parseEntry(entry, baseUrl),
    );

    // Parse links
    const linkElements = feed.querySelectorAll('link');
    const links: OPDSLink[] = Array.from(linkElements).map((link) => ({
      rel: link.getAttribute('rel') || 'alternate',
      href: this.resolveUrl(link.getAttribute('href') || '', baseUrl),
      type: link.getAttribute('type') || undefined,
      title: link.getAttribute('title') || undefined,
    }));

    const nextPageLink = links.find((l) => l.rel === 'next');
    const nextPageUrl = nextPageLink?.href;

    return {
      title,
      id,
      updated,
      entries,
      links,
      nextPageUrl,
    };
  }

  /**
   * Parse an entry element
   */
  private parseEntry(entry: Element, baseUrl: string): OPDSEntry {
    const id = this.getTextContent(entry, 'id') || '';
    const title = this.getTextContent(entry, 'title') || 'Untitled';

    // Authors
    const authors = entry.querySelectorAll('author');
    const author =
      authors.length > 0
        ? Array.from(authors)
            .map((a) => this.getTextContent(a, 'name'))
            .filter(Boolean)
            .join(', ')
        : undefined;

    // Summary
    const summary = this.getTextContent(entry, 'summary') || this.getTextContent(entry, 'content');

    // Links
    const links = entry.querySelectorAll('link');
    let coverUrl: string | undefined;
    let downloadUrl: string | undefined;
    let downloadType: string | undefined;

    Array.from(links).forEach((link) => {
      const rel = link.getAttribute('rel') || '';
      const href = link.getAttribute('href') || '';
      const type = link.getAttribute('type') || '';

      if (
        rel.includes('image') ||
        rel === 'http://opds-spec.org/image' ||
        rel === 'http://opds-spec.org/image/thumbnail'
      ) {
        coverUrl = this.resolveUrl(href, baseUrl);
      } else if (rel === 'http://opds-spec.org/acquisition' || rel.includes('acquisition')) {
        downloadUrl = this.resolveUrl(href, baseUrl);
        downloadType = type;
      }
    });

    // Published/Updated
    const published = this.getTextContent(entry, 'published');
    const updated = this.getTextContent(entry, 'updated');

    // Categories
    const categories = Array.from(entry.querySelectorAll('category'))
      .map((cat) => cat.getAttribute('term'))
      .filter((term): term is string => !!term);

    // Language
    const dcLanguage = entry.querySelector('dc\\:language, language');
    const language = dcLanguage?.textContent?.trim();

    return {
      id,
      title,
      author,
      summary,
      coverUrl,
      downloadUrl,
      downloadType,
      published,
      updated,
      language,
      categories,
    };
  }

  /**
   * Get text content of an element
   */
  private getTextContent(parent: Element, tagName: string): string | undefined {
    const element = parent.querySelector(tagName);
    return element?.textContent?.trim() || undefined;
  }

  /**
   * Resolve relative URL
   */
  private resolveUrl(href: string, baseUrl: string): string {
    try {
      return new URL(href, baseUrl).href;
    } catch {
      return href;
    }
  }

  /**
   * Search OPDS catalog
   */
  async search(catalogUrl: string, query: string): Promise<OPDSEntry[]> {
    logger.info('OPDSParser', `Searching OPDS catalog: ${query}`);

    try {
      // OPDS search typically uses query parameter
      const searchUrl = new URL(catalogUrl);
      searchUrl.searchParams.set('q', query);
      searchUrl.searchParams.set('searchTerm', query);

      const feed = await this.parseFeed(searchUrl.href);
      return feed.entries;
    } catch (error) {
      logger.error('OPDSParser', `Search failed: ${query}`, undefined, error as Error);
      throw error;
    }
  }
}

export const opdsParser = new OPDSParserService();

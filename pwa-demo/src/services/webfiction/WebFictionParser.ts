/**
 * Web Fiction Parser
 *
 * Parses web fiction URLs and extracts story information
 */

import { logger } from '../logging';

export interface StoryInfo {
  title: string;
  author: string;
  description?: string;
  chapterCount: number;
  chapters: ChapterInfo[];
  coverUrl?: string;
  site: string;
  url: string;
}

export interface ChapterInfo {
  title: string;
  url: string;
  number: number;
  content?: string;
}

export interface Parser {
  name: string;
  canParse(url: string): boolean;
  parseStory(url: string): Promise<StoryInfo>;
  parseChapter(url: string): Promise<ChapterInfo>;
}

class WebFictionParserService {
  private parsers: Parser[] = [];

  constructor() {
    this.registerDefaultParsers();
  }

  /**
   * Register a parser
   */
  registerParser(parser: Parser) {
    this.parsers.push(parser);
    logger.info('WebFictionParser', `Registered parser: ${parser.name}`);
  }

  /**
   * Register default parsers
   */
  private registerDefaultParsers() {
    this.registerParser(new ArchiveOfOurOwnParser());
    this.registerParser(new FanFictionNetParser());
    this.registerParser(new GenericParser());
  }

  /**
   * Find parser for URL
   */
  findParser(url: string): Parser | null {
    return this.parsers.find((p) => p.canParse(url)) || null;
  }

  /**
   * Parse story from URL
   */
  async parseStory(url: string): Promise<StoryInfo> {
    logger.info('WebFictionParser', `Parsing story: ${url}`);

    const parser = this.findParser(url);
    if (!parser) {
      throw new Error(`No parser available for URL: ${url}`);
    }

    try {
      const story = await parser.parseStory(url);
      logger.info('WebFictionParser', `Parsed story: ${story.title}`);
      return story;
    } catch (error) {
      logger.error('WebFictionParser', `Failed to parse story: ${url}`, undefined, error as Error);
      throw error;
    }
  }

  /**
   * Parse chapter from URL
   */
  async parseChapter(url: string): Promise<ChapterInfo> {
    logger.info('WebFictionParser', `Parsing chapter: ${url}`);

    const parser = this.findParser(url);
    if (!parser) {
      throw new Error(`No parser available for URL: ${url}`);
    }

    try {
      const chapter = await parser.parseChapter(url);
      return chapter;
    } catch (error) {
      logger.error(
        'WebFictionParser',
        `Failed to parse chapter: ${url}`,
        undefined,
        error as Error,
      );
      throw error;
    }
  }
}

/**
 * Archive of Our Own (AO3) parser
 */
class ArchiveOfOurOwnParser implements Parser {
  name = 'ArchiveOfOurOwn';

  canParse(url: string): boolean {
    return url.includes('archiveofourown.org') || url.includes('ao3.org');
  }

  async parseStory(url: string): Promise<StoryInfo> {
    // Note: AO3 has rate limiting and requires proper headers
    // This is a basic implementation
    const response = await fetch(url, {
      headers: {
        'User-Agent': 'CleverFerret/1.0',
      },
    });

    if (!response.ok) {
      throw new Error(`Failed to fetch: ${response.status}`);
    }

    const html = await response.text();
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');

    const title = doc.querySelector('h2.title')?.textContent?.trim() || 'Unknown Title';
    const author = doc.querySelector('a[rel="author"]')?.textContent?.trim() || 'Unknown Author';
    const description = doc.querySelector('.summary blockquote')?.textContent?.trim();
    const chapterLinks = Array.from(doc.querySelectorAll('ol.chapter.index li a'));
    const chapters: ChapterInfo[] = chapterLinks.map((link, index) => ({
      title: link.textContent?.trim() || `Chapter ${index + 1}`,
      url: new URL(link.getAttribute('href') || '', url).href,
      number: index + 1,
    }));

    return {
      title,
      author,
      description,
      chapterCount: chapters.length,
      chapters,
      site: 'Archive of Our Own',
      url,
    };
  }

  async parseChapter(url: string): Promise<ChapterInfo> {
    const response = await fetch(url, {
      headers: {
        'User-Agent': 'CleverFerret/1.0',
      },
    });

    if (!response.ok) {
      throw new Error(`Failed to fetch: ${response.status}`);
    }

    const html = await response.text();
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');

    const title = doc.querySelector('h3.title')?.textContent?.trim() || 'Unknown Chapter';
    const content = doc.querySelector('.chapter')?.innerHTML || '';

    return {
      title,
      url,
      number: 1, // Would need to extract from URL or page
      content,
    };
  }
}

/**
 * FanFiction.Net parser
 */
class FanFictionNetParser implements Parser {
  name = 'FanFictionNet';

  canParse(url: string): boolean {
    return url.includes('fanfiction.net');
  }

  async parseStory(url: string): Promise<StoryInfo> {
    // FanFiction.Net has strict anti-scraping measures
    // This is a placeholder implementation
    throw new Error(
      'FanFiction.Net parsing requires special handling due to anti-scraping measures',
    );
  }

  async parseChapter(url: string): Promise<ChapterInfo> {
    throw new Error('FanFiction.Net parsing requires special handling');
  }
}

/**
 * Generic parser for unknown sites
 */
class GenericParser implements Parser {
  name = 'Generic';

  canParse(_url: string): boolean {
    return true; // Fallback parser
  }

  async parseStory(url: string): Promise<StoryInfo> {
    // Basic generic parsing
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Failed to fetch: ${response.status}`);
    }

    const html = await response.text();
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');

    const title = doc.querySelector('title')?.textContent?.trim() || 'Unknown Title';

    // Try to find chapter links
    const links = Array.from(doc.querySelectorAll('a'));
    const chapterLinks = links.filter((link) => {
      const text = link.textContent?.toLowerCase() || '';
      const href = link.getAttribute('href') || '';
      return text.includes('chapter') || href.includes('chapter');
    });

    const chapters: ChapterInfo[] = chapterLinks.slice(0, 50).map((link, index) => ({
      title: link.textContent?.trim() || `Chapter ${index + 1}`,
      url: new URL(link.getAttribute('href') || '', url).href,
      number: index + 1,
    }));

    return {
      title,
      author: 'Unknown',
      chapterCount: chapters.length,
      chapters,
      site: new URL(url).hostname,
      url,
    };
  }

  async parseChapter(url: string): Promise<ChapterInfo> {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Failed to fetch: ${response.status}`);
    }

    const html = await response.text();
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');

    const title = doc.querySelector('title')?.textContent?.trim() || 'Unknown Chapter';
    const content = doc.querySelector('article, .content, main, .chapter')?.innerHTML || '';

    return {
      title,
      url,
      number: 1,
      content,
    };
  }
}

export const webFictionParser = new WebFictionParserService();

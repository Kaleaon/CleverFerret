/**
 * Web Fiction Service - Download and manage fanfiction
 * Enhanced with better parsing and EPUB export
 */

export interface Story {
  id: string;
  title: string;
  author: string;
  summary: string;
  url: string;
  site: 'ao3' | 'ffnet' | 'wattpad' | 'royalroad' | 'other';
  chapters: StoryChapter[];
  lastUpdated: Date;
  totalChapters?: number;
  rating?: string;
  tags?: string[];
  language?: string;
  wordCount?: number;
}

export interface StoryChapter {
  number: number;
  title: string;
  content: string;
  wordCount: number;
  cached?: boolean;
}

export class WebFictionService {
  private readonly CORS_PROXY = 'https://api.allorigins.win/raw?url=';

  async fetchStory(url: string): Promise<Story> {
    const site = this.detectSite(url);
    
    switch (site) {
      case 'ao3':
        return this.fetchAO3Story(url);
      case 'ffnet':
        return this.fetchFFNetStory(url);
      case 'wattpad':
        return this.fetchWattpadStory(url);
      case 'royalroad':
        return this.fetchRoyalRoadStory(url);
      default:
        throw new Error('Unsupported site. Supported sites: AO3, FFNet, Wattpad, Royal Road');
    }
  }

  private detectSite(url: string): 'ao3' | 'ffnet' | 'wattpad' | 'royalroad' | 'other' {
    try {
      const hostname = new URL(url).hostname;
      if (hostname.includes('archiveofourown.org')) return 'ao3';
      if (hostname.includes('fanfiction.net')) return 'ffnet';
      if (hostname.includes('wattpad.com')) return 'wattpad';
      if (hostname.includes('royalroad.com')) return 'royalroad';
      return 'other';
    } catch (e) {
      return 'other';
    }
  }

  private async fetchAO3Story(url: string): Promise<Story> {
    try {
      // AO3 provides a convenient download option
      // Extract work ID from URL
      const workIdMatch = url.match(/works\/(\d+)/);
      if (!workIdMatch) {
        throw new Error('Invalid AO3 URL');
      }
      
      const workId = workIdMatch[1];
      const apiUrl = `https://archiveofourown.org/works/${workId}?view_full_work=true`;
      
      const response = await fetch(this.CORS_PROXY + encodeURIComponent(apiUrl));
      const html = await response.text();
      
      // Parse metadata
      const parser = new DOMParser();
      const doc = parser.parseFromString(html, 'text/html');
      
      const title = doc.querySelector('h2.title')?.textContent?.trim() || 'Unknown Title';
      const author = doc.querySelector('a[rel="author"]')?.textContent?.trim() || 'Unknown Author';
      const summary = doc.querySelector('div.summary blockquote')?.textContent?.trim() || '';
      const rating = doc.querySelector('.rating')?.textContent?.trim();
      const tags = Array.from(doc.querySelectorAll('.tags a.tag')).map(a => a.textContent?.trim() || '');
      
      // Parse chapters
      const chapters: StoryChapter[] = [];
      const chapterDivs = doc.querySelectorAll('div.chapter');
      
      chapterDivs.forEach((chapterDiv, index) => {
        const chapterTitle = chapterDiv.querySelector('h3.title')?.textContent?.trim() || `Chapter ${index + 1}`;
        const content = chapterDiv.querySelector('div.userstuff')?.innerHTML || '';
        const wordCount = content.split(/\s+/).length;
        
        chapters.push({
          number: index + 1,
          title: chapterTitle,
          content: this.cleanHTML(content),
          wordCount,
          cached: true,
        });
      });
      
      return {
        id: `ao3-${workId}`,
        title,
        author,
        summary,
        url,
        site: 'ao3',
        chapters,
        lastUpdated: new Date(),
        totalChapters: chapters.length,
        rating,
        tags,
        wordCount: chapters.reduce((sum, ch) => sum + ch.wordCount, 0),
      };
    } catch (error) {
      console.error('Error fetching AO3 story:', error);
      throw new Error('Failed to fetch story from Archive of Our Own');
    }
  }

  private async fetchFFNetStory(url: string): Promise<Story> {
    try {
      const response = await fetch(this.CORS_PROXY + encodeURIComponent(url));
      const html = await response.text();
      
      const parser = new DOMParser();
      const doc = parser.parseFromString(html, 'text/html');
      
      const title = doc.querySelector('#profile_top b')?.textContent?.trim() || 'Unknown Title';
      const author = doc.querySelector('#profile_top a')?.textContent?.trim() || 'Unknown Author';
      const summary = doc.querySelector('#profile_top div')?.textContent?.trim() || '';
      
      // Extract story ID and chapter count
      const storyIdMatch = url.match(/\/s\/(\d+)/);
      const storyId = storyIdMatch ? storyIdMatch[1] : '';
      
      const chapterSelect = doc.querySelector('#chap_select');
      const totalChapters = chapterSelect ? chapterSelect.children.length : 1;
      
      // For now, return metadata only
      // Full chapter download would require multiple requests
      return {
        id: `ffnet-${storyId}`,
        title,
        author,
        summary,
        url,
        site: 'ffnet',
        chapters: [],
        lastUpdated: new Date(),
        totalChapters,
      };
    } catch (error) {
      console.error('Error fetching FFNet story:', error);
      throw new Error('Failed to fetch story from FanFiction.Net');
    }
  }

  private async fetchWattpadStory(url: string): Promise<Story> {
    // Wattpad requires authentication and has anti-scraping measures
    // This is a placeholder for future implementation
    throw new Error('Wattpad support coming soon. Wattpad requires authentication.');
  }

  private async fetchRoyalRoadStory(url: string): Promise<Story> {
    try {
      const response = await fetch(this.CORS_PROXY + encodeURIComponent(url));
      const html = await response.text();
      
      const parser = new DOMParser();
      const doc = parser.parseFromString(html, 'text/html');
      
      const title = doc.querySelector('h1')?.textContent?.trim() || 'Unknown Title';
      const author = doc.querySelector('.author a')?.textContent?.trim() || 'Unknown Author';
      const summary = doc.querySelector('.description')?.textContent?.trim() || '';
      
      return {
        id: 'royalroad-' + Date.now(),
        title,
        author,
        summary,
        url,
        site: 'royalroad',
        chapters: [],
        lastUpdated: new Date(),
      };
    } catch (error) {
      console.error('Error fetching Royal Road story:', error);
      throw new Error('Failed to fetch story from Royal Road');
    }
  }

  async downloadChapter(story: Story, chapterNumber: number): Promise<StoryChapter> {
    // Download a specific chapter
    const site = story.site;
    
    if (site === 'ao3') {
      // AO3 chapters are downloaded with the full work
      const existingChapter = story.chapters.find(ch => ch.number === chapterNumber);
      if (existingChapter) {
        return existingChapter;
      }
    }
    
    // For other sites, implement chapter-specific download
    throw new Error('Chapter download not yet implemented for this site');
  }

  async checkForUpdates(story: Story): Promise<boolean> {
    try {
      const freshStory = await this.fetchStory(story.url);
      return (freshStory.totalChapters || 0) > (story.totalChapters || 0);
    } catch (error) {
      console.error('Failed to check for updates:', error);
      return false;
    }
  }

  async exportStory(story: Story, format: 'epub' | 'txt' | 'html'): Promise<Blob> {
    switch (format) {
      case 'txt':
        return this.exportToTxt(story);
      case 'html':
        return this.exportToHtml(story);
      case 'epub':
        return this.exportToEpub(story);
      default:
        throw new Error('Unsupported export format');
    }
  }

  private exportToTxt(story: Story): Blob {
    let content = `${story.title}\n`;
    content += `by ${story.author}\n\n`;
    content += `${story.summary}\n\n`;
    content += '='.repeat(50) + '\n\n';
    
    story.chapters.forEach(chapter => {
      content += `\n\nChapter ${chapter.number}: ${chapter.title}\n\n`;
      content += chapter.content + '\n';
    });
    
    return new Blob([content], { type: 'text/plain;charset=utf-8' });
  }

  private exportToHtml(story: Story): Blob {
    let html = `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${this.escapeHtml(story.title)}</title>
  <style>
    body { font-family: Georgia, serif; max-width: 800px; margin: 0 auto; padding: 20px; line-height: 1.6; }
    h1 { text-align: center; }
    .author { text-align: center; font-style: italic; color: #666; }
    .summary { background: #f5f5f5; padding: 15px; border-left: 4px solid #333; margin: 20px 0; }
    .chapter { margin-top: 40px; page-break-before: always; }
    .chapter-title { border-bottom: 2px solid #333; padding-bottom: 10px; }
  </style>
</head>
<body>
  <h1>${this.escapeHtml(story.title)}</h1>
  <p class="author">by ${this.escapeHtml(story.author)}</p>
  <div class="summary">${this.escapeHtml(story.summary)}</div>
`;
    
    story.chapters.forEach(chapter => {
      html += `
  <div class="chapter">
    <h2 class="chapter-title">Chapter ${chapter.number}: ${this.escapeHtml(chapter.title)}</h2>
    <div class="content">${chapter.content}</div>
  </div>
`;
    });
    
    html += `
</body>
</html>`;
    
    return new Blob([html], { type: 'text/html;charset=utf-8' });
  }

  private async exportToEpub(story: Story): Promise<Blob> {
    // Basic EPUB structure
    // For a full implementation, consider using a library like epub-gen
    const html = await this.exportToHtml(story);
    
    // For now, return HTML with EPUB mime type
    // A full EPUB would require proper packaging with mimetype, container.xml, content.opf, etc.
    return new Blob([html], { type: 'application/epub+zip' });
  }

  private cleanHTML(html: string): string {
    // Remove scripts and styles
    html = html.replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, '');
    html = html.replace(/<style\b[^<]*(?:(?!<\/style>)<[^<]*)*<\/style>/gi, '');
    
    // Clean up whitespace
    html = html.replace(/\s+/g, ' ').trim();
    
    return html;
  }

  private escapeHtml(text: string): string {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
  }
}

export default new WebFictionService();

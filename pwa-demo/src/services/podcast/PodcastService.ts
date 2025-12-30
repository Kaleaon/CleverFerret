/**
 * Podcast Service - Podcast feed parsing and management
 * Migrated from Android Podcast Service
 */

export interface PodcastFeed {
  title: string;
  description: string;
  author: string;
  imageUrl?: string;
  feedUrl: string;
  episodes: PodcastEpisode[];
}

export interface PodcastEpisode {
  title: string;
  description: string;
  audioUrl: string;
  duration: number;
  pubDate: Date;
  guid: string;
}

export class PodcastService {
  async parseFeed(feedUrl: string): Promise<PodcastFeed> {
    try {
      const response = await fetch(feedUrl);
      const xmlText = await response.text();
      const parser = new DOMParser();
      const xmlDoc = parser.parseFromString(xmlText, 'text/xml');

      const channel = xmlDoc.querySelector('channel');
      if (!channel) {
        throw new Error('Invalid podcast feed');
      }

      const title = channel.querySelector('title')?.textContent || 'Unknown Podcast';
      const description = channel.querySelector('description')?.textContent || '';
      const author =
        channel.querySelector('author')?.textContent ||
        channel.querySelector('itunes\\:author')?.textContent ||
        'Unknown';
      const imageUrl =
        channel.querySelector('image url')?.textContent ||
        channel.querySelector('itunes\\:image')?.getAttribute('href') ||
        undefined;

      const items = Array.from(xmlDoc.querySelectorAll('item'));
      const episodes: PodcastEpisode[] = items.map((item) => ({
        title: item.querySelector('title')?.textContent || 'Untitled',
        description: item.querySelector('description')?.textContent || '',
        audioUrl: item.querySelector('enclosure')?.getAttribute('url') || '',
        duration: parseInt(item.querySelector('itunes\\:duration')?.textContent || '0'),
        pubDate: new Date(item.querySelector('pubDate')?.textContent || Date.now()),
        guid: item.querySelector('guid')?.textContent || Math.random().toString(),
      }));

      return { title, description, author, imageUrl, feedUrl, episodes };
    } catch (error) {
      console.error('Failed to parse podcast feed:', error);
      throw error;
    }
  }

  async subscribe(feedUrl: string): Promise<PodcastFeed> {
    const feed = await this.parseFeed(feedUrl);
    // Save to database
    localStorage.setItem(`podcast-${feedUrl}`, JSON.stringify(feed));
    return feed;
  }

  async unsubscribe(feedUrl: string): Promise<void> {
    localStorage.removeItem(`podcast-${feedUrl}`);
  }

  async getSubscriptions(): Promise<PodcastFeed[]> {
    const keys = Object.keys(localStorage).filter((k) => k.startsWith('podcast-'));
    return keys
      .map((key) => JSON.parse(localStorage.getItem(key) || '{}'))
      .filter((f) => f.feedUrl);
  }

  async downloadEpisode(episode: PodcastEpisode): Promise<void> {
    // Placeholder for episode download
    console.log('Downloading episode:', episode.title);
  }
}

export default new PodcastService();

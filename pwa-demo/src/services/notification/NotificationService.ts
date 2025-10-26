/**
 * Notification Service - Web Notifications API wrapper
 * Migrated from Android Notification Service
 */

export interface NotificationOptions {
  title: string;
  body: string;
  icon?: string;
  badge?: string;
  tag?: string;
  requireInteraction?: boolean;
}

export class NotificationService {
  async requestPermission(): Promise<boolean> {
    if (!('Notification' in window)) {
      console.warn('Notifications not supported');
      return false;
    }

    const permission = await Notification.requestPermission();
    return permission === 'granted';
  }

  hasPermission(): boolean {
    if (!('Notification' in window)) return false;
    return Notification.permission === 'granted';
  }

  async show(options: NotificationOptions): Promise<void> {
    if (!this.hasPermission()) {
      const granted = await this.requestPermission();
      if (!granted) {
        console.warn('Notification permission denied');
        return;
      }
    }

    new Notification(options.title, {
      body: options.body,
      icon: options.icon,
      badge: options.badge,
      tag: options.tag,
      requireInteraction: options.requireInteraction,
    });
  }

  async showDownloadComplete(filename: string): Promise<void> {
    await this.show({
      title: 'Download Complete',
      body: `${filename} has been downloaded successfully`,
      icon: '/icons/download.png',
      tag: 'download-complete',
    });
  }

  async showSyncComplete(): Promise<void> {
    await this.show({
      title: 'Sync Complete',
      body: 'Your library has been synchronized',
      icon: '/icons/sync.png',
      tag: 'sync-complete',
    });
  }

  async showNewEpisode(podcastName: string, episodeTitle: string): Promise<void> {
    await this.show({
      title: `New Episode: ${podcastName}`,
      body: episodeTitle,
      icon: '/icons/podcast.png',
      tag: 'new-episode',
    });
  }
}

export default new NotificationService();

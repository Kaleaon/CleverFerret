// Enhanced Sync Service for cross-platform synchronization
// Provides real-time sync with Android app and cloud services

import enhancedDB from './database-enhanced';
import { MediaItem, ReadingProgress, Collection, UserProfile } from '../types-enhanced';

interface SyncConfig {
  serverUrl?: string;
  apiKey?: string;
  deviceId: string;
  userId: string;
  syncInterval: number; // minutes
  conflictResolution: 'client' | 'server' | 'prompt';
}

interface SyncStatus {
  isOnline: boolean;
  lastSync: string | null;
  pendingUploads: number;
  pendingDownloads: number;
  conflicts: SyncConflict[];
  errors: string[];
}

interface SyncConflict {
  id: string;
  type: 'media_item' | 'reading_progress' | 'collection';
  clientVersion: any;
  serverVersion: any;
  timestamp: string;
}

interface CloudProvider {
  name: string;
  authenticate(): Promise<boolean>;
  uploadFile(file: File, path: string): Promise<string>;
  downloadFile(path: string): Promise<File>;
  deleteFile(path: string): Promise<void>;
  listFiles(directory?: string): Promise<string[]>;
}

// Cloud Storage Providers
class GoogleDriveProvider implements CloudProvider {
  name = 'Google Drive';
  private accessToken: string | null = null;

  async authenticate(): Promise<boolean> {
    // Implement Google OAuth2 flow
    console.log('Authenticating with Google Drive...');
    return false; // Placeholder
  }

  async uploadFile(file: File, path: string): Promise<string> {
    if (!this.accessToken) throw new Error('Not authenticated');
    // Implement Google Drive upload
    return `https://drive.google.com/file/d/example/${path}`;
  }

  async downloadFile(path: string): Promise<File> {
    if (!this.accessToken) throw new Error('Not authenticated');
    // Implement Google Drive download
    throw new Error('Not implemented');
  }

  async deleteFile(path: string): Promise<void> {
    if (!this.accessToken) throw new Error('Not authenticated');
    // Implement Google Drive delete
  }

  async listFiles(directory?: string): Promise<string[]> {
    if (!this.accessToken) throw new Error('Not authenticated');
    // Implement Google Drive list
    return [];
  }
}

class DropboxProvider implements CloudProvider {
  name = 'Dropbox';
  private accessToken: string | null = null;

  async authenticate(): Promise<boolean> {
    console.log('Authenticating with Dropbox...');
    return false; // Placeholder
  }

  async uploadFile(file: File, path: string): Promise<string> {
    if (!this.accessToken) throw new Error('Not authenticated');
    return `https://dropbox.com/file/${path}`;
  }

  async downloadFile(path: string): Promise<File> {
    if (!this.accessToken) throw new Error('Not authenticated');
    throw new Error('Not implemented');
  }

  async deleteFile(path: string): Promise<void> {
    if (!this.accessToken) throw new Error('Not authenticated');
  }

  async listFiles(directory?: string): Promise<string[]> {
    if (!this.accessToken) throw new Error('Not authenticated');
    return [];
  }
}

class EnhancedSyncService {
  private config: SyncConfig;
  private status: SyncStatus;
  private syncInterval: NodeJS.Timeout | null = null;
  private websocket: WebSocket | null = null;
  private cloudProvider: CloudProvider | null = null;
  private isInitialized = false;

  constructor() {
    this.config = {
      deviceId: this.generateDeviceId(),
      userId: 'default-user',
      syncInterval: 5, // 5 minutes
      conflictResolution: 'client'
    };

    this.status = {
      isOnline: navigator.onLine,
      lastSync: null,
      pendingUploads: 0,
      pendingDownloads: 0,
      conflicts: [],
      errors: []
    };

    this.setupNetworkListeners();
  }

  async initialize(config?: Partial<SyncConfig>): Promise<void> {
    if (this.isInitialized) return;

    if (config) {
      this.config = { ...this.config, ...config };
    }

    // Load sync configuration from database
    await this.loadSyncConfig();
    
    // Initialize cloud provider if configured
    await this.initializeCloudProvider();
    
    // Start sync if enabled
    if (await enhancedDB.getSetting('sync.enabled')) {
      await this.startSync();
    }

    this.isInitialized = true;
    console.log('Enhanced Sync Service initialized');
  }

  // Configuration Management
  async updateConfig(updates: Partial<SyncConfig>): Promise<void> {
    this.config = { ...this.config, ...updates };
    await this.saveSyncConfig();
    
    // Restart sync if running
    if (this.syncInterval) {
      this.stopSync();
      await this.startSync();
    }
  }

  async enableSync(serverUrl: string, apiKey?: string): Promise<void> {
    await this.updateConfig({ serverUrl, apiKey });
    await enhancedDB.setSetting('sync.enabled', true);
    await this.startSync();
  }

  async disableSync(): Promise<void> {
    await enhancedDB.setSetting('sync.enabled', false);
    this.stopSync();
  }

  // Cloud Provider Management
  async setCloudProvider(provider: 'google-drive' | 'dropbox'): Promise<boolean> {
    try {
      switch (provider) {
        case 'google-drive':
          this.cloudProvider = new GoogleDriveProvider();
          break;
        case 'dropbox':
          this.cloudProvider = new DropboxProvider();
          break;
        default:
          throw new Error(`Unsupported provider: ${provider}`);
      }

      const authenticated = await this.cloudProvider.authenticate();
      if (authenticated) {
        await enhancedDB.setSetting('cloud.provider', provider);
        return true;
      } else {
        this.cloudProvider = null;
        return false;
      }
    } catch (error) {
      console.error('Failed to set cloud provider:', error);
      this.cloudProvider = null;
      return false;
    }
  }

  // Sync Control
  async startSync(): Promise<void> {
    if (this.syncInterval) return; // Already running

    // Perform initial sync
    await this.performFullSync();

    // Set up periodic sync
    this.syncInterval = setInterval(async () => {
      await this.performIncrementalSync();
    }, this.config.syncInterval * 60 * 1000);

    // Set up real-time sync if WebSocket is available
    await this.initializeRealtimeSync();

    console.log(`Sync started with ${this.config.syncInterval} minute interval`);
  }

  stopSync(): void {
    if (this.syncInterval) {
      clearInterval(this.syncInterval);
      this.syncInterval = null;
    }

    if (this.websocket) {
      this.websocket.close();
      this.websocket = null;
    }

    console.log('Sync stopped');
  }

  // Full Synchronization
  async performFullSync(): Promise<void> {
    if (!this.status.isOnline || !this.config.serverUrl) {
      console.log('Cannot sync: offline or no server configured');
      return;
    }

    try {
      console.log('Starting full synchronization...');
      
      // Get local data
      const [localMediaItems, localProgress, localCollections] = await Promise.all([
        enhancedDB.getAllMediaItems(),
        enhancedDB.getAllReadingProgress(),
        enhancedDB.getAllCollections()
      ]);

      // Get server data
      const serverData = await this.fetchServerData();

      // Sync media items
      await this.syncMediaItems(localMediaItems, serverData.mediaItems);
      
      // Sync reading progress
      await this.syncReadingProgress(localProgress, serverData.readingProgress);
      
      // Sync collections
      await this.syncCollections(localCollections, serverData.collections);

      // Upload pending changes
      await this.uploadPendingChanges();

      // Update sync status
      this.status.lastSync = new Date().toISOString();
      await enhancedDB.setSetting('sync.lastSync', this.status.lastSync);

      console.log('Full synchronization completed successfully');
    } catch (error) {
      console.error('Full sync failed:', error);
      this.status.errors.push(`Full sync failed: ${(error as Error).message}`);
    }
  }

  // Incremental Synchronization
  async performIncrementalSync(): Promise<void> {
    if (!this.status.isOnline || !this.config.serverUrl) return;

    try {
      const lastSync = this.status.lastSync;
      if (!lastSync) {
        await this.performFullSync();
        return;
      }

      console.log('Starting incremental synchronization...');
      
      // Get changes since last sync
      const changes = await this.fetchServerChanges(lastSync);
      
      // Apply server changes
      await this.applyServerChanges(changes);
      
      // Upload local changes
      await this.uploadPendingChanges();

      // Update sync timestamp
      this.status.lastSync = new Date().toISOString();
      await enhancedDB.setSetting('sync.lastSync', this.status.lastSync);

      console.log('Incremental synchronization completed');
    } catch (error) {
      console.error('Incremental sync failed:', error);
      this.status.errors.push(`Incremental sync failed: ${(error as Error).message}`);
    }
  }

  // Real-time Sync
  private async initializeRealtimeSync(): Promise<void> {
    if (!this.config.serverUrl) return;

    try {
      const wsUrl = this.config.serverUrl.replace(/^http/, 'ws') + '/sync/realtime';
      this.websocket = new WebSocket(wsUrl);

      this.websocket.onopen = () => {
        console.log('Real-time sync connected');
        
        // Send authentication
        this.websocket?.send(JSON.stringify({
          type: 'auth',
          deviceId: this.config.deviceId,
          userId: this.config.userId,
          apiKey: this.config.apiKey
        }));
      };

      this.websocket.onmessage = (event) => {
        const message = JSON.parse(event.data);
        this.handleRealtimeMessage(message);
      };

      this.websocket.onerror = (error) => {
        console.error('WebSocket error:', error);
      };

      this.websocket.onclose = () => {
        console.log('Real-time sync disconnected');
        // Attempt reconnection after delay
        setTimeout(() => {
          if (this.syncInterval) { // Only if sync is still enabled
            this.initializeRealtimeSync();
          }
        }, 30000);
      };
    } catch (error) {
      console.error('Failed to initialize real-time sync:', error);
    }
  }

  // Conflict Resolution
  async resolveConflicts(): Promise<void> {
    const conflicts = this.status.conflicts;
    if (conflicts.length === 0) return;

    for (const conflict of conflicts) {
      try {
        let resolution;
        
        switch (this.config.conflictResolution) {
          case 'client':
            resolution = conflict.clientVersion;
            break;
          case 'server':
            resolution = conflict.serverVersion;
            break;
          case 'prompt':
            resolution = await this.promptUserForResolution(conflict);
            break;
        }

        await this.applyConflictResolution(conflict, resolution);
        
        // Remove resolved conflict
        this.status.conflicts = this.status.conflicts.filter(c => c.id !== conflict.id);
      } catch (error) {
        console.error(`Failed to resolve conflict ${conflict.id}:`, error);
      }
    }
  }

  // File Sync
  async syncFile(mediaItem: MediaItem): Promise<string | null> {
    if (!this.cloudProvider || !mediaItem.localPath) {
      return null;
    }

    try {
      // Get file from local path
      const response = await fetch(mediaItem.localPath);
      const blob = await response.blob();
      const file = new File([blob], mediaItem.title, { type: blob.type });
      
      // Upload to cloud
      const cloudPath = `media/${mediaItem.id}/${file.name}`;
      const cloudUrl = await this.cloudProvider.uploadFile(file, cloudPath);
      
      // Update media item with cloud URL
      await enhancedDB.updateMediaItem(mediaItem.id, { cloudUrl });
      
      return cloudUrl;
    } catch (error) {
      console.error(`Failed to sync file for ${mediaItem.title}:`, error);
      return null;
    }
  }

  async downloadFile(mediaItem: MediaItem): Promise<string | null> {
    if (!this.cloudProvider || !mediaItem.cloudUrl) {
      return null;
    }

    try {
      const cloudPath = mediaItem.cloudUrl.split('/').pop() || '';
      const file = await this.cloudProvider.downloadFile(cloudPath);
      
      // Create local URL
      const localUrl = URL.createObjectURL(file);
      
      // Update media item with local path
      await enhancedDB.updateMediaItem(mediaItem.id, { localPath: localUrl });
      
      return localUrl;
    } catch (error) {
      console.error(`Failed to download file for ${mediaItem.title}:`, error);
      return null;
    }
  }

  // Status and Monitoring
  getStatus(): SyncStatus {
    return { ...this.status };
  }

  async getSyncStats(): Promise<{
    totalItems: number;
    syncedItems: number;
    pendingSync: number;
    lastSyncTime: string | null;
    cloudStorageUsed: number;
    syncErrors: number;
  }> {
    const allItems = await enhancedDB.getAllMediaItems();
    const syncedItems = allItems.filter(item => item.cloudUrl).length;
    
    return {
      totalItems: allItems.length,
      syncedItems,
      pendingSync: this.status.pendingUploads + this.status.pendingDownloads,
      lastSyncTime: this.status.lastSync,
      cloudStorageUsed: 0, // Would calculate from cloud provider
      syncErrors: this.status.errors.length
    };
  }

  // Private methods
  private generateDeviceId(): string {
    // Generate or retrieve device ID from localStorage
    let deviceId = localStorage.getItem('cleverferret-device-id');
    if (!deviceId) {
      deviceId = `pwa-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
      localStorage.setItem('cleverferret-device-id', deviceId);
    }
    return deviceId;
  }

  private setupNetworkListeners(): void {
    window.addEventListener('online', () => {
      this.status.isOnline = true;
      console.log('Network connection restored');
      
      // Trigger sync when coming back online
      if (this.syncInterval) {
        this.performIncrementalSync();
      }
    });

    window.addEventListener('offline', () => {
      this.status.isOnline = false;
      console.log('Network connection lost');
    });
  }

  private async loadSyncConfig(): Promise<void> {
    const [serverUrl, apiKey, syncInterval, conflictResolution] = await Promise.all([
      enhancedDB.getSetting('sync.serverUrl'),
      enhancedDB.getSetting('sync.apiKey'),
      enhancedDB.getSetting('sync.interval'),
      enhancedDB.getSetting('sync.conflictResolution')
    ]);

    if (serverUrl) this.config.serverUrl = serverUrl;
    if (apiKey) this.config.apiKey = apiKey;
    if (syncInterval) this.config.syncInterval = syncInterval;
    if (conflictResolution) this.config.conflictResolution = conflictResolution;
  }

  private async saveSyncConfig(): Promise<void> {
    await Promise.all([
      enhancedDB.setSetting('sync.serverUrl', this.config.serverUrl),
      enhancedDB.setSetting('sync.apiKey', this.config.apiKey),
      enhancedDB.setSetting('sync.interval', this.config.syncInterval),
      enhancedDB.setSetting('sync.conflictResolution', this.config.conflictResolution)
    ]);
  }

  private async initializeCloudProvider(): Promise<void> {
    const provider = await enhancedDB.getSetting('cloud.provider');
    if (provider) {
      await this.setCloudProvider(provider);
    }
  }

  private async fetchServerData(): Promise<{
    mediaItems: MediaItem[];
    readingProgress: ReadingProgress[];
    collections: Collection[];
  }> {
    if (!this.config.serverUrl) {
      throw new Error('No server URL configured');
    }

    const response = await fetch(`${this.config.serverUrl}/api/sync/full`, {
      headers: {
        'Authorization': `Bearer ${this.config.apiKey}`,
        'Device-ID': this.config.deviceId
      }
    });

    if (!response.ok) {
      throw new Error(`Server returned ${response.status}: ${response.statusText}`);
    }

    return await response.json();
  }

  private async fetchServerChanges(since: string): Promise<any> {
    if (!this.config.serverUrl) {
      throw new Error('No server URL configured');
    }

    const response = await fetch(`${this.config.serverUrl}/api/sync/changes?since=${since}`, {
      headers: {
        'Authorization': `Bearer ${this.config.apiKey}`,
        'Device-ID': this.config.deviceId
      }
    });

    if (!response.ok) {
      throw new Error(`Server returned ${response.status}: ${response.statusText}`);
    }

    return await response.json();
  }

  private async syncMediaItems(local: MediaItem[], server: MediaItem[]): Promise<void> {
    // Simple sync logic - in production would be more sophisticated
    const serverMap = new Map(server.map(item => [item.id, item]));
    
    for (const localItem of local) {
      const serverItem = serverMap.get(localItem.id);
      if (!serverItem) {
        // Local item doesn't exist on server - upload
        this.status.pendingUploads++;
      } else {
        // Check for conflicts based on modification dates
        const localDate = new Date(localItem.dateAdded);
        const serverDate = new Date(serverItem.dateAdded);
        
        if (localDate > serverDate) {
          // Local is newer - upload
          this.status.pendingUploads++;
        } else if (serverDate > localDate) {
          // Server is newer - download
          await enhancedDB.updateMediaItem(localItem.id, serverItem);
        }
      }
    }
    
    // Add server items that don't exist locally
    for (const serverItem of server) {
      const localExists = local.some(item => item.id === serverItem.id);
      if (!localExists) {
        await enhancedDB.addMediaItem(serverItem);
      }
    }
  }

  private async syncReadingProgress(local: ReadingProgress[], server: ReadingProgress[]): Promise<void> {
    // Similar logic to media items sync
    // Implementation would merge progress data intelligently
  }

  private async syncCollections(local: Collection[], server: Collection[]): Promise<void> {
    // Similar logic to media items sync
    // Implementation would handle collection merging
  }

  private async uploadPendingChanges(): Promise<void> {
    const pending = await enhancedDB.getPendingSyncItems();
    
    for (const item of pending) {
      try {
        await this.uploadChange(item);
        await enhancedDB.markSyncItemCompleted(item.id);
        this.status.pendingUploads = Math.max(0, this.status.pendingUploads - 1);
      } catch (error) {
        console.error(`Failed to upload change ${item.id}:`, error);
      }
    }
  }

  private async uploadChange(change: any): Promise<void> {
    if (!this.config.serverUrl) return;

    const response = await fetch(`${this.config.serverUrl}/api/sync/change`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.config.apiKey}`,
        'Device-ID': this.config.deviceId
      },
      body: JSON.stringify(change)
    });

    if (!response.ok) {
      throw new Error(`Failed to upload change: ${response.status}`);
    }
  }

  private async applyServerChanges(changes: any): Promise<void> {
    // Apply changes received from server
    // Implementation would handle different change types
  }

  private handleRealtimeMessage(message: any): void {
    switch (message.type) {
      case 'change':
        this.applyRealtimeChange(message.data);
        break;
      case 'conflict':
        this.status.conflicts.push(message.data);
        break;
      default:
        console.log('Unknown real-time message:', message);
    }
  }

  private async applyRealtimeChange(change: any): Promise<void> {
    // Apply real-time changes from other devices
    // Implementation would update local database
  }

  private async promptUserForResolution(conflict: SyncConflict): Promise<any> {
    // In a real implementation, this would show a UI dialog
    // For now, default to client version
    return conflict.clientVersion;
  }

  private async applyConflictResolution(conflict: SyncConflict, resolution: any): Promise<void> {
    // Apply the chosen resolution
    switch (conflict.type) {
      case 'media_item':
        await enhancedDB.updateMediaItem(conflict.id, resolution);
        break;
      case 'reading_progress':
        await enhancedDB.updateReadingProgress(resolution);
        break;
      case 'collection':
        await enhancedDB.updateCollection(conflict.id, resolution);
        break;
    }
  }
}

// Export singleton instance
export const enhancedSync = new EnhancedSyncService();
export { EnhancedSyncService };
export default enhancedSync;
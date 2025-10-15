/**
 * Permissions handler for PWA
 * Web equivalent of Android PermissionsHandler.kt
 * Handles Web API permissions (notifications, storage, media devices)
 */

export enum PermissionType {
  NOTIFICATIONS = 'notifications',
  STORAGE = 'persistent-storage',
  CAMERA = 'camera',
  MICROPHONE = 'microphone',
  GEOLOCATION = 'geolocation',
}

export interface PermissionStatus {
  granted: boolean;
  denied: boolean;
  prompt: boolean;
}

class PermissionsHandlerClass {
  /**
   * Check if notifications permission is granted
   */
  async hasNotificationPermission(): Promise<boolean> {
    if (!('Notification' in window)) {
      return false;
    }
    return Notification.permission === 'granted';
  }

  /**
   * Request notifications permission
   */
  async requestNotificationPermission(): Promise<boolean> {
    if (!('Notification' in window)) {
      console.warn('Notifications not supported');
      return false;
    }

    if (Notification.permission === 'granted') {
      return true;
    }

    if (Notification.permission === 'denied') {
      return false;
    }

    try {
      const permission = await Notification.requestPermission();
      return permission === 'granted';
    } catch (error) {
      console.error('Failed to request notification permission:', error);
      return false;
    }
  }

  /**
   * Check if persistent storage is granted
   */
  async hasStoragePermission(): Promise<boolean> {
    if (!navigator.storage || !navigator.storage.persisted) {
      return false;
    }

    try {
      return await navigator.storage.persisted();
    } catch (error) {
      console.error('Failed to check storage permission:', error);
      return false;
    }
  }

  /**
   * Request persistent storage permission
   */
  async requestStoragePermission(): Promise<boolean> {
    if (!navigator.storage || !navigator.storage.persist) {
      console.warn('Persistent storage not supported');
      return false;
    }

    try {
      return await navigator.storage.persist();
    } catch (error) {
      console.error('Failed to request storage permission:', error);
      return false;
    }
  }

  /**
   * Check camera permission
   */
  async hasCameraPermission(): Promise<boolean> {
    if (!navigator.permissions) {
      return false;
    }

    try {
      const result = await navigator.permissions.query({ name: 'camera' as PermissionName });
      return result.state === 'granted';
    } catch (error) {
      return false;
    }
  }

  /**
   * Check microphone permission
   */
  async hasMicrophonePermission(): Promise<boolean> {
    if (!navigator.permissions) {
      return false;
    }

    try {
      const result = await navigator.permissions.query({ name: 'microphone' as PermissionName });
      return result.state === 'granted';
    } catch (error) {
      return false;
    }
  }

  /**
   * Request media permissions (camera/microphone)
   */
  async requestMediaPermissions(video: boolean = true, audio: boolean = true): Promise<boolean> {
    if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
      console.warn('Media devices not supported');
      return false;
    }

    try {
      const constraints: MediaStreamConstraints = {};
      if (video) constraints.video = true;
      if (audio) constraints.audio = true;

      const stream = await navigator.mediaDevices.getUserMedia(constraints);
      
      // Stop all tracks immediately - we just wanted to trigger permission
      stream.getTracks().forEach((track) => track.stop());
      
      return true;
    } catch (error) {
      console.error('Failed to request media permissions:', error);
      return false;
    }
  }

  /**
   * Check geolocation permission
   */
  async hasGeolocationPermission(): Promise<boolean> {
    if (!navigator.permissions) {
      return false;
    }

    try {
      const result = await navigator.permissions.query({ name: 'geolocation' as PermissionName });
      return result.state === 'granted';
    } catch (error) {
      return false;
    }
  }

  /**
   * Request all recommended permissions for the app
   */
  async requestAllPermissions(): Promise<{
    notifications: boolean;
    storage: boolean;
  }> {
    const results = {
      notifications: await this.requestNotificationPermission(),
      storage: await this.requestStoragePermission(),
    };

    return results;
  }

  /**
   * Check if all recommended permissions are granted
   */
  async hasAllPermissions(): Promise<boolean> {
    const notifications = await this.hasNotificationPermission();
    const storage = await this.hasStoragePermission();
    return notifications && storage;
  }

  /**
   * Get storage quota information
   */
  async getStorageQuota(): Promise<{
    usage: number;
    quota: number;
    percentage: number;
  } | null> {
    if (!navigator.storage || !navigator.storage.estimate) {
      return null;
    }

    try {
      const estimate = await navigator.storage.estimate();
      const usage = estimate.usage || 0;
      const quota = estimate.quota || 0;
      const percentage = quota > 0 ? (usage / quota) * 100 : 0;

      return { usage, quota, percentage };
    } catch (error) {
      console.error('Failed to get storage quota:', error);
      return null;
    }
  }
}

export const PermissionsHandler = new PermissionsHandlerClass();

/**
 * Device information and capabilities detection
 * Web equivalent of Android Build class functionality
 */

export interface DeviceInfo {
  platform: 'web' | 'android' | 'ios' | 'windows' | 'mac' | 'linux';
  browser: string;
  browserVersion: string;
  isMobile: boolean;
  isTablet: boolean;
  isDesktop: boolean;
  screenWidth: number;
  screenHeight: number;
  devicePixelRatio: number;
  touchSupported: boolean;
  online: boolean;
}

export interface DeviceCapabilities {
  notifications: boolean;
  serviceWorker: boolean;
  indexedDB: boolean;
  localStorage: boolean;
  webAudio: boolean;
  mediaSession: boolean;
  webShare: boolean;
  fileSystemAccess: boolean;
  webSpeech: boolean;
  webCrypto: boolean;
}

class DeviceInfoClass {
  private deviceInfo: DeviceInfo | null = null;
  private capabilities: DeviceCapabilities | null = null;

  /**
   * Get device information
   */
  getDeviceInfo(): DeviceInfo {
    if (this.deviceInfo) {
      return this.deviceInfo;
    }

    const ua = navigator.userAgent;
    const platform = this.detectPlatform(ua);
    const { browser, version } = this.detectBrowser(ua);

    this.deviceInfo = {
      platform,
      browser,
      browserVersion: version,
      isMobile: this.isMobileDevice(ua),
      isTablet: this.isTabletDevice(ua),
      isDesktop: !this.isMobileDevice(ua) && !this.isTabletDevice(ua),
      screenWidth: window.screen.width,
      screenHeight: window.screen.height,
      devicePixelRatio: window.devicePixelRatio || 1,
      touchSupported: 'ontouchstart' in window || navigator.maxTouchPoints > 0,
      online: navigator.onLine,
    };

    return this.deviceInfo;
  }

  /**
   * Get device capabilities
   */
  getCapabilities(): DeviceCapabilities {
    if (this.capabilities) {
      return this.capabilities;
    }

    this.capabilities = {
      notifications: 'Notification' in window,
      serviceWorker: 'serviceWorker' in navigator,
      indexedDB: 'indexedDB' in window,
      localStorage: this.checkLocalStorage(),
      webAudio: 'AudioContext' in window || 'webkitAudioContext' in window,
      mediaSession: 'mediaSession' in navigator,
      webShare: 'share' in navigator,
      fileSystemAccess: 'showOpenFilePicker' in window,
      webSpeech: 'speechSynthesis' in window,
      webCrypto: 'crypto' in window && 'subtle' in window.crypto,
    };

    return this.capabilities;
  }

  /**
   * Detect platform from user agent
   */
  private detectPlatform(ua: string): DeviceInfo['platform'] {
    if (/android/i.test(ua)) return 'android';
    if (/iPad|iPhone|iPod/.test(ua)) return 'ios';
    if (/Win/i.test(ua)) return 'windows';
    if (/Mac/i.test(ua)) return 'mac';
    if (/Linux/i.test(ua)) return 'linux';
    return 'web';
  }

  /**
   * Detect browser and version
   */
  private detectBrowser(ua: string): { browser: string; version: string } {
    let browser = 'Unknown';
    let version = '';

    if (ua.includes('Firefox/')) {
      browser = 'Firefox';
      version = ua.split('Firefox/')[1]?.split(' ')[0] || '';
    } else if (ua.includes('Edg/')) {
      browser = 'Edge';
      version = ua.split('Edg/')[1]?.split(' ')[0] || '';
    } else if (ua.includes('Chrome/')) {
      browser = 'Chrome';
      version = ua.split('Chrome/')[1]?.split(' ')[0] || '';
    } else if (ua.includes('Safari/')) {
      browser = 'Safari';
      version = ua.split('Version/')[1]?.split(' ')[0] || '';
    }

    return { browser, version };
  }

  /**
   * Check if device is mobile
   */
  private isMobileDevice(ua: string): boolean {
    return /Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i.test(ua);
  }

  /**
   * Check if device is tablet
   */
  private isTabletDevice(ua: string): boolean {
    return /iPad|Android(?!.*Mobile)/i.test(ua);
  }

  /**
   * Check localStorage availability
   */
  private checkLocalStorage(): boolean {
    try {
      const test = '__storage_test__';
      localStorage.setItem(test, test);
      localStorage.removeItem(test);
      return true;
    } catch (e) {
      return false;
    }
  }

  /**
   * Check if running in PWA mode
   */
  isPWA(): boolean {
    return (
      window.matchMedia('(display-mode: standalone)').matches ||
      (window.navigator as any).standalone === true
    );
  }

  /**
   * Get network information
   */
  getNetworkInfo(): {
    type: string;
    effectiveType: string;
    downlink: number;
    rtt: number;
  } | null {
    const connection =
      (navigator as any).connection ||
      (navigator as any).mozConnection ||
      (navigator as any).webkitConnection;

    if (!connection) {
      return null;
    }

    return {
      type: connection.type || 'unknown',
      effectiveType: connection.effectiveType || 'unknown',
      downlink: connection.downlink || 0,
      rtt: connection.rtt || 0,
    };
  }

  /**
   * Check if device has good connectivity
   */
  hasGoodConnectivity(): boolean {
    const networkInfo = this.getNetworkInfo();
    if (!networkInfo) {
      return navigator.onLine;
    }

    // Consider 4g, wifi, or unknown (desktop) as good connectivity
    return (
      networkInfo.effectiveType === '4g' ||
      networkInfo.type === 'wifi' ||
      networkInfo.type === 'unknown'
    );
  }
}

export const DeviceInfo = new DeviceInfoClass();

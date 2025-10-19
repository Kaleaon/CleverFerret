import React from 'react';
import { createRoot } from 'react-dom/client';
import EnhancedApp from './App-Enhanced';
import enhancedDB from './services/database-enhanced';
import enhancedFileSystem from './services/file-system-enhanced';
import enhancedSync from './services/sync-enhanced';
import './index-enhanced.css';

// Enhanced initialization with proper error handling and performance monitoring
class AppInitializer {
  private static instance: AppInitializer;
  private initialized = false;
  private initPromise: Promise<void> | null = null;

  static getInstance(): AppInitializer {
    if (!AppInitializer.instance) {
      AppInitializer.instance = new AppInitializer();
    }
    return AppInitializer.instance;
  }

  async initialize(): Promise<void> {
    if (this.initialized) return;
    if (this.initPromise) return this.initPromise;

    this.initPromise = this._doInitialize();
    await this.initPromise;
  }

  private async _doInitialize(): Promise<void> {
    try {
      console.log('🚀 Initializing Enhanced CleverFerret PWA...');
      
      // Show loading screen if available
      const startTime = performance.now();
      
      // Initialize core services in parallel
      await Promise.all([
        this.initializeDatabase(),
        this.initializeFileSystem(),
        this.initializeSync(),
        this.registerServiceWorker(),
        this.setupErrorReporting(),
        this.setupPerformanceMonitoring()
      ]);

      // Additional setup
      await Promise.all([
        this.loadUserSettings(),
        this.setupKeyboardShortcuts(),
        this.initializeAnalytics()
      ]);

      const endTime = performance.now();
      console.log(`✅ App initialized successfully in ${Math.round(endTime - startTime)}ms`);
      
      this.initialized = true;
    } catch (error) {
      console.error('❌ App initialization failed:', error);
      this.showErrorScreen(error as Error);
      throw error;
    }
  }

  private async initializeDatabase(): Promise<void> {
    try {
      await enhancedDB.initialize();
      console.log('📦 Database initialized');
    } catch (error) {
      console.error('Database initialization failed:', error);
      throw new Error('Failed to initialize database');
    }
  }

  private async initializeFileSystem(): Promise<void> {
    try {
      // File system service doesn't need explicit initialization
      console.log('📁 File system service ready');
    } catch (error) {
      console.error('File system initialization failed:', error);
      // Non-critical, don't throw
    }
  }

  private async initializeSync(): Promise<void> {
    try {
      await enhancedSync.initialize();
      console.log('🔄 Sync service initialized');
    } catch (error) {
      console.error('Sync initialization failed:', error);
      // Non-critical, don't throw
    }
  }

  private async registerServiceWorker(): Promise<void> {
    if (!('serviceWorker' in navigator)) {
      console.warn('Service Worker not supported');
      return;
    }

    try {
      const registration = await navigator.serviceWorker.register('/src/enhanced-sw.js', {
        scope: '/'
      });
      
      console.log('🔧 Service Worker registered:', registration);

      // Handle updates
      registration.addEventListener('updatefound', () => {
        const newWorker = registration.installing;
        if (newWorker) {
          newWorker.addEventListener('statechange', () => {
            if (newWorker.state === 'installed' && navigator.serviceWorker.controller) {
              this.showUpdateAvailable(registration);
            }
          });
        }
      });

      // Listen for messages from service worker
      navigator.serviceWorker.addEventListener('message', (event) => {
        this.handleServiceWorkerMessage(event.data);
      });

    } catch (error) {
      console.error('Service Worker registration failed:', error);
    }
  }

  private async setupErrorReporting(): Promise<void> {
    // Global error handlers
    window.addEventListener('error', (event) => {
      this.reportError({
        message: event.message,
        filename: event.filename,
        lineno: event.lineno,
        colno: event.colno,
        error: event.error
      });
    });

    window.addEventListener('unhandledrejection', (event) => {
      this.reportError({
        message: 'Unhandled Promise Rejection',
        error: event.reason
      });
    });

    console.log('🛡️ Error reporting setup complete');
  }

  private async setupPerformanceMonitoring(): Promise<void> {
    if (!('PerformanceObserver' in window)) return;

    try {
      // Monitor navigation timing
      const navObserver = new PerformanceObserver((list) => {
        for (const entry of list.getEntries()) {
          if (entry.entryType === 'navigation') {
            const navEntry = entry as PerformanceNavigationTiming;
            this.reportPerformance({
              type: 'navigation',
              domContentLoaded: navEntry.domContentLoadedEventEnd - navEntry.domContentLoadedEventStart,
              loadComplete: navEntry.loadEventEnd - navEntry.loadEventStart,
              firstByte: navEntry.responseStart - navEntry.requestStart
            });
          }
        }
      });
      navObserver.observe({ entryTypes: ['navigation'] });

      // Monitor paint timing
      const paintObserver = new PerformanceObserver((list) => {
        for (const entry of list.getEntries()) {
          this.reportPerformance({
            type: 'paint',
            name: entry.name,
            startTime: entry.startTime
          });
        }
      });
      paintObserver.observe({ entryTypes: ['paint'] });

      console.log('📊 Performance monitoring setup complete');
    } catch (error) {
      console.error('Performance monitoring setup failed:', error);
    }
  }

  private async loadUserSettings(): Promise<void> {
    try {
      // Load user preferences and theme
      const theme = await enhancedDB.getSetting('app.theme') || 'Navy & Gold';
      const language = await enhancedDB.getSetting('app.language') || 'en';
      
      // Apply theme
      document.documentElement.setAttribute('data-theme', theme);
      document.documentElement.setAttribute('lang', language);
      
      console.log('⚙️ User settings loaded');
    } catch (error) {
      console.error('Failed to load user settings:', error);
    }
  }

  private async setupKeyboardShortcuts(): Promise<void> {
    document.addEventListener('keydown', (event) => {
      // Global keyboard shortcuts
      if (event.ctrlKey || event.metaKey) {
        switch (event.key) {
          case 'k': // Ctrl/Cmd + K: Search
            event.preventDefault();
            this.focusSearch();
            break;
          case 'n': // Ctrl/Cmd + N: New item
            event.preventDefault();
            this.openAddModal();
            break;
          case 'i': // Ctrl/Cmd + I: Import
            event.preventDefault();
            this.openImportDialog();
            break;
          case ',': // Ctrl/Cmd + ,: Settings
            event.preventDefault();
            this.openSettings();
            break;
        }
      }
    });

    console.log('⌨️ Keyboard shortcuts setup complete');
  }

  private async initializeAnalytics(): Promise<void> {
    try {
      // Initialize analytics (placeholder for real implementation)
      const analyticsEnabled = await enhancedDB.getSetting('analytics.enabled') !== false;
      
      if (analyticsEnabled) {
        // Track app start
        this.trackEvent('app_start', {
          version: '2.0.0',
          platform: 'pwa',
          userAgent: navigator.userAgent
        });
      }
      
      console.log('📈 Analytics initialized');
    } catch (error) {
      console.error('Analytics initialization failed:', error);
    }
  }

  // Utility methods
  private focusSearch(): void {
    const searchInput = document.querySelector('input[type="text"]') as HTMLInputElement;
    if (searchInput) {
      searchInput.focus();
      searchInput.select();
    }
  }

  private openAddModal(): void {
    // Dispatch custom event for add modal
    window.dispatchEvent(new CustomEvent('open-add-modal'));
  }

  private openImportDialog(): void {
    window.dispatchEvent(new CustomEvent('open-import-dialog'));
  }

  private openSettings(): void {
    window.dispatchEvent(new CustomEvent('open-settings'));
  }

  private showUpdateAvailable(registration: ServiceWorkerRegistration): void {
    const notification = document.createElement('div');
    notification.className = 'update-notification';
    notification.innerHTML = `
      <div class="update-content">
        <div class="update-icon">🔄</div>
        <div class="update-text">
          <div class="update-title">Update Available</div>
          <div class="update-message">A new version of CleverFerret is ready</div>
        </div>
        <div class="update-actions">
          <button class="update-btn update-now">Update Now</button>
          <button class="update-btn update-later">Later</button>
        </div>
      </div>
    `;

    document.body.appendChild(notification);

    notification.querySelector('.update-now')?.addEventListener('click', () => {
      if (registration.waiting) {
        registration.waiting.postMessage({ type: 'SKIP_WAITING' });
        window.location.reload();
      }
    });

    notification.querySelector('.update-later')?.addEventListener('click', () => {
      notification.remove();
    });
  }

  private handleServiceWorkerMessage(data: any): void {
    switch (data.type) {
      case 'CACHE_SIZE':
        console.log('Cache size:', data.size);
        break;
      case 'SYNC_COMPLETE':
        this.showNotification('Sync completed', 'success');
        break;
      case 'OFFLINE_READY':
        this.showNotification('App is ready for offline use', 'info');
        break;
    }
  }

  private showErrorScreen(error: Error): void {
    const errorScreen = document.createElement('div');
    errorScreen.className = 'error-screen-overlay';
    errorScreen.innerHTML = `
      <div class="error-content">
        <div class="error-icon">⚠️</div>
        <div class="error-title">Something went wrong</div>
        <div class="error-message">${error.message || 'An unexpected error occurred'}</div>
        <div class="error-actions">
          <button class="error-btn retry" onclick="window.location.reload()">Retry</button>
          <button class="error-btn report" onclick="window.open('mailto:support@cleverferret.app')">Report Issue</button>
        </div>
      </div>
    `;
    
    document.body.appendChild(errorScreen);
  }

  private showNotification(message: string, type: 'success' | 'error' | 'info' | 'warning' = 'info'): void {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
      notification.classList.add('show');
    }, 100);
    
    setTimeout(() => {
      notification.classList.remove('show');
      setTimeout(() => notification.remove(), 300);
    }, 3000);
  }

  private reportError(errorInfo: any): void {
    console.error('Error reported:', errorInfo);
    
    // In production, send to error reporting service
    if (process.env.NODE_ENV === 'production') {
      // Send to error reporting service (e.g., Sentry, Bugsnag)
    }
  }

  private reportPerformance(metrics: any): void {
    console.log('Performance metrics:', metrics);
    
    // In production, send to analytics service
    if (process.env.NODE_ENV === 'production') {
      // Send to analytics service
    }
  }

  private trackEvent(eventName: string, properties: any = {}): void {
    console.log('Event tracked:', eventName, properties);
    
    // In production, send to analytics service
    if (process.env.NODE_ENV === 'production') {
      // Send to analytics service (e.g., Google Analytics, Mixpanel)
    }
  }
}

// Main app bootstrap
async function bootstrap(): Promise<void> {
  try {
    const initializer = AppInitializer.getInstance();
    await initializer.initialize();
    
    // Create React root and render app
    const rootElement = document.getElementById('root');
    if (!rootElement) {
      throw new Error('Root element not found');
    }
    
    const root = createRoot(rootElement);
    
    root.render(
      <React.StrictMode>
        <EnhancedApp />
      </React.StrictMode>
    );
    
    // Hide loading screen
    const loadingScreen = document.getElementById('loading-screen');
    if (loadingScreen) {
      setTimeout(() => {
        loadingScreen.classList.add('hidden');
        setTimeout(() => {
          loadingScreen.style.display = 'none';
        }, 500);
      }, 500);
    }
    
    console.log('🎉 Enhanced CleverFerret PWA bootstrapped successfully');
    
  } catch (error) {
    console.error('❌ Bootstrap failed:', error);
    
    // Show error screen
    const errorScreen = document.getElementById('error-screen');
    const loadingScreen = document.getElementById('loading-screen');
    
    if (errorScreen && loadingScreen) {
      loadingScreen.style.display = 'none';
      errorScreen.style.display = 'flex';
    }
  }
}

// Start the application
bootstrap();

// Hot module replacement for development
if (import.meta.hot) {
  import.meta.hot.accept('./App-Enhanced', () => {
    console.log('🔄 Hot reloading Enhanced App...');
  });
}

// Export for debugging in development
if (process.env.NODE_ENV === 'development') {
  (window as any).enhancedDB = enhancedDB;
  (window as any).enhancedFileSystem = enhancedFileSystem;
  (window as any).enhancedSync = enhancedSync;
  
  console.log('%c🛠️ Development mode: Enhanced services available on window', 'color: #00d4aa; font-weight: bold;');
}
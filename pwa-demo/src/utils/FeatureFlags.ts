/**
 * Feature flags for controlling experimental and optional features
 * Web equivalent of Android FeatureFlags.kt
 * Uses localStorage for persistence
 */

export enum FeatureFlag {
  USE_EPUB_JS = 'USE_EPUB_JS',
  ENABLE_GEMINI = 'ENABLE_GEMINI',
  ENABLE_CLOUD_TTS = 'ENABLE_CLOUD_TTS',
  ENABLE_PODCASTS = 'ENABLE_PODCASTS',
  ENABLE_ADVANCED_READER = 'ENABLE_ADVANCED_READER',
  ENABLE_AI_METADATA = 'ENABLE_AI_METADATA',
  ENABLE_AUDIOBOOK_PLAYER = 'ENABLE_AUDIOBOOK_PLAYER',
  ENABLE_SYNCHRONIZED_READING = 'ENABLE_SYNCHRONIZED_READING',
  ENABLE_EXPERIMENTAL = 'ENABLE_EXPERIMENTAL',
  ENABLE_SERVICE_WORKER = 'ENABLE_SERVICE_WORKER',
  ENABLE_OFFLINE_MODE = 'ENABLE_OFFLINE_MODE',
}

export interface FeatureFlagMeta {
  key: FeatureFlag;
  displayName: string;
  description: string;
  defaultValue: boolean;
}

const FEATURE_FLAGS: Record<FeatureFlag, FeatureFlagMeta> = {
  [FeatureFlag.USE_EPUB_JS]: {
    key: FeatureFlag.USE_EPUB_JS,
    displayName: 'epub.js Integration',
    description: 'Advanced EPUB parsing capabilities',
    defaultValue: true,
  },
  [FeatureFlag.ENABLE_GEMINI]: {
    key: FeatureFlag.ENABLE_GEMINI,
    displayName: 'Gemini AI',
    description: 'OCR and book identification',
    defaultValue: true,
  },
  [FeatureFlag.ENABLE_CLOUD_TTS]: {
    key: FeatureFlag.ENABLE_CLOUD_TTS,
    displayName: 'Cloud Text-to-Speech',
    description: 'Cloud TTS support (when available)',
    defaultValue: true,
  },
  [FeatureFlag.ENABLE_PODCASTS]: {
    key: FeatureFlag.ENABLE_PODCASTS,
    displayName: 'Podcasts',
    description: 'Podcast discovery and management',
    defaultValue: true,
  },
  [FeatureFlag.ENABLE_ADVANCED_READER]: {
    key: FeatureFlag.ENABLE_ADVANCED_READER,
    displayName: 'Advanced Reader',
    description: 'TTS integration and advanced features',
    defaultValue: true,
  },
  [FeatureFlag.ENABLE_AI_METADATA]: {
    key: FeatureFlag.ENABLE_AI_METADATA,
    displayName: 'AI Metadata Enhancement',
    description: 'Automatic metadata enhancement via AI',
    defaultValue: true,
  },
  [FeatureFlag.ENABLE_AUDIOBOOK_PLAYER]: {
    key: FeatureFlag.ENABLE_AUDIOBOOK_PLAYER,
    displayName: 'Audiobook Player',
    description: 'Advanced audiobook playback features',
    defaultValue: true,
  },
  [FeatureFlag.ENABLE_SYNCHRONIZED_READING]: {
    key: FeatureFlag.ENABLE_SYNCHRONIZED_READING,
    displayName: 'Synchronized Reading',
    description: 'Read-along functionality',
    defaultValue: true,
  },
  [FeatureFlag.ENABLE_EXPERIMENTAL]: {
    key: FeatureFlag.ENABLE_EXPERIMENTAL,
    displayName: 'Experimental Features',
    description: 'Unstable experimental features',
    defaultValue: false,
  },
  [FeatureFlag.ENABLE_SERVICE_WORKER]: {
    key: FeatureFlag.ENABLE_SERVICE_WORKER,
    displayName: 'Service Worker',
    description: 'Offline support and caching',
    defaultValue: true,
  },
  [FeatureFlag.ENABLE_OFFLINE_MODE]: {
    key: FeatureFlag.ENABLE_OFFLINE_MODE,
    displayName: 'Offline Mode',
    description: 'Enable full offline functionality',
    defaultValue: true,
  },
};

const STORAGE_KEY = 'feature_flags';

class FeatureFlagsManager {
  private flags: Map<FeatureFlag, boolean> = new Map();
  private initialized = false;

  /**
   * Initialize feature flags from localStorage
   */
  init(): void {
    if (this.initialized) return;

    try {
      const stored = localStorage.getItem(STORAGE_KEY);
      if (stored) {
        const parsed = JSON.parse(stored);
        Object.entries(parsed).forEach(([key, value]) => {
          if (key in FeatureFlag) {
            this.flags.set(key as FeatureFlag, value as boolean);
          }
        });
      }
    } catch (error) {
      console.error('Failed to load feature flags:', error);
    }

    // Set defaults for missing flags
    Object.values(FeatureFlag).forEach((flag) => {
      if (!this.flags.has(flag)) {
        this.flags.set(flag, FEATURE_FLAGS[flag].defaultValue);
      }
    });

    this.initialized = true;
    this.persist();
  }

  /**
   * Get flag value
   */
  isEnabled(flag: FeatureFlag): boolean {
    if (!this.initialized) this.init();
    return this.flags.get(flag) ?? FEATURE_FLAGS[flag].defaultValue;
  }

  /**
   * Set flag value
   */
  setFlag(flag: FeatureFlag, enabled: boolean): void {
    if (!this.initialized) this.init();
    this.flags.set(flag, enabled);
    this.persist();
  }

  /**
   * Get all flags with metadata
   */
  getAllFlags(): Array<FeatureFlagMeta & { enabled: boolean }> {
    if (!this.initialized) this.init();
    return Object.values(FeatureFlag).map((flag) => ({
      ...FEATURE_FLAGS[flag],
      enabled: this.isEnabled(flag),
    }));
  }

  /**
   * Reset all flags to defaults
   */
  resetToDefaults(): void {
    Object.values(FeatureFlag).forEach((flag) => {
      this.flags.set(flag, FEATURE_FLAGS[flag].defaultValue);
    });
    this.persist();
  }

  /**
   * Persist flags to localStorage
   */
  private persist(): void {
    try {
      const obj: Record<string, boolean> = {};
      this.flags.forEach((value, key) => {
        obj[key] = value;
      });
      localStorage.setItem(STORAGE_KEY, JSON.stringify(obj));
    } catch (error) {
      console.error('Failed to persist feature flags:', error);
    }
  }
}

// Singleton instance
export const FeatureFlags = new FeatureFlagsManager();

// Initialize on module load
FeatureFlags.init();

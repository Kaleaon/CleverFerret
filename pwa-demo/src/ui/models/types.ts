// ============================================================================
// UI Models for CleverFerret PWA
// ============================================================================

/**
 * Font Family options for E-Reader
 */
export enum FontFamily {
  SYSTEM = 'System',
  SERIF = 'Serif',
  SANS_SERIF = 'Sans Serif',
  MONOSPACE = 'Monospace',
  CURSIVE = 'Cursive',
}

/**
 * Reader Theme options
 */
export enum ReaderTheme {
  LIGHT = 'Light',
  SEPIA = 'Sepia',
  DARK = 'Dark',
  BLACK = 'Black',
}

/**
 * Text Alignment options
 */
export enum TextAlignmentUI {
  LEFT = 'Left',
  CENTER = 'Center',
  JUSTIFY = 'Justify',
}

/**
 * Page Animation styles
 */
export enum PageAnimation {
  SLIDE = 'Slide',
  FADE = 'Fade',
  CURL = 'Page Curl',
  NONE = 'None',
}

/**
 * Cloud Storage Providers
 */
export enum CloudProvider {
  NONE = 'None',
  GOOGLE_DRIVE = 'Google Drive',
  DROPBOX = 'Dropbox',
  ONEDRIVE = 'OneDrive',
  WEBDAV = 'WebDAV',
}

/**
 * Sidebar Position for navigation rail
 */
export enum SidebarPosition {
  LEFT = 'Left',
  RIGHT = 'Right',
}

/**
 * API Keys for external services
 */
export interface ApiKeys {
  tmdbKey: string;
  googleBooksKey: string;
  comicVineKey: string;
  spotifyClientId: string;
  spotifyClientSecret: string;
  musicBrainzUserAgent: string;
  lastFmKey: string;
  openLibraryKey: string;
}

/**
 * E-Reader Settings
 */
export interface ReaderSettings {
  fontSize: number;
  fontFamily: FontFamily;
  theme: ReaderTheme;
  lineHeight: number;
  pageMargin: number;
  pageAnimation: PageAnimation;
  hyphenation: boolean;
  textAlignment: TextAlignmentUI;
  brightnessControl: boolean;
  customBrightness: number;
  keepScreenOn: boolean;
  volumeKeysNavigation: boolean;
}

/**
 * Audiobook Playback Settings
 */
export interface AudiobookSettings {
  playbackSpeed: number;
  sleepTimerMinutes: number;
  autoPlay: boolean;
  skipSilence: boolean;
  rewindSeconds: number;
  forwardSeconds: number;
  rememberPosition: boolean;
  backgroundPlayback: boolean;
}

/**
 * Metadata Management Settings
 */
export interface MetadataSettings {
  ocrEnabled: boolean;
  nerEnabled: boolean;
  autoFetchMetadata: boolean;
  autoDownloadCovers: boolean;
  comparisonViewEnabled: boolean;
  preferLocalMetadata: boolean;
  embedMetadataInFiles: boolean;
  metadataLanguage: string;
}

/**
 * Cloud Sync Settings
 */
export interface CloudSyncSettings {
  enabled: boolean;
  provider: CloudProvider;
  syncOnWifiOnly: boolean;
  syncMetadata: boolean;
  syncProgress: boolean;
  syncAnnotations: boolean;
  syncSettings: boolean;
  autoSync: boolean;
  syncInterval: number; // minutes
}

/**
 * Interface/UI Settings
 */
export interface InterfaceSettings {
  sidebarPosition: SidebarPosition;
  gridColumns: number;
  themePalette: string;
  metallicTheme: string;
  enableShimmerEffects: boolean;
  dynamicColors: boolean;
  darkMode: boolean;
  showThumbnails: boolean;
  compactView: boolean;
  animationsEnabled: boolean;
}

/**
 * Import Settings (e.g., Calibre import)
 */
export interface ImportSettings {
  calibreDatabasePath: string;
  calibreLibraryRoot: string;
  autoImportOnStartup: boolean;
  importMetadata: boolean;
  importCovers: boolean;
  importSeries: boolean;
  importTags: boolean;
  importRatings: boolean;
  preserveCalibreIds: boolean;
}

/**
 * Master App Settings container
 */
export interface AppSettings {
  apiKeys: ApiKeys;
  reader: ReaderSettings;
  audiobook: AudiobookSettings;
  metadata: MetadataSettings;
  cloudSync: CloudSyncSettings;
  interface: InterfaceSettings;
  import: ImportSettings;
  version: number;
}

/**
 * Media Category enum with complete information
 */
export enum MediaCategory {
  MUSIC = 'Music',
  MOVIES = 'Movies',
  TV_SHOWS = 'TV Shows',
  RADIO = 'Radio',
  EBOOKS = 'eBooks',
  COMICS = 'Comics',
  AUDIOBOOKS = 'Audiobooks',
  PODCASTS = 'Podcasts',
  MAGAZINES = 'Magazines',
  NEWS = 'News',
  FANFICTION = 'Fanfiction',
}

/**
 * Get MediaCategory from media type string (compatibility with database)
 */
export function getMediaCategoryFromType(type: string): MediaCategory | null {
  const upperType = type.toUpperCase();
  switch (upperType) {
    case 'MUSIC':
    case 'MUSIC_TRACK':
    case 'ALBUM':
      return MediaCategory.MUSIC;
    case 'MOVIE':
    case 'VIDEO':
      return MediaCategory.MOVIES;
    case 'TV_SHOW':
    case 'TV':
    case 'SERIES':
    case 'EPISODE':
      return MediaCategory.TV_SHOWS;
    case 'RADIO':
    case 'RADIO_STREAM':
      return MediaCategory.RADIO;
    case 'BOOK':
    case 'EBOOK':
      return MediaCategory.EBOOKS;
    case 'COMIC':
    case 'MANGA':
    case 'CBR':
    case 'CBZ':
      return MediaCategory.COMICS;
    case 'AUDIOBOOK':
      return MediaCategory.AUDIOBOOKS;
    case 'PODCAST':
    case 'PODCAST_EPISODE':
      return MediaCategory.PODCASTS;
    case 'MAGAZINE':
      return MediaCategory.MAGAZINES;
    case 'NEWS':
      return MediaCategory.NEWS;
    case 'FANFICTION':
    case 'FAN_FICTION':
      return MediaCategory.FANFICTION;
    default:
      return null;
  }
}

/**
 * Default values for settings
 */
export const defaultApiKeys: ApiKeys = {
  tmdbKey: '',
  googleBooksKey: '',
  comicVineKey: '',
  spotifyClientId: '',
  spotifyClientSecret: '',
  musicBrainzUserAgent: '',
  lastFmKey: '',
  openLibraryKey: '',
};

export const defaultReaderSettings: ReaderSettings = {
  fontSize: 16,
  fontFamily: FontFamily.SERIF,
  theme: ReaderTheme.SEPIA,
  lineHeight: 1.5,
  pageMargin: 16,
  pageAnimation: PageAnimation.SLIDE,
  hyphenation: true,
  textAlignment: TextAlignmentUI.JUSTIFY,
  brightnessControl: false,
  customBrightness: 0.5,
  keepScreenOn: false,
  volumeKeysNavigation: true,
};

export const defaultAudiobookSettings: AudiobookSettings = {
  playbackSpeed: 1.0,
  sleepTimerMinutes: 0,
  autoPlay: false,
  skipSilence: false,
  rewindSeconds: 15,
  forwardSeconds: 30,
  rememberPosition: true,
  backgroundPlayback: true,
};

export const defaultMetadataSettings: MetadataSettings = {
  ocrEnabled: false,
  nerEnabled: false,
  autoFetchMetadata: true,
  autoDownloadCovers: true,
  comparisonViewEnabled: true,
  preferLocalMetadata: false,
  embedMetadataInFiles: false,
  metadataLanguage: 'en',
};

export const defaultCloudSyncSettings: CloudSyncSettings = {
  enabled: false,
  provider: CloudProvider.NONE,
  syncOnWifiOnly: true,
  syncMetadata: true,
  syncProgress: true,
  syncAnnotations: true,
  syncSettings: false,
  autoSync: true,
  syncInterval: 60,
};

export const defaultInterfaceSettings: InterfaceSettings = {
  sidebarPosition: SidebarPosition.LEFT,
  gridColumns: 4,
  themePalette: 'NAVY_GOLD',
  metallicTheme: 'GOLD_ROYAL_BLUE',
  enableShimmerEffects: true,
  dynamicColors: false,
  darkMode: true,
  showThumbnails: true,
  compactView: false,
  animationsEnabled: true,
};

export const defaultImportSettings: ImportSettings = {
  calibreDatabasePath: '',
  calibreLibraryRoot: '',
  autoImportOnStartup: false,
  importMetadata: true,
  importCovers: true,
  importSeries: true,
  importTags: true,
  importRatings: true,
  preserveCalibreIds: true,
};

export const defaultAppSettings: AppSettings = {
  apiKeys: defaultApiKeys,
  reader: defaultReaderSettings,
  audiobook: defaultAudiobookSettings,
  metadata: defaultMetadataSettings,
  cloudSync: defaultCloudSyncSettings,
  interface: defaultInterfaceSettings,
  import: defaultImportSettings,
  version: 1,
};

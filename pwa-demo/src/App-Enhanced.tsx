import React, { useState, useMemo, useEffect } from 'react';
import { MediaItem, MediaType, MediaItemWithOriginal } from './types';
import { MOCK_MEDIA_ITEMS } from './constants';
import { BookIcon, MovieIcon, MusicIcon, ComicIcon, PodcastIcon, RadioIcon, GridIcon, ListIcon, SearchIcon, SettingsIcon, PlusIcon, CheckCircleIcon, UndoIcon, PencilIcon } from './components/icons';
import MetadataEditor from './components/MetadataEditor';
import SettingsModal from './components/SettingsModal';
import AddMediaModal from './components/AddMediaModal';
import { ThemeProvider } from './contexts/ThemeContext';

// Enhanced PWA App with full feature parity to Android
const mediaTypeIcons: Record<MediaType, React.JSX.Element> = {
  [MediaType.Book]: <BookIcon className="w-5 h-5" />,
  [MediaType.Movie]: <MovieIcon className="w-5 h-5" />,
  [MediaType.Music]: <MusicIcon className="w-5 h-5" />,
  [MediaType.Comic]: <ComicIcon className="w-5 h-5" />,
  [MediaType.Podcast]: <PodcastIcon className="w-5 h-5" />,
  [MediaType.Radio]: <RadioIcon className="w-5 h-5" />,
};

type ViewMode = 'grid' | 'list';
type SortKey = 'title' | 'dateAdded' | 'rating';

// Enhanced File System Access API
class FileSystemService {
  static async openFileDialog(types: string[]): Promise<File[]> {
    if ('showOpenFilePicker' in window) {
      try {
        const fileHandles = await (window as any).showOpenFilePicker({
          multiple: true,
          types: [{
            description: 'Media files',
            accept: {
              'application/epub+zip': ['.epub'],
              'application/pdf': ['.pdf'],
              'audio/mpeg': ['.mp3'],
              'audio/m4a': ['.m4a'],
              'audio/flac': ['.flac'],
              'audio/wav': ['.wav'],
              'video/mp4': ['.mp4'],
              'video/x-matroska': ['.mkv'],
              'video/quicktime': ['.mov'],
              'image/jpeg': ['.jpg', '.jpeg'],
              'image/png': ['.png'],
              'application/x-cbr': ['.cbr'],
              'application/x-cbz': ['.cbz'],
              'application/x-sqlite3': ['.db']
            }
          }]
        });
        
        const files = [];
        for (const handle of fileHandles) {
          const file = await handle.getFile();
          files.push(file);
        }
        return files;
      } catch (error) {
        console.error('File picker error:', error);
        return [];
      }
    } else {
      // Fallback to traditional file input
      return new Promise((resolve) => {
        const input = document.createElement('input');
        input.type = 'file';
        input.multiple = true;
        input.accept = types.join(',');
        input.onchange = (e) => {
          const files = Array.from((e.target as HTMLInputElement).files || []);
          resolve(files);
        };
        input.click();
      });
    }
  }

  static async openDirectoryDialog(): Promise<FileSystemDirectoryHandle | null> {
    if ('showDirectoryPicker' in window) {
      try {
        return await (window as any).showDirectoryPicker();
      } catch (error) {
        console.error('Directory picker error:', error);
        return null;
      }
    }
    return null;
  }

  static async readDirectory(dirHandle: FileSystemDirectoryHandle): Promise<File[]> {
    const files = [];
    for await (const [name, handle] of dirHandle.entries()) {
      if (handle.kind === 'file') {
        const file = await handle.getFile();
        files.push(file);
      }
    }
    return files;
  }
}

// Enhanced Media Player Service
class MediaPlayerService {
  private static audio: HTMLAudioElement | null = null;
  private static video: HTMLVideoElement | null = null;

  static async playAudio(file: File) {
    if (this.audio) {
      this.audio.pause();
    }
    
    this.audio = new Audio(URL.createObjectURL(file));
    this.audio.controls = true;
    
    // Enable Media Session API for system controls
    if ('mediaSession' in navigator) {
      navigator.mediaSession.metadata = new MediaMetadata({
        title: file.name,
        artist: 'Unknown Artist',
        artwork: [{ src: 'https://picsum.photos/512/512', sizes: '512x512', type: 'image/png' }]
      });
      
      navigator.mediaSession.setActionHandler('play', () => this.audio?.play());
      navigator.mediaSession.setActionHandler('pause', () => this.audio?.pause());
      navigator.mediaSession.setActionHandler('stop', () => {
        this.audio?.pause();
        if (this.audio) this.audio.currentTime = 0;
      });
    }
    
    return this.audio;
  }

  static async playVideo(file: File) {
    if (this.video) {
      this.video.pause();
    }
    
    this.video = document.createElement('video');
    this.video.src = URL.createObjectURL(file);
    this.video.controls = true;
    this.video.style.width = '100%';
    this.video.style.height = 'auto';
    
    return this.video;
  }
}

// Enhanced eBook Reader Service
class EBookReaderService {
  static async openEPUB(file: File): Promise<void> {
    // For now, we'll create a simple reader interface
    // In a full implementation, this would use epub.js
    const reader = window.open('', '_blank');
    if (reader) {
      reader.document.write(`
        <html>
          <head><title>${file.name}</title></head>
          <body style="font-family: serif; max-width: 800px; margin: 0 auto; padding: 20px;">
            <h1>EPUB Reader</h1>
            <p>File: ${file.name}</p>
            <p>Size: ${(file.size / 1024 / 1024).toFixed(2)} MB</p>
            <p><strong>Note:</strong> Full EPUB rendering requires epub.js integration.</p>
            <button onclick="window.close()">Close Reader</button>
          </body>
        </html>
      `);
    }
  }

  static async openPDF(file: File): Promise<void> {
    // Use browser's built-in PDF viewer
    const pdfUrl = URL.createObjectURL(file);
    window.open(pdfUrl, '_blank');
  }

  static async openComic(file: File): Promise<void> {
    // For CBR/CBZ files, we'd need to extract and display images
    // For now, show a placeholder
    const reader = window.open('', '_blank');
    if (reader) {
      reader.document.write(`
        <html>
          <head><title>${file.name}</title></head>
          <body style="font-family: sans-serif; max-width: 800px; margin: 0 auto; padding: 20px;">
            <h1>Comic Reader</h1>
            <p>File: ${file.name}</p>
            <p>Size: ${(file.size / 1024 / 1024).toFixed(2)} MB</p>
            <p><strong>Note:</strong> Full comic reading requires CBR/CBZ extraction.</p>
            <button onclick="window.close()">Close Reader</button>
          </body>
        </html>
      `);
    }
  }
}

const MediaItemCard: React.FC<{ 
  item: MediaItem; 
  onEdit: (item: MediaItem) => void; 
  onUpdateStatus: (id: string, status: MediaItem['status']) => void;
  onPlay: (item: MediaItem) => void;
}> = ({ item, onEdit, onUpdateStatus, onPlay }) => {
  const creator = item.authors?.[0] || item.directors?.[0] || item.artists?.[0] || 'Unknown Artist';
  
  const isFinished = item.status === 'Finished' || item.status === 'Watched';
  const finishStatus: MediaItem['status'] = item.type === MediaType.Movie ? 'Watched' : 'Finished';
  const unfinishStatus: MediaItem['status'] = item.type === MediaType.Movie ? 'Unwatched' : 'Unread';

  return (
    <div className="bg-light-navy rounded-lg overflow-hidden group transition-all duration-300 hover:shadow-2xl hover:shadow-secondary/20 hover:scale-105">
      <div className="relative">
        <img src={item.coverArt} alt={item.title} className="w-full h-64 object-cover" />
        <div className="absolute inset-0 bg-black bg-opacity-60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center p-4">
          <div className="flex flex-col items-center gap-3">
            <button
              onClick={() => onPlay(item)}
              className="bg-primary text-on-primary font-bold py-2 px-4 rounded-md hover:bg-opacity-90 w-40 text-center"
            >
              {item.type === MediaType.Book || item.type === MediaType.Comic ? 'Read' : 'Play'}
            </button>
            <button
              onClick={() => onEdit(item)}
              className="bg-secondary text-on-primary font-bold py-2 px-4 rounded-md hover:bg-opacity-90 w-40 text-center"
            >
              Edit Metadata
            </button>
            <button
              onClick={() => onUpdateStatus(item.id, isFinished ? unfinishStatus : finishStatus)}
              className="bg-lightest-navy/80 text-lightest-slate font-bold py-2 px-4 rounded-md hover:bg-slate w-40 flex items-center justify-center gap-2"
              title={isFinished ? `Mark as ${unfinishStatus}` : `Mark as ${finishStatus}`}
            >
              {isFinished ? <UndoIcon className="w-5 h-5" /> : <CheckCircleIcon className="w-5 h-5" />}
              <span>{isFinished ? unfinishStatus : finishStatus}</span>
            </button>
          </div>
        </div>
        <div className="absolute top-2 right-2 bg-navy/80 p-1 rounded-full text-secondary text-xs">
          {item.type}
        </div>
      </div>
      <div className="p-4">
        <h3 className="text-lg font-bold text-lightest-slate truncate">{item.title}</h3>
        <p className="text-sm text-slate truncate">{creator}</p>
        <div className="flex items-center mt-2">
            {[...Array(5)].map((_, i) => (
                <svg key={i} className={`w-4 h-4 ${i < (item.rating || 0) ? 'text-primary' : 'text-lightest-navy'}`} fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
            ))}
            <span className="ml-auto text-xs font-medium px-2.5 py-0.5 rounded-full bg-lightest-navy text-slate">{item.status}</span>
        </div>
      </div>
    </div>
  );
};

const MediaItemRow: React.FC<{ 
  item: MediaItem; 
  onEdit: (item: MediaItem) => void; 
  onUpdateStatus: (id: string, status: MediaItem['status']) => void;
  onPlay: (item: MediaItem) => void;
}> = ({ item, onEdit, onUpdateStatus, onPlay }) => {
  const creator = item.authors?.[0] || item.directors?.[0] || item.artists?.[0] || 'Unknown Artist';

  const isFinished = item.status === 'Finished' || item.status === 'Watched';
  const finishStatus: MediaItem['status'] = item.type === MediaType.Movie ? 'Watched' : 'Finished';
  const unfinishStatus: MediaItem['status'] = item.type === MediaType.Movie ? 'Unwatched' : 'Unread';

  return (
    <div className="flex items-center p-3 bg-light-navy rounded-md hover:bg-lightest-navy transition-colors duration-200">
      <img src={item.coverArt} alt={item.title} className="w-12 h-16 object-cover rounded-sm flex-shrink-0" />
      <div className="flex-grow mx-4">
        <p className="font-bold text-lightest-slate">{item.title}</p>
        <p className="text-sm text-slate">{creator}</p>
      </div>
      <div className="w-32 text-sm text-slate text-center hidden md:block truncate">{item.genres?.join(', ')}</div>
      <div className="w-24 text-center hidden sm:block">
         <span className="text-xs font-medium px-2.5 py-0.5 rounded-full bg-navy text-slate">{item.status}</span>
      </div>
      <div className="w-32 text-center flex justify-center gap-2">
        <button
          onClick={() => onPlay(item)}
          className="p-2 rounded-full text-slate hover:bg-navy hover:text-primary"
          title={item.type === MediaType.Book || item.type === MediaType.Comic ? 'Read' : 'Play'}
        >
          ▶️
        </button>
        <button
          onClick={() => onUpdateStatus(item.id, isFinished ? unfinishStatus : finishStatus)}
          className="p-2 rounded-full text-slate hover:bg-navy hover:text-secondary"
          title={isFinished ? `Mark as ${unfinishStatus}` : `Mark as ${finishStatus}`}
        >
          {isFinished ? <UndoIcon className="w-5 h-5" /> : <CheckCircleIcon className="w-5 h-5" />}
        </button>
        <button
          onClick={() => onEdit(item)}
          className="p-2 rounded-full text-slate hover:bg-navy hover:text-secondary"
          title="Edit Metadata"
        >
          <PencilIcon className="w-5 h-5"/>
        </button>
      </div>
    </div>
  );
};

const FileImportDialog: React.FC<{
  isOpen: boolean;
  onClose: () => void;
  onImport: (files: File[]) => void;
}> = ({ isOpen, onClose, onImport }) => {
  if (!isOpen) return null;

  const handleFileImport = async () => {
    const files = await FileSystemService.openFileDialog([
      '.epub', '.pdf', '.mp3', '.m4a', '.flac', '.wav', 
      '.mp4', '.mkv', '.mov', '.jpg', '.jpeg', '.png',
      '.cbr', '.cbz', '.db'
    ]);
    if (files.length > 0) {
      onImport(files);
    }
    onClose();
  };

  const handleDirectoryImport = async () => {
    const dirHandle = await FileSystemService.openDirectoryDialog();
    if (dirHandle) {
      const files = await FileSystemService.readDirectory(dirHandle);
      if (files.length > 0) {
        onImport(files);
      }
    }
    onClose();
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-75 flex items-center justify-center z-50 p-4" onClick={onClose}>
      <div className="bg-light-navy w-full max-w-md rounded-lg shadow-xl flex flex-col" onClick={(e) => e.stopPropagation()}>
        <div className="flex justify-between items-center p-4 border-b border-lightest-navy/50">
          <h2 className="text-xl font-bold text-lightest-slate">Import Files</h2>
          <button onClick={onClose} className="text-slate hover:text-white">✕</button>
        </div>
        
        <div className="p-6 space-y-4">
          <button
            onClick={handleFileImport}
            className="w-full bg-emerald text-navy font-bold py-3 px-4 rounded-md hover:bg-opacity-90"
          >
            📄 Import Individual Files
          </button>
          
          <button
            onClick={handleDirectoryImport}
            className="w-full bg-secondary text-on-primary font-bold py-3 px-4 rounded-md hover:bg-opacity-90"
          >
            📁 Import Entire Directory
          </button>
          
          <p className="text-sm text-slate text-center">
            Supports: EPUB, PDF, MP3, M4A, FLAC, WAV, MP4, MKV, MOV, CBR, CBZ, and Calibre DB files
          </p>
        </div>
      </div>
    </div>
  );
};

const App: React.FC = () => {
  const [mediaItems, setMediaItems] = useState<MediaItem[]>(MOCK_MEDIA_ITEMS);
  const [activeType, setActiveType] = useState<MediaType | 'All'>('All');
  const [viewMode, setViewMode] = useState<ViewMode>('grid');
  const [searchTerm, setSearchTerm] = useState('');
  const [sortKey, setSortKey] = useState<SortKey>('dateAdded');
  const [editingItem, setEditingItem] = useState<MediaItemWithOriginal | null>(null);
  const [isSettingsOpen, setIsSettingsOpen] = useState(false);
  const [isAddingMedia, setIsAddingMedia] = useState(false);
  const [isImportDialogOpen, setIsImportDialogOpen] = useState(false);
  const [currentPlayer, setCurrentPlayer] = useState<HTMLAudioElement | HTMLVideoElement | null>(null);

  // Enhanced offline support
  useEffect(() => {
    // Register service worker for offline support
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register('/sw.js')
        .then(registration => console.log('SW registered:', registration))
        .catch(error => console.log('SW registration failed:', error));
    }

    // Load saved data from localStorage
    const savedItems = localStorage.getItem('clever-ferret-media-items');
    if (savedItems) {
      try {
        setMediaItems(JSON.parse(savedItems));
      } catch (error) {
        console.error('Error loading saved items:', error);
      }
    }
  }, []);

  // Save data to localStorage whenever items change
  useEffect(() => {
    localStorage.setItem('clever-ferret-media-items', JSON.stringify(mediaItems));
  }, [mediaItems]);

  const filteredAndSortedItems = useMemo(() => {
    return mediaItems
      .filter(item => {
        const typeMatch = activeType === 'All' || item.type === activeType;
        const searchMatch = searchTerm === '' || 
                              item.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
                              (item.authors || []).join(' ').toLowerCase().includes(searchTerm.toLowerCase()) ||
                              (item.directors || []).join(' ').toLowerCase().includes(searchTerm.toLowerCase()) ||
                              (item.artists || []).join(' ').toLowerCase().includes(searchTerm.toLowerCase());
        return typeMatch && searchMatch;
      })
      .sort((a, b) => {
        if (sortKey === 'title') return (a.sortTitle || a.title).localeCompare(b.sortTitle || b.title);
        if (sortKey === 'dateAdded') return new Date(b.dateAdded).getTime() - new Date(a.dateAdded).getTime();
        if (sortKey === 'rating') return (b.rating || 0) - (a.rating || 0);
        return 0;
      });
  }, [mediaItems, activeType, searchTerm, sortKey]);

  const handleEdit = (item: MediaItem) => {
    setEditingItem({ ...item, original: item });
  };
  
  const handleSave = (updatedItem: MediaItem) => {
    setMediaItems(prev => prev.map(item => item.id === updatedItem.id ? updatedItem : item));
    setEditingItem(null);
  };

  const handleAddItem = (title: string, type: MediaType, creator: string) => {
    const newId = `item-${Date.now()}`;
    const newMediaItem: MediaItem = {
      id: newId,
      title,
      type,
      authors: type === MediaType.Book || type === MediaType.Comic ? [creator] : [],
      directors: type === MediaType.Movie ? [creator] : [],
      artists: type === MediaType.Music || type === MediaType.Podcast ? [creator] : [],
      coverArt: `https://picsum.photos/seed/${newId}/400/600`,
      status: 'Unread',
      dateAdded: new Date().toISOString(),
    };

    setMediaItems(prev => [newMediaItem, ...prev]);
    setIsAddingMedia(false);
    handleEdit(newMediaItem);
  };
  
  const handleImport = (newItems: MediaItem[]) => {
    const existingKeys = new Set(
      mediaItems.map(i => `${i.title.toLowerCase().trim()}-${(i.authors?.[0] || '').toLowerCase().trim()}`)
    );

    const nonDuplicates = newItems.filter(i => {
      const key = `${i.title.toLowerCase().trim()}-${(i.authors?.[0] || '').toLowerCase().trim()}`;
      return !existingKeys.has(key);
    });

    setMediaItems(prev => [...nonDuplicates.reverse(), ...prev]);
  };

  const handleFileImport = async (files: File[]) => {
    const newItems: MediaItem[] = [];
    
    for (const file of files) {
      const extension = file.name.split('.').pop()?.toLowerCase();
      let mediaType: MediaType = MediaType.Book;
      
      switch (extension) {
        case 'mp3':
        case 'm4a':
        case 'flac':
        case 'wav':
          mediaType = MediaType.Music;
          break;
        case 'mp4':
        case 'mkv':
        case 'mov':
        case 'avi':
          mediaType = MediaType.Movie;
          break;
        case 'epub':
        case 'pdf':
          mediaType = MediaType.Book;
          break;
        case 'cbr':
        case 'cbz':
          mediaType = MediaType.Comic;
          break;
        default:
          continue; // Skip unsupported files
      }
      
      const newId = `file-${Date.now()}-${Math.random()}`;
      const newItem: MediaItem = {
        id: newId,
        title: file.name.replace(/\.[^/.]+$/, ''), // Remove extension
        type: mediaType,
        coverArt: `https://picsum.photos/seed/${newId}/400/600`,
        status: mediaType === MediaType.Movie ? 'Unwatched' : 'Unread',
        dateAdded: new Date().toISOString(),
        // Store file reference for later use
        localPath: URL.createObjectURL(file)
      };
      
      newItems.push(newItem);
    }
    
    if (newItems.length > 0) {
      handleImport(newItems);
    }
  };

  const handleUpdateStatus = (itemId: string, newStatus: MediaItem['status']) => {
    setMediaItems(prev => prev.map(item => item.id === itemId ? { ...item, status: newStatus } : item));
  };

  const handlePlay = async (item: MediaItem) => {
    // Stop current player if any
    if (currentPlayer) {
      currentPlayer.pause();
    }

    // If item has local file path, play it directly
    if (item.localPath) {
      try {
        let player;
        
        if (item.type === MediaType.Music || item.type === MediaType.Podcast) {
          // For audio files, fetch the file and play
          const response = await fetch(item.localPath);
          const blob = await response.blob();
          const file = new File([blob], item.title, { type: blob.type });
          player = await MediaPlayerService.playAudio(file);
        } else if (item.type === MediaType.Movie) {
          // For video files
          const response = await fetch(item.localPath);
          const blob = await response.blob();
          const file = new File([blob], item.title, { type: blob.type });
          player = await MediaPlayerService.playVideo(file);
          
          // Open in new window for video
          const videoWindow = window.open('', '_blank');
          if (videoWindow) {
            videoWindow.document.body.appendChild(player);
          }
        } else if (item.type === MediaType.Book) {
          // For books
          const response = await fetch(item.localPath);
          const blob = await response.blob();
          const file = new File([blob], item.title, { type: blob.type });
          
          if (file.name.endsWith('.epub')) {
            await EBookReaderService.openEPUB(file);
          } else if (file.name.endsWith('.pdf')) {
            await EBookReaderService.openPDF(file);
          }
        } else if (item.type === MediaType.Comic) {
          // For comics
          const response = await fetch(item.localPath);
          const blob = await response.blob();
          const file = new File([blob], item.title, { type: blob.type });
          await EBookReaderService.openComic(file);
        }
        
        if (player) {
          setCurrentPlayer(player);
        }
      } catch (error) {
        console.error('Error playing media:', error);
        alert('Error playing media file');
      }
    } else {
      // For demo items without local files
      alert(`Playing ${item.title}\n\nIn a full implementation, this would:\n- Launch the appropriate reader/player\n- Track reading/watching progress\n- Sync with cloud services`);
    }
  };

  return (
    <>
      <div className="flex h-screen bg-navy font-sans text-lightest-slate">
        {/* Enhanced Sidebar */}
        <nav className="w-16 md:w-64 bg-light-navy p-2 md:p-4 flex flex-col">
          <div>
            <div className="flex items-center gap-2 mb-8 px-2">
              <img src="https://picsum.photos/seed/logo/40/40" alt="logo" className="rounded-full w-8 h-8" />
              <span className="text-xl font-bold text-lightest-slate hidden md:inline">CleverFerret</span>
            </div>
            <ul>
                <li
                  onClick={() => setIsAddingMedia(true)}
                  className={`flex items-center gap-4 p-2 md:px-4 md:py-3 rounded-md cursor-pointer transition-colors mb-2 bg-emerald text-on-primary hover:bg-opacity-90`}
                >
                  <PlusIcon className="w-5 h-5" />
                  <span className="hidden md:inline">Add Media</span>
                </li>
                <li
                  onClick={() => setIsImportDialogOpen(true)}
                  className={`flex items-center gap-4 p-2 md:px-4 md:py-3 rounded-md cursor-pointer transition-colors mb-4 bg-secondary text-on-primary hover:bg-opacity-90`}
                >
                  <span className="text-lg">📁</span>
                  <span className="hidden md:inline">Import Files</span>
                </li>
                <li
                  onClick={() => setActiveType('All')}
                  className={`flex items-center gap-4 p-2 md:px-4 md:py-3 rounded-md cursor-pointer transition-colors ${
                    activeType === 'All' ? 'bg-secondary text-on-primary' : 'text-slate hover:bg-lightest-navy hover:text-lightest-slate'
                  }`}
                >
                  <GridIcon className="w-5 h-5" />
                  <span className="hidden md:inline">All Media</span>
                </li>
              {(Object.keys(mediaTypeIcons) as MediaType[]).map(type => (
                <li
                  key={type}
                  onClick={() => setActiveType(type)}
                  className={`flex items-center gap-4 p-2 md:px-4 md:py-3 rounded-md cursor-pointer transition-colors ${
                    activeType === type ? 'bg-secondary text-on-primary' : 'text-slate hover:bg-lightest-navy hover:text-lightest-slate'
                  }`}
                >
                  {mediaTypeIcons[type]}
                  <span className="hidden md:inline">{type}s</span>
                </li>
              ))}
            </ul>
          </div>

          <div className="mt-auto">
              <div
                onClick={() => setIsSettingsOpen(true)}
                className={`flex items-center gap-4 p-2 md:px-4 md:py-3 rounded-md cursor-pointer transition-colors text-slate hover:bg-lightest-navy hover:text-lightest-slate`}
              >
                <SettingsIcon className="w-5 h-5" />
                <span className="hidden md:inline">Settings</span>
              </div>
          </div>
        </nav>

        {/* Enhanced Main Content */}
        <main className="flex-1 flex flex-col overflow-hidden">
          <header className="flex-shrink-0 bg-light-navy/80 backdrop-blur-sm p-4 border-b border-lightest-navy/20">
              <div className="flex items-center justify-between">
                  <div className="relative w-full max-w-md">
                      <SearchIcon className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-slate" />
                      <input 
                          type="text"
                          placeholder="Search by title, author, artist..."
                          value={searchTerm}
                          onChange={(e) => setSearchTerm(e.target.value)}
                          className="w-full bg-navy border border-lightest-navy rounded-full py-2 pl-10 pr-4 focus:outline-none focus:ring-2 focus:ring-secondary text-lightest-slate"
                      />
                  </div>
                  <div className="flex items-center gap-4">
                      <select
                          value={sortKey}
                          onChange={(e) => setSortKey(e.target.value as SortKey)}
                          className="bg-navy border border-lightest-navy rounded-md py-2 px-3 focus:outline-none focus:ring-2 focus:ring-secondary text-slate"
                      >
                          <option value="dateAdded">Recently Added</option>
                          <option value="title">Title</option>
                          <option value="rating">Rating</option>
                      </select>
                      <div className="flex items-center bg-navy border border-lightest-navy rounded-md p-1">
                          <button onClick={() => setViewMode('grid')} className={`p-1 rounded ${viewMode === 'grid' ? 'bg-secondary text-on-primary' : 'text-slate'}`}>
                              <GridIcon className="w-5 h-5"/>
                          </button>
                          <button onClick={() => setViewMode('list')} className={`p-1 rounded ${viewMode === 'list' ? 'bg-secondary text-on-primary' : 'text-slate'}`}>
                              <ListIcon className="w-5 h-5"/>
                          </button>
                      </div>
                  </div>
              </div>
          </header>

          <div className="flex-1 overflow-y-auto p-4 md:p-6">
            <div className="mb-4">
              <p className="text-sm text-slate">
                📊 Total: {filteredAndSortedItems.length} items 
                {activeType !== 'All' && `• Showing: ${activeType}s`}
                {currentPlayer && ' • 🎵 Playing'}
              </p>
            </div>
            
            {viewMode === 'grid' ? (
              <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6 gap-6">
                {filteredAndSortedItems.map(item => <MediaItemCard key={item.id} item={item} onEdit={handleEdit} onUpdateStatus={handleUpdateStatus} onPlay={handlePlay} />)}
              </div>
            ) : (
              <div className="space-y-3">
                {filteredAndSortedItems.map(item => <MediaItemRow key={item.id} item={item} onEdit={handleEdit} onUpdateStatus={handleUpdateStatus} onPlay={handlePlay} />)}
              </div>
            )}
            
            {filteredAndSortedItems.length === 0 && (
              <div className="text-center py-12">
                <p className="text-slate mb-4">No media items found</p>
                <button
                  onClick={() => setIsAddingMedia(true)}
                  className="bg-emerald text-navy font-bold py-2 px-4 rounded-md hover:bg-opacity-90"
                >
                  Add Your First Item
                </button>
              </div>
            )}
          </div>
        </main>
      </div>
      
      {/* Enhanced Modals */}
      {editingItem && (
        <MetadataEditor 
          item={editingItem}
          onClose={() => setEditingItem(null)}
          onSave={handleSave}
        />
      )}

      {isAddingMedia && (
        <AddMediaModal 
          onClose={() => setIsAddingMedia(false)}
          onAdd={handleAddItem}
        />
      )}

      {isSettingsOpen && <SettingsModal onClose={() => setIsSettingsOpen(false)} onImport={handleImport} />}
      
      <FileImportDialog 
        isOpen={isImportDialogOpen}
        onClose={() => setIsImportDialogOpen(false)}
        onImport={handleFileImport}
      />
    </>
  );
};

// Enhanced App with Theme Provider
const EnhancedApp: React.FC = () => {
  return (
    <ThemeProvider>
      <App />
    </ThemeProvider>
  );
};

export default EnhancedApp;
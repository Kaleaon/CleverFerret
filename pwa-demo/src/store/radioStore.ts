/**
 * Radio Store
 *
 * State management for radio player functionality
 * Handles playback, favorites, and station selection
 */

import { create } from 'zustand';
import { persist } from 'zustand/middleware';
import { RadioStation } from '../data/radioStations';

interface RadioState {
  currentStation: RadioStation | null;
  isPlaying: boolean;
  volume: number;
  favorites: string[]; // Array of station IDs
  recentlyPlayed: RadioStation[];

  // Actions
  setCurrentStation: (station: RadioStation | null) => void;
  play: () => void;
  pause: () => void;
  togglePlay: () => void;
  setVolume: (volume: number) => void;
  toggleFavorite: (stationId: string) => void;
  isFavorite: (stationId: string) => boolean;
  addToRecentlyPlayed: (station: RadioStation) => void;
  clearRecentlyPlayed: () => void;
}

export const useRadioStore = create<RadioState>()(
  persist(
    (set, get) => ({
      currentStation: null,
      isPlaying: false,
      volume: 0.7,
      favorites: [],
      recentlyPlayed: [],

      setCurrentStation: (station) => {
        set({ currentStation: station });
        if (station) {
          get().addToRecentlyPlayed(station);
        }
      },

      play: () => set({ isPlaying: true }),

      pause: () => set({ isPlaying: false }),

      togglePlay: () => set((state) => ({ isPlaying: !state.isPlaying })),

      setVolume: (volume) => set({ volume: Math.max(0, Math.min(1, volume)) }),

      toggleFavorite: (stationId) =>
        set((state) => ({
          favorites: state.favorites.includes(stationId)
            ? state.favorites.filter((id) => id !== stationId)
            : [...state.favorites, stationId],
        })),

      isFavorite: (stationId) => get().favorites.includes(stationId),

      addToRecentlyPlayed: (station) =>
        set((state) => {
          const filtered = state.recentlyPlayed.filter((s) => s.id !== station.id);
          return {
            recentlyPlayed: [station, ...filtered].slice(0, 10), // Keep last 10
          };
        }),

      clearRecentlyPlayed: () => set({ recentlyPlayed: [] }),
    }),
    {
      name: 'radio-storage',
      partialize: (state) => ({
        favorites: state.favorites,
        recentlyPlayed: state.recentlyPlayed,
        volume: state.volume,
      }),
    },
  ),
);

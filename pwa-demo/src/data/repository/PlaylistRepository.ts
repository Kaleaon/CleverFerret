/**
 * Playlist Repository
 *
 * Repository for playlist operations.
 * Migrated from PlaylistRepository.kt
 */

import { db } from '../../services/database-complete';
import type { Playlist, PlaylistItem, MediaItem } from '../local/entity';

export class PlaylistRepository {
  /**
   * Get all playlists
   */
  async getAllPlaylists(): Promise<Playlist[]> {
    return db.playlists.orderBy('name').toArray();
  }

  /**
   * Get playlist by ID
   */
  async getPlaylistById(playlistId: number): Promise<Playlist | undefined> {
    return db.playlists.get(playlistId);
  }

  /**
   * Get items in playlist
   */
  async getPlaylistItems(playlistId: number): Promise<MediaItem[]> {
    const playlistItems = await db.playlistItems
      .where('playlistId')
      .equals(playlistId)
      .sortBy('position');

    const itemIds = playlistItems.map((pi) => pi.mediaItemId);
    const items = await db.mediaItems.bulkGet(itemIds);

    return items.filter((item): item is MediaItem => item !== undefined);
  }

  /**
   * Create new playlist
   */
  async createPlaylist(name: string, description?: string): Promise<number> {
    const playlist: Playlist = {
      playlistId: 0,
      name,
      description,
      isLiked: false,
      isPublic: false,
      shareCode: undefined,
      plexPlaylistId: undefined,
      lastSyncedAt: undefined,
      createdAt: Date.now(),
      updatedAt: Date.now(),
    };

    return db.playlists.add(playlist);
  }

  /**
   * Update playlist
   */
  async updatePlaylist(playlist: Playlist): Promise<void> {
    await db.playlists.update(playlist.playlistId, {
      ...playlist,
      updatedAt: Date.now(),
    });
  }

  /**
   * Delete playlist
   */
  async deletePlaylist(playlistId: number): Promise<void> {
    await db.playlists.delete(playlistId);
  }

  /**
   * Add item to playlist
   */
  async addItemToPlaylist(playlistId: number, mediaItemId: number): Promise<void> {
    // Get current max position
    const items = await db.playlistItems.where('playlistId').equals(playlistId).toArray();

    const maxPosition = items.length > 0 ? Math.max(...items.map((item) => item.position)) : -1;

    const playlistItem: PlaylistItem = {
      id: 0,
      playlistId,
      mediaItemId,
      position: maxPosition + 1,
      addedAt: Date.now(),
    };

    await db.playlistItems.add(playlistItem);

    // Update playlist timestamp
    await db.playlists.update(playlistId, { updatedAt: Date.now() });
  }

  /**
   * Remove item from playlist
   */
  async removeItemFromPlaylist(playlistId: number, mediaItemId: number): Promise<void> {
    await db.playlistItems
      .where('[playlistId+mediaItemId]')
      .equals([playlistId, mediaItemId])
      .delete();

    // Update playlist timestamp
    await db.playlists.update(playlistId, { updatedAt: Date.now() });
  }

  /**
   * Reorder playlist items
   */
  async reorderPlaylistItems(playlistId: number, orderedItemIds: number[]): Promise<void> {
    const updates = orderedItemIds.map(async (mediaItemId, index) => {
      const item = await db.playlistItems
        .where('[playlistId+mediaItemId]')
        .equals([playlistId, mediaItemId])
        .first();

      if (item) {
        return db.playlistItems.update(item.id, { position: index });
      }
    });

    await Promise.all(updates);

    // Update playlist timestamp
    await db.playlists.update(playlistId, { updatedAt: Date.now() });
  }

  /**
   * Clear all items from playlist
   */
  async clearPlaylist(playlistId: number): Promise<void> {
    await db.playlistItems.where('playlistId').equals(playlistId).delete();
    await db.playlists.update(playlistId, { updatedAt: Date.now() });
  }

  /**
   * Get playlist count
   */
  async getPlaylistCount(): Promise<number> {
    return db.playlists.count();
  }

  /**
   * Get item count in playlist
   */
  async getItemCountInPlaylist(playlistId: number): Promise<number> {
    return db.playlistItems.where('playlistId').equals(playlistId).count();
  }

  /**
   * Toggle playlist liked status
   */
  async toggleLiked(playlistId: number): Promise<void> {
    const playlist = await this.getPlaylistById(playlistId);
    if (playlist) {
      await db.playlists.update(playlistId, {
        isLiked: !playlist.isLiked,
        updatedAt: Date.now(),
      });
    }
  }

  /**
   * Check if item is in playlist
   */
  async isItemInPlaylist(playlistId: number, mediaItemId: number): Promise<boolean> {
    const item = await db.playlistItems
      .where('[playlistId+mediaItemId]')
      .equals([playlistId, mediaItemId])
      .first();

    return item !== undefined;
  }
}

// Export singleton instance
export const playlistRepository = new PlaylistRepository();

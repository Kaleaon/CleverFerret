/**
 * Radio Stations Database - Auto-generated from Radio Registry
 * Generated: 2025-10-31 09:41:56
 * Total Stations: 0
 */

export interface RadioStation {
  id: string;
  name: string;
  description: string;
  streamUrls: string[];
  pageUrl: string;
  website?: string;
  genres: string[];
  country: string;
  language: string;
  bitrate?: string;
}

export const radioStations: RadioStation[] = [];

export const getStationsByGenre = (genre: string): RadioStation[] => {
  return radioStations.filter(station => 
    station.genres.some(g => g.toLowerCase().includes(genre.toLowerCase()))
  );
};

export const searchStations = (query: string): RadioStation[] => {
  const searchTerm = query.toLowerCase();
  return radioStations.filter(station =>
    station.name.toLowerCase().includes(searchTerm) ||
    station.description?.toLowerCase().includes(searchTerm) ||
    station.genres.some(g => g.toLowerCase().includes(searchTerm))
  );
};

export const getAllGenres = (): string[] => {
  const genresSet = new Set<string>();
  radioStations.forEach(station => {
    station.genres.forEach(genre => genresSet.add(genre));
  });
  return Array.from(genresSet).sort();
};

export default radioStations;

/**
 * Radio Stations Database
 * 
 * Curated list of internet radio stations with working stream URLs
 * Organized by genre for easy browsing
 */

export interface RadioStation {
  id: string;
  name: string;
  description: string;
  streamUrl: string;
  website?: string;
  genres: string[];
  country: string;
  language: string;
  bitrate?: string;
  logo?: string;
  favorite?: boolean;
}

export const radioStations: RadioStation[] = [
  // ROCK STATIONS
  {
    id: 'classic-rock-florida',
    name: 'Classic Rock Florida',
    description: 'The best classic rock hits',
    streamUrl: 'http://144.217.129.213:8296/;',
    genres: ['Rock', 'Classic Rock'],
    country: 'USA',
    language: 'English',
    bitrate: '320',
  },
  {
    id: '181-rock',
    name: '181.FM - Rock 181',
    description: 'Classic and modern rock',
    streamUrl: 'http://listen.181fm.com/181-rock_128k.mp3',
    genres: ['Rock', 'Alternative'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: 'hard-rock-radio',
    name: 'Hard Rock & Metal Radio',
    streamUrl: 'http://stream.laut.fm/hardrock',
    genres: ['Hard Rock', 'Metal'],
    country: 'International',
    language: 'English',
    bitrate: '128',
  },
  
  // POP STATIONS
  {
    id: '181-power',
    name: '181.FM - Power 181 (Top 40)',
    description: 'Today\'s Hit Music',
    streamUrl: 'http://listen.181fm.com/181-power_128k.mp3',
    genres: ['Pop', 'Top 40'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: 'absolut-top-40',
    name: 'Absolut Top 40',
    streamUrl: 'http://stream.laut.fm/absolut_top40',
    genres: ['Pop', 'Top 40', 'Charts'],
    country: 'International',
    language: 'English',
    bitrate: '128',
  },

  // ELECTRONIC / DANCE
  {
    id: '181-chill',
    name: '181.FM - Chill 181',
    description: 'Chillout Electronic',
    streamUrl: 'http://listen.181fm.com/181-chill_128k.mp3',
    genres: ['Electronic', 'Chill', 'Ambient'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: 'dis-fm',
    name: 'DI.FM - Trance',
    description: 'Trance music 24/7',
    streamUrl: 'http://prem2.di.fm:80/trance',
    genres: ['Trance', 'Electronic', 'Dance'],
    country: 'USA',
    language: 'English',
    bitrate: '96',
  },
  {
    id: 'housetime-fm',
    name: 'HouseTime.FM',
    streamUrl: 'http://mp3.stream.tb-group.fm/ht.mp3',
    genres: ['House', 'Electronic', 'Dance'],
    country: 'Germany',
    language: 'English',
    bitrate: '128',
  },
  {
    id: 'ibiza-sonica',
    name: 'Ibiza Sonica Radio',
    description: 'Electronic music from Ibiza',
    streamUrl: 'http://s3.sonicabroadcast.com:8745/;',
    genres: ['Electronic', 'House', 'Techno'],
    country: 'Spain',
    language: 'English/Spanish',
    bitrate: '128',
  },

  // JAZZ & BLUES
  {
    id: '181-jazz',
    name: '181.FM - Jazz 181',
    streamUrl: 'http://listen.181fm.com/181-jazz_128k.mp3',
    genres: ['Jazz', 'Smooth Jazz'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: 'jazz24',
    name: 'Jazz24',
    description: 'Modern and classic jazz',
    streamUrl: 'http://live.str3am.com:2430/;',
    genres: ['Jazz'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: 'smoothjazz',
    name: 'Smooth Jazz Global',
    streamUrl: 'http://smoothjazz.com.pl:8000/;',
    genres: ['Smooth Jazz', 'Jazz'],
    country: 'International',
    language: 'English',
    bitrate: '128',
  },

  // CLASSICAL
  {
    id: 'venice-classic',
    name: 'Venice Classic Radio',
    streamUrl: 'http://174.36.206.197:8000/;',
    genres: ['Classical'],
    country: 'Italy',
    language: 'Italian/Instrumental',
    bitrate: '128',
  },
  {
    id: '181-classical',
    name: '181.FM - Classical Music',
    streamUrl: 'http://listen.181fm.com/181-classical_128k.mp3',
    genres: ['Classical'],
    country: 'USA',
    language: 'Instrumental',
    bitrate: '128',
  },

  // COUNTRY
  {
    id: '181-country',
    name: '181.FM - Country 181',
    streamUrl: 'http://listen.181fm.com/181-country_128k.mp3',
    genres: ['Country'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: 'kickin-country',
    name: 'Kickin\' Country',
    streamUrl: 'http://jenny.torontocast.com:8014/;',
    genres: ['Country', 'Modern Country'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },

  // HIP HOP / R&B
  {
    id: '181-hiphop',
    name: '181.FM - The Beat (HipHop/R&B)',
    streamUrl: 'http://listen.181fm.com/181-beat_128k.mp3',
    genres: ['Hip Hop', 'R&B', 'Urban'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: 'old-school-hiphop',
    name: 'Old School Hip Hop',
    streamUrl: 'http://stream.laut.fm/oldschoolhiphop',
    genres: ['Hip Hop', '90s', 'Classic'],
    country: 'International',
    language: 'English',
    bitrate: '128',
  },

  // REGGAE
  {
    id: '181-reggae',
    name: '181.FM - Reggae Roots',
    streamUrl: 'http://listen.181fm.com/181-reggae_128k.mp3',
    genres: ['Reggae', 'Ska', 'Dub'],
    country: 'International',
    language: 'English',
    bitrate: '128',
  },

  // OLDIES / RETRO
  {
    id: '181-60s',
    name: '181.FM - 60s',
    streamUrl: 'http://listen.181fm.com/181-60s_128k.mp3',
    genres: ['60s', 'Oldies', 'Classic Rock'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: '181-70s',
    name: '181.FM - 70s',
    streamUrl: 'http://listen.181fm.com/181-70s_128k.mp3',
    genres: ['70s', 'Classic Rock', 'Disco'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: '181-80s',
    name: '181.FM - 80s',
    streamUrl: 'http://listen.181fm.com/181-80s_128k.mp3',
    genres: ['80s', 'New Wave', 'Synth Pop'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },
  {
    id: '181-90s',
    name: '181.FM - 90s',
    streamUrl: 'http://listen.181fm.com/181-90s_128k.mp3',
    genres: ['90s', 'Alternative', 'Grunge'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },

  // NEWS & TALK
  {
    id: 'bbc-world-service',
    name: 'BBC World Service',
    streamUrl: 'http://stream.live.vc.bbcmedia.co.uk/bbc_world_service',
    genres: ['News', 'Talk'],
    country: 'UK',
    language: 'English',
    bitrate: '48',
  },
  {
    id: 'npr-news',
    name: 'NPR News Now',
    streamUrl: 'http://npr-ice.streamguys1.com/live.mp3',
    genres: ['News', 'Talk'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },

  // AMBIENT / CHILLOUT
  {
    id: 'ambient-sleeping-pill',
    name: 'Ambient Sleeping Pill',
    streamUrl: 'http://radio.stereoscenic.com/asp-s',
    genres: ['Ambient', 'Chillout', 'Drone'],
    country: 'International',
    language: 'Instrumental',
    bitrate: '128',
  },
  {
    id: 'soma-fm-drone-zone',
    name: 'SomaFM - Drone Zone',
    description: 'Atmospheric ambient music',
    streamUrl: 'http://ice1.somafm.com/dronezone-128-mp3',
    genres: ['Ambient', 'Drone', 'Chillout'],
    country: 'USA',
    language: 'Instrumental',
    bitrate: '128',
  },

  // INDIE / ALTERNATIVE
  {
    id: '181-indie',
    name: '181.FM - Indie 181',
    streamUrl: 'http://listen.181fm.com/181-indie_128k.mp3',
    genres: ['Indie', 'Alternative'],
    country: 'USA',
    language: 'English',
    bitrate: '128',
  },

  // WORLD MUSIC
  {
    id: 'world-music-radio',
    name: 'World Music Radio',
    streamUrl: 'http://stream.laut.fm/worldmusic',
    genres: ['World', 'International', 'Folk'],
    country: 'International',
    language: 'Various',
    bitrate: '128',
  },
];

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

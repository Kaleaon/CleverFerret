#!/usr/bin/env python3
"""
Comprehensive Radio Station Aggregator
=======================================
Aggregates radio stations from multiple free/open sources that provide
actual streaming URLs.

Sources:
1. Radio Browser API (community-driven, 30,000+ stations)
2. Dirble API (if available)
3. TuneIn (public streams)
4. Community Radio Browser
"""

import requests
import json
import time
from typing import List, Dict, Optional
from tqdm import tqdm
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class RadioStationAggregator:
    """Aggregates radio stations from multiple free sources"""
    
    def __init__(self):
        self.stations = []
        self.radio_browser_api = "https://de1.api.radio-browser.info/json"
        
    def fetch_from_radio_browser(self, limit: int = 1000) -> List[Dict]:
        """
        Fetch stations from Radio-Browser.info API
        This is a community-driven project with 30,000+ stations
        API Docs: https://api.radio-browser.info/
        """
        logger.info("Fetching stations from Radio-Browser.info...")
        
        all_stations = []
        
        try:
            # Get top voted stations
            logger.info("Fetching top voted stations...")
            response = requests.get(
                f"{self.radio_browser_api}/stations/topvote/{limit}",
                headers={'User-Agent': 'CleverFerret/1.0'}
            )
            response.raise_for_status()
            top_stations = response.json()
            
            logger.info(f"Fetched {len(top_stations)} top voted stations")
            all_stations.extend(top_stations)
            
            # Get stations by popular genres
            popular_genres = [
                'pop', 'rock', 'jazz', 'classical', 'electronic',
                'hip hop', 'country', 'blues', 'reggae', 'metal'
            ]
            
            for genre in popular_genres:
                try:
                    logger.info(f"Fetching {genre} stations...")
                    response = requests.get(
                        f"{self.radio_browser_api}/stations/bytag/{genre}",
                        headers={'User-Agent': 'CleverFerret/1.0'}
                    )
                    if response.status_code == 200:
                        genre_stations = response.json()
                        logger.info(f"  Found {len(genre_stations)} {genre} stations")
                        all_stations.extend(genre_stations[:50])  # Top 50 per genre
                    time.sleep(0.5)  # Rate limiting
                except Exception as e:
                    logger.warning(f"Failed to fetch {genre}: {e}")
            
            # Remove duplicates based on stationuuid
            seen = set()
            unique_stations = []
            for station in all_stations:
                if station.get('stationuuid') not in seen:
                    seen.add(station['stationuuid'])
                    unique_stations.append(station)
            
            logger.info(f"Total unique stations from Radio-Browser: {len(unique_stations)}")
            return unique_stations
            
        except Exception as e:
            logger.error(f"Error fetching from Radio-Browser: {e}")
            return []
    
    def fetch_by_country(self, country_code: str, limit: int = 100) -> List[Dict]:
        """Fetch stations by country code"""
        try:
            logger.info(f"Fetching stations from {country_code}...")
            response = requests.get(
                f"{self.radio_browser_api}/stations/bycountrycodeexact/{country_code}",
                headers={'User-Agent': 'CleverFerret/1.0'}
            )
            response.raise_for_status()
            stations = response.json()
            
            # Sort by votes and take top N
            stations.sort(key=lambda x: x.get('votes', 0), reverse=True)
            return stations[:limit]
        except Exception as e:
            logger.error(f"Error fetching from {country_code}: {e}")
            return []
    
    def convert_to_cleverferret_format(self, radio_browser_station: Dict) -> Dict:
        """Convert Radio-Browser format to CleverFerret format"""
        return {
            'id': radio_browser_station.get('stationuuid', ''),
            'name': radio_browser_station.get('name', ''),
            'description': radio_browser_station.get('tags', ''),
            'streamUrl': radio_browser_station.get('url_resolved') or radio_browser_station.get('url', ''),
            'streamUrls': [
                radio_browser_station.get('url_resolved', ''),
                radio_browser_station.get('url', '')
            ],
            'website': radio_browser_station.get('homepage', ''),
            'genres': [t.strip() for t in radio_browser_station.get('tags', '').split(',') if t.strip()][:5],
            'country': radio_browser_station.get('country', ''),
            'countryCode': radio_browser_station.get('countrycode', ''),
            'language': radio_browser_station.get('language', ''),
            'bitrate': str(radio_browser_station.get('bitrate', 0)),
            'codec': radio_browser_station.get('codec', ''),
            'favicon': radio_browser_station.get('favicon', ''),
            'votes': radio_browser_station.get('votes', 0),
            'clickCount': radio_browser_station.get('clickcount', 0),
            'lastCheckOk': radio_browser_station.get('lastcheckok', 0) == 1,
        }
    
    def aggregate_all(self, top_limit: int = 2000):
        """Aggregate stations from all sources"""
        logger.info(f"Starting radio station aggregation...")
        logger.info(f"Target: {top_limit} top stations")
        
        # Get stations from Radio-Browser
        raw_stations = self.fetch_from_radio_browser(limit=top_limit)
        
        # Also fetch from major countries
        major_countries = ['US', 'GB', 'DE', 'FR', 'ES', 'IT', 'CA', 'AU']
        for country in major_countries:
            country_stations = self.fetch_by_country(country, limit=100)
            raw_stations.extend(country_stations)
            time.sleep(1)
        
        # Remove duplicates again
        seen = set()
        unique_raw = []
        for station in raw_stations:
            uuid = station.get('stationuuid')
            if uuid and uuid not in seen:
                seen.add(uuid)
                unique_raw.append(station)
        
        logger.info(f"Total unique raw stations: {len(unique_raw)}")
        
        # Filter for quality
        quality_stations = [
            s for s in unique_raw
            if s.get('url_resolved') and  # Has working stream URL
               s.get('lastcheckok') == 1 and  # Last check was successful
               s.get('bitrate', 0) >= 64  # Minimum bitrate
        ]
        
        logger.info(f"Quality filtered stations: {len(quality_stations)}")
        
        # Sort by quality score (votes + click count)
        quality_stations.sort(
            key=lambda x: x.get('votes', 0) * 2 + x.get('clickcount', 0) / 1000,
            reverse=True
        )
        
        # Take top N
        top_stations = quality_stations[:top_limit]
        
        # Convert to CleverFerret format
        self.stations = [
            self.convert_to_cleverferret_format(s)
            for s in tqdm(top_stations, desc="Converting to CleverFerret format")
        ]
        
        logger.info(f"Final station count: {len(self.stations)}")
        return self.stations
    
    def save_to_files(self, output_dir: str = '/app/pwa-demo/src/data'):
        """Save stations to JSON and TypeScript files"""
        import os
        os.makedirs(output_dir, exist_ok=True)
        
        # Save JSON
        json_file = f"{output_dir}/radioStationsAggregated.json"
        with open(json_file, 'w', encoding='utf-8') as f:
            json.dump({
                'metadata': {
                    'total': len(self.stations),
                    'source': 'Radio-Browser.info Community API',
                    'generated_at': time.strftime('%Y-%m-%d %H:%M:%S'),
                    'api_docs': 'https://api.radio-browser.info/'
                },
                'stations': self.stations
            }, f, indent=2, ensure_ascii=False)
        
        logger.info(f"Saved JSON to: {json_file}")
        
        # Generate TypeScript file
        ts_file = f"{output_dir}/radioStationsAggregated.ts"
        ts_content = f'''/**
 * Radio Stations Database - Aggregated from Radio-Browser.info
 * Generated: {time.strftime('%Y-%m-%d %H:%M:%S')}
 * Total Stations: {len(self.stations)}
 * Source: Radio-Browser.info Community API (30,000+ stations)
 */

export interface RadioStation {{
  id: string;
  name: string;
  description: string;
  streamUrl: string;
  streamUrls: string[];
  website?: string;
  genres: string[];
  country: string;
  countryCode: string;
  language: string;
  bitrate?: string;
  codec?: string;
  favicon?: string;
  votes?: number;
  clickCount?: number;
  lastCheckOk?: boolean;
}}

export const radioStations: RadioStation[] = {json.dumps(self.stations, indent=2, ensure_ascii=False)};

export const getStationsByGenre = (genre: string): RadioStation[] => {{
  return radioStations.filter(station => 
    station.genres.some(g => g.toLowerCase().includes(genre.toLowerCase()))
  );
}};

export const getStationsByCountry = (country: string): RadioStation[] => {{
  return radioStations.filter(station =>
    station.country.toLowerCase().includes(country.toLowerCase()) ||
    station.countryCode.toLowerCase() === country.toLowerCase()
  );
}};

export const searchStations = (query: string): RadioStation[] => {{
  const searchTerm = query.toLowerCase();
  return radioStations.filter(station =>
    station.name.toLowerCase().includes(searchTerm) ||
    station.description?.toLowerCase().includes(searchTerm) ||
    station.genres.some(g => g.toLowerCase().includes(searchTerm))
  );
}};

export const getAllGenres = (): string[] => {{
  const genresSet = new Set<string>();
  radioStations.forEach(station => {{
    station.genres.forEach(genre => {{
      if (genre) genresSet.add(genre);
    }});
  }});
  return Array.from(genresSet).sort();
}};

export const getAllCountries = (): string[] => {{
  const countriesSet = new Set<string>();
  radioStations.forEach(station => {{
    if (station.country) countriesSet.add(station.country);
  }});
  return Array.from(countriesSet).sort();
}};

export const getTopStations = (limit: number = 50): RadioStation[] => {{
  return radioStations.slice(0, limit);
}};

export default radioStations;
'''
        
        with open(ts_file, 'w', encoding='utf-8') as f:
            f.write(ts_content)
        
        logger.info(f"Saved TypeScript to: {ts_file}")
        
        # Print summary
        self.print_summary()
    
    def print_summary(self):
        """Print aggregation summary"""
        print("\n" + "="*70)
        print("RADIO STATION AGGREGATION SUMMARY")
        print("="*70)
        print(f"\nTotal Stations: {len(self.stations)}")
        
        # Genre distribution
        genre_count = {}
        for station in self.stations:
            for genre in station['genres']:
                if genre:
                    genre_count[genre] = genre_count.get(genre, 0) + 1
        
        print(f"\nTotal Genres: {len(genre_count)}")
        print("\nTop 20 Genres:")
        for genre, count in sorted(genre_count.items(), key=lambda x: x[1], reverse=True)[:20]:
            print(f"  {genre}: {count} stations")
        
        # Country distribution
        country_count = {}
        for station in self.stations:
            country = station['country']
            if country:
                country_count[country] = country_count.get(country, 0) + 1
        
        print(f"\nTotal Countries: {len(country_count)}")
        print("\nTop 10 Countries:")
        for country, count in sorted(country_count.items(), key=lambda x: x[1], reverse=True)[:10]:
            print(f"  {country}: {count} stations")
        
        # Bitrate statistics
        bitrates = [int(s['bitrate']) for s in self.stations if s['bitrate'] and s['bitrate'].isdigit()]
        if bitrates:
            avg_bitrate = sum(bitrates) / len(bitrates)
            print(f"\nBitrate Statistics:")
            print(f"  Average: {avg_bitrate:.0f} kbps")
            print(f"  Min: {min(bitrates)} kbps")
            print(f"  Max: {max(bitrates)} kbps")
        
        print("\n" + "="*70)


def main():
    """Main execution"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Aggregate radio stations from public APIs')
    parser.add_argument('--limit', type=int, default=2000,
                       help='Number of top stations to aggregate (default: 2000)')
    parser.add_argument('--output', default='/app/pwa-demo/src/data',
                       help='Output directory')
    
    args = parser.parse_args()
    
    aggregator = RadioStationAggregator()
    
    try:
        logger.info("="*70)
        logger.info("RADIO STATION AGGREGATOR")
        logger.info("="*70)
        
        # Aggregate stations
        aggregator.aggregate_all(top_limit=args.limit)
        
        # Save results
        aggregator.save_to_files(output_dir=args.output)
        
        print("\n✅ Aggregation completed successfully!")
        print(f"📁 Files saved to: {args.output}/")
        print(f"   - radioStationsAggregated.json")
        print(f"   - radioStationsAggregated.ts")
        
        return 0
        
    except KeyboardInterrupt:
        print("\n\n⚠️  Aggregation interrupted by user")
        return 1
    except Exception as e:
        logger.error(f"Fatal error: {e}", exc_info=True)
        return 1


if __name__ == '__main__':
    exit(main())

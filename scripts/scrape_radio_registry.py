#!/usr/bin/env python3
"""
Radio Registry Scraper
======================
Extracts actual streaming URLs and station data from radioregistry.com links.

This script:
1. Parses the radio_stations.md file
2. Scrapes each radioregistry.com page
3. Extracts streaming URLs (M3U, PLS, direct streams)
4. Validates and saves data to JSON
5. Handles rate limiting and retries
"""

import re
import json
import time
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse
from typing import Dict, List, Optional
from pathlib import Path
import concurrent.futures
from tqdm import tqdm
import logging

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('/tmp/radio_scraper.log'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

class RadioRegistryScraper:
    """Scrapes radio station data from radioregistry.com"""
    
    def __init__(self, input_file: str, output_file: str):
        self.input_file = input_file
        self.output_file = output_file
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.5',
            'Connection': 'keep-alive',
        })
        self.results = []
        self.errors = []
        self.rate_limit_delay = 2  # seconds between requests
        
    def parse_markdown_file(self) -> List[Dict]:
        """Parse the radio_stations.md file to extract station info"""
        logger.info(f"Parsing markdown file: {self.input_file}")
        
        with open(self.input_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Extract stations using regex
        pattern = r'## (\d+)\. (.+?)\n\n- \*\*Link:\*\* (.+?)\n- \*\*Genres:\*\* (.+?)\n- \*\*Bitrate:\*\* (.+?)\n'
        matches = re.findall(pattern, content)
        
        # Create unique stations dictionary
        unique_stations = {}
        for match in matches:
            station_id, name, link, genres, bitrate = match
            if name not in unique_stations:
                unique_stations[name] = {
                    'name': name.strip(),
                    'page_url': link.strip(),
                    'genres': [g.strip() for g in genres.split(',')],
                    'bitrate': bitrate.strip()
                }
        
        stations_list = list(unique_stations.values())
        logger.info(f"Found {len(stations_list)} unique stations")
        return stations_list
    
    def extract_stream_urls(self, soup: BeautifulSoup, page_url: str) -> List[str]:
        """Extract streaming URLs from the page"""
        stream_urls = []
        
        # Look for common patterns in streaming URLs
        # Pattern 1: Direct links to .m3u, .pls, .mp3, .aac files
        for link in soup.find_all('a', href=True):
            href = link['href']
            if any(ext in href.lower() for ext in ['.m3u', '.pls', '.mp3', '.aac', '.ogg']):
                full_url = urljoin(page_url, href)
                stream_urls.append(full_url)
        
        # Pattern 2: Look for streaming URLs in specific containers
        # Many radio sites use specific class names or data attributes
        for element in soup.find_all(['div', 'span', 'button'], {'class': re.compile(r'stream|play|listen', re.I)}):
            # Check data attributes
            for attr in ['data-stream', 'data-url', 'data-src', 'data-stream-url']:
                if attr in element.attrs:
                    stream_urls.append(element[attr])
        
        # Pattern 3: Look in script tags for stream URLs
        for script in soup.find_all('script'):
            if script.string:
                # Find URLs in JavaScript
                url_pattern = r'https?://[^\s"\'\)]+(?:\.m3u|\.pls|\.mp3|\.aac|/stream|/listen)'
                found_urls = re.findall(url_pattern, script.string)
                stream_urls.extend(found_urls)
        
        # Pattern 4: Look for specific streaming patterns
        # Icecast/Shoutcast patterns
        text_content = soup.get_text()
        stream_pattern = r'https?://[^\s]+:\d+/[^\s]+'
        potential_streams = re.findall(stream_pattern, text_content)
        stream_urls.extend(potential_streams)
        
        # Remove duplicates and clean URLs
        cleaned_urls = []
        seen = set()
        for url in stream_urls:
            url = url.strip().strip('"\'')
            if url and url not in seen:
                seen.add(url)
                cleaned_urls.append(url)
        
        return cleaned_urls
    
    def extract_station_info(self, soup: BeautifulSoup) -> Dict:
        """Extract additional station information from the page"""
        info = {
            'description': '',
            'website': '',
            'country': '',
            'language': '',
            'format': '',
        }
        
        # Look for description
        desc_selectors = ['meta[name="description"]', 'meta[property="og:description"]']
        for selector in desc_selectors:
            meta = soup.select_one(selector)
            if meta and meta.get('content'):
                info['description'] = meta['content'].strip()
                break
        
        # Look for website link
        for link in soup.find_all('a', href=True):
            if 'website' in link.get_text().lower() or 'official' in link.get_text().lower():
                info['website'] = link['href']
                break
        
        # Look for country/language in text
        text = soup.get_text().lower()
        countries = ['usa', 'uk', 'canada', 'germany', 'france', 'spain', 'italy']
        for country in countries:
            if country in text:
                info['country'] = country.upper()
                break
        
        return info
    
    def scrape_station_page(self, station: Dict) -> Optional[Dict]:
        """Scrape a single station page to get streaming URLs"""
        url = station['page_url']
        
        try:
            logger.info(f"Scraping: {station['name']}")
            
            # Add delay to respect rate limiting
            time.sleep(self.rate_limit_delay)
            
            response = self.session.get(url, timeout=15)
            response.raise_for_status()
            
            soup = BeautifulSoup(response.content, 'html.parser')
            
            # Extract streaming URLs
            stream_urls = self.extract_stream_urls(soup, url)
            
            if not stream_urls:
                logger.warning(f"No stream URLs found for: {station['name']}")
                self.errors.append({
                    'station': station['name'],
                    'error': 'No stream URLs found',
                    'url': url
                })
                return None
            
            # Extract additional info
            additional_info = self.extract_station_info(soup)
            
            # Build result
            result = {
                'id': station['name'].lower().replace(' ', '-').replace('/', '-'),
                'name': station['name'],
                'description': additional_info['description'] or station['name'],
                'genres': station['genres'],
                'bitrate': station['bitrate'],
                'stream_urls': stream_urls,
                'page_url': url,
                'website': additional_info['website'],
                'country': additional_info['country'],
                'language': additional_info['language'] or 'English',
                'scraped_at': time.strftime('%Y-%m-%d %H:%M:%S')
            }
            
            logger.info(f"✓ Successfully scraped: {station['name']} ({len(stream_urls)} URLs found)")
            return result
            
        except requests.RequestException as e:
            logger.error(f"✗ Request error for {station['name']}: {str(e)}")
            self.errors.append({
                'station': station['name'],
                'error': str(e),
                'url': url
            })
            return None
        except Exception as e:
            logger.error(f"✗ Unexpected error for {station['name']}: {str(e)}")
            self.errors.append({
                'station': station['name'],
                'error': str(e),
                'url': url
            })
            return None
    
    def validate_stream_url(self, url: str) -> bool:
        """Validate if a stream URL is accessible"""
        try:
            response = requests.head(url, timeout=5, allow_redirects=True)
            return response.status_code < 400
        except:
            return False
    
    def scrape_all(self, max_workers: int = 5, limit: Optional[int] = None):
        """Scrape all stations with concurrent requests"""
        stations = self.parse_markdown_file()
        
        if limit:
            stations = stations[:limit]
            logger.info(f"Limited to first {limit} stations for testing")
        
        logger.info(f"Starting to scrape {len(stations)} stations with {max_workers} workers...")
        
        # Use ThreadPoolExecutor for concurrent scraping
        with concurrent.futures.ThreadPoolExecutor(max_workers=max_workers) as executor:
            # Create progress bar
            futures = {executor.submit(self.scrape_station_page, station): station 
                      for station in stations}
            
            for future in tqdm(concurrent.futures.as_completed(futures), 
                             total=len(futures), 
                             desc="Scraping stations"):
                result = future.result()
                if result:
                    self.results.append(result)
        
        logger.info(f"Scraping complete! Successfully scraped {len(self.results)}/{len(stations)} stations")
        logger.info(f"Errors: {len(self.errors)}")
    
    def save_results(self):
        """Save results to JSON file"""
        output_data = {
            'metadata': {
                'total_stations': len(self.results),
                'total_errors': len(self.errors),
                'scraped_at': time.strftime('%Y-%m-%d %H:%M:%S'),
                'source_file': self.input_file
            },
            'stations': self.results,
            'errors': self.errors
        }
        
        # Save full results
        with open(self.output_file, 'w', encoding='utf-8') as f:
            json.dump(output_data, f, indent=2, ensure_ascii=False)
        
        logger.info(f"Results saved to: {self.output_file}")
        
        # Save TypeScript-friendly format for PWA
        ts_output = self.output_file.replace('.json', '.ts')
        self.generate_typescript_file(ts_output)
        
        # Save error report
        error_file = self.output_file.replace('.json', '_errors.json')
        with open(error_file, 'w', encoding='utf-8') as f:
            json.dump(self.errors, f, indent=2, ensure_ascii=False)
        
        logger.info(f"Error report saved to: {error_file}")
        
        # Print summary
        self.print_summary()
    
    def generate_typescript_file(self, output_file: str):
        """Generate TypeScript file for easy import in PWA"""
        ts_content = '''/**
 * Radio Stations Database - Auto-generated from Radio Registry
 * Generated: {timestamp}
 * Total Stations: {total}
 */

export interface RadioStation {{
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
}}

export const radioStations: RadioStation[] = {stations};

export const getStationsByGenre = (genre: string): RadioStation[] => {{
  return radioStations.filter(station => 
    station.genres.some(g => g.toLowerCase().includes(genre.toLowerCase()))
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
    station.genres.forEach(genre => genresSet.add(genre));
  }});
  return Array.from(genresSet).sort();
}};

export default radioStations;
'''.format(
            timestamp=time.strftime('%Y-%m-%d %H:%M:%S'),
            total=len(self.results),
            stations=json.dumps([{
                'id': s['id'],
                'name': s['name'],
                'description': s['description'],
                'streamUrls': s['stream_urls'],
                'pageUrl': s['page_url'],
                'website': s['website'],
                'genres': s['genres'],
                'country': s['country'],
                'language': s['language'],
                'bitrate': s['bitrate']
            } for s in self.results], indent=2)
        )
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(ts_content)
        
        logger.info(f"TypeScript file generated: {output_file}")
    
    def print_summary(self):
        """Print scraping summary"""
        print("\n" + "="*70)
        print("RADIO REGISTRY SCRAPING SUMMARY")
        print("="*70)
        print(f"\nTotal Stations Attempted: {len(self.results) + len(self.errors)}")
        print(f"Successfully Scraped: {len(self.results)}")
        print(f"Failed: {len(self.errors)}")
        print(f"Success Rate: {len(self.results)/(len(self.results)+len(self.errors))*100:.1f}%")
        
        # Genre distribution
        genre_count = {}
        for station in self.results:
            for genre in station['genres']:
                genre_count[genre] = genre_count.get(genre, 0) + 1
        
        print(f"\nGenres Found: {len(genre_count)}")
        print("\nTop 10 Genres:")
        for genre, count in sorted(genre_count.items(), key=lambda x: x[1], reverse=True)[:10]:
            print(f"  {genre}: {count} stations")
        
        # Stream URLs statistics
        total_urls = sum(len(s['stream_urls']) for s in self.results)
        avg_urls = total_urls / len(self.results) if self.results else 0
        print(f"\nTotal Stream URLs Found: {total_urls}")
        print(f"Average URLs per Station: {avg_urls:.1f}")
        
        print("\n" + "="*70)


def main():
    """Main execution function"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Scrape radio stations from Radio Registry')
    parser.add_argument('--input', default='/app/archive/feature-docs/radio_stations.md',
                       help='Input markdown file')
    parser.add_argument('--output', default='/app/pwa-demo/src/data/radioStationsScraped.json',
                       help='Output JSON file')
    parser.add_argument('--workers', type=int, default=3,
                       help='Number of concurrent workers (default: 3)')
    parser.add_argument('--limit', type=int, default=None,
                       help='Limit number of stations to scrape (for testing)')
    parser.add_argument('--delay', type=float, default=2.0,
                       help='Delay between requests in seconds (default: 2.0)')
    
    args = parser.parse_args()
    
    # Create scraper
    scraper = RadioRegistryScraper(args.input, args.output)
    scraper.rate_limit_delay = args.delay
    
    # Run scraping
    try:
        scraper.scrape_all(max_workers=args.workers, limit=args.limit)
        scraper.save_results()
        
        print("\n✅ Scraping completed successfully!")
        print(f"📁 Results saved to: {args.output}")
        print(f"📁 TypeScript file: {args.output.replace('.json', '.ts')}")
        print(f"📁 Error report: {args.output.replace('.json', '_errors.json')}")
        
    except KeyboardInterrupt:
        print("\n\n⚠️  Scraping interrupted by user")
        print(f"Saving partial results...")
        scraper.save_results()
        print("Partial results saved")
    except Exception as e:
        logger.error(f"Fatal error: {str(e)}", exc_info=True)
        print(f"\n❌ Fatal error occurred: {str(e)}")
        return 1
    
    return 0


if __name__ == '__main__':
    exit(main())

"""Main photo organizer module."""

import hashlib
import logging
import shutil
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple, Union
from concurrent.futures import ThreadPoolExecutor, as_completed

from PIL import Image
from PIL.ExifTags import TAGS
from tqdm import tqdm

from .config import Config
from .tagger import AutoTagger, TagResult
from .cover_detector import CoverDetector, CoverDetectionResult

logger = logging.getLogger(__name__)


@dataclass
class PhotoInfo:
    """Information about a photo."""
    path: Path
    filename: str
    size: int
    modified_time: datetime
    created_time: Optional[datetime] = None
    exif_date: Optional[datetime] = None
    tags: List[str] = field(default_factory=list)
    tag_scores: Dict[str, float] = field(default_factory=dict)
    is_cover: bool = False
    cover_type: Optional[str] = None
    cover_confidence: float = 0.0
    file_hash: Optional[str] = None
    destination: Optional[Path] = None
    
    @property
    def best_date(self) -> datetime:
        """Get the best available date for the photo."""
        return self.exif_date or self.created_time or self.modified_time


@dataclass 
class OrganizeStats:
    """Statistics from organizing photos."""
    total_files: int = 0
    processed: int = 0
    skipped: int = 0
    covers_found: int = 0
    duplicates: int = 0
    errors: int = 0
    tags_assigned: int = 0
    files_moved: int = 0


class PhotoOrganizer:
    """Main photo organizer class."""
    
    def __init__(self, config: Optional[Config] = None):
        """Initialize the photo organizer.
        
        Args:
            config: Configuration object. If None, uses defaults.
        """
        self.config = config or Config()
        
        # Initialize components lazily
        self._tagger: Optional[AutoTagger] = None
        self._cover_detector: Optional[CoverDetector] = None
        
        # Setup logging
        self._setup_logging()
        
        # Ensure cache directory exists
        self.config.cache_path.mkdir(parents=True, exist_ok=True)
    
    def _setup_logging(self) -> None:
        """Setup logging configuration."""
        log_level = getattr(logging, self.config.get("logging.level", "INFO"))
        log_file = self.config.get("logging.file")
        
        logging.basicConfig(
            level=log_level,
            format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
            handlers=[
                logging.StreamHandler(),
                logging.FileHandler(log_file) if log_file else logging.NullHandler(),
            ],
        )
    
    @property
    def tagger(self) -> AutoTagger:
        """Get or create the auto-tagger."""
        if self._tagger is None:
            self._tagger = AutoTagger(
                model_name=self.config.get("tagging.model", "clip"),
                device="cuda" if self.config.get("performance.use_gpu") else "cpu",
                cache_dir=self.config.cache_path,
            )
        return self._tagger
    
    @property
    def cover_detector(self) -> CoverDetector:
        """Get or create the cover detector."""
        if self._cover_detector is None:
            self._cover_detector = CoverDetector(
                use_ml=self.config.get("cover_detection.settings.use_ml_classifier", True),
                device="cuda" if self.config.get("performance.use_gpu") else "cpu",
                cache_dir=self.config.cache_path,
            )
        return self._cover_detector
    
    def scan_directory(
        self,
        directory: Optional[Path] = None,
        recursive: bool = True,
    ) -> List[Path]:
        """Scan directory for image files.
        
        Args:
            directory: Directory to scan. Defaults to config source path.
            recursive: Whether to scan subdirectories.
        
        Returns:
            List of image file paths.
        """
        directory = directory or self.config.source_path
        directory = Path(directory)
        
        if not directory.exists():
            raise ValueError(f"Directory does not exist: {directory}")
        
        extensions = set(self.config.supported_extensions)
        min_size = self.config.get("files.min_size", 0)
        skip_hidden = self.config.get("files.skip_hidden", True)
        
        image_files = []
        
        pattern = "**/*" if recursive else "*"
        for path in directory.glob(pattern):
            if not path.is_file():
                continue
            
            # Skip hidden files
            if skip_hidden and path.name.startswith("."):
                continue
            
            # Check extension
            if path.suffix.lower() not in extensions:
                continue
            
            # Check file size
            try:
                if path.stat().st_size < min_size:
                    continue
            except OSError:
                continue
            
            image_files.append(path)
        
        logger.info(f"Found {len(image_files)} image files in {directory}")
        return image_files
    
    def analyze_photo(self, image_path: Path) -> PhotoInfo:
        """Analyze a single photo.
        
        Args:
            image_path: Path to the image file.
        
        Returns:
            PhotoInfo with analysis results.
        """
        stat = image_path.stat()
        
        info = PhotoInfo(
            path=image_path,
            filename=image_path.name,
            size=stat.st_size,
            modified_time=datetime.fromtimestamp(stat.st_mtime),
        )
        
        # Try to get creation time
        try:
            info.created_time = datetime.fromtimestamp(stat.st_ctime)
        except Exception:
            pass
        
        # Extract EXIF date
        try:
            info.exif_date = self._extract_exif_date(image_path)
        except Exception as e:
            logger.debug(f"Failed to extract EXIF from {image_path}: {e}")
        
        # Auto-tag if enabled
        if self.config.get("tagging.enabled", True):
            try:
                tag_result = self.tagger.tag_image(
                    image_path,
                    confidence_threshold=self.config.get("tagging.confidence_threshold", 0.25),
                    max_tags=self.config.get("tagging.max_tags", 10),
                )
                info.tags = tag_result.tags
                info.tag_scores = tag_result.scores
            except Exception as e:
                logger.warning(f"Failed to tag {image_path}: {e}")
        
        # Check if it's a cover
        if self.config.get("cover_detection.enabled", True):
            try:
                cover_result = self.cover_detector.detect(image_path)
                info.is_cover = cover_result.is_cover
                info.cover_type = cover_result.cover_type
                info.cover_confidence = cover_result.confidence
            except Exception as e:
                logger.warning(f"Failed cover detection for {image_path}: {e}")
        
        return info
    
    def _extract_exif_date(self, image_path: Path) -> Optional[datetime]:
        """Extract date from EXIF metadata.
        
        Args:
            image_path: Path to image file.
        
        Returns:
            Datetime from EXIF or None.
        """
        try:
            image = Image.open(image_path)
            exif = image._getexif()
            
            if exif is None:
                return None
            
            # Look for DateTimeOriginal (36867) or DateTime (306)
            date_tags = [36867, 36868, 306]
            
            for tag_id in date_tags:
                if tag_id in exif:
                    date_str = exif[tag_id]
                    try:
                        return datetime.strptime(date_str, "%Y:%m:%d %H:%M:%S")
                    except ValueError:
                        continue
            
            return None
        except Exception:
            return None
    
    def compute_file_hash(self, file_path: Path, quick: bool = True) -> str:
        """Compute hash for a file.
        
        Args:
            file_path: Path to file.
            quick: If True, only hash first 64KB for speed.
        
        Returns:
            Hash string.
        """
        hasher = hashlib.md5()
        
        with open(file_path, "rb") as f:
            if quick:
                hasher.update(f.read(65536))  # First 64KB
            else:
                while chunk := f.read(8192):
                    hasher.update(chunk)
        
        return hasher.hexdigest()
    
    def determine_destination(self, info: PhotoInfo) -> Path:
        """Determine destination path for a photo.
        
        Args:
            info: PhotoInfo object.
        
        Returns:
            Destination path.
        """
        dest_base = self.config.destination_path
        strategy = self.config.get("organization.strategy", "hybrid")
        
        # Handle covers
        if info.is_cover:
            cover_mode = self.config.get("cover_detection.mode", "separate")
            
            if cover_mode == "ignore":
                return None  # Skip this file
            elif cover_mode == "separate":
                covers_folder = self.config.get("cover_detection.covers_folder", "_Covers")
                if info.cover_type:
                    return dest_base / covers_folder / info.cover_type / info.filename
                return dest_base / covers_folder / info.filename
            # else "tag" - continue with normal organization
        
        # Determine folder structure based on strategy
        if strategy == "date":
            date_format = self.config.get("organization.date_format", "%Y/%Y-%m")
            date_folder = info.best_date.strftime(date_format)
            return dest_base / date_folder / info.filename
        
        elif strategy == "tags":
            if info.tags:
                primary_tag = info.tags[0]
                return dest_base / primary_tag / info.filename
            return dest_base / "Untagged" / info.filename
        
        elif strategy == "hybrid":
            # Combine date and tags
            date_format = self.config.get("organization.date_format", "%Y/%Y-%m")
            date_folder = info.best_date.strftime(date_format)
            
            if self.config.get("organization.use_tag_folders", True) and info.tags:
                primary_tag = info.tags[0]
                return dest_base / date_folder / primary_tag / info.filename
            
            return dest_base / date_folder / info.filename
        
        else:  # flat
            return dest_base / info.filename
    
    def organize(
        self,
        source: Optional[Path] = None,
        destination: Optional[Path] = None,
        dry_run: bool = False,
        progress: bool = True,
    ) -> OrganizeStats:
        """Organize photos from source to destination.
        
        Args:
            source: Source directory. Defaults to config.
            destination: Destination directory. Defaults to config.
            dry_run: If True, don't actually move files.
            progress: Show progress bar.
        
        Returns:
            OrganizeStats with operation statistics.
        """
        source = source or self.config.source_path
        if destination:
            self.config.set("paths.destination", str(destination))
        
        stats = OrganizeStats()
        
        # Scan for images
        logger.info(f"Scanning {source} for images...")
        image_files = self.scan_directory(source)
        stats.total_files = len(image_files)
        
        if not image_files:
            logger.warning("No images found to organize")
            return stats
        
        # Track duplicates
        seen_hashes: Dict[str, Path] = {}
        duplicate_handling = self.config.get("organization.duplicates", "skip")
        
        # Process images
        iterator = tqdm(image_files, desc="Analyzing") if progress else image_files
        
        for image_path in iterator:
            try:
                # Analyze photo
                info = self.analyze_photo(image_path)
                stats.processed += 1
                
                if info.tags:
                    stats.tags_assigned += len(info.tags)
                
                if info.is_cover:
                    stats.covers_found += 1
                    logger.debug(f"Cover detected: {image_path} ({info.cover_type})")
                
                # Check for duplicates
                file_hash = self.compute_file_hash(image_path)
                if file_hash in seen_hashes:
                    stats.duplicates += 1
                    if duplicate_handling == "skip":
                        logger.debug(f"Skipping duplicate: {image_path}")
                        stats.skipped += 1
                        continue
                seen_hashes[file_hash] = image_path
                
                # Determine destination
                dest_path = self.determine_destination(info)
                
                if dest_path is None:
                    # Skip (e.g., cover with mode=ignore)
                    stats.skipped += 1
                    continue
                
                info.destination = dest_path
                
                # Move/copy file
                if not dry_run:
                    self._move_file(image_path, dest_path)
                    stats.files_moved += 1
                else:
                    logger.info(f"[DRY RUN] Would move {image_path} -> {dest_path}")
                
            except Exception as e:
                logger.error(f"Error processing {image_path}: {e}")
                stats.errors += 1
        
        # Log summary
        logger.info(f"Organization complete:")
        logger.info(f"  Total files: {stats.total_files}")
        logger.info(f"  Processed: {stats.processed}")
        logger.info(f"  Moved: {stats.files_moved}")
        logger.info(f"  Covers found: {stats.covers_found}")
        logger.info(f"  Duplicates: {stats.duplicates}")
        logger.info(f"  Skipped: {stats.skipped}")
        logger.info(f"  Errors: {stats.errors}")
        logger.info(f"  Tags assigned: {stats.tags_assigned}")
        
        return stats
    
    def _move_file(self, source: Path, destination: Path) -> None:
        """Move a file to destination, creating directories as needed.
        
        Args:
            source: Source file path.
            destination: Destination file path.
        """
        # Create destination directory
        destination.parent.mkdir(parents=True, exist_ok=True)
        
        # Handle existing files
        if destination.exists():
            duplicate_handling = self.config.get("organization.duplicates", "skip")
            
            if duplicate_handling == "skip":
                logger.debug(f"Skipping existing: {destination}")
                return
            elif duplicate_handling == "rename":
                # Add number suffix
                stem = destination.stem
                suffix = destination.suffix
                counter = 1
                while destination.exists():
                    destination = destination.parent / f"{stem}_{counter}{suffix}"
                    counter += 1
            # else "replace" - will overwrite
        
        # Copy file (preserving original for safety)
        shutil.copy2(source, destination)
        logger.debug(f"Copied: {source} -> {destination}")
    
    def analyze_batch(
        self,
        image_paths: List[Path],
        workers: Optional[int] = None,
        progress: bool = True,
    ) -> List[PhotoInfo]:
        """Analyze multiple photos in parallel.
        
        Args:
            image_paths: List of image paths.
            workers: Number of worker threads.
            progress: Show progress bar.
        
        Returns:
            List of PhotoInfo objects.
        """
        workers = workers or self.config.get("performance.workers", 4)
        results = []
        
        with ThreadPoolExecutor(max_workers=workers) as executor:
            futures = {
                executor.submit(self.analyze_photo, path): path
                for path in image_paths
            }
            
            iterator = as_completed(futures)
            if progress:
                iterator = tqdm(iterator, total=len(futures), desc="Analyzing")
            
            for future in iterator:
                path = futures[future]
                try:
                    info = future.result()
                    results.append(info)
                except Exception as e:
                    logger.error(f"Failed to analyze {path}: {e}")
        
        return results
    
    def preview(
        self,
        source: Optional[Path] = None,
        limit: int = 20,
    ) -> List[Tuple[PhotoInfo, Path]]:
        """Preview organization without moving files.
        
        Args:
            source: Source directory.
            limit: Maximum number of files to preview.
        
        Returns:
            List of (PhotoInfo, destination_path) tuples.
        """
        source = source or self.config.source_path
        
        image_files = self.scan_directory(source)[:limit]
        
        previews = []
        for path in tqdm(image_files, desc="Analyzing"):
            try:
                info = self.analyze_photo(path)
                dest = self.determine_destination(info)
                previews.append((info, dest))
            except Exception as e:
                logger.error(f"Error previewing {path}: {e}")
        
        return previews

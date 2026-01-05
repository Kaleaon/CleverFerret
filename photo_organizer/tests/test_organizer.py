"""Tests for organizer module."""

import tempfile
from datetime import datetime
from pathlib import Path

import pytest
from PIL import Image

from photo_organizer.config import Config
from photo_organizer.organizer import PhotoOrganizer, PhotoInfo, OrganizeStats


class TestPhotoInfo:
    """Test cases for PhotoInfo dataclass."""
    
    def test_best_date_exif(self):
        """Test best_date returns EXIF date when available."""
        exif_date = datetime(2024, 1, 15, 10, 30, 0)
        modified = datetime(2024, 6, 1)
        
        info = PhotoInfo(
            path=Path("/test/photo.jpg"),
            filename="photo.jpg",
            size=1000,
            modified_time=modified,
            exif_date=exif_date,
        )
        
        assert info.best_date == exif_date
    
    def test_best_date_fallback(self):
        """Test best_date falls back to modified time."""
        modified = datetime(2024, 6, 1)
        
        info = PhotoInfo(
            path=Path("/test/photo.jpg"),
            filename="photo.jpg",
            size=1000,
            modified_time=modified,
        )
        
        assert info.best_date == modified


class TestPhotoOrganizer:
    """Test cases for PhotoOrganizer class."""
    
    @pytest.fixture
    def config(self):
        """Create test configuration."""
        config = Config()
        config.set("tagging.enabled", False)  # Disable ML for tests
        config.set("cover_detection.settings.use_ml_classifier", False)
        config.set("files.min_size", 0)  # Allow small test files
        return config
    
    @pytest.fixture
    def organizer(self, config):
        """Create organizer with test config."""
        return PhotoOrganizer(config)
    
    @pytest.fixture
    def sample_photos_dir(self):
        """Create directory with sample photos."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tmppath = Path(tmpdir)
            
            # Create some test images
            for i, name in enumerate(["photo1.jpg", "photo2.png", "cover.jpg"]):
                img = Image.new("RGB", (100 + i * 50, 100 + i * 50), color=(i * 50, i * 50, i * 50))
                img.save(tmppath / name)
            
            # Create subdirectory with more images
            subdir = tmppath / "vacation"
            subdir.mkdir()
            img = Image.new("RGB", (200, 200), color="blue")
            img.save(subdir / "beach.jpg")
            
            yield tmppath
    
    def test_scan_directory(self, organizer, sample_photos_dir):
        """Test scanning directory for images."""
        files = organizer.scan_directory(directory=sample_photos_dir)
        
        assert len(files) == 4
        assert all(f.suffix.lower() in [".jpg", ".png"] for f in files)
    
    def test_scan_directory_non_recursive(self, organizer, sample_photos_dir):
        """Test scanning without recursion."""
        files = organizer.scan_directory(directory=sample_photos_dir, recursive=False)
        
        assert len(files) == 3  # Only root level files
    
    def test_analyze_photo(self, organizer, sample_photos_dir):
        """Test analyzing a single photo."""
        photo_path = sample_photos_dir / "photo1.jpg"
        
        info = organizer.analyze_photo(photo_path)
        
        assert info.path == photo_path
        assert info.filename == "photo1.jpg"
        assert info.size > 0
        assert info.modified_time is not None
    
    def test_compute_file_hash(self, organizer, sample_photos_dir):
        """Test file hash computation."""
        photo_path = sample_photos_dir / "photo1.jpg"
        
        hash1 = organizer.compute_file_hash(photo_path)
        hash2 = organizer.compute_file_hash(photo_path)
        
        assert hash1 == hash2  # Same file, same hash
        assert len(hash1) == 32  # MD5 hash length
    
    def test_determine_destination_date_strategy(self, organizer, sample_photos_dir):
        """Test destination determination with date strategy."""
        organizer.config.set("organization.strategy", "date")
        organizer.config.set("paths.destination", str(sample_photos_dir / "output"))
        
        info = PhotoInfo(
            path=sample_photos_dir / "photo1.jpg",
            filename="photo1.jpg",
            size=1000,
            modified_time=datetime(2024, 3, 15),
        )
        
        dest = organizer.determine_destination(info)
        
        assert "2024" in str(dest)
        assert dest.name == "photo1.jpg"
    
    def test_determine_destination_cover_separate(self, organizer, sample_photos_dir):
        """Test that covers go to separate folder."""
        organizer.config.set("cover_detection.mode", "separate")
        organizer.config.set("paths.destination", str(sample_photos_dir / "output"))
        
        info = PhotoInfo(
            path=sample_photos_dir / "cover.jpg",
            filename="cover.jpg",
            size=1000,
            modified_time=datetime(2024, 3, 15),
            is_cover=True,
            cover_type="album",
        )
        
        dest = organizer.determine_destination(info)
        
        assert "_Covers" in str(dest)
        assert "album" in str(dest)
    
    def test_determine_destination_cover_ignore(self, organizer, sample_photos_dir):
        """Test that covers are skipped when mode is ignore."""
        organizer.config.set("cover_detection.mode", "ignore")
        
        info = PhotoInfo(
            path=sample_photos_dir / "cover.jpg",
            filename="cover.jpg",
            size=1000,
            modified_time=datetime(2024, 3, 15),
            is_cover=True,
        )
        
        dest = organizer.determine_destination(info)
        
        assert dest is None


class TestOrganizeStats:
    """Test OrganizeStats tracking."""
    
    def test_default_values(self):
        """Test default stat values."""
        stats = OrganizeStats()
        
        assert stats.total_files == 0
        assert stats.processed == 0
        assert stats.covers_found == 0
        assert stats.errors == 0


class TestDryRun:
    """Test dry run functionality."""
    
    @pytest.fixture
    def setup_organize_test(self):
        """Set up directories for organize test."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tmppath = Path(tmpdir)
            
            source = tmppath / "source"
            source.mkdir()
            
            dest = tmppath / "dest"
            
            # Create test image
            img = Image.new("RGB", (100, 100), color="red")
            img.save(source / "test.jpg")
            
            config = Config()
            config.set("paths.source", str(source))
            config.set("paths.destination", str(dest))
            config.set("tagging.enabled", False)
            config.set("cover_detection.settings.use_ml_classifier", False)
            config.set("files.min_size", 0)  # Allow small test files
            
            yield {
                "source": source,
                "dest": dest,
                "config": config,
            }
    
    def test_dry_run_no_files_moved(self, setup_organize_test):
        """Test that dry run doesn't move files."""
        source = setup_organize_test["source"]
        dest = setup_organize_test["dest"]
        config = setup_organize_test["config"]
        
        organizer = PhotoOrganizer(config)
        stats = organizer.organize(source=source, destination=dest, dry_run=True)
        
        # File should still be in source
        assert (source / "test.jpg").exists()
        
        # Destination should not exist
        assert not dest.exists()
        
        # Stats should show processing happened
        assert stats.total_files == 1
        assert stats.processed == 1

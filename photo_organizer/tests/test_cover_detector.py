"""Tests for cover detection module."""

import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock

import pytest
from PIL import Image

from photo_organizer.cover_detector import CoverDetector, CoverDetectionResult


class TestCoverDetector:
    """Test cases for CoverDetector class."""
    
    @pytest.fixture
    def detector(self):
        """Create a detector without ML for testing."""
        return CoverDetector(use_ml=False)
    
    @pytest.fixture
    def sample_image(self):
        """Create a sample test image."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create a square image (typical album cover)
            img = Image.new("RGB", (500, 500), color="blue")
            path = Path(tmpdir) / "test.jpg"
            img.save(path)
            yield path
    
    @pytest.fixture
    def cover_named_image(self):
        """Create an image with cover-like filename."""
        with tempfile.TemporaryDirectory() as tmpdir:
            img = Image.new("RGB", (500, 500), color="red")
            path = Path(tmpdir) / "cover.jpg"
            img.save(path)
            yield path
    
    @pytest.fixture
    def portrait_image(self):
        """Create a portrait-oriented image (like book cover)."""
        with tempfile.TemporaryDirectory() as tmpdir:
            img = Image.new("RGB", (400, 600), color="green")
            path = Path(tmpdir) / "book.jpg"
            img.save(path)
            yield path
    
    def test_filename_detection_cover(self, detector, cover_named_image):
        """Test detection of cover by filename."""
        result = detector.detect(
            cover_named_image,
            check_ml=False,
            check_directory=False,
        )
        
        assert result.metrics.get("filename_match", 0) > 0.9
        assert "Filename matches cover pattern" in str(result.reasons)
    
    def test_filename_detection_regular(self, detector, sample_image):
        """Test that regular filenames don't trigger detection."""
        result = detector.detect(
            sample_image,
            check_ml=False,
            check_directory=False,
        )
        
        assert result.metrics.get("filename_match", 0) == 0
    
    def test_aspect_ratio_square(self, detector, sample_image):
        """Test square images get high aspect ratio score."""
        result = detector.detect(
            sample_image,
            check_filename=False,
            check_directory=False,
            check_ml=False,
        )
        
        assert result.metrics.get("aspect_ratio_score", 0) > 0.9
    
    def test_aspect_ratio_portrait(self, detector, portrait_image):
        """Test portrait images get moderate aspect ratio score."""
        result = detector.detect(
            portrait_image,
            check_filename=False,
            check_directory=False,
            check_ml=False,
        )
        
        # Portrait images (like books) should get some score
        assert 0.3 < result.metrics.get("aspect_ratio_score", 0) < 0.8
    
    def test_combined_detection(self, detector, cover_named_image):
        """Test combined filename + aspect ratio detection."""
        result = detector.detect(cover_named_image, check_ml=False)
        
        # Should be detected as cover due to filename
        assert result.is_cover == True
        assert result.confidence > 0.5
    
    def test_result_structure(self, detector, sample_image):
        """Test that result has correct structure."""
        result = detector.detect(sample_image, check_ml=False)
        
        assert isinstance(result, CoverDetectionResult)
        assert isinstance(result.is_cover, bool)
        assert isinstance(result.confidence, float)
        assert isinstance(result.reasons, list)
        assert isinstance(result.metrics, dict)
        assert 0 <= result.confidence <= 1


class TestCoverFilenamePatterns:
    """Test filename pattern matching."""
    
    @pytest.fixture
    def detector(self):
        return CoverDetector(use_ml=False)
    
    @pytest.mark.parametrize("filename,expected_match", [
        ("cover.jpg", True),
        ("Cover.PNG", True),
        ("COVER.jpeg", True),
        ("folder.jpg", True),
        ("Folder.png", True),
        ("front.jpg", True),
        ("album_art.jpg", True),
        ("artwork.png", True),
        ("photo.jpg", False),
        ("vacation.png", False),
        ("IMG_1234.jpg", False),
    ])
    def test_filename_patterns(self, detector, filename, expected_match):
        """Test various filename patterns."""
        with tempfile.TemporaryDirectory() as tmpdir:
            img = Image.new("RGB", (100, 100), color="white")
            path = Path(tmpdir) / filename
            img.save(path)
            
            score = detector._check_filename(path)
            
            if expected_match:
                assert score > 0.5, f"Expected {filename} to match"
            else:
                assert score < 0.5, f"Expected {filename} to not match"


class TestCoverDirectoryPatterns:
    """Test directory pattern matching."""
    
    @pytest.fixture
    def detector(self):
        return CoverDetector(use_ml=False)
    
    def test_music_directory(self, detector):
        """Test detection in music directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            music_dir = Path(tmpdir) / "Music" / "Artist" / "Album"
            music_dir.mkdir(parents=True)
            
            img = Image.new("RGB", (100, 100), color="white")
            path = music_dir / "cover.jpg"
            img.save(path)
            
            score = detector._check_directory(path)
            assert score > 0.5
    
    def test_regular_directory(self, detector):
        """Test regular directory doesn't trigger detection."""
        with tempfile.TemporaryDirectory() as tmpdir:
            photos_dir = Path(tmpdir) / "Vacation2024" / "Beach"
            photos_dir.mkdir(parents=True)
            
            img = Image.new("RGB", (100, 100), color="white")
            path = photos_dir / "photo.jpg"
            img.save(path)
            
            score = detector._check_directory(path)
            # Score can be non-zero if there are other factors, just shouldn't detect as media folder
            assert score < 0.6


class TestBatchDetection:
    """Test batch cover detection."""
    
    @pytest.fixture
    def detector(self):
        return CoverDetector(use_ml=False)
    
    def test_batch_detect(self, detector):
        """Test batch detection of multiple images."""
        with tempfile.TemporaryDirectory() as tmpdir:
            paths = []
            
            # Create regular image
            img1 = Image.new("RGB", (800, 600), color="blue")
            path1 = Path(tmpdir) / "photo.jpg"
            img1.save(path1)
            paths.append(path1)
            
            # Create cover-like image
            img2 = Image.new("RGB", (500, 500), color="red")
            path2 = Path(tmpdir) / "cover.jpg"
            img2.save(path2)
            paths.append(path2)
            
            results = detector.batch_detect(paths)
            
            assert len(results) == 2
            assert all(isinstance(r, CoverDetectionResult) for r in results)

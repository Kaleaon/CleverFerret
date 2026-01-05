"""Tests for configuration module."""

import tempfile
from pathlib import Path

import pytest

from photo_organizer.config import Config


class TestConfig:
    """Test cases for Config class."""
    
    def test_default_config(self):
        """Test default configuration values."""
        config = Config()
        
        assert config.get("tagging.enabled") is True
        assert config.get("tagging.model") == "clip"
        assert config.get("cover_detection.enabled") is True
        assert config.get("cover_detection.mode") == "separate"
    
    def test_get_nested_value(self):
        """Test getting nested configuration values."""
        config = Config()
        
        assert config.get("tagging.confidence_threshold") == 0.25
        assert config.get("cover_detection.settings.use_ml_classifier") is True
        assert config.get("nonexistent.key") is None
        assert config.get("nonexistent.key", "default") == "default"
    
    def test_set_value(self):
        """Test setting configuration values."""
        config = Config()
        
        config.set("tagging.enabled", False)
        assert config.get("tagging.enabled") is False
        
        config.set("custom.new.key", "value")
        assert config.get("custom.new.key") == "value"
    
    def test_supported_extensions(self):
        """Test supported file extensions."""
        config = Config()
        
        extensions = config.supported_extensions
        assert ".jpg" in extensions
        assert ".png" in extensions
        assert ".webp" in extensions
    
    def test_save_and_load(self):
        """Test saving and loading configuration."""
        config = Config()
        config.set("tagging.model", "blip")
        config.set("cover_detection.mode", "ignore")
        
        with tempfile.TemporaryDirectory() as tmpdir:
            config_path = Path(tmpdir) / "test_config.yaml"
            config.save(str(config_path))
            
            assert config_path.exists()
            
            # Load the saved config
            loaded_config = Config(str(config_path))
            assert loaded_config.get("tagging.model") == "blip"
            assert loaded_config.get("cover_detection.mode") == "ignore"
    
    def test_path_expansion(self):
        """Test that paths are expanded."""
        config = Config()
        
        # Source path should have ~ expanded
        source = config.source_path
        assert "~" not in str(source) or source == Path("~").expanduser() / "Pictures"


class TestCoverDetectionConfig:
    """Test cover detection configuration."""
    
    def test_filename_patterns(self):
        """Test cover filename patterns are configured."""
        config = Config()
        
        patterns = config.get("cover_detection.settings.filename_patterns")
        assert patterns is not None
        assert len(patterns) > 0
        assert any("cover" in p.lower() for p in patterns)
    
    def test_directory_patterns(self):
        """Test directory patterns are configured."""
        config = Config()
        
        patterns = config.get("cover_detection.settings.directory_patterns")
        assert patterns is not None
        assert any("music" in p.lower() for p in patterns)


class TestTaggingConfig:
    """Test tagging configuration."""
    
    def test_tag_categories(self):
        """Test tag categories are configured."""
        config = Config()
        
        categories = config.get("tagging.categories")
        assert categories is not None
        assert "people" in categories
        assert "nature" in categories

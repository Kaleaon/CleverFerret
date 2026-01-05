"""Configuration management for Photo Organizer."""

import os
from pathlib import Path
from typing import Any, Dict, List, Optional
import yaml


class Config:
    """Configuration management class."""
    
    DEFAULT_CONFIG = {
        "paths": {
            "source": "~/Pictures",
            "destination": "~/Pictures/Organized",
            "cache": "~/.photo_organizer",
        },
        "tagging": {
            "enabled": True,
            "model": "clip",
            "confidence_threshold": 0.25,
            "max_tags": 10,
            "categories": [
                "people", "nature", "architecture", "food",
                "animals", "vehicles", "art", "text", "screenshot", "meme"
            ],
        },
        "cover_detection": {
            "enabled": True,
            "mode": "separate",
            "covers_folder": "_Covers",
            "settings": {
                "square_tolerance": 0.15,
                "min_text_coverage": 0.05,
                "edge_uniformity_threshold": 0.7,
                "use_ml_classifier": True,
                "cover_confidence": 0.6,
                "filename_patterns": [
                    r"(?i)cover\.(jpg|jpeg|png|webp)$",
                    r"(?i)folder\.(jpg|jpeg|png|webp)$",
                    r"(?i)album.*\.(jpg|jpeg|png|webp)$",
                    r"(?i)front\.(jpg|jpeg|png|webp)$",
                    r"(?i)artwork\.(jpg|jpeg|png|webp)$",
                ],
                "directory_patterns": [
                    r"(?i)music",
                    r"(?i)album",
                    r"(?i)discography",
                    r"(?i)audiobook",
                    r"(?i)ebook",
                    r"(?i)comics?",
                ],
            },
        },
        "organization": {
            "strategy": "hybrid",
            "date_format": "%Y/%Y-%m",
            "use_tag_folders": True,
            "duplicates": "skip",
            "preserve_structure_tags": True,
        },
        "files": {
            "extensions": [
                ".jpg", ".jpeg", ".png", ".webp", ".gif",
                ".bmp", ".tiff", ".heic", ".heif", ".avif"
            ],
            "min_size": 10000,
            "skip_hidden": True,
            "write_metadata": True,
        },
        "performance": {
            "workers": 4,
            "batch_size": 8,
            "use_gpu": True,
            "cache_embeddings": True,
        },
        "logging": {
            "level": "INFO",
            "file": "photo_organizer.log",
        },
    }
    
    def __init__(self, config_path: Optional[str] = None):
        """Initialize configuration.
        
        Args:
            config_path: Path to YAML config file. If None, uses defaults.
        """
        self._config = self.DEFAULT_CONFIG.copy()
        
        if config_path:
            self.load(config_path)
        
        # Expand paths
        self._expand_paths()
    
    def _expand_paths(self) -> None:
        """Expand user home directory in paths."""
        for key in self._config.get("paths", {}):
            path = self._config["paths"][key]
            if isinstance(path, str):
                self._config["paths"][key] = os.path.expanduser(path)
    
    def load(self, config_path: str) -> None:
        """Load configuration from YAML file.
        
        Args:
            config_path: Path to configuration file.
        """
        path = Path(config_path)
        if path.exists():
            with open(path, "r") as f:
                user_config = yaml.safe_load(f)
                if user_config:
                    self._deep_merge(self._config, user_config)
    
    def _deep_merge(self, base: Dict, override: Dict) -> Dict:
        """Deep merge two dictionaries."""
        for key, value in override.items():
            if key in base and isinstance(base[key], dict) and isinstance(value, dict):
                self._deep_merge(base[key], value)
            else:
                base[key] = value
        return base
    
    def get(self, key: str, default: Any = None) -> Any:
        """Get configuration value using dot notation.
        
        Args:
            key: Configuration key (e.g., "tagging.enabled")
            default: Default value if key not found.
        
        Returns:
            Configuration value.
        """
        keys = key.split(".")
        value = self._config
        
        for k in keys:
            if isinstance(value, dict) and k in value:
                value = value[k]
            else:
                return default
        
        return value
    
    def set(self, key: str, value: Any) -> None:
        """Set configuration value using dot notation.
        
        Args:
            key: Configuration key (e.g., "tagging.enabled")
            value: Value to set.
        """
        keys = key.split(".")
        config = self._config
        
        for k in keys[:-1]:
            if k not in config:
                config[k] = {}
            config = config[k]
        
        config[keys[-1]] = value
    
    @property
    def source_path(self) -> Path:
        """Get source directory path."""
        return Path(self.get("paths.source"))
    
    @property
    def destination_path(self) -> Path:
        """Get destination directory path."""
        return Path(self.get("paths.destination"))
    
    @property
    def cache_path(self) -> Path:
        """Get cache directory path."""
        return Path(self.get("paths.cache"))
    
    @property
    def supported_extensions(self) -> List[str]:
        """Get list of supported file extensions."""
        return self.get("files.extensions", [])
    
    def save(self, config_path: str) -> None:
        """Save configuration to YAML file.
        
        Args:
            config_path: Path to save configuration.
        """
        path = Path(config_path)
        path.parent.mkdir(parents=True, exist_ok=True)
        
        with open(path, "w") as f:
            yaml.dump(self._config, f, default_flow_style=False)
    
    def to_dict(self) -> Dict:
        """Return configuration as dictionary."""
        return self._config.copy()

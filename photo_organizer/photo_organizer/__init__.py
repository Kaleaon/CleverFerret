"""
Photo Organizer - Auto-tagging photo organization with cover detection

A comprehensive photo organization tool that uses AI for auto-tagging
and can intelligently detect and handle album/book covers.
"""

__version__ = "1.0.0"
__author__ = "Photo Organizer Team"

from .organizer import PhotoOrganizer
from .tagger import AutoTagger
from .cover_detector import CoverDetector
from .config import Config

__all__ = ["PhotoOrganizer", "AutoTagger", "CoverDetector", "Config"]

"""Album and book cover detection module."""

import logging
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Union

import numpy as np
from PIL import Image

logger = logging.getLogger(__name__)


@dataclass
class CoverDetectionResult:
    """Result of cover detection analysis."""
    is_cover: bool
    confidence: float
    cover_type: Optional[str]  # "album", "book", "dvd", "game", "unknown"
    reasons: List[str]
    metrics: Dict[str, float]


class CoverDetector:
    """Detector for album covers, book covers, and similar media artwork."""
    
    # Common cover filename patterns
    COVER_FILENAME_PATTERNS = [
        r"(?i)^cover\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^folder\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^front\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^album.*\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^artwork\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^poster\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^thumb(nail)?\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^disc\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^cd\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^dvd\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)back\.(jpg|jpeg|png|webp|gif)$",
        r"(?i)^booklet.*\.(jpg|jpeg|png|webp|gif)$",
    ]
    
    # Directory patterns suggesting media content
    MEDIA_DIRECTORY_PATTERNS = [
        r"(?i)music",
        r"(?i)album[s]?",
        r"(?i)artist[s]?",
        r"(?i)discograph",
        r"(?i)audiobook[s]?",
        r"(?i)ebook[s]?",
        r"(?i)book[s]?",
        r"(?i)comic[s]?",
        r"(?i)manga",
        r"(?i)movie[s]?",
        r"(?i)film[s]?",
        r"(?i)game[s]?",
        r"(?i)flac",
        r"(?i)mp3",
        r"(?i)lossless",
    ]
    
    # CLIP prompts for cover detection
    COVER_PROMPTS = [
        "an album cover",
        "a music album cover",
        "a book cover",
        "a DVD cover",
        "a video game cover",
        "a movie poster",
        "a CD cover",
        "artwork for media",
    ]
    
    NON_COVER_PROMPTS = [
        "a photograph of a person",
        "a photograph of nature",
        "a photograph of a place",
        "a personal photo",
        "a snapshot",
        "a candid photo",
        "a family photo",
    ]
    
    def __init__(
        self,
        use_ml: bool = True,
        device: Optional[str] = None,
        cache_dir: Optional[Path] = None,
    ):
        """Initialize the cover detector.
        
        Args:
            use_ml: Whether to use ML-based classification
            device: Device for ML model ("cuda", "cpu", or None for auto)
            cache_dir: Directory to cache model weights
        """
        self.use_ml = use_ml
        self.cache_dir = cache_dir
        self._model = None
        self._processor = None
        self._device = device
        self._initialized = False
        
        # Compile regex patterns
        self._filename_patterns = [
            re.compile(p) for p in self.COVER_FILENAME_PATTERNS
        ]
        self._directory_patterns = [
            re.compile(p) for p in self.MEDIA_DIRECTORY_PATTERNS
        ]
    
    def _ensure_initialized(self) -> None:
        """Lazy initialization of ML model."""
        if self._initialized or not self.use_ml:
            return
        
        try:
            import torch
            
            if self._device is None:
                self._device = "cuda" if torch.cuda.is_available() else "cpu"
            
            logger.info(f"Loading CLIP model for cover detection on {self._device}...")
            
            try:
                import open_clip
                
                model_name = "ViT-B-32"
                pretrained = "laion2b_s34b_b79k"
                
                self._model, _, self._processor = open_clip.create_model_and_transforms(
                    model_name,
                    pretrained=pretrained,
                    device=self._device,
                    cache_dir=str(self.cache_dir) if self.cache_dir else None,
                )
                self._tokenizer = open_clip.get_tokenizer(model_name)
                self._model.eval()
                
                # Pre-compute text embeddings
                self._precompute_embeddings()
                
            except ImportError:
                logger.warning("open_clip not available, using transformers")
                self._load_transformers_clip()
            
            self._initialized = True
            logger.info("Cover detection model loaded")
            
        except Exception as e:
            logger.warning(f"Failed to load ML model for cover detection: {e}")
            self.use_ml = False
    
    def _load_transformers_clip(self) -> None:
        """Load CLIP from transformers."""
        from transformers import CLIPProcessor, CLIPModel
        
        model_id = "openai/clip-vit-base-patch32"
        self._model = CLIPModel.from_pretrained(
            model_id,
            cache_dir=str(self.cache_dir) if self.cache_dir else None,
        ).to(self._device)
        self._processor = CLIPProcessor.from_pretrained(model_id)
        self._model.eval()
        self._tokenizer = None
    
    def _precompute_embeddings(self) -> None:
        """Pre-compute text embeddings for classification."""
        import torch
        
        all_prompts = self.COVER_PROMPTS + self.NON_COVER_PROMPTS
        
        with torch.no_grad():
            text_tokens = self._tokenizer(all_prompts).to(self._device)
            embeddings = self._model.encode_text(text_tokens)
            embeddings /= embeddings.norm(dim=-1, keepdim=True)
            
            # Split into cover and non-cover embeddings
            n_cover = len(self.COVER_PROMPTS)
            self._cover_embeddings = embeddings[:n_cover]
            self._non_cover_embeddings = embeddings[n_cover:]
    
    def detect(
        self,
        image_path: Union[str, Path],
        check_filename: bool = True,
        check_directory: bool = True,
        check_aspect_ratio: bool = True,
        check_ml: bool = True,
    ) -> CoverDetectionResult:
        """Detect if an image is likely an album/book cover.
        
        Args:
            image_path: Path to the image file
            check_filename: Check filename patterns
            check_directory: Check parent directory patterns
            check_aspect_ratio: Check if image is square-ish
            check_ml: Use ML classification
        
        Returns:
            CoverDetectionResult with detection details
        """
        image_path = Path(image_path)
        reasons = []
        metrics = {}
        confidence_scores = []
        
        # Check filename patterns
        if check_filename:
            filename_score = self._check_filename(image_path)
            metrics["filename_match"] = filename_score
            if filename_score > 0:
                reasons.append(f"Filename matches cover pattern (score: {filename_score:.2f})")
                confidence_scores.append(filename_score)
        
        # Check directory patterns
        if check_directory:
            dir_score = self._check_directory(image_path)
            metrics["directory_match"] = dir_score
            if dir_score > 0:
                reasons.append(f"Located in media directory (score: {dir_score:.2f})")
                confidence_scores.append(dir_score * 0.5)  # Lower weight
        
        # Check aspect ratio (covers are often square)
        if check_aspect_ratio:
            try:
                aspect_score = self._check_aspect_ratio(image_path)
                metrics["aspect_ratio_score"] = aspect_score
                if aspect_score > 0.5:
                    reasons.append(f"Square aspect ratio (score: {aspect_score:.2f})")
                    confidence_scores.append(aspect_score * 0.7)
            except Exception as e:
                logger.debug(f"Failed to check aspect ratio: {e}")
        
        # Check with ML model
        if check_ml and self.use_ml:
            try:
                ml_score, cover_type = self._check_ml(image_path)
                metrics["ml_score"] = ml_score
                metrics["cover_type"] = cover_type
                if ml_score > 0.5:
                    reasons.append(f"ML classifier detected {cover_type} cover (score: {ml_score:.2f})")
                    confidence_scores.append(ml_score)
            except Exception as e:
                logger.debug(f"ML classification failed: {e}")
        
        # Calculate overall confidence
        if confidence_scores:
            # Weighted average with emphasis on high scores
            confidence = np.average(
                confidence_scores,
                weights=[s ** 2 for s in confidence_scores]  # Weight by squared score
            )
        else:
            confidence = 0.0
        
        # Determine if it's a cover
        is_cover = bool(confidence >= 0.5 or (
            metrics.get("filename_match", 0) >= 0.9  # Strong filename match
        ))
        
        # Determine cover type
        cover_type = None
        if is_cover:
            cover_type = self._determine_cover_type(image_path, metrics)
        
        return CoverDetectionResult(
            is_cover=is_cover,
            confidence=float(confidence),
            cover_type=cover_type,
            reasons=reasons,
            metrics=metrics,
        )
    
    def _check_filename(self, image_path: Path) -> float:
        """Check if filename matches cover patterns.
        
        Returns:
            Score from 0 to 1
        """
        filename = image_path.name
        
        for pattern in self._filename_patterns:
            if pattern.match(filename):
                return 1.0
        
        # Partial matches
        lower_name = filename.lower()
        partial_keywords = ["cover", "folder", "album", "artwork", "front", "poster"]
        for keyword in partial_keywords:
            if keyword in lower_name:
                return 0.7
        
        return 0.0
    
    def _check_directory(self, image_path: Path) -> float:
        """Check if parent directories suggest media content.
        
        Returns:
            Score from 0 to 1
        """
        # Check up to 3 parent directories
        path_str = str(image_path.parent)
        
        for pattern in self._directory_patterns:
            if pattern.search(path_str):
                return 1.0
        
        # Check for common media file extensions in same directory
        try:
            parent = image_path.parent
            media_extensions = {".mp3", ".flac", ".m4a", ".wav", ".ogg", ".opus",
                              ".mp4", ".mkv", ".avi", ".epub", ".pdf", ".mobi", ".cbz", ".cbr"}
            
            siblings = list(parent.iterdir())
            media_files = [f for f in siblings if f.suffix.lower() in media_extensions]
            
            if len(media_files) > 0:
                return min(1.0, len(media_files) / 5)  # Scale based on media file count
        except Exception:
            pass
        
        return 0.0
    
    def _check_aspect_ratio(self, image_path: Path) -> float:
        """Check if image has square-ish aspect ratio typical of covers.
        
        Returns:
            Score from 0 to 1 (1 = perfectly square)
        """
        image = Image.open(image_path)
        width, height = image.size
        
        aspect_ratio = width / height
        
        # Perfect square = 1.0
        # Most album covers are square (1:1)
        # Book covers are typically ~0.65-0.75 (portrait)
        # DVD covers are ~0.7
        
        if 0.9 <= aspect_ratio <= 1.1:
            # Square - very likely album cover
            return 1.0 - abs(1.0 - aspect_ratio)
        elif 0.6 <= aspect_ratio <= 0.8:
            # Portrait - could be book/DVD cover
            return 0.7
        elif 0.5 <= aspect_ratio <= 0.9:
            # Somewhat portrait
            return 0.4
        else:
            # Unusual aspect ratio for covers
            return 0.1
    
    def _check_ml(self, image_path: Path) -> Tuple[float, str]:
        """Use ML model to classify as cover.
        
        Returns:
            Tuple of (confidence score, cover type)
        """
        self._ensure_initialized()
        
        if not self._initialized:
            return 0.0, "unknown"
        
        import torch
        
        image = Image.open(image_path).convert("RGB")
        
        with torch.no_grad():
            if hasattr(self, '_tokenizer') and self._tokenizer is not None:
                # Using open_clip
                image_input = self._processor(image).unsqueeze(0).to(self._device)
                image_embedding = self._model.encode_image(image_input)
                image_embedding /= image_embedding.norm(dim=-1, keepdim=True)
                
                # Calculate similarity to cover prompts
                cover_sims = (image_embedding @ self._cover_embeddings.T).squeeze(0)
                non_cover_sims = (image_embedding @ self._non_cover_embeddings.T).squeeze(0)
                
                max_cover_sim = cover_sims.max().item()
                max_cover_idx = cover_sims.argmax().item()
                max_non_cover_sim = non_cover_sims.max().item()
                
            else:
                # Using transformers CLIP
                all_prompts = self.COVER_PROMPTS + self.NON_COVER_PROMPTS
                inputs = self._processor(
                    text=all_prompts,
                    images=image,
                    return_tensors="pt",
                    padding=True,
                ).to(self._device)
                
                outputs = self._model(**inputs)
                logits = outputs.logits_per_image.squeeze(0)
                probs = torch.softmax(logits, dim=-1)
                
                n_cover = len(self.COVER_PROMPTS)
                cover_probs = probs[:n_cover]
                non_cover_probs = probs[n_cover:]
                
                max_cover_sim = cover_probs.max().item()
                max_cover_idx = cover_probs.argmax().item()
                max_non_cover_sim = non_cover_probs.max().item()
        
        # Calculate confidence as relative score
        if max_cover_sim + max_non_cover_sim > 0:
            confidence = max_cover_sim / (max_cover_sim + max_non_cover_sim)
        else:
            confidence = 0.5
        
        # Determine cover type from best matching prompt
        cover_type_map = {
            0: "album",  # "an album cover"
            1: "album",  # "a music album cover"
            2: "book",   # "a book cover"
            3: "dvd",    # "a DVD cover"
            4: "game",   # "a video game cover"
            5: "movie",  # "a movie poster"
            6: "album",  # "a CD cover"
            7: "unknown", # "artwork for media"
        }
        cover_type = cover_type_map.get(max_cover_idx, "unknown")
        
        return confidence, cover_type
    
    def _determine_cover_type(self, image_path: Path, metrics: Dict) -> str:
        """Determine the type of cover based on context.
        
        Returns:
            Cover type string
        """
        # Use ML classification if available
        if "cover_type" in metrics and metrics["cover_type"] != "unknown":
            return metrics["cover_type"]
        
        # Use directory context
        path_str = str(image_path.parent).lower()
        
        if any(k in path_str for k in ["music", "album", "artist", "discograph", "flac", "mp3"]):
            return "album"
        elif any(k in path_str for k in ["book", "ebook", "epub", "pdf"]):
            return "book"
        elif any(k in path_str for k in ["comic", "manga", "cbz", "cbr"]):
            return "comic"
        elif any(k in path_str for k in ["movie", "film", "video"]):
            return "movie"
        elif any(k in path_str for k in ["game"]):
            return "game"
        
        # Check aspect ratio
        aspect_score = metrics.get("aspect_ratio_score", 0)
        if aspect_score > 0.9:
            return "album"  # Square images are usually album covers
        elif aspect_score > 0.5:
            return "book"  # Portrait images might be book covers
        
        return "unknown"
    
    def batch_detect(
        self,
        image_paths: List[Union[str, Path]],
        **kwargs,
    ) -> List[CoverDetectionResult]:
        """Detect covers in multiple images.
        
        Args:
            image_paths: List of image paths
            **kwargs: Arguments passed to detect()
        
        Returns:
            List of CoverDetectionResult objects
        """
        results = []
        for path in image_paths:
            try:
                result = self.detect(path, **kwargs)
                results.append(result)
            except Exception as e:
                logger.error(f"Failed to analyze {path}: {e}")
                results.append(CoverDetectionResult(
                    is_cover=False,
                    confidence=0.0,
                    cover_type=None,
                    reasons=[f"Error: {str(e)}"],
                    metrics={},
                ))
        return results

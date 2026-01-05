"""Auto-tagging module using CLIP and other vision models."""

import logging
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Union
from dataclasses import dataclass

import numpy as np
from PIL import Image

logger = logging.getLogger(__name__)


@dataclass
class TagResult:
    """Result of auto-tagging an image."""
    tags: List[str]
    scores: Dict[str, float]
    description: Optional[str] = None
    embedding: Optional[np.ndarray] = None


class AutoTagger:
    """Auto-tagger using CLIP and vision-language models."""
    
    # Comprehensive tag vocabulary for photo classification
    TAG_VOCABULARY = {
        "scene": [
            "indoor", "outdoor", "beach", "mountain", "forest", "city",
            "countryside", "desert", "lake", "river", "ocean", "sky",
            "sunset", "sunrise", "night", "day", "cloudy", "sunny",
            "rainy", "snowy", "garden", "park", "street", "building",
        ],
        "people": [
            "portrait", "group photo", "selfie", "family", "friends",
            "couple", "child", "baby", "man", "woman", "crowd",
            "wedding", "party", "celebration", "meeting",
        ],
        "animals": [
            "dog", "cat", "bird", "horse", "fish", "wildlife",
            "pet", "farm animal", "insect", "marine life",
        ],
        "objects": [
            "food", "vehicle", "furniture", "electronics", "clothing",
            "book", "art", "plant", "flower", "tree", "water",
        ],
        "activity": [
            "sports", "travel", "cooking", "reading", "working",
            "playing", "dancing", "swimming", "hiking", "camping",
            "concert", "festival", "ceremony",
        ],
        "style": [
            "artistic", "professional", "casual", "vintage", "modern",
            "minimalist", "colorful", "black and white", "blurry",
            "high quality", "low quality",
        ],
        "content_type": [
            "photograph", "screenshot", "meme", "artwork", "drawing",
            "painting", "illustration", "infographic", "document",
            "album cover", "book cover", "poster", "advertisement",
        ],
    }
    
    def __init__(
        self,
        model_name: str = "clip",
        device: Optional[str] = None,
        cache_dir: Optional[Path] = None,
    ):
        """Initialize the auto-tagger.
        
        Args:
            model_name: Model to use ("clip", "blip", or "both")
            device: Device to run on ("cuda", "cpu", or None for auto)
            cache_dir: Directory to cache model weights
        """
        self.model_name = model_name
        self.cache_dir = cache_dir
        self._model = None
        self._processor = None
        self._device = None
        self._initialized = False
        
        # Determine device
        if device:
            self._device = device
        else:
            try:
                import torch
                self._device = "cuda" if torch.cuda.is_available() else "cpu"
            except ImportError:
                self._device = "cpu"
        
        # Flatten vocabulary for quick lookup
        self._all_tags = []
        for category_tags in self.TAG_VOCABULARY.values():
            self._all_tags.extend(category_tags)
    
    def _ensure_initialized(self) -> None:
        """Lazy initialization of models."""
        if self._initialized:
            return
        
        logger.info(f"Loading {self.model_name} model on {self._device}...")
        
        try:
            if self.model_name in ("clip", "both"):
                self._load_clip()
            
            self._initialized = True
            logger.info("Model loaded successfully")
        except Exception as e:
            logger.error(f"Failed to load model: {e}")
            raise
    
    def _load_clip(self) -> None:
        """Load CLIP model."""
        try:
            import open_clip
            import torch
            
            # Use a good general-purpose CLIP model
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
            
            # Pre-compute text embeddings for all tags
            self._precompute_tag_embeddings()
            
        except ImportError:
            logger.warning("open_clip not available, falling back to transformers CLIP")
            self._load_transformers_clip()
    
    def _load_transformers_clip(self) -> None:
        """Load CLIP model from transformers."""
        from transformers import CLIPProcessor, CLIPModel
        import torch
        
        model_id = "openai/clip-vit-base-patch32"
        self._model = CLIPModel.from_pretrained(
            model_id,
            cache_dir=str(self.cache_dir) if self.cache_dir else None,
        ).to(self._device)
        self._processor = CLIPProcessor.from_pretrained(model_id)
        self._model.eval()
        self._tokenizer = None
        self._tag_embeddings = None
    
    def _precompute_tag_embeddings(self) -> None:
        """Pre-compute text embeddings for all tags."""
        import torch
        
        # Create prompts for each tag
        prompts = [f"a photo of {tag}" for tag in self._all_tags]
        
        with torch.no_grad():
            text_tokens = self._tokenizer(prompts).to(self._device)
            self._tag_embeddings = self._model.encode_text(text_tokens)
            self._tag_embeddings /= self._tag_embeddings.norm(dim=-1, keepdim=True)
    
    def tag_image(
        self,
        image_path: Union[str, Path],
        confidence_threshold: float = 0.25,
        max_tags: int = 10,
        return_embedding: bool = False,
    ) -> TagResult:
        """Tag a single image.
        
        Args:
            image_path: Path to image file
            confidence_threshold: Minimum confidence for a tag
            max_tags: Maximum number of tags to return
            return_embedding: Whether to return the image embedding
        
        Returns:
            TagResult with tags and scores
        """
        self._ensure_initialized()
        
        image_path = Path(image_path)
        
        try:
            image = Image.open(image_path).convert("RGB")
        except Exception as e:
            logger.error(f"Failed to load image {image_path}: {e}")
            return TagResult(tags=[], scores={})
        
        return self._tag_pil_image(
            image,
            confidence_threshold=confidence_threshold,
            max_tags=max_tags,
            return_embedding=return_embedding,
        )
    
    def _tag_pil_image(
        self,
        image: Image.Image,
        confidence_threshold: float = 0.25,
        max_tags: int = 10,
        return_embedding: bool = False,
    ) -> TagResult:
        """Tag a PIL image.
        
        Args:
            image: PIL Image object
            confidence_threshold: Minimum confidence for a tag
            max_tags: Maximum number of tags to return
            return_embedding: Whether to return the image embedding
        
        Returns:
            TagResult with tags and scores
        """
        import torch
        
        with torch.no_grad():
            if hasattr(self, '_tokenizer') and self._tokenizer is not None:
                # Using open_clip
                image_input = self._processor(image).unsqueeze(0).to(self._device)
                image_embedding = self._model.encode_image(image_input)
                image_embedding /= image_embedding.norm(dim=-1, keepdim=True)
                
                # Calculate similarity with all tags
                similarities = (image_embedding @ self._tag_embeddings.T).squeeze(0)
                similarities = similarities.cpu().numpy()
            else:
                # Using transformers CLIP
                inputs = self._processor(
                    text=[f"a photo of {tag}" for tag in self._all_tags],
                    images=image,
                    return_tensors="pt",
                    padding=True,
                ).to(self._device)
                
                outputs = self._model(**inputs)
                similarities = outputs.logits_per_image.squeeze(0)
                similarities = torch.softmax(similarities, dim=-1).cpu().numpy()
                image_embedding = outputs.image_embeds
        
        # Convert to probabilities (softmax already applied for transformers)
        if hasattr(self, '_tokenizer') and self._tokenizer is not None:
            # Apply softmax for open_clip
            exp_sim = np.exp(similarities * 100)  # Temperature scaling
            probs = exp_sim / exp_sim.sum()
        else:
            probs = similarities
        
        # Get top tags above threshold
        tag_scores = {}
        for i, tag in enumerate(self._all_tags):
            score = float(probs[i])
            if score >= confidence_threshold:
                tag_scores[tag] = score
        
        # Sort by score and limit
        sorted_tags = sorted(tag_scores.items(), key=lambda x: x[1], reverse=True)
        sorted_tags = sorted_tags[:max_tags]
        
        tags = [tag for tag, _ in sorted_tags]
        scores = {tag: score for tag, score in sorted_tags}
        
        embedding = None
        if return_embedding:
            embedding = image_embedding.cpu().numpy().squeeze()
        
        return TagResult(tags=tags, scores=scores, embedding=embedding)
    
    def tag_batch(
        self,
        image_paths: List[Union[str, Path]],
        confidence_threshold: float = 0.25,
        max_tags: int = 10,
        batch_size: int = 8,
    ) -> List[TagResult]:
        """Tag multiple images in batches for efficiency.
        
        Args:
            image_paths: List of image paths
            confidence_threshold: Minimum confidence for a tag
            max_tags: Maximum number of tags to return
            batch_size: Number of images per batch
        
        Returns:
            List of TagResult objects
        """
        self._ensure_initialized()
        
        results = []
        
        for i in range(0, len(image_paths), batch_size):
            batch_paths = image_paths[i:i + batch_size]
            batch_results = []
            
            for path in batch_paths:
                result = self.tag_image(
                    path,
                    confidence_threshold=confidence_threshold,
                    max_tags=max_tags,
                )
                batch_results.append(result)
            
            results.extend(batch_results)
        
        return results
    
    def get_image_embedding(self, image_path: Union[str, Path]) -> Optional[np.ndarray]:
        """Get the embedding vector for an image.
        
        Args:
            image_path: Path to image file
        
        Returns:
            Embedding vector as numpy array, or None on failure
        """
        result = self.tag_image(image_path, return_embedding=True)
        return result.embedding
    
    def compute_similarity(
        self,
        image_path1: Union[str, Path],
        image_path2: Union[str, Path],
    ) -> float:
        """Compute similarity between two images.
        
        Args:
            image_path1: Path to first image
            image_path2: Path to second image
        
        Returns:
            Cosine similarity score (0-1)
        """
        emb1 = self.get_image_embedding(image_path1)
        emb2 = self.get_image_embedding(image_path2)
        
        if emb1 is None or emb2 is None:
            return 0.0
        
        # Cosine similarity
        similarity = np.dot(emb1, emb2) / (np.linalg.norm(emb1) * np.linalg.norm(emb2))
        return float(similarity)
    
    def add_custom_tags(self, category: str, tags: List[str]) -> None:
        """Add custom tags to the vocabulary.
        
        Args:
            category: Category name for the tags
            tags: List of tag strings
        """
        if category not in self.TAG_VOCABULARY:
            self.TAG_VOCABULARY[category] = []
        
        self.TAG_VOCABULARY[category].extend(tags)
        self._all_tags.extend(tags)
        
        # Re-compute embeddings if already initialized
        if self._initialized and hasattr(self, '_tag_embeddings'):
            self._precompute_tag_embeddings()

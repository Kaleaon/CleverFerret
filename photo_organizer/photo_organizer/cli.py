"""Command-line interface for Photo Organizer."""

import logging
import sys
from pathlib import Path
from typing import Optional

import click

from .config import Config
from .organizer import PhotoOrganizer
from .cover_detector import CoverDetector
from .tagger import AutoTagger


@click.group()
@click.option(
    "--config", "-c",
    type=click.Path(exists=True),
    help="Path to configuration file",
)
@click.option(
    "--verbose", "-v",
    is_flag=True,
    help="Enable verbose output",
)
@click.pass_context
def cli(ctx, config: Optional[str], verbose: bool):
    """Photo Organizer - AI-powered photo organization with cover detection.
    
    Automatically tag, organize, and manage your photo collection.
    Intelligently handles album covers, book covers, and other media artwork.
    """
    ctx.ensure_object(dict)
    
    # Load configuration
    ctx.obj["config"] = Config(config) if config else Config()
    
    # Set logging level
    if verbose:
        logging.getLogger().setLevel(logging.DEBUG)
    else:
        logging.getLogger().setLevel(logging.INFO)


@cli.command()
@click.argument("source", type=click.Path(exists=True), required=False)
@click.option(
    "--destination", "-d",
    type=click.Path(),
    help="Destination directory for organized photos",
)
@click.option(
    "--dry-run", "-n",
    is_flag=True,
    help="Show what would be done without moving files",
)
@click.option(
    "--cover-mode",
    type=click.Choice(["ignore", "separate", "tag"]),
    help="How to handle detected covers",
)
@click.option(
    "--strategy",
    type=click.Choice(["date", "tags", "hybrid", "flat"]),
    help="Organization strategy",
)
@click.pass_context
def organize(
    ctx,
    source: Optional[str],
    destination: Optional[str],
    dry_run: bool,
    cover_mode: Optional[str],
    strategy: Optional[str],
):
    """Organize photos from SOURCE to destination.
    
    Analyzes photos, auto-tags them, detects covers, and organizes
    them into a structured folder hierarchy.
    
    Examples:
    
        # Organize photos in current directory
        photo-organizer organize .
        
        # Organize with specific destination
        photo-organizer organize ~/Pictures -d ~/Pictures/Organized
        
        # Preview without moving files
        photo-organizer organize ~/Pictures --dry-run
        
        # Ignore album covers
        photo-organizer organize ~/Music --cover-mode ignore
    """
    config = ctx.obj["config"]
    
    # Apply command-line overrides
    if source:
        config.set("paths.source", source)
    if destination:
        config.set("paths.destination", destination)
    if cover_mode:
        config.set("cover_detection.mode", cover_mode)
    if strategy:
        config.set("organization.strategy", strategy)
    
    organizer = PhotoOrganizer(config)
    
    click.echo(f"Source: {config.source_path}")
    click.echo(f"Destination: {config.destination_path}")
    click.echo(f"Cover mode: {config.get('cover_detection.mode')}")
    click.echo(f"Strategy: {config.get('organization.strategy')}")
    click.echo()
    
    if dry_run:
        click.echo(click.style("DRY RUN - No files will be moved", fg="yellow"))
        click.echo()
    
    stats = organizer.organize(dry_run=dry_run)
    
    # Display results
    click.echo()
    click.echo(click.style("Organization Complete!", fg="green", bold=True))
    click.echo(f"  Total files scanned: {stats.total_files}")
    click.echo(f"  Files processed: {stats.processed}")
    click.echo(f"  Files moved: {stats.files_moved}")
    click.echo(f"  Covers found: {stats.covers_found}")
    click.echo(f"  Duplicates skipped: {stats.duplicates}")
    click.echo(f"  Files skipped: {stats.skipped}")
    click.echo(f"  Errors: {stats.errors}")
    click.echo(f"  Total tags assigned: {stats.tags_assigned}")


@cli.command()
@click.argument("source", type=click.Path(exists=True))
@click.option(
    "--limit", "-l",
    type=int,
    default=10,
    help="Number of files to preview",
)
@click.pass_context
def preview(ctx, source: str, limit: int):
    """Preview organization without moving files.
    
    Shows what tags would be assigned and where files would be moved.
    """
    config = ctx.obj["config"]
    config.set("paths.source", source)
    
    organizer = PhotoOrganizer(config)
    
    click.echo(f"Previewing organization for: {source}")
    click.echo()
    
    previews = organizer.preview(limit=limit)
    
    for info, dest in previews:
        click.echo(click.style(f"📷 {info.filename}", fg="cyan", bold=True))
        click.echo(f"   Tags: {', '.join(info.tags[:5]) if info.tags else 'None'}")
        
        if info.is_cover:
            click.echo(click.style(
                f"   🎵 Cover detected: {info.cover_type} ({info.cover_confidence:.0%})",
                fg="yellow"
            ))
        
        if dest:
            click.echo(f"   → {dest}")
        else:
            click.echo(click.style("   → [SKIP]", fg="red"))
        click.echo()


@cli.command()
@click.argument("image", type=click.Path(exists=True))
@click.option(
    "--show-scores", "-s",
    is_flag=True,
    help="Show confidence scores for each tag",
)
@click.pass_context
def tag(ctx, image: str, show_scores: bool):
    """Auto-tag a single image.
    
    Analyzes the image and displays detected tags.
    """
    config = ctx.obj["config"]
    
    tagger = AutoTagger(
        model_name=config.get("tagging.model", "clip"),
        cache_dir=config.cache_path,
    )
    
    click.echo(f"Analyzing: {image}")
    click.echo()
    
    result = tagger.tag_image(
        image,
        confidence_threshold=config.get("tagging.confidence_threshold", 0.25),
        max_tags=config.get("tagging.max_tags", 10),
    )
    
    if result.tags:
        click.echo(click.style("Detected Tags:", fg="green", bold=True))
        for tag in result.tags:
            if show_scores:
                score = result.scores.get(tag, 0)
                click.echo(f"  • {tag} ({score:.1%})")
            else:
                click.echo(f"  • {tag}")
    else:
        click.echo(click.style("No tags detected", fg="yellow"))


@cli.command("detect-cover")
@click.argument("image", type=click.Path(exists=True))
@click.option(
    "--detailed", "-d",
    is_flag=True,
    help="Show detailed analysis",
)
@click.pass_context
def detect_cover(ctx, image: str, detailed: bool):
    """Check if an image is an album/book cover.
    
    Analyzes the image for cover characteristics.
    """
    config = ctx.obj["config"]
    
    detector = CoverDetector(
        use_ml=config.get("cover_detection.settings.use_ml_classifier", True),
        cache_dir=config.cache_path,
    )
    
    click.echo(f"Analyzing: {image}")
    click.echo()
    
    result = detector.detect(image)
    
    if result.is_cover:
        click.echo(click.style(
            f"✓ This appears to be a {result.cover_type or 'media'} cover",
            fg="green", bold=True
        ))
        click.echo(f"  Confidence: {result.confidence:.1%}")
    else:
        click.echo(click.style("✗ This does not appear to be a cover", fg="yellow"))
        click.echo(f"  Confidence: {1 - result.confidence:.1%}")
    
    if detailed and result.reasons:
        click.echo()
        click.echo("Analysis details:")
        for reason in result.reasons:
            click.echo(f"  • {reason}")
        
        if result.metrics:
            click.echo()
            click.echo("Metrics:")
            for key, value in result.metrics.items():
                if isinstance(value, float):
                    click.echo(f"  • {key}: {value:.2f}")
                else:
                    click.echo(f"  • {key}: {value}")


@cli.command()
@click.argument("source", type=click.Path(exists=True))
@click.option(
    "--recursive/--no-recursive", "-r/-R",
    default=True,
    help="Scan subdirectories",
)
@click.pass_context
def scan(ctx, source: str, recursive: bool):
    """Scan directory and show statistics.
    
    Analyzes photos without moving them.
    """
    config = ctx.obj["config"]
    config.set("paths.source", source)
    
    organizer = PhotoOrganizer(config)
    
    click.echo(f"Scanning: {source}")
    click.echo()
    
    # Scan for images
    image_files = organizer.scan_directory(recursive=recursive)
    
    click.echo(f"Found {len(image_files)} images")
    click.echo()
    
    if not image_files:
        return
    
    # Analyze a sample
    sample_size = min(50, len(image_files))
    click.echo(f"Analyzing sample of {sample_size} images...")
    
    infos = organizer.analyze_batch(image_files[:sample_size])
    
    # Gather statistics
    total_covers = sum(1 for i in infos if i.is_cover)
    cover_types = {}
    all_tags = {}
    
    for info in infos:
        if info.cover_type:
            cover_types[info.cover_type] = cover_types.get(info.cover_type, 0) + 1
        for tag in info.tags:
            all_tags[tag] = all_tags.get(tag, 0) + 1
    
    click.echo()
    click.echo(click.style("Statistics:", fg="cyan", bold=True))
    click.echo(f"  Total images: {len(image_files)}")
    click.echo(f"  Covers detected: {total_covers} ({100*total_covers/sample_size:.1f}%)")
    
    if cover_types:
        click.echo()
        click.echo("  Cover types:")
        for ctype, count in sorted(cover_types.items(), key=lambda x: -x[1]):
            click.echo(f"    • {ctype}: {count}")
    
    click.echo()
    click.echo("  Top tags:")
    for tag, count in sorted(all_tags.items(), key=lambda x: -x[1])[:10]:
        click.echo(f"    • {tag}: {count}")


@cli.command()
@click.argument("output", type=click.Path(), default="config.yaml")
@click.pass_context
def init(ctx, output: str):
    """Generate a default configuration file.
    
    Creates a config.yaml with all available options.
    """
    config = Config()
    config.save(output)
    
    click.echo(f"Configuration file created: {output}")
    click.echo()
    click.echo("Edit this file to customize:")
    click.echo("  • Source and destination paths")
    click.echo("  • Auto-tagging settings")
    click.echo("  • Cover detection mode (ignore, separate, tag)")
    click.echo("  • Organization strategy (date, tags, hybrid, flat)")


@cli.command()
@click.argument("image1", type=click.Path(exists=True))
@click.argument("image2", type=click.Path(exists=True))
@click.pass_context
def compare(ctx, image1: str, image2: str):
    """Compare similarity between two images.
    
    Uses AI embeddings to compute visual similarity.
    """
    config = ctx.obj["config"]
    
    tagger = AutoTagger(
        model_name=config.get("tagging.model", "clip"),
        cache_dir=config.cache_path,
    )
    
    click.echo(f"Comparing:")
    click.echo(f"  1. {image1}")
    click.echo(f"  2. {image2}")
    click.echo()
    
    similarity = tagger.compute_similarity(image1, image2)
    
    click.echo(f"Similarity: {similarity:.1%}")
    
    if similarity > 0.9:
        click.echo(click.style("These images are very similar or duplicates", fg="green"))
    elif similarity > 0.7:
        click.echo(click.style("These images share similar content", fg="yellow"))
    else:
        click.echo(click.style("These images are different", fg="blue"))


def main():
    """Main entry point."""
    cli(obj={})


if __name__ == "__main__":
    main()

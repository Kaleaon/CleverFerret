#!/bin/bash
#
# Automated Reddit Stories Update Script
# Updates all tracked Reddit stories and converts to EPUB
#

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/reddit_stories_config.json"
OUTPUT_DIR="$SCRIPT_DIR/epub_output"
LOG_FILE="$OUTPUT_DIR/auto_update_$(date '+%Y%m%d').log"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

print_header() {
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}  Reddit Stories - Automated Update                            ${BLUE}║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════════╝${NC}"
}

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# Check dependencies
check_dependencies() {
    print_status "Checking dependencies..."
    
    if ! command -v python3 &> /dev/null; then
        print_error "Python 3 is not installed"
        exit 1
    fi
    
    if ! python3 -c "import requests" 2>/dev/null; then
        print_warning "Installing required Python packages..."
        pip3 install -q requests
    fi
    
    print_success "Dependencies OK"
}

# Update all stories
update_stories() {
    print_status "Updating all tracked stories..."
    log "Starting auto-update for all stories"
    
    if python3 "$SCRIPT_DIR/multi_story_updater.py" --update-all >> "$LOG_FILE" 2>&1; then
        print_success "Update completed successfully"
        log "Auto-update completed successfully"
        return 0
    else
        print_error "Update failed - check log: $LOG_FILE"
        log "Auto-update failed"
        return 1
    fi
}

# Convert HTML to EPUB if converter available
convert_to_epub() {
    print_status "Converting HTML files to EPUB..."
    
    local converted=0
    local failed=0
    
    for html_file in "$OUTPUT_DIR"/*.html; do
        [ -f "$html_file" ] || continue
        
        epub_file="${html_file%.html}.epub"
        
        # Skip if EPUB already exists and is newer than HTML
        if [ -f "$epub_file" ] && [ "$epub_file" -nt "$html_file" ]; then
            continue
        fi
        
        if command -v pandoc &> /dev/null; then
            print_status "Converting $(basename "$html_file")..."
            if pandoc "$html_file" -o "$epub_file" --metadata title="Reddit Story" 2>/dev/null; then
                ((converted++))
                print_success "Converted: $(basename "$epub_file")"
            else
                ((failed++))
                print_warning "Failed to convert: $(basename "$html_file")"
            fi
        elif command -v ebook-convert &> /dev/null; then
            print_status "Converting $(basename "$html_file")..."
            if ebook-convert "$html_file" "$epub_file" 2>/dev/null; then
                ((converted++))
                print_success "Converted: $(basename "$epub_file")"
            else
                ((failed++))
                print_warning "Failed to convert: $(basename "$html_file")"
            fi
        else
            print_warning "No EPUB converter found (install pandoc or Calibre)"
            break
        fi
    done
    
    if [ $converted -gt 0 ]; then
        print_success "Converted $converted EPUB files"
        log "Converted $converted EPUB files"
    fi
    
    if [ $failed -gt 0 ]; then
        print_warning "$failed conversions failed"
        log "$failed conversions failed"
    fi
}

# Generate statistics
generate_stats() {
    print_status "Generating statistics..."
    
    local total_stories=$(python3 -c "import json; data=json.load(open('$CONFIG_FILE')); print(len(data.get('stories', [])))" 2>/dev/null || echo "0")
    local enabled_stories=$(python3 -c "import json; data=json.load(open('$CONFIG_FILE')); print(sum(1 for s in data.get('stories', []) if s.get('enabled', True)))" 2>/dev/null || echo "0")
    local total_chapters=$(python3 -c "import json; data=json.load(open('$CONFIG_FILE')); print(sum(s.get('chapter_count', 0) for s in data.get('stories', [])))" 2>/dev/null || echo "0")
    
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}  Statistics                                                    ${BLUE}║${NC}"
    echo -e "${BLUE}╠════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BLUE}║${NC}  Total Stories:        $total_stories                                           ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC}  Enabled Stories:      $enabled_stories                                           ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC}  Total Chapters:       $total_chapters                                          ${BLUE}║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Cleanup old files
cleanup_old_files() {
    local days=${1:-30}
    print_status "Cleaning up files older than $days days..."
    
    find "$OUTPUT_DIR" -name "*.html" -type f -mtime +$days -delete 2>/dev/null || true
    find "$OUTPUT_DIR" -name "*.log" -type f -mtime +$days -delete 2>/dev/null || true
    
    print_success "Cleanup completed"
}

# Main execution
main() {
    print_header
    log "=== Auto-update started ==="
    
    # Check dependencies
    check_dependencies
    
    # Update stories
    if ! update_stories; then
        log "=== Auto-update failed ==="
        exit 1
    fi
    
    # Convert to EPUB
    convert_to_epub
    
    # Generate stats
    generate_stats
    
    # Cleanup (only if --cleanup flag is passed)
    if [[ "$1" == "--cleanup" ]]; then
        cleanup_old_files 30
    fi
    
    log "=== Auto-update completed ==="
    print_success "All done!"
    echo ""
    print_status "Output directory: $OUTPUT_DIR"
    print_status "Log file: $LOG_FILE"
    echo ""
}

# Handle command line arguments
case "${1:-}" in
    -h|--help)
        echo "Usage: $0 [OPTIONS]"
        echo ""
        echo "Options:"
        echo "  -h, --help     Show this help message"
        echo "  --cleanup      Cleanup files older than 30 days after update"
        echo ""
        echo "This script automatically updates all tracked Reddit stories."
        echo "Configure stories with: python multi_story_updater.py --add"
        echo ""
        echo "For cron: 0 2 * * * $0 >> $LOG_FILE 2>&1"
        exit 0
        ;;
    *)
        main "$@"
        ;;
esac

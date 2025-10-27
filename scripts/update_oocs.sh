#!/bin/bash
# 
# Out of Cruel Space - Automated EPUB Update Script
# This script checks for new chapters and updates the EPUB automatically
#

set -e  # Exit on error

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/epub_output"
LOG_FILE="$OUTPUT_DIR/update_log.txt"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Function to log messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Function to print colored messages
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Main function
main() {
    print_status "Starting Out of Cruel Space EPUB updater..."
    log "=== Update started ==="
    
    # Check if Python is installed
    if ! command -v python3 &> /dev/null; then
        print_error "Python 3 is not installed. Please install Python 3 to continue."
        log "ERROR: Python 3 not found"
        exit 1
    fi
    
    print_success "Python 3 found: $(python3 --version)"
    
    # Check if requirements are installed
    print_status "Checking dependencies..."
    if ! python3 -c "import requests" 2>/dev/null; then
        print_warning "Installing required dependencies..."
        pip3 install -r "$SCRIPT_DIR/requirements-reddit.txt" || {
            print_error "Failed to install dependencies"
            log "ERROR: Failed to install dependencies"
            exit 1
        }
    fi
    print_success "Dependencies OK"
    
    # Run the updater script
    print_status "Checking for new chapters..."
    log "Running Python updater script..."
    
    if python3 "$SCRIPT_DIR/out_of_cruel_space_updater.py" --update; then
        print_success "Update completed successfully!"
        log "Update completed successfully"
        
        # Check if HTML file exists
        HTML_FILE=$(find "$OUTPUT_DIR" -name "Out_Of_Cruel_Space_*.html" -type f -print -quit)
        
        if [ -n "$HTML_FILE" ]; then
            print_status "HTML file created: $(basename "$HTML_FILE")"
            
            # Try to convert to EPUB if pandoc is available
            if command -v pandoc &> /dev/null; then
                EPUB_FILE="${HTML_FILE%.html}.epub"
                print_status "Converting to EPUB with pandoc..."
                
                if pandoc "$HTML_FILE" -o "$EPUB_FILE" --metadata title="Out of Cruel Space" --metadata author="KyleKKent"; then
                    print_success "EPUB created: $(basename "$EPUB_FILE")"
                    log "EPUB created: $EPUB_FILE"
                else
                    print_warning "Failed to convert to EPUB. HTML file is available."
                    log "WARNING: EPUB conversion failed"
                fi
            elif command -v ebook-convert &> /dev/null; then
                EPUB_FILE="${HTML_FILE%.html}.epub"
                print_status "Converting to EPUB with Calibre..."
                
                if ebook-convert "$HTML_FILE" "$EPUB_FILE"; then
                    print_success "EPUB created: $(basename "$EPUB_FILE")"
                    log "EPUB created: $EPUB_FILE"
                else
                    print_warning "Failed to convert to EPUB. HTML file is available."
                    log "WARNING: EPUB conversion failed"
                fi
            else
                print_warning "Neither pandoc nor Calibre found. Install one to convert to EPUB."
                print_status "HTML file is available at: $HTML_FILE"
                log "INFO: No EPUB converter found, HTML only"
            fi
        else
            print_warning "No HTML file generated"
            log "WARNING: No HTML file found"
        fi
    else
        print_error "Update failed. Check the log for details."
        log "ERROR: Python updater script failed"
        exit 1
    fi
    
    log "=== Update finished ==="
    print_success "Done!"
    echo ""
    print_status "Output directory: $OUTPUT_DIR"
    print_status "Log file: $LOG_FILE"
}

# Help message
show_help() {
    cat << EOF
Out of Cruel Space - Automated EPUB Updater

Usage: $0 [OPTIONS]

OPTIONS:
    -h, --help      Show this help message
    -f, --full      Perform full rebuild instead of update
    -v, --verbose   Verbose output

EXAMPLES:
    $0                  # Check for updates
    $0 --full          # Rebuild entire EPUB
    
CRON JOB:
    # Check for updates daily at 2 AM
    0 2 * * * $0 >> $LOG_FILE 2>&1

EOF
}

# Parse command line arguments
case "${1:-}" in
    -h|--help)
        show_help
        exit 0
        ;;
    -f|--full)
        print_status "Running full rebuild..."
        python3 "$SCRIPT_DIR/out_of_cruel_space_updater.py" --rebuild
        ;;
    *)
        main
        ;;
esac

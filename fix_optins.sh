#!/bin/bash
# Add @OptIn annotations where needed

find CleverFerret/src/main/java -name "*.kt" -print0 | while IFS= read -r -d '' file; do
    # Check if file already has @OptIn
    if ! grep -q "@OptIn" "$file"; then
        # Check if file uses experimental APIs
        if grep -q "ExperimentalMaterial3Api\|ExperimentalFoundationApi\|ExperimentalAnimationApi" "$file"; then
            echo "Adding @OptIn to: $file"
        fi
    fi
done

#!/bin/bash
# Add @OptIn annotations where needed

find CleverFerret/src/main/java -name "*.kt" -print0 | while IFS= read -r -d '' file; do
    # Check if file already has @OptIn
    if ! grep -q "@OptIn" "$file"; then
        # Check if file uses experimental APIs
        if grep -q "ExperimentalMaterial3Api\|ExperimentalFoundationApi\|ExperimentalAnimationApi" "$file"; then
            optins=()
            grep -q "ExperimentalMaterial3Api" "$file" && optins+=("ExperimentalMaterial3Api::class")
            grep -q "ExperimentalFoundationApi" "$file" && optins+=("ExperimentalFoundationApi::class")
            grep -q "ExperimentalAnimationApi" "$file" && optins+=("ExperimentalAnimationApi::class")

            if [[ ${#optins[@]} -eq 0 ]]; then
                continue
            fi

            IFS=', '
            annotation="@file:OptIn(${optins[*]})"
            unset IFS

            tmp_file=$(mktemp)
            package_line=$(grep -n '^package ' "$file" | head -n1 | cut -d: -f1 || true)
            if [[ -n "$package_line" ]]; then
                head -n "$((package_line-1))" "$file" > "$tmp_file"
                printf '%s\n\n' "$annotation" >> "$tmp_file"
                tail -n "+$package_line" "$file" >> "$tmp_file"
            else
                printf '%s\n\n' "$annotation" > "$tmp_file"
                cat "$file" >> "$tmp_file"
            fi
            mv "$tmp_file" "$file"
            echo "Added $annotation to: $file"
        fi
    fi
done

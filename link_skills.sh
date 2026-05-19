#!/bin/bash

# Configuration
SOURCE_BASE_DIR="$HOME/Development/skills"
TARGET_DIR="$HOME/.gemini/config/skills"

echo "Syncing skills from $SOURCE_BASE_DIR to $TARGET_DIR..."

# 1. Create target directory if it doesn't exist, otherwise clear symbolic links
if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
    echo "Created $TARGET_DIR"
else
    echo "Clearing existing links in $TARGET_DIR..."
    find "$TARGET_DIR" -type l -delete
fi

# 2. Link current skills from source to target
for category in "$SOURCE_BASE_DIR"/*; do
    if [ -d "$category" ]; then
        category_name=$(basename "$category")
        # Skip categories starting with _
        if [[ "$category_name" == _* ]]; then
            continue
        fi

        for skill in "$category"/*; do
            if [ -d "$skill" ]; then
                skill_name=$(basename "$skill")
                # Skip skills starting with _
                if [[ "$skill_name" == _* ]]; then
                    continue
                fi
                ln -sf "$skill" "$TARGET_DIR/$skill_name"
            fi
        done
    fi
done

# 3. Handle Deletions (macOS compatible): Remove broken symbolic links
# On macOS find, we check for links (-type l) that are broken (! -exec test -e {} \;)
echo "Cleaning up broken links..."
find "$TARGET_DIR" -type l ! -exec test -e {} \; -delete -print | sed 's/^/  [CLEANED] /'

echo "Sync completed. Total skills: $(ls -1 "$TARGET_DIR" | wc -l)"

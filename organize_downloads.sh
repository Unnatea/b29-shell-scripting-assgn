#!/bin/bash

# Base directory (Downloads folder)
DIR=~/Downloads

# Create folders
mkdir -p "$DIR/Images" "$DIR/Documents" "$DIR/Videos" "$DIR/Others"

# Counters
img_count=0
doc_count=0
vid_count=0
other_count=0

echo "Organizing files in $DIR..."

# Loop through files
for file in "$DIR"/*; do
    # Skip directories
    [ -d "$file" ] && continue

    case "$file" in
        *.jpg|*.png)
            mv -n "$file" "$DIR/Images/" && ((img_count++))
            ;;
        *.pdf|*.txt)
            mv -n "$file" "$DIR/Documents/" && ((doc_count++))
            ;;
        *.mp4|*.mkv)
            mv -n "$file" "$DIR/Videos/" && ((vid_count++))
            ;;
        *)
            mv -n "$file" "$DIR/Others/" && ((other_count++))
            ;;
    esac
done

# Summary
echo "------ Summary ------"
echo "Images moved: $img_count"
echo "Documents moved: $doc_count"
echo "Videos moved: $vid_count"
echo "Others moved: $other_count"

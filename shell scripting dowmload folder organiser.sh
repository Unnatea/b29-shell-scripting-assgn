#!/bin/bash

mkdir -p photos docs videos others

sum=0

echo "Sorting files..."

for f in *.jpg *.png *.jpeg; do
    test -f "$f" || continue
    mv "$f" photos/
    echo "  $f  -->  photos"
    sum=$((sum + 1))
done

for f in *.pdf *.txt *.docx; do
    test -f "$f" || continue
    mv "$f" docs/
    echo "  $f  -->  docs"
    sum=$((sum + 1))
done

for f in *.mp4 *.mkv *.avi; do
    test -f "$f" || continue
    mv "$f" videos/
    echo "  $f  --> videos"
    sum=$((sum + 1))
done

for f in *; do
    if [ -f "$f" ]; then
        mv "$f" others/
        echo "  $f  -->  others"
        sum=$((sum + 1))
    fi
done

echo "Done."
echo " $sum files moved in total."


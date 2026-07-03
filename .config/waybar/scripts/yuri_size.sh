#!/bin/sh

echo -n "{"
echo -n "\"text\": \"Yuri Folder: $(du -sL ~/Pictures/banger | awk -F' ' {' print ($1 * 1024)'} | numfmt --to=iec --suffix=B --format=%.2f)\","
echo -n "\"tooltip\": \"$(du -sL ~/Pictures/banger | awk -F' ' {' print ($1 * 1024)'} | numfmt --to=iec --suffix=B --format=%.6f)\""
echo "}"

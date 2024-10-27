#!/bin/sh
echo "Yuri Folder: $(du -shL ~/Pictures/banger | awk -F' ' {' print $1'})iB"

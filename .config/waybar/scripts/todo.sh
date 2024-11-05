#!/bin/sh
echo "$(sed -n '4,4p' "$HOME/Documents/notes/todo.txt" | awk -F'] ' {' print $2'})"

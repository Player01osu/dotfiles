#!/bin/sh
echo "$(sed -n '6,6p' "$HOME/Documents/wiki/todo.wiki" | awk -F'] ' {' print $2'})"

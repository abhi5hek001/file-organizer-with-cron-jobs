#!/bin/bash

echo "Downloads Organizer"

cd ~/Downloads

mkdir -p Images Documents Music

for file in *; do
	case "$file" in
	*jpg|*png) mv "$file" Images/ ;;
	*pdf|*doc|*docs|*docx) mv "$file" Documents ;;
	*mp3) mv "$file" Music ;;
	esac
done

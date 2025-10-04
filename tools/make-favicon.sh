#!/bin/bash

FAVICON_FOLDER="icons_to_put_in_assets_img"

# Ensure FAVICON_FOLDER exists or create it if not
rm -rf "$FAVICON_FOLDER"
mkdir -p "$FAVICON_FOLDER"

if [[ $1 =~ \.(jpg|jpeg|png)$ ]]; then
  SOURCE_IMAGE="$1"
else
  echo "Error: Only JPEG and PNG files are supported."
  exit 1
fi

# Process the source image to generate various favicon sizes
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=16:16" "$FAVICON_FOLDER/favicon-16x16.png"
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=32:32" "$FAVICON_FOLDER/favicon-32x32.png"
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=192x192" "$FAVICON_FOLDER/android-chrome-192x192.png"
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=512:512" "$FAVICON_FOLDER/android-chrome-512x512.png"
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=150:150" "$FAVICON_FOLDER/mstile-150x150.png"
#!/bin/bash

# Ensure only valid image formats are provided
if [[ $1 =~ \.(jpg|jpeg|png)$ ]]; then
  SOURCE_IMAGE="$FAVICON_FOLDER/$1"
else
  echo "Error: Only JPEG and PNG files are supported."
  exit 1
fi

SOURCE_IMAGE="$FAVICON_FOLDER/web-app-manifest-512x512.png"
rm "$FAVICON_FOLDER/browserconfig.xml" "$FAVICON_FOLDER/site.webmanifest"
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=16:16" "$FAVICON_FOLDER/favicon-16x16.png"
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=32:32" "$FAVICON_FOLDER/favicon-32x32.png"
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=192x192" "$FAVICON_FOLDER/android-chrome-192x192.png"
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=512:512" "$FAVICON_FOLDER/android-chrome-512x512"
ffmpeg -i "$SOURCE_IMAGE" -vf "scale=150:150" "$FAVICON_FOLDER/mstile-150x150.png"
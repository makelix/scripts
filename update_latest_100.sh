#!/bin/bash
cd /garfunkel/music
echo "#EXTM3U" > Latest100.m3u
find . -type f \( -iname '*.ogg' -o -iname '*.mp3' \) -printf '%C+ %p\n' | sort -rt \t | head -100 | cut -c 32- >> Latest100.m3u

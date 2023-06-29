#!/bin/bash

# def variable
BASE_DIR=/home/felix/Media/
MUSIC_DIR=Music/
CACHE_DIR=$BASE_DIR${MUSIC_DIR}.cache
DOWNLOAD_BAK_FILE=$BASE_DIR${MUSIC_DIR}.download.txt
FLAGS=" --download-archive $DOWNLOAD_BAK_FILE \
        --no-post-overwrites \
        -cwix \
        --audio-format m4a \
        -o \"%(title)s.%(ext)s\" \
        --embed-thumbnail \
        --cache-dir=$CACHE_DIR \
        --format bestaudio \
        --audio-quality 0 \
        --add-metadata 
        "
BIN=yt-dlp

## exec cmd
cd $BASE_DIR$MUSIC_DIR$2
$BIN $1 $FLAGS

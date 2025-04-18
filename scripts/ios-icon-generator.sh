#!/bin/bash
#
# Copyright (C) 2014 Wenva <lvyexuwenfa100@126.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e

SRC_FILE="$1"
DST_PATH="$2"

VERSION=1.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF
VERSION: $VERSION
USAGE:
    $0 srcfile dstpath

DESCRIPTION:
    This script aims to generate iOS app icons easily and simply.

    srcfile - The source PNG image. Preferably above 1024x1024
    dstpath - The destination path where the icons are generated.

    This script depends on ImageMagick. So you must install ImageMagick first.
    You can use 'sudo brew install ImageMagick' to install it.

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>

LICENSE:
    This script follows the MIT license.

EXAMPLE:
    $0 1024.png ~/123
EOF
}

# Check ImageMagick
command -v magick >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check parameters
if [ $# != 2 ];then
    usage
    exit -1
fi

# Check destination path existence
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

# Generate icons
info 'Generate iTunesArtwork@2x.png ...'
magick "$SRC_FILE" -resize 1024x1024 "$DST_PATH/ItunesArtwork@2x.png"

info 'Generate Icon-20.png ...'
magick "$SRC_FILE" -resize 20x20 "$DST_PATH/Icon-App-20x20@1x.png"
info 'Generate Icon-20@2x.png ...'
magick "$SRC_FILE" -resize 40x40 "$DST_PATH/Icon-App-20x20@2x.png"
info 'Generate Icon-40@2x.png ...'
magick "$SRC_FILE" -resize 60x60 "$DST_PATH/Icon-App-20x20@3x.png"

info 'Generate Icon-29.png ...'
magick "$SRC_FILE" -resize 29x29 "$DST_PATH/Icon-App-29x29@1x.png"
info 'Generate Icon-29@2x.png ...'
magick "$SRC_FILE" -resize 58x58 "$DST_PATH/Icon-App-29x29@2x.png"
info 'Generate Icon-29@3x.png ...'
magick "$SRC_FILE" -resize 87x87 "$DST_PATH/Icon-App-29x29@3x.png"

info 'Generate Icon-40.png ...'
magick "$SRC_FILE" -resize 40x40 "$DST_PATH/Icon-App-40x40@1x.png"
info 'Generate Icon-40@2x.png ...'
magick "$SRC_FILE" -resize 80x80 "$DST_PATH/Icon-App-40x40@2x.png"
info 'Generate Icon-40@3x.png ...'
magick "$SRC_FILE" -resize 120x120 "$DST_PATH/Icon-App-40x40@3x.png"

info 'Generate Icon-60@2x.png ...'
magick "$SRC_FILE" -resize 120x120 "$DST_PATH/Icon-App-60x60@2x.png"
info 'Generate Icon-60@3x.png ...'
magick "$SRC_FILE" -resize 180x180 "$DST_PATH/Icon-App-60x60@3x.png"

info 'Generate Icon-76.png ...'
magick "$SRC_FILE" -resize 76x76 "$DST_PATH/Icon-App-76x76@1x.png"
info 'Generate Icon-76@2x.png ...'
magick "$SRC_FILE" -resize 152x152 "$DST_PATH/Icon-App-76x76@2x.png"

info 'Generate Icon-57.png ...'
magick "$SRC_FILE" -resize 57x57 "$DST_PATH/Icon-App-57x57@1x.png"
info 'Generate Icon-57@2x.png ...'
magick "$SRC_FILE" -resize 114x114 "$DST_PATH/Icon-App-57x57@2x.png"

info 'Generate Icon-83.5@2x.png ...'
magick "$SRC_FILE" -resize 167x167 "$DST_PATH/Icon-App-83.5x83.5@2x.png"

info 'Generate Icon-72.png ...'
magick "$SRC_FILE" -resize 72x72 "$DST_PATH/Icon-App-72x72@1x.png"
info 'Generate Icon-72@2x.png ...'
magick "$SRC_FILE" -resize 144x144 "$DST_PATH/Icon-App-72x72@2x.png"

info 'Generate Icon-50.png ...'
magick "$SRC_FILE" -resize 50x50 "$DST_PATH/Icon-Small-50x50@1x.png"
info 'Generate Icon-50@2x.png ...'
magick "$SRC_FILE" -resize 100x100 "$DST_PATH/Icon-Small-50x50@2x.png"

info 'Generate Done.'

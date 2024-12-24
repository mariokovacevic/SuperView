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
    This script aims to generate iOS app splash images easily and simply.

    srcfile - The source PNG image. Preferably above 2048x2048
    dstpath - The destination path where the splash image will be generated.

    This script depends on ImageMagick. So you must install ImageMagick first.
    You can use 'sudo brew install ImageMagick' to install it.

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>

LICENSE:
    This script follows the MIT license.

EXAMPLE:
    $0 splash_source.png ~/123
EOF
}

# Check ImageMagick
command -v magick >/dev/null 2>&1 || { error >&2 "ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check parameters
if [ $# != 2 ];then
    usage
    exit -1
fi

# Check if destination path exists
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

# Generate splash image
info 'Generate splash.png ...'
magick "$SRC_FILE" -resize 2048x2048 "$DST_PATH/splash.png"

info 'Generate Done.'

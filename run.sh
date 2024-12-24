#!/bin/bash

set -e

trap "exit 1" TERM
TOP_PID=$$

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

function alert() {
    echo "😭 - There was an error"
    kill -s TERM $TOP_PID
}

function log() {
    local message=$1
    local status=$2
    if [ "$status" == "error" ]; then
        echo "🔥 - $message"
    elif [ "$status" == "info" ]; then
        echo "🔄 - $message"
    else
        echo "👏 - $message"
    fi
}

function bundleInstall() {
    echo "✋ - Installing gems"
    local output=$(bundle install 2>&1)
    echo "$output"

    if [[ $output == *"Bundle complete!"* ]]; then
        log "Gems installed successfully" "success"
    else
        log "Gem installation failed" "error"
        alert
    fi
}

function generateAppIcon() {
    echo "✋ - Generating App Icons"
    local generator="$DIR/scripts/ios-icon-generator.sh"
    local appIcon="$DIR/Icons/app_icon.png"
    local appIconAssets="$DIR/Sources/Assets.xcassets/AppIcon.appiconset/"
    local output

    output=$(/bin/sh "$generator" "$appIcon" "$appIconAssets")
    echo "$output"

    if [[ $output == *"Generate Done"* ]]; then
        log "App Icon created successfully" "success"
    else
        log "App Icon generation failed" "error"
        alert
    fi
}

function generateSplash() {
    echo "✋ - Generating Splash Screen"
    local generator="$DIR/scripts/ios-splash-generator.sh"
    local splashIcon="$DIR/Icons/splash.png"
    local splashIconAssets="$DIR/Sources/Assets.xcassets/splash.imageset/"
    local output

    output=$(/bin/sh "$generator" "$splashIcon" "$splashIconAssets")
    echo "$output"

    if [[ $output == *"Generate Done"* ]]; then
        log "Splash Screen created successfully" "success"
    else
        log "Splash Screen generation failed" "error"
        alert
    fi
}

function createProject() {
    echo "✋ - Generating project"
    local output=$(xcodegen 2>&1)
    echo "$output"

    if [[ $output == *"Created project"* ]]; then
        log "Xcode project created successfully" "success"
    else
        log "Xcode project creation failed" "error"
        alert
    fi
}

function openProject() {
    echo "✋ - Opening Xcode project"
    xed . || { log "Failed to open Xcode project" "error"; alert; }
    log "Project opened in Xcode" "success"
}

function podInstall() {
    echo "✋ - Installing Pods"
    bundle exec pod install || { log "Pod installation failed" "error"; alert; }

    local workspacePath="$DIR/App.xcworkspace"

    echo "🔍 Checking for App.xcworkspace at: $workspacePath"
    ls -l "$DIR" # List contents of the directory for debugging

    if [ -d "$workspacePath" ]; then
        log "App.xcworkspace directory found successfully" "success"
    else
        log "App.xcworkspace directory is missing or not recognized" "error"
        alert
    fi
}

function cleanEnvironment() {
    echo "✋ - Cleaning up environment"
    rm -rf *.xcodeproj
    rm -rf *.xcworkspace
    rm -rf Pods
    rm -rf Podfile.lock
    log "Environment cleaned up" "success"
}

# Main script execution
cd "$DIR"
cleanEnvironment
bundleInstall
generateAppIcon
generateSplash
createProject
podInstall
openProject

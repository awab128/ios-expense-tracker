#!/bin/bash

cd "$(dirname "$0")"

# Install CocoaPods dependencies
pod install

# Clean previous builds
xcodebuild clean -workspace TRKEBATTRANSACTIONAPP.xcworkspace \
  -scheme TRKEBATTRANSACTIONAPP \
  -configuration Release

# Build the app
xcodebuild -workspace TRKEBATTRANSACTIONAPP.xcworkspace \
  -scheme TRKEBATTRANSACTIONAPP \
  -sdk iphoneos \
  -configuration Release \
  -derivedDataPath build

# Package the .ipa
mkdir -p Payload
cp -r build/Build/Products/Release-iphoneos/*.app Payload/
zip -r TRKEBATTRANSACTIONAPP.ipa Payload
rm -rf Payload

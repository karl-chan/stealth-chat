#!/usr/bin/env bash
flutter pub get

flutter pub run flutter_launcher_name:main
flutter pub run flutter_launcher_icons:main

flutter build apk --target-platform android-arm64

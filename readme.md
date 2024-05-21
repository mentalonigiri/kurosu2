# Kurosu2
it's a little helloworld kind of app
buildable for many platforms
using SDL2 and LVGL.

## deps

### General
1. xmake

### Android
1. sdkmanager (pip install sdkmanager). Or it can be sdkmanager from android sdk

### Windows
1. mingw toolchain installed

### Linux
1. dev packages installed (compiler)
1. sdl2 development headers from your package manager are recommended.

### Wasm
1. emscripten installed and emsdk environment activated (see emscripten docs)

## building
```
xmake run build-mingw
xmake run build-linux
xmake run build-wasm
xmake run build-android
```
Select one. Or many.

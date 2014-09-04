#How to use ffmpeg4android:
1. Download [Android NDK](https://developer.android.com/tools/sdk/ndk/index.html)
2. Put this whole project (actually, only Android folder should be enough.) under $NDK/sources/ffmpeg4android
3. Add reference "$(call import-module, ffmpeg4android/android/arm)" into Android.mk of your NDK project.
4. Now ndk-build should work. Tada~


---


#Installing FFmpeg:

1. Type `./configure` to create the configuration. A list of configure
options is printed by running `configure --help`.

    `configure` can be launched from a directory different from the FFmpeg
sources to build the objects out of tree. To do this, use an absolute
path when launching `configure`, e.g. `/ffmpegdir/ffmpeg/configure`.

2. Then type `make` to build FFmpeg. GNU Make 3.81 or later is required.

3. Type `make install` to install all binaries and libraries you built.

NOTICE
------

 - Non system dependencies (e.g. libx264, libvpx) are disabled by default.

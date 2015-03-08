ffmpeg4android README
=====================
(FFmpeg README is listed below)
ffmpeg4android is a source project for Android NDK, which contains latest FFmpeg modules (without bins), and **ANDROID-USE-ONLY libraries compiled with all decoders and x264/aac encoders**.

***Please make sure, before you follow "How to xxx" below, you already knew what's `ndk-build`, `environment-variable` and similar basic technologies.***

##How to use
1. Download [Android NDK](https://developer.android.com/tools/sdk/ndk/index.html)
2. Put the whole `ffmpeg-2.x/*` folder (actually, only `ffmpeg-2.x/android/*` is enough.) under `$NDK/sources/ffmpeg4android/`
3. Add reference `$(call import-module, ffmpeg4android/android/arm)` into `Android.mk` of your project with NDK.
4. Now ndk-build should work. ***Tada~***

##How to compile shared libraries (DEFAULT)
1. Add path of ndk10 as environment variable : `$NDK_HOME`
2. If you want to compile with x264, you need [x264android](http://chloette.github.io/x264android) at first. Then add x264 path as environment variable : `$X264_HOME`
3. Now you can run `./build.sh FFMPEG_CODES_FOLDER` to compile. ***Tada~***

##How to compile static libraries (BE CARE : LGPL limitation)
1. Follow step 1 and 2 of "How to compile (shared libraries)"
2. Use `--enable-static` instead of `--disable-static` in `build_android.sh`
3. Now you can run `build.sh FFMPEG_CODES_FOLDER` to compile static libraries. ***Tada~***
4. One more thing, modify `Android.mk`, use `PREBUILT_STATIC_LIBRARY` instead of `PREBUILT_SHARED_LIBRARY`; And use `lib***.a` instead of `lib***.so`

##Notice
1. Now the `build_android.sh` includes `all decoders` but **only** `aac and x264 encoders`, if you need more, please modify it and re-compile. BTW, per X264, please follow GPL license.
2. `ffmpeg` folder (not `ffmpeg-2.x`) contains latest build (newer than `ffmpeg-2.4` but not stable), be care.
3. Codes newer than `ffmpeg 2.4`, use `Android_newer.mk`; otherwise, use `Android.mk`.

##Environment
***Android NDK*** only.

##License
Should be same as FFmpeg...

##Contact
Any problems please contact me [@ffmpeg4android](https://github.com/chloette/ffmpeg4android) or `chloette.e@gmail.com`


---




FFmpeg README
=============

FFmpeg is a collection of libraries and tools to process multimedia content
such as audio, video, subtitles and related metadata.

## Libraries

* `libavcodec` provides implementation of a wider range of codecs.
* `libavformat` implements streaming protocols, container formats and basic I/O access.
* `libavutil` includes hashers, decompressors and miscellaneous utility functions.
* `libavfilter` provides a mean to alter decoded Audio and Video through chain of filters.
* `libavdevice` provides an abstraction to access capture and playback devices.
* `libswresample` implements audio mixing and resampling routines.
* `libswscale` implements color conversion and scaling routines.

## Tools

* [ffmpeg](http://ffmpeg.org/ffmpeg.html) is a command line toolbox to
  manipulate, convert and stream multimedia content.
* [ffplay](http://ffmpeg.org/ffplay.html) is a minimalistic multimedia player.
* [ffprobe](http://ffmpeg.org/ffprobe.html) is a simple analisys tool to inspect
  multimedia content.
* Additional small tools such as `aviocat`, `ismindex` and `qt-faststart`.

## Documentation

The offline documentation is available in the **doc/** directory.

The online documentation is available in the main [website](http://ffmpeg.org)
and in the [wiki](http://trac.ffmpeg.org).

### Examples

Conding examples are available in the **doc/example** directory.

## License

FFmpeg codebase is mainly LGPL-licensed with optional components licensed under
GPL. Please refer to the LICENSE file for detailed information.

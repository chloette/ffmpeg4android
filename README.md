ffmpeg4android README
=====================
(FFmpeg README is listed below)
ffmpeg4android is a source project for Android NDK, which contains latest FFmpeg modules (without bins) and X264 encoders.

##How to use
1. Download [Android NDK](https://developer.android.com/tools/sdk/ndk/index.html)
2. Put the whole `ffmpeg-2.x/*` folder (actually, only `ffmpeg-2.x/android/*` should be enough.) under `$NDK/sources/ffmpeg4android/`
3. Add reference `$(call import-module, ffmpeg4android/android/arm)` into Android.mk of your NDK project.
4. Now ndk-build should work. Tada~ 

##Notice
1. Now the build configure includes `all decoders` but **only** `aac and x264 encoders`, if you need more, please modify the `build_android10.sh` and compile again.
2. If you want to compile with x264, you need [x264android](http://chloette.github.io/x264android) first.
3. Above ffmpeg 2.4, use Android_newer.mk; otherwise, use Android.mk.
4. `ffmpeg` folder (not `ffmpeg-2.x`) contains latest build (newer than 2.4 but not stable), be care.

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

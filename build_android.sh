#!/bin/bash
NDK=$HOME/android/android-ndk-r9d
SYSROOT=$NDK/platforms/android-9/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64
X264LIB=$NDK/sources/x264-snapshot-20140511-2245/android/arm/lib/
X264INC=$NDK/sources/x264-snapshot-20140511-2245/android/arm/include/
function build_one
{
./configure \
    --prefix=$PREFIX \
    --enable-shared \
    --disable-static \
    --disable-doc \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-avdevice \
    --disable-doc \
    --disable-symver \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --target-os=linux \
    --arch=arm \
	--disable-debug \
	--disable-encoders \
	--enable-gpl \
	--enable-pthreads \
	--enable-libx264 \
	--enable-encoder=aac \
	--enable-encoder=libx264 \
	--enable-decoder=h264 \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --extra-cflags="-Os -fpic $ADDI_CFLAGS -I$X264INC"  \
    --extra-ldflags="$ADDI_LDFLAGS -s -L$X264LIB -lx264" \
    $ADDITIONAL_CONFIGURE_FLAG
	
make clean
make
make install
}
CPU=arm
PREFIX=$(pwd)/android/$CPU 
ADDI_CFLAGS="-marm"
build_one

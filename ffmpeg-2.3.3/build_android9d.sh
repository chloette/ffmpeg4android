#!/bin/bash
NDK=$NDK9D
SYSROOT=$NDK/platforms/android-9/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64
X264LIB=$X264/android/arm/lib/
X264INC=$X264/android/arm/include/
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
    --enable-libx264 \
    --enable-encoder=libx264 \
    --enable-encoder=aac \
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

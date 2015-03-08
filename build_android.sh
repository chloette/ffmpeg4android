#!/bin/bash
NDK=$NDK_HOME
SYSROOT=$NDK/platforms/android-9/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/
if [ -d "$TOOLCHAIN/linux-x86_64" ]; then
  TOOLCHAIN+=linux-x86_64
else #treat as darwin
  TOOLCHAIN+=darwin-x86_64
fi
X264LIB=$X264_HOME/android/arm/lib/
X264INC=$X264_HOME/android/arm/include/
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

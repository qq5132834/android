#!/bin/bash
NDK=/home/ubuntu/Desktop/android/android-ndk-r22b
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64/
API=21
BASEPATH=$(cd `dirname $0`; pwd)

function build_android
{
echo "Compiling FFmpeg for $CPU"
./configure \
    --prefix=$PREFIX \
    --disable-neon \
    --disable-hwaccels \
    --disable-gpl \
    --disable-postproc \
    --enable-shared \
    --enable-jni \
    --disable-mediacodec \
    --disable-decoder=h264_mediacodec \
    --disable-static \
    --disable-doc \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-avdevice \
    --disable-doc \
    --disable-symver \
    --extra-cflags="-I$X264_INCLUDE  -I$FDK_INCLUDE -I$MP3_INCLUDE" \
    --extra-ldflags="-L$FDK_LIB -L$X264_LIB -L$MP3_LIB" \
    --enable-nonfree \
    --enable-gpl \
    --enable-libfdk-aac \
    --enable-libx264 \
    --enable-libmp3lame \
    --cross-prefix=$CROSS_PREFIX \
    --target-os=android \
    --arch=$ARCH \
    --cpu=$CPU \
    --cc=$CC
    --cxx=$CXX
    --sysroot=$SYSROOT \
    --extra-cflags="-Os -fpic $OPTIMIZE_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS" \
    $ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
echo "The Compilation of FFmpeg for $CPU is completed"
}

#armv8-a
ARCH=arm64
CPU=armv8-a

#HOST=aarch64-linux-android
#export AR=$TOOLCHAIN/bin/aarch64-linux-android-ar
#export AS=$TOOLCHAIN/bin/aarch64-linux-android-as
#export LD=$TOOLCHAIN/bin/aarch64-linux-android-ld
#export RANLIB=$TOOLCHAIN/bin/aarch64-linux-android-ranlib
#export STRIP=$TOOLCHAIN/bin/aarch64-linux-android-strip
#export CC=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
#export CXX=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
#OPTIMIZE_CFLAGS="-march=$CPU"
#export CFLAGS="-Os -fpic $OPTIMIZE_CFLAGS"
#export CPPFLAGS="-Os -fpic $OPTIMIZE_CFLAGS"


CC=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
CXX=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
SYSROOT=$NDK/toolchains/llvm/prebuilt/linux-x86_64/sysroot
CROSS_PREFIX=$TOOLCHAIN/bin/aarch64-linux-android-
PREFIX=$(pwd)/android/$CPU
OPTIMIZE_CFLAGS="-march=$CPU"
#第三方库
FDK_INCLUDE=$BASEPATH/fdk-aac/android/$CPU/include
FDK_LIB=$BASEPATH/fdk-aac/android/$CPU/lib
X264_INCLUDE=$BASEPATH/x264/android/$CPU/include
X264_LIB=$BASEPATH/x264/android/$CPU/lib
MP3_INCLUDE=$BASEPATH/lame/android/$CPU/include
MP3_LIB=$BASEPATH/lame/android/$CPU/lib

build_android


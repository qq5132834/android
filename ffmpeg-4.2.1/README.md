
## 1、环境 ubuntu 16 LTS
## 2、在 DESKTOP 创建 ndk 文件夹
## 3、下载： wget https://ffmpeg.org/releases/ffmpeg-4.2.1.tar.bz2
## 4、解压： tar jxf ffmpeg-4.2.1.tar.bz2
## 5、在解压后的目录文件中下载，x264, lame， fdk-aac
### 5.1、 x264
```
        官方下载：https://github.com/mirror/x264.git  没有tag直接用master，日期是2024.3.31
        自定义下载（可以直接用）：https://github.com/qq5132834/x264.git
```
### 5.2、 fdk-aac
```
        官方下载：https://github.com/mstorsjo/fdk-aac.git  tag版本：v2.0.2
        自定义下载（可以直接用）： https://github.com/qq5132834/fdk-aac.git
```
### 5.3、 lame
```
        官方下载：https://gitee.com/hqiu/lame.git  没有tag直接用master，日期是2024.3.31
        自定义下载（可以直接用）： https://github.com/qq5132834/lame.git
```
### 5.4、 目录结构
```
        ffmpeg-4.2.1
                    |________
                            |____[ffmpeg-4.2.1目录文件]
                            |____fdk-aac
                            |____x264
                            |____lame
```
## 6 下载解压NDK
```
		wget https://dl.google.com/android/repository/android-ndk-r22b-linux-x86_64.zip
		unzip android-ndk-r22b-linux-x86_64.zip
```





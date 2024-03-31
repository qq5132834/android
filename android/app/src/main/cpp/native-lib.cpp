#include <jni.h>
#include <string>


extern "C" {

    #include "libavutil/avutil.h"
    JNIEXPORT jstring


    JNICALL
    Java_com_example_livestream_MainActivity_stringFromJNI(
            JNIEnv *env,
            jobject /* this */) {
        std::string hello = "Hello from C++, ffmpeg version: ";
        hello += av_version_info();
        return env->NewStringUTF(hello.c_str());
    }
}


/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class com_umeng_fb_opus_OpusTool */

#ifndef _Included_com_umeng_fb_opus_OpusTool
#define _Included_com_umeng_fb_opus_OpusTool
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     com_umeng_fb_opus_OpusTool
 * Method:    nativeGetString
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_com_umeng_fb_opus_OpusTool_nativeGetString
  (JNIEnv *, jobject);

/*
 * Class:     com_umeng_fb_opus_OpusTool
 * Method:    encode_wav_file
 * Signature: (Ljava/lang/String;)I
 */
JNIEXPORT jint JNICALL Java_com_umeng_fb_opus_OpusTool_encode_1wav_1file
  (JNIEnv *, jobject, jstring, jstring);

/*
 * Class:     com_umeng_fb_opus_OpusTool
 * Method:    decode_opus_file
 * Signature: (Ljava/lang/String;Ljava/lang/String;)I
 */
JNIEXPORT jint JNICALL Java_com_umeng_fb_opus_OpusTool_decode_1opus_1file
  (JNIEnv *, jobject, jstring, jstring);


#ifdef __cplusplus
}
#endif
#endif
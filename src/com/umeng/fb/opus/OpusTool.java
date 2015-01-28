package com.umeng.fb.opus;

public class OpusTool {
	
	static{
		System.loadLibrary("umeng_opustool");
	}
	public OpusTool(){
		
	}
	
	private native String nativeGetString();

	public native int encode_wav_file(String wav_path,String opus_path);

	public native int decode_opus_file(String opus_path,String wav_path);
	
	public String getNativeString(){
		return nativeGetString();
	}
			
}

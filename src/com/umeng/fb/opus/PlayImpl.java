package com.umeng.fb.opus;

import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioTrack;
import android.os.Environment;
import android.util.Log;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

/**
 * Created by user on 2014/11/13.
 */
public class PlayImpl implements IPlay {
    protected static int FREQUENCY = 16000;
    private static int CHANNEL = AudioFormat.CHANNEL_CONFIGURATION_MONO;
    private static int ENCODING = AudioFormat.ENCODING_PCM_16BIT;
    private AudioTrack audioTrack;

    @Override
    public void play(String path) {
    	  File file = new File(path);
          int  bufferSizeInBytes  = AudioRecord.getMinBufferSize(16000,
                    AudioFormat.CHANNEL_IN_MONO,  AudioFormat.ENCODING_PCM_16BIT);
            byte[] data = new byte[bufferSizeInBytes];
            initAudioTrack((int) (file.length()));
            try {
                FileInputStream is = new FileInputStream(file);
                audioTrack.play();
                while (is.read(data) != -1) {
                    audioTrack.write(data, 0, bufferSizeInBytes);
                }
                audioTrack.stop();

            } catch (Throwable t) {
                Log.e("AudioTrack", "Playback Failed");
            }
    }


    public void initAudioTrack(int musicLength) {
        audioTrack = new AudioTrack(AudioManager.STREAM_MUSIC,
                FREQUENCY,
                AudioFormat.CHANNEL_CONFIGURATION_MONO,
                AudioFormat.ENCODING_PCM_16BIT,
                musicLength ,
                AudioTrack.MODE_STREAM);
    }

    @Override
    public void stop() {
        audioTrack.stop();
    }


}

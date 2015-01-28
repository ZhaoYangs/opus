package com.umeng.fb.opus;

import java.io.File;

import com.umeng.fb.R;

import android.app.Activity;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends Activity {
	private final String TAG = MainActivity.class.getName();
	private static RecordImpl mRecord;
	private static PlayImpl mPlay;
	private OpusTool mOpusTool;



	private final String FILEPATH = Environment.getExternalStorageDirectory()
			.getAbsolutePath() + "/voice/";
	
	private final String FILEPATH_ORIGIN_DATA = FILEPATH + "origin_data.raw";
	private final String FILEPATH_ENCODE_OPUS = FILEPATH +"encode_opus.opus";
	private final String FILEPATH_ORIGIN_WAV = FILEPATH + "origin_wav.wav";
	private final String FILEPATH_DECODE_WAV = FILEPATH + "decode_wav.wav";


	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		initView();

		File dirFile = new File(FILEPATH);
		if (!dirFile.exists()) {
			boolean status = dirFile.mkdirs();
		}

		mOpusTool = new OpusTool();
		Log.d(TAG, "" + mOpusTool.getNativeString());
	}

	private void initView() {
		mRecord = new RecordImpl();
		mPlay = new PlayImpl();

		findViewById(R.id.record_start).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						Thread thread = new Thread(new Runnable() {
							public void run() {
								mRecord.start(FILEPATH_ORIGIN_DATA,
										FILEPATH_ORIGIN_WAV);
							}
						});
						thread.start();
					}
				});

		findViewById(R.id.record_stop).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						mRecord.stop();
					}
				});

		findViewById(R.id.play_start).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						mPlay.play(FILEPATH_ORIGIN_DATA);
					}
				});

		findViewById(R.id.play_stop).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						mPlay.stop();
					}
				});

		findViewById(R.id.wav_to_opus).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						wav2opusStart();
					}
				});

		findViewById(R.id.opus_to_wav).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						opus2wavStart();
					}
				});

		findViewById(R.id.play_wav).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						mPlay.play(FILEPATH_DECODE_WAV);
					}
				});

	}


	private void wav2opusStart() {
		new Thread(new Runnable() {
			public void run() {
				mOpusTool.encode_wav_file(FILEPATH_ORIGIN_WAV,
						FILEPATH_ENCODE_OPUS);

			}
		}).start();

	}

	private void opus2wavStart() {
		new Thread(new Runnable() {
			public void run() {
				mOpusTool.decode_opus_file(FILEPATH_ENCODE_OPUS,
						FILEPATH_DECODE_WAV);	
			}
		}).start();
	}

}

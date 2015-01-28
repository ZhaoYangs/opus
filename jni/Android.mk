LOCAL_PATH := $(call my-dir)
OPUS_INC = $(LOCAL_PATH)/libopus
OPUS_PATH = ./libopus

include $(CLEAR_VARS)
LOCAL_LDLIBS += -L$(SYSROOT)/usr/lib -llog
LOCAL_CPP_EXTENSION := .cpp
LOCAL_MODULE    := umeng_opustool

OPUS_CFLAGS = -DHAVE_CONFIG_H -DUSE_ALLOCA -O2 -fvisibility=hidden  -externs  

LOCAL_CFLAGS = -DFIXED_POINT -DUSE_KISS_FFT -DEXPORT="" -UHAVE_CONFIG_H -DLINUX -DCOMMON_VAD -DLIBLOG $(OPUS_CFLAGS) -D_ENCODE_ONLY_

LOCAL_C_INCLUDES := $(LOCAL_PATH)/libclient/inc  \
$(LOCAL_PATH)/uvad $(OPUS_INC)/silk $(OPUS_INC)/include $(OPUS_INC)/silk/fixed $(OPUS_INC)/celt $(OPUS_INC) \
$(LOCAL_PATH)/speex/include $(LOCAL_PATH)/speex/libspeex

CELT_SOURCES = \
$(OPUS_PATH)/celt/bands.c \
$(OPUS_PATH)/celt/celt.c \
$(OPUS_PATH)/celt/cwrs.c \
$(OPUS_PATH)/celt/entcode.c \
$(OPUS_PATH)/celt/entenc.c \
$(OPUS_PATH)/celt/kiss_fft.c \
$(OPUS_PATH)/celt/laplace.c \
$(OPUS_PATH)/celt/mathops.c \
$(OPUS_PATH)/celt/mdct.c \
$(OPUS_PATH)/celt/modes.c \
$(OPUS_PATH)/celt/pitch.c \
$(OPUS_PATH)/celt/celt_lpc.c \
$(OPUS_PATH)/celt/quant_bands.c \
$(OPUS_PATH)/celt/rate.c \
$(OPUS_PATH)/celt/vq.c \
$(OPUS_PATH)/celt/entdec.c \
$(OPUS_PATH)/celt/celt_decoder.c \
$(OPUS_PATH)/celt/celt_encoder.c \




SILK_SOURCES_FIXED = \
$(OPUS_PATH)/silk/fixed/LTP_analysis_filter_FIX.c \
$(OPUS_PATH)/silk/fixed/LTP_scale_ctrl_FIX.c \
$(OPUS_PATH)/silk/fixed/corrMatrix_FIX.c \
$(OPUS_PATH)/silk/fixed/encode_frame_FIX.c \
$(OPUS_PATH)/silk/fixed/find_LPC_FIX.c \
$(OPUS_PATH)/silk/fixed/find_LTP_FIX.c \
$(OPUS_PATH)/silk/fixed/find_pitch_lags_FIX.c \
$(OPUS_PATH)/silk/fixed/find_pred_coefs_FIX.c \
$(OPUS_PATH)/silk/fixed/noise_shape_analysis_FIX.c \
$(OPUS_PATH)/silk/fixed/prefilter_FIX.c \
$(OPUS_PATH)/silk/fixed/process_gains_FIX.c \
$(OPUS_PATH)/silk/fixed/regularize_correlations_FIX.c \
$(OPUS_PATH)/silk/fixed/residual_energy16_FIX.c \
$(OPUS_PATH)/silk/fixed/residual_energy_FIX.c \
$(OPUS_PATH)/silk/fixed/solve_LS_FIX.c \
$(OPUS_PATH)/silk/fixed/warped_autocorrelation_FIX.c \
$(OPUS_PATH)/silk/fixed/apply_sine_window_FIX.c \
$(OPUS_PATH)/silk/fixed/autocorr_FIX.c \
$(OPUS_PATH)/silk/fixed/burg_modified_FIX.c \
$(OPUS_PATH)/silk/fixed/k2a_FIX.c \
$(OPUS_PATH)/silk/fixed/k2a_Q16_FIX.c \
$(OPUS_PATH)/silk/fixed/pitch_analysis_core_FIX.c \
$(OPUS_PATH)/silk/fixed/vector_ops_FIX.c \
$(OPUS_PATH)/silk/fixed/schur64_FIX.c \
$(OPUS_PATH)/silk/fixed/schur_FIX.c

SILK_SOURCES = \
$(OPUS_PATH)/silk/CNG.c \
$(OPUS_PATH)/silk/code_signs.c \
$(OPUS_PATH)/silk/enc_API.c \
$(OPUS_PATH)/silk/encode_indices.c \
$(OPUS_PATH)/silk/encode_pulses.c \
$(OPUS_PATH)/silk/gain_quant.c \
$(OPUS_PATH)/silk/interpolate.c \
$(OPUS_PATH)/silk/LP_variable_cutoff.c \
$(OPUS_PATH)/silk/NLSF_decode.c \
$(OPUS_PATH)/silk/NSQ.c \
$(OPUS_PATH)/silk/NSQ_del_dec.c \
$(OPUS_PATH)/silk/PLC.c \
$(OPUS_PATH)/silk/shell_coder.c \
$(OPUS_PATH)/silk/tables_gain.c \
$(OPUS_PATH)/silk/tables_LTP.c \
$(OPUS_PATH)/silk/tables_NLSF_CB_NB_MB.c \
$(OPUS_PATH)/silk/tables_NLSF_CB_WB.c \
$(OPUS_PATH)/silk/tables_other.c \
$(OPUS_PATH)/silk/tables_pitch_lag.c \
$(OPUS_PATH)/silk/tables_pulses_per_block.c \
$(OPUS_PATH)/silk/VAD.c \
$(OPUS_PATH)/silk/control_audio_bandwidth.c \
$(OPUS_PATH)/silk/quant_LTP_gains.c \
$(OPUS_PATH)/silk/VQ_WMat_EC.c \
$(OPUS_PATH)/silk/HP_variable_cutoff.c \
$(OPUS_PATH)/silk/NLSF_encode.c \
$(OPUS_PATH)/silk/NLSF_VQ.c \
$(OPUS_PATH)/silk/NLSF_unpack.c \
$(OPUS_PATH)/silk/NLSF_del_dec_quant.c \
$(OPUS_PATH)/silk/process_NLSFs.c \
$(OPUS_PATH)/silk/stereo_LR_to_MS.c \
$(OPUS_PATH)/silk/stereo_MS_to_LR.c \
$(OPUS_PATH)/silk/check_control_input.c \
$(OPUS_PATH)/silk/control_SNR.c \
$(OPUS_PATH)/silk/init_encoder.c \
$(OPUS_PATH)/silk/control_codec.c \
$(OPUS_PATH)/silk/A2NLSF.c \
$(OPUS_PATH)/silk/ana_filt_bank_1.c \
$(OPUS_PATH)/silk/biquad_alt.c \
$(OPUS_PATH)/silk/bwexpander_32.c \
$(OPUS_PATH)/silk/bwexpander.c \
$(OPUS_PATH)/silk/debug.c \
$(OPUS_PATH)/silk/decode_pitch.c \
$(OPUS_PATH)/silk/inner_prod_aligned.c \
$(OPUS_PATH)/silk/lin2log.c \
$(OPUS_PATH)/silk/log2lin.c \
$(OPUS_PATH)/silk/LPC_analysis_filter.c \
$(OPUS_PATH)/silk/LPC_inv_pred_gain.c \
$(OPUS_PATH)/silk/table_LSF_cos.c \
$(OPUS_PATH)/silk/NLSF2A.c \
$(OPUS_PATH)/silk/NLSF_stabilize.c \
$(OPUS_PATH)/silk/NLSF_VQ_weights_laroia.c \
$(OPUS_PATH)/silk/pitch_est_tables.c \
$(OPUS_PATH)/silk/resampler.c \
$(OPUS_PATH)/silk/resampler_down2_3.c \
$(OPUS_PATH)/silk/resampler_down2.c \
$(OPUS_PATH)/silk/resampler_private_AR2.c \
$(OPUS_PATH)/silk/resampler_private_down_FIR.c \
$(OPUS_PATH)/silk/resampler_private_IIR_FIR.c \
$(OPUS_PATH)/silk/resampler_private_up2_HQ.c \
$(OPUS_PATH)/silk/resampler_rom.c \
$(OPUS_PATH)/silk/sigm_Q15.c \
$(OPUS_PATH)/silk/sort.c \
$(OPUS_PATH)/silk/sum_sqr_shift.c \
$(OPUS_PATH)/silk/stereo_encode_pred.c \
$(OPUS_PATH)/silk/stereo_find_predictor.c \
$(OPUS_PATH)/silk/stereo_quant_pred.c \
$(OPUS_PATH)/silk/decode_core.c \
$(OPUS_PATH)/silk/decode_frame.c \
$(OPUS_PATH)/silk/decode_indices.c \
$(OPUS_PATH)/silk/init_decoder.c \
$(OPUS_PATH)/silk/decoder_set_fs.c \
$(OPUS_PATH)/silk/decode_parameters.c \
$(OPUS_PATH)/silk/decode_pulses.c \
$(OPUS_PATH)/silk/dec_API.c \
$(OPUS_PATH)/silk/stereo_decode_pred.c \
$(SILK_SOURCES_FIXED)



OPUS_SOURCES = \
$(OPUS_PATH)/src/opus.c \
$(OPUS_PATH)/src/opus_encoder.c \
$(OPUS_PATH)/src/opus_decoder.c \
$(OPUS_PATH)/src/repacketizer.c \
$(OPUS_PATH)/src/analysis.c \
$(OPUS_PATH)/src/mlp.c \
$(OPUS_PATH)/src/mlp_data.c \
$(OPUS_PATH)/src/opus_tool.c \
$(OPUS_PATH)/src/com_umeng_fb_opus_OpusTool.c




libopus_la_SOURCES = $(CELT_SOURCES) $(SILK_SOURCES) $(OPUS_SOURCES)

LOCAL_SRC_FILES :=  \
	$(libopus_la_SOURCES)

include $(BUILD_SHARED_LIBRARY)



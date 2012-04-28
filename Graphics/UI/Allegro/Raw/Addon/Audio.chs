{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE EmptyDataDecls #-}
module Graphics.UI.Allegro.Raw.Addon.Audio where

import Data.Word

import C2HS
import Internal
{#import Graphics.UI.Allegro.Raw.File #}
{#import Graphics.UI.Allegro.Raw.Events #}

#include "allegro-raw.h"
{#context prefix = "ALLEGRO_" #}

{#enum AUDIO_DEPTH as AudioDepth {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
{#enum CHANNEL_CONF as ChannelConf {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
{#enum PLAYMODE as Playmode {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
{#enum MIXER_QUALITY as MixerQuality {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
-- {#enum AUDIO_PROPERTY as AudioProperty {underscoreToCase} deriving (Show, Eq, Ord, Read) #}
-- {#enum AUDIO_DRIVER_ENUM as AudioDriverEnum {underscoreToCase} deriving (Show, Eq, Ord, Read) #}

data Sample_
{#pointer *SAMPLE as Sample -> Sample_ #}

data SampleId_
{#pointer *SAMPLE_ID as SampleId foreign -> SampleId_ #}

instance Storable SampleId_ where
    sizeOf _ = {#sizeof SAMPLE_ID #}
    alignment _ = {#alignof SAMPLE_ID #}
    peek _ = error "SampleId_.peek: unsupported operation."
    poke _ _ = error "SampleId_.poke: unsupported operation."

data SampleInstance_
{#pointer *SAMPLE_INSTANCE as SampleInstance -> SampleInstance_ #}

data AudioStream_
{#pointer *AUDIO_STREAM as AudioStream -> AudioStream_ #}

data Mixer_
{#pointer *MIXER as Mixer -> Mixer_ #}

data Voice_
{#pointer *VOICE as Voice -> Voice_ #}


{#fun unsafe al_create_sample as createSample { id `Ptr ()', `Int', `Int', cFromEnum `AudioDepth', cFromEnum `ChannelConf', `Bool' } -> `Sample' id #}
{#fun unsafe al_destroy_sample as destroySample { id `Sample' } -> `()' #}

{#fun unsafe al_create_sample_instance as createSampleInstance { id `Sample' } -> `SampleInstance' id #}
{#fun unsafe al_destroy_sample_instance as destroySampleInstance { id `SampleInstance' } -> `()' #}

{#fun unsafe al_get_sample_frequency as getSampleFrequency { id `Sample' } -> `Int' #}
{#fun unsafe al_get_sample_length as getSampleLength { id `Sample' } -> `Int' #}
{#fun unsafe al_get_sample_depth as getSampleDepth { id `Sample' } -> `AudioDepth' cToEnum #}
{#fun unsafe al_get_sample_channels as getSampleChannels { id `Sample' } -> `ChannelConf' cToEnum #}
{#fun unsafe al_get_sample_data as getSampleData { id `Sample' } -> `Ptr ()' id #}

{#fun unsafe al_get_sample_instance_frequency as getSampleInstanceFrequency { id `SampleInstance' } -> `Int' #}
{#fun unsafe al_get_sample_instance_length as getSampleInstanceLength { id `SampleInstance' } -> `Int' #}
{#fun unsafe al_get_sample_instance_position as getSampleInstancePosition { id `SampleInstance' } -> `Int' #}

{#fun unsafe al_get_sample_instance_speed as getSampleInstanceSpeed { id `SampleInstance' } -> `Float' #}
{#fun unsafe al_get_sample_instance_gain as getSampleInstanceGain { id `SampleInstance' } -> `Float' #}
{#fun unsafe al_get_sample_instance_pan as getSampleInstancePan { id `SampleInstance' } -> `Float' #}
{#fun unsafe al_get_sample_instance_time as getSampleInstancetime { id `SampleInstance' } -> `Float' #}

{#fun unsafe al_get_sample_instance_depth as getSampleInstanceDepth { id `SampleInstance' } -> `AudioDepth' cToEnum #}
{#fun unsafe al_get_sample_instance_channels as getSampleInstanceChannels { id `SampleInstance' } -> `ChannelConf' cToEnum #}
{#fun unsafe al_get_sample_instance_playmode as getSampleInstancePlaymode { id `SampleInstance' } -> `Playmode' cToEnum #}

{#fun unsafe al_get_sample_instance_playing as getSampleInstancePlaying { id `SampleInstance' } -> `Bool' #}
{#fun unsafe al_get_sample_instance_attached as getSampleInstanceAttached { id `SampleInstance' } -> `Bool' #}
{#fun unsafe al_set_sample_instance_position as setSampleInstancePosition { id `SampleInstance', `Int' } -> `Bool' #}
{#fun unsafe al_set_sample_instance_length as setSampleInstanceLength { id `SampleInstance', `Int' } -> `Bool' #}

{#fun unsafe al_set_sample_instance_speed as setSampleInstanceSpeed { id `SampleInstance', `Float' } -> `Bool' #}
{#fun unsafe al_set_sample_instance_gain as setSampleInstanceGain { id `SampleInstance', `Float' } -> `Bool' #}
{#fun unsafe al_set_sample_instance_pan as setSampleInstancePan { id `SampleInstance', `Float' } -> `Bool' #}

{#fun unsafe al_set_sample_instance_playmode as setSampleInstancePlaymode { id `SampleInstance', cFromEnum `Playmode' } -> `Bool' #}

{#fun unsafe al_set_sample_instance_playing as setSampleInstancePlaying { id `SampleInstance', `Bool' } -> `Bool' #}
{#fun unsafe al_detach_sample_instance as detachSampleInstance { id `SampleInstance' } -> `Bool' #}

{#fun unsafe al_set_sample as setSample { id `SampleInstance', id `Sample' } -> `Bool' #}
{#fun unsafe al_get_sample as getSample { id `SampleInstance' } -> `Sample' id #}
{#fun unsafe al_play_sample_instance as playSampleInstance { id `SampleInstance' } -> `Bool' #}
{#fun unsafe al_stop_sample_instance as stopSampleInstance { id `SampleInstance' } -> `Bool' #}

{#fun unsafe al_create_audio_stream as createAudioStream { `Int', `Int', `Int', cFromEnum `AudioDepth', cFromEnum `ChannelConf' } -> `AudioStream' id #}
{#fun unsafe al_destroy_audio_stream as destroyAudioStream { id `AudioStream' } -> `()' #}
{#fun unsafe al_drain_audio_stream as drainAudioStream { id `AudioStream' } -> `()' #}


{#fun unsafe al_get_audio_stream_frequency as getAudioStreamFrequency { id `AudioStream' } -> `Int' #}
{#fun unsafe al_get_audio_stream_length as getAudioStreamLength { id `AudioStream' } -> `Int' #}
{#fun unsafe al_get_audio_stream_fragments as getAudioStreamFragments { id `AudioStream' } -> `Int' #}
{#fun unsafe al_get_available_audio_stream_fragments as getAvailableAudioStreamFragments { id `AudioStream' } -> `Int' #}

{#fun unsafe al_get_audio_stream_speed as getAudioStreamSpeed { id `AudioStream' } -> `Float' #}
{#fun unsafe al_get_audio_stream_gain as getAudioStreamGain { id `AudioStream' } -> `Float' #}
{#fun unsafe al_get_audio_stream_pan as getAudioStreamPan { id `AudioStream' } -> `Float' #}

{#fun unsafe al_get_audio_stream_channels as getAudioStreamChannels { id `AudioStream' } -> `ChannelConf' cToEnum #}
{#fun unsafe al_get_audio_stream_depth as getAudioStreamDepth { id `AudioStream' } -> `AudioDepth' cToEnum #}
{#fun unsafe al_get_audio_stream_playmode as getAudioStreamPlaymode { id `AudioStream' } -> `Playmode' cToEnum #}

{#fun unsafe al_get_audio_stream_playing as getAudioStreamPlaying { id `AudioStream' } -> `Bool' #}
{#fun unsafe al_get_audio_stream_attached as getAudioStreamAttached { id `AudioStream' } -> `Bool' #}

{#fun unsafe al_get_audio_stream_fragment as getAudioStreamFragment { id `AudioStream' } -> `Ptr ()' id #}

{#fun unsafe al_set_audio_stream_speed as setAudioStreamSpeed { id `AudioStream', `Float' } -> `Bool' #}
{#fun unsafe al_set_audio_stream_gain as setAudioStreamGain { id `AudioStream', `Float' } -> `Bool' #}
{#fun unsafe al_set_audio_stream_pan as setAudioStreamPan { id `AudioStream', `Float' } -> `Bool' #}
{#fun unsafe al_set_audio_stream_playing as setAudioStreamPlaying { id `AudioStream', `Bool' } -> `Bool' #}
{#fun unsafe al_detach_audio_stream as detachAudioStream { id `AudioStream' } -> `Bool' #}
{#fun unsafe al_set_audio_stream_fragment as setAudioStreamFragment { id `AudioStream', id `Ptr ()' } -> `Bool' #}

{#fun unsafe al_rewind_audio_stream as rewindAudioStream { id `AudioStream' } -> `Bool' #}
{#fun unsafe al_seek_audio_stream_secs as seekAudioStreamSecs { id `AudioStream', `Double' } -> `Bool' #}
{#fun unsafe al_get_audio_stream_position_secs as getAudioStreamPositionSecs { id `AudioStream' } -> `Double' #}
{#fun unsafe al_get_audio_stream_length_secs as getAudioStreamLengthSecs { id `AudioStream' } -> `Double' #}
{#fun unsafe al_set_audio_stream_loop_secs as setAudioStreamLoopSecs { id `AudioStream', `Double', `Double' } -> `Bool' #}

{#fun unsafe al_get_audio_stream_event_source as getAudioStreamEventSource { id `AudioStream' } -> `EventSource' id #}

{#fun unsafe al_create_mixer as createMixer { `Int', cFromEnum `AudioDepth', cFromEnum `ChannelConf' } -> `Mixer' id #}
{#fun unsafe al_destroy_mixer as destroyMixer { id `Mixer' } -> `()' #}
{#fun unsafe al_attach_sample_instance_to_mixer as attachSampleInstanceToMixer { id `SampleInstance', id `Mixer' } -> `Bool' #}
{#fun unsafe al_attach_audio_stream_to_mixer as attachAudioStreamToMixer { id `AudioStream', id `Mixer' } -> `Bool' #}
{#fun unsafe al_attach_mixer_to_mixer as attachMixerToMixer { id `Mixer', id `Mixer' } -> `Bool' #}
{#fun unsafe al_set_mixer_postprocess_callback as setMixerPostprocessCallback { id `Mixer', id `FunPtr (Ptr () -> CUInt -> Ptr () -> IO ())', id `Ptr ()' } -> `Bool' #}

{#fun unsafe al_get_mixer_frequency as getMixerFrequency { id `Mixer' } -> `Int' #}
{#fun unsafe al_get_mixer_channels as getMixerChannels { id `Mixer' } -> `ChannelConf' cToEnum #}
{#fun unsafe al_get_mixer_depth as getMixerDepth { id `Mixer' } -> `AudioDepth' cToEnum #}
{#fun unsafe al_get_mixer_quality as getMixerQuality { id `Mixer' } -> `MixerQuality' cToEnum #}
{#fun unsafe al_get_mixer_playing as getMixerPlaying { id `Mixer' } -> `Bool' #}
{#fun unsafe al_get_mixer_attached as getMixerAttached { id `Mixer' } -> `Bool' #}
{#fun unsafe al_set_mixer_frequency as setMixerFrequency { id `Mixer', `Int' } -> `Bool' #}
{#fun unsafe al_set_mixer_quality as setMixerQuality { id `Mixer', cFromEnum `MixerQuality' } -> `Bool' #}
{#fun unsafe al_set_mixer_playing as setMixerPlaying { id `Mixer', `Bool'  } -> `Bool' #}
{#fun unsafe al_detach_mixer as detachMixer { id `Mixer' } -> `Bool' #}

{#fun unsafe al_create_voice as createVoice { `Int', cFromEnum `AudioDepth', cFromEnum `ChannelConf' } -> `Voice' id #}
{#fun unsafe al_destroy_voice as destroyVoice { id `Voice' } -> `()' #}
{#fun unsafe al_attach_sample_instance_to_voice as attachSampleInstanceToVoice { id `SampleInstance', id `Voice' } -> `Bool' #}
{#fun unsafe al_attach_audio_stream_to_voice as attachAudioStreamToVoice { id `AudioStream', id `Voice' } -> `Bool' #}
{#fun unsafe al_attach_mixer_to_voice as attachMixerToVoice { id `Mixer', id `Voice' } -> `Bool' #}
{#fun unsafe al_detach_voice as detachVoice { id `Voice' } -> `()' #}

{#fun unsafe al_get_voice_frequency as getVoiceFrequency { id `Voice' } -> `Int' #}
{#fun unsafe al_get_voice_position as getVoicePosition { id `Voice' } -> `Int' #}
{#fun unsafe al_get_voice_channels as getVoiceChannels { id `Voice' } -> `ChannelConf' cToEnum #}
{#fun unsafe al_get_voice_depth as getVoiceDepth { id `Voice' } -> `AudioDepth' cToEnum #}
{#fun unsafe al_get_voice_playing as getVoicePlaying { id `Voice' } -> `Bool' #}
{#fun unsafe al_set_voice_position as setVoicePosition { id `Voice', `Int' } -> `Bool' #}
{#fun unsafe al_set_voice_playing as setVoicePlaying { id `Voice', `Bool' } -> `Bool' #}

{#fun unsafe al_install_audio as installAudio { } -> `Bool' #}
{#fun unsafe al_uninstall_audio as uninstallAudio { } -> `()' #}
{#fun unsafe al_is_audio_installed as isAudioInstalled { } -> `Bool' #}
{#fun pure unsafe al_get_allegro_audio_version as getAllegroAudioVersion { } -> `Word32' #}

{#fun pure unsafe al_get_channel_count as getChannelCount { cFromEnum `ChannelConf' } -> `Int' #}
{#fun pure unsafe al_get_audio_depth_size as getAudioDepthSize { cFromEnum `AudioDepth' } -> `Int' #}

{#fun unsafe al_reserve_samples as reserveSamples { `Int' } -> `Bool' #}
{#fun unsafe al_get_default_mixer as getDefaultMixer { } -> `Mixer' id #}
{#fun unsafe al_set_default_mixer as setDefaultMixer { id `Mixer' } -> `Bool' #}
{#fun unsafe al_restore_default_mixer as restoreDefaultMixer { } -> `Bool' #}
{#fun unsafe al_play_sample as playSample { id `Sample', `Float', `Float', `Float', cFromEnum `Playmode', withMallocedForeign- `SampleId' id} -> `()' #}
{#fun unsafe al_stop_sample as stopSample { withForeignPtr* `SampleId' } -> `()' #}
{#fun unsafe al_stop_samples as stopSamples { } -> `()' #}

{#fun unsafe al_register_sample_loader as registerSampleLoader { `String', id `FunPtr (CString -> IO Sample)' } -> `Bool' #}
{#fun unsafe al_register_sample_saver as registerSampleSaver { `String', id `FunPtr (CString -> Sample -> IO CInt)' } -> `Bool' #}
{#fun unsafe al_register_audio_stream_loader as registerAudioStreamLoader { `String', id `FunPtr (CString -> CULong -> CUInt -> IO AudioStream)' } -> `Bool' #}

{#fun unsafe al_register_sample_loader_f as registerSampleLoaderF { `String', id `FunPtr (File -> IO Sample)' } -> `Bool' #}
{#fun unsafe al_register_sample_saver_f as registerSampleSaverF { `String', id `FunPtr (File -> Sample -> IO CInt)' } -> `Bool' #}
{#fun unsafe al_register_audio_stream_loader_f as registerAudioStreamLoaderF { `String', id `FunPtr (File -> CULong -> CUInt -> IO AudioStream)' } -> `Bool' #}

{#fun unsafe al_load_sample as loadSample { `String' } -> `Sample' id #}
{#fun unsafe al_save_sample as saveSample { `String', id `Sample' } -> `Bool' #}
{#fun unsafe al_load_audio_stream as loadAudioStream { `String', `Int', `Int' } -> `AudioStream' id #}

{#fun unsafe al_load_sample_f as loadSampleF { id `File', `String' } -> `Sample' id #}
{#fun unsafe al_save_sample_f as saveSampleF { id `File', `String', id `Sample' } -> `Bool' #}
{#fun unsafe al_load_audio_stream_f as loadAudioStreamF { id `File', `String', `Int', `Int' } -> `AudioStream' id #}

/// @desc 

bpm = 150;
music = audio_play_sound(mMusic,1,true);
audio_sound_loop_start(music, 60/150*8*4);
lastBeat = 0;
thisBeat = 0;
global.audioTick = false;
global.audioBeat = 0;
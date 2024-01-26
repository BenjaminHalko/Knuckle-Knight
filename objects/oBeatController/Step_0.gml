/// @desc 

EnableLive;

thisBeat = current_time / 1000 / 60 * bpm;//audio_sound_get_track_position(music) / 60 * bpm;
var _beat = thisBeat % 1;
global.audioTick = _beat < lastBeat;
lastBeat = _beat;
global.audioBeat = floor(thisBeat);
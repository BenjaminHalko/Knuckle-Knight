/// @description Insert description here
// You can write your code in this editor


EnableLive;

if (array_length(oPlatformGenerator.platformsToGenerate) == 0) {
	global.level++;
	GeneratePlatforms(global.level, 5);
} else
	NextPlatforms();
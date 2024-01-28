/// @desc Setup Camera

cam = view_camera[0];
follow = oPlayer;
xTo = follow.x;
yTo = follow.y;

viewWidthHalf = RESW/2;
viewHeightHalf = RESH/2;

xTo = clamp(xTo,viewWidthHalf,room_width-viewWidthHalf);
yTo = min(yTo,room_height-viewHeightHalf);
x = xTo;
y = yTo;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;
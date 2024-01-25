#macro EnableLive if (live_call()) return live_result
#macro FIREBASE_LEADERBOARD_URL "https://globalgamejam-2024-default-rtdb.firebaseio.com/"
#macro RESW 640
#macro RESH 360
#macro MAXHEALTH 5
#macro SAVEFILE "save.ini"
#macro INFO_HEIGHT 26

#macro BROWSER (global.ostype == OS.OSBROWSER)
#macro OPERA (global.ostype == OS.OSOPERA)
#macro DESKTOP (global.ostype == OS.OSDESKTOP)
#macro MOBILE (global.ostype == OS.OSMOBILE or os_type == os_android or global.mobileOperaGX)
/// @desc

scores = [];

draw = false;
scoreOffset = 0;
scoreOffsetTarget = 0;

scoresPerPage = 8;
disableSelect = false;

global.highscore = 0;

LeaderboardGet();
listener = FirebaseRealTime(FIREBASE_LEADERBOARD_URL).Path("/").Listener();
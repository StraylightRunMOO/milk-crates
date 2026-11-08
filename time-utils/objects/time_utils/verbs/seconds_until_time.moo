@verb time_utils:seconds_until_time this none this rx
@program time_utils:seconds_until_time
// $time_utils:seconds_until_time(hms) => INT
// Seconds from now until "HH:MM:SS" today. Negative if that time has already passed.
current = $time_utils:to_seconds(ctime()[12..19]);
// Copied from Ballroom Complex (#29992):seconds_until by Keelah! (#30246) Tue Jul 13 19:42:37 1993 PDT
// Written by Keelah, on July 4, 1993.
time = $time_utils:to_seconds(args[1]);
return toint(time) - toint(current);
.

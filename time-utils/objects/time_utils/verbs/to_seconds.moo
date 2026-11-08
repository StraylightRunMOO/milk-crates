@verb time_utils:to_seconds this none this rxd
@program time_utils:to_seconds
// $time_utils:to_seconds(hms_string) => INT
// "HH:MM:SS" or similar to a second count from midnight.
return 60 * 60 * toint(args[1][1..2]) + 60 * toint(args[1][4..5]) + toint(args[1][7..8]);
.

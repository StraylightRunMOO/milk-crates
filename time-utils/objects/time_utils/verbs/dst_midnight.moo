@verb time_utils:dst_midnight this none this rxd
@program time_utils:dst_midnight
// $time_utils:dst_midnight(pst_midnight) => INT
// Shift a midnight-PST unix time to the nearest local midnight when DST is in effect.
time = args[1];
return time - 3600 * ((toint(ctime(time)[12..13]) + 12) % 24 - 12);
.

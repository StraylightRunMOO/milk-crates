@verb time_utils:seconds_until_date this none this rx
@program time_utils:seconds_until_date
// $time_utils:seconds_until_date(month, day, time, which) => INT
// Seconds from now until month/day at time "HH:MM:SS".
// which -1 = most recent such month, +1 = next, 0 = closest.
{month, day, time, which} = args;
// Copied from Ballroom Complex (#29992):from_date by Keelah! (#30246) Tue Jul 13 19:42:32 1993 PDT
// Written by Keelah, on July 5, 1993.
converted = $time_utils:from_month(month, which, day);
current = this:seconds_until_time("12:00:00");
get_seconds = this:seconds_until_time(time);
converted = converted + get_seconds + 39600 - current - time();
return converted;
.

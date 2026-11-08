@verb time_utils:rfc822_ctime this none this rxd
@program time_utils:rfc822_ctime
// $time_utils:rfc822_ctime([time]) => STR
// Like ctime(), but RFC-822: "Day, DD Mon YYYY HH:MM:SS TZ".
c = $string_utils:explode(ctime(@args));
// Last modified Fri Oct 17 23:17:25 1997 EDT by neuro (#3642) on opal moo.
tz = length(c) >= 6 ? " " + c[6] | "";
return tostr(c[1], ", ", c[3], " ", c[2], " ", c[5], " ", c[4], tz);
.

@verb string_utils:from_seconds this none this rxd
@program string_utils:from_seconds
// $string_utils:from_seconds(seconds) => STR
// Rough duration: days, else hours, else minutes, else seconds. 1 => "a second".
minute = 60;
hour = 60 * minute;
day = 24 * hour;
secs = args[1];
if (secs > day)
  count = secs / day;
  unit = "day";
  article = "a";
elseif (secs > hour)
  count = secs / hour;
  unit = "hour";
  article = "an";
else
  if (secs > minute)
    count = secs / minute;
    unit = "minute";
    article = "a";
  else
    count = secs;
    unit = "second";
    article = "a";
  endif
endif
if (count == 1)
  time = tostr(article, " ", unit);
else
  time = tostr(count, " ", unit, "s");
endif
return time;
.

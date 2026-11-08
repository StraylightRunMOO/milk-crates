@verb time_utils:dhms dayshoursminutesseconds this none this rxd
@program time_utils:dhms dayshoursminutesseconds
// $time_utils:dhms/dayshoursminutesseconds(seconds) => STR
// Duration as [[D:]HH:]MM:SS, or just the second count if under a minute. Negative => leading "-".
s = args[1];
if (s < 0)
  return "-" + this:(verb)(-s);
endif
m = s / 60;
s = s % 60;
if (m)
  ss = tostr(s < 10 ? ":0" | ":", s);
  h = m / 60;
  m = m % 60;
  if (h)
    ss = tostr(m < 10 ? ":0" | ":", m, ss);
    d = h / 24;
    h = h % 24;
    return tostr(@d ? {d, h < 10 ? ":0" | ":"} | {}, h, ss);
  else
    return tostr(m, ss);
  endif
else
  return tostr(s);
endif
.

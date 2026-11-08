@verb time_utils:ampm none none none rxd
@program time_utils:ampm
// $time_utils:ampm(time [, precision]) => STR|ERR
// 12-hour clock from a time() INT or ctime() STR. precision 1=hours, 2=minutes (default), 3=seconds.
// Midnight => "12 a.m.", noon => "12 p.m.". E_TYPE if time is not INT or STR.
{time, ?precision = 2} = args;
if (typeof(time) == INT)
  time = ctime(time);
elseif (typeof(time) != STR)
  return E_TYPE;
endif
time = $string_utils:explode(time)[4];
hour = toint(time[1..2]);
if (hour == 0)
  time = "12" + time[3..precision * 3 - 1] + " a.m.";
elseif (hour == 12)
  time = time[1..precision * 3 - 1] + " p.m.";
else
  if (hour > 12)
    time = tostr(hour - 12) + time[3..precision * 3 - 1] + " p.m.";
  else
    time = tostr(hour) + time[3..precision * 3 - 1] + " a.m.";
  endif
endif
return time;
.

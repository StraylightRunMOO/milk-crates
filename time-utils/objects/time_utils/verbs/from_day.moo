@verb time_utils:from_day this none this rxd
@program time_utils:from_day
// $time_utils:from_day(day [, which [, reftime]]) => INT|ERR
// Midnight PST of weekday day (name or 1..7, Sunday=1). E_DIV if day is unknown.
// which -1 = most recent, +1 = next, 0 = closest (default). |which| > 1 skips that many weeks.
// reftime defaults to time().
{day, ?dir = 0, ?reftime = time()} = args;
if (!(toint(day) || (day = $string_utils:find_prefix(day, this.days))))
  return E_DIV;
endif
delta = {288000, 374400, 460800, 547200, 28800, 115200, 201600}[toint(day)];
time = reftime - delta;
if (dir)
  time = time / 604800 + (dir > 0 ? dir | dir + 1);
else
  time = (time + 302400) / 604800;
endif
return time * 604800 + delta;
.

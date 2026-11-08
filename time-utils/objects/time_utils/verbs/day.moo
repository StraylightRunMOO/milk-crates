@verb time_utils:day none none none rxd
@program time_utils:day
// $time_utils:day(time) => STR|ERR
// Full weekday name from a time() INT or ctime() STR. E_TYPE otherwise.
if (typeof(args[1]) == INT)
  time = ctime(args[1]);
elseif (typeof(args[1]) == STR)
  time = args[1];
else
  return E_TYPE;
endif
dayabbr = $string_utils:explode(time)[1];
return this.days[dayabbr in this.dayabbrs];
.

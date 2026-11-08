@verb time_utils:month none none none rxd
@program time_utils:month
// $time_utils:month(time) => STR|ERR
// Full month name from a time() INT or ctime() STR. E_TYPE otherwise.
if (typeof(args[1]) == INT)
  time = ctime(args[1]);
elseif (typeof(args[1]) == STR)
  time = args[1];
else
  return E_TYPE;
endif
monthabbr = $string_utils:explode(time)[2];
return this.months[monthabbr in this.monthabbrs];
.

@verb time_utils:mmddyyyy ddmmyyyy this none this rxd
@program time_utils:mmddyyyy ddmmyyyy
// $time_utils:mmddyyyy/ddmmyyyy(time [, sep]) => STR|ERR
// MM/DD/YYYY or DD/MM/YYYY (verb name) from a time() INT or ctime() STR. sep defaults to "/".
{time, ?divstr = "/"} = args;
if (typeof(time) == INT)
  time = ctime(time);
elseif (typeof(time) != STR)
  return E_TYPE;
endif
date = $string_utils:explode(time);
day = toint(date[3]);
month = date[2] in $time_utils.monthabbrs;
year = date[5];
daystr = day < 10 ? "0" + tostr(day) | tostr(day);
monthstr = month < 10 ? "0" + tostr(month) | tostr(month);
yearstr = tostr(year);
if (verb == "mmddyyyy")
  return tostr(monthstr, divstr, daystr, divstr, yearstr);
else
  return tostr(daystr, divstr, monthstr, divstr, yearstr);
endif
.

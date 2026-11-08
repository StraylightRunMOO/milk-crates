@verb string_utils:max_length truncate this none this rxd
@program string_utils:max_length truncate
// $string_utils:max_length/truncate(string [, max [, fill]]) => STR
// Cut to max with "...", or pad with spaces if fill is true. Default max 30.
{string, ?maxw = 30, ?fill = 0} = args;
string = tostr(string);
len = length(string);
if (len <= maxw)
  return fill ? string + this:space(maxw - len) | string;
endif
if (maxw <= 3)
  return string[1..maxw];
endif
return string[1..maxw - 3] + "...";
.

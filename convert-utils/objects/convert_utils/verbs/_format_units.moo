@verb convert_utils:_format_units this none this rxd
@program convert_utils:_format_units
// $convert_utils:_format_units(@{unit, power}...) => STR
// Format unit/power pairs as "m2 / s". Not for callers.
top = bottom = "";
for pair in (args)
  if (pair[2] > 0)
    top = tostr(top, " ", pair[1], pair[2] > 1 ? pair[2] | "");
  elseif (pair[2] < 0)
    bottom = tostr(bottom, " ", pair[1], pair[2] < -1 ? -pair[2] | "");
  endif
endfor
if (bottom)
  return (top + " /" + bottom)[2..$];
else
  return top[2..$];
endif
.

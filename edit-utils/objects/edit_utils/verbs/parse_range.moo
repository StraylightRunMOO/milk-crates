@verb edit_utils:parse_range this none this xd
@program edit_utils:parse_range
// $edit_utils:parse_range(spec, maxrange, insertion) => {from, to} | STR error
{arg, maxrange, insertion} = args;
if (typeof(arg) == LIST)
  arg = $string_utils:from_list(arg, " ");
endif
range = {0, 0};
explode_by = {"..", " ", "-", "+"};
exploded_by = 0;
for x in (explode_by)
  expl = $string_utils:explode(arg, x);
  if (length(expl) > 1)
    exploded_by = x;
    break;
  endif
endfor
if (length(expl) > 2)
  return tostr("Junk at end of command: ", $string_utils:from_list(expl[3..$], " "), ".");
elseif (length(expl) == 1)
  if ((single = expl[1]) == "$")
    range = {maxrange, maxrange};
  elseif (single == "^")
    range = {insertion, insertion};
  else
    if (toint(single) > 0 && toint(single) <= maxrange)
      range = {toint(single), toint(single)};
    endif
  endif
else
  for x in (expl)
    if (x == "$")
      line = maxrange;
    elseif (x == "^")
      line = insertion;
    else
      if (!$string_utils:is_numeric(x))
        return tostr("Garbled Range: ", arg, " - should be integers");
      elseif (toint(x) <= 0 || toint(x) > maxrange)
        return tostr("Lines range from 1 to ", maxrange, ".");
      else
        line = toint(x);
      endif
    endif
    range[x in expl] = line;
  endfor
endif
if (exploded_by == "+")
  increment_line = range[1] + range[2];
  range = {increment_line, increment_line};
endif
if (range[1] > range[2])
  return tostr("Garbled Range: ", range[1], " greater than ", range[2], ". Put smallest index first.");
elseif (0 in range)
  return tostr("Garbled Range: ", arg);
endif
return range;
.

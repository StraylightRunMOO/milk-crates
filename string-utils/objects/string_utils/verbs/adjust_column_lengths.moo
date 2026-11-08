@verb string_utils:adjust_column_lengths this none this rxd
@program string_utils:adjust_column_lengths
// $string_utils:adjust_column_lengths(lengths [, increment [, who]]) => LIST
// Shrink column widths until they fit who:linelen(). increment default 5.
{ret, ?increment = 5, ?player = player} = args;
variable_picker = 0;
len = length(ret);
iterations = 0;
linelen = player:linelen();
while (1)
  $command_utils:suspend_if_needed(0);
  iterations = iterations + 1;
  if (iterations >= 500000)
    break;
  endif
  sum = 0;
  for x in (ret)
    sum = sum + x;
  endfor
  if (sum <= linelen)
    return ret;
  else
    variable_picker = variable_picker + 1;
    if (variable_picker > len)
      variable_picker = len;
    endif
    if (ret[variable_picker] - increment <= 4)
      continue;
    endif
  endif
  ret[variable_picker] = ret[variable_picker] - increment;
endwhile
return ret;
.

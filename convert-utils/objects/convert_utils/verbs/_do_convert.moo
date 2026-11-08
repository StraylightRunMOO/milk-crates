@verb convert_utils:_do_convert this none this rxd
@program convert_utils:_do_convert
// $convert_utils:_do_convert(units_str) => {FLOAT, LIST} | 0
// Workhorse for :convert. Reduce units to basic_units and a scale. Not for callers.
instr = args[1];
units = this.basic_units_template;
value = 1.0;
top = 1;
instr = $string_utils:substitute(instr, {{"/", " / "}});
while (instr)
  {first, instr} = $string_utils:first_word(instr);
  if (first == "/")
    top = 1 - top;
    continue;
  elseif (match(first, "|"))
    value = this:_do_value(first, value, top);
    continue;
  else
    if ($string_utils:is_integer(first) || $string_utils:is_float(first))
      value = top ? value * tofloat(first) | value / tofloat(first);
      continue;
    elseif (match(first, "[0-9]$"))
      subs = match(first, "%([a-zA-Z]+%)%([0-9]+%)");
      first = substitute("%1", subs);
      power = toint(substitute("%2", subs));
      while (power > 0)
        instr = first + " " + instr;
        power = power - 1;
      endwhile
      continue;
    else
      {first, value, top} = this:_try_metric_prefix(first, value, top);
      if (index = first in this.basic_units)
        units[index][2] = top ? units[index][2] + 1 | units[index][2] - 1;
        continue;
      elseif (prop = `this.(first) ! E_PROPNF => 0')
        result = this:_do_convert(prop);
        value = top ? value * result[1] | value / result[1];
        for i in [1..length(units)]
          units[i][2] = top ? units[i][2] + result[2][i][2] | units[i][2] - result[2][i][2];
        endfor
        continue;
      else
        if (first[$] == "s")
          temp = first[1..$ - 1];
          if (index = temp in this.basic_units)
            units[index][2] = top ? units[index][2] + 1 | units[index][2] - 1;
            continue;
          elseif (prop = `this.(temp) ! E_PROPNF => 0')
            result = this:_do_convert(prop);
            value = top ? value * result[1] | value / result[1];
            for i in [1..length(units)]
              units[i][2] = top ? units[i][2] + result[2][i][2] | units[i][2] - result[2][i][2];
            endfor
            continue;
          endif
        endif
      endif
      return 0;
    endif
  endif
endwhile
return {value, units};
.

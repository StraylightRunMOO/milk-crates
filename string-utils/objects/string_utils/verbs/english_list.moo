@verb string_utils:english_list this none this rxd
@program string_utils:english_list
// $string_utils:english_list(list [, nothingstr [, andstr [, commastr [, finalcommastr]]]]) => STR
// {1, 2, 3} => "1, 2, and 3"; {1, 2} => "1 and 2". Empty => nothingstr ("nothing").
// andstr defaults to " and "; commastr to ", "; finalcommastr to "," before andstr.
{things, ?nothingstr = "nothing", ?andstr = " and ", ?commastr = ", ", ?finalcommastr = ","} = args;
nthings = length(things);
if (nthings == 0)
  return nothingstr;
elseif (nthings == 1)
  return tostr(things[1]);
else
  if (nthings == 2)
    return tostr(things[1], andstr, things[2]);
  else
    ret = "";
    for k in [1..nthings - 1]
      if (k == nthings - 1)
        commastr = finalcommastr;
      endif
      ret = tostr(ret, things[k], commastr);
    endfor
    return tostr(ret, andstr, things[nthings]);
  endif
endif
.

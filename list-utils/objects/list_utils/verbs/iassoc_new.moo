@verb list_utils:iassoc_new this none this rxd
@program list_utils:iassoc_new
// $list_utils:iassoc_new(target, list[, index]) => INT|ERR
// Index of the first matching sublist, or 0. Returns E_RANGE if a row is too short.
{target, thelist, ?indx = 1} = args;
// Copied from Moo_tilities (#332):iassoc_new by Mooshie (#106469) Wed Mar 18 19:27:52 1998 PST
try
  for element in (thelist)
    if (element[indx] == target)
      if (typeof(element) == LIST)
        return element in thelist;
      endif
    endif
  endfor
except e (ANY)
  return e[1];
endtry
return 0;
.

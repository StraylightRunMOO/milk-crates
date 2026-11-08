@verb list_utils:longest shortest this none this rxd
@program list_utils:longest shortest
// $list_utils:longest/shortest(list) => STR|LIST|ERR
// Longest or shortest string/list element. E_TYPE if mixed non-string/list; E_RANGE if empty.
if (typeof(all = args[1]) != LIST)
  return E_TYPE;
elseif (all == {})
  return E_RANGE;
else
  result = all[1];
  for things in (all)
    if (typeof(things) != LIST && typeof(things) != STR)
      return E_TYPE;
    else
      result = verb == "longest" && length(result) < length(things) || (verb == "shortest" && length(result) > length(things)) ? things | result;
    endif
  endfor
endif
// Copied from APHiD (#33119):longest Sun May  9 21:00:18 1993 PDT
return result;
.

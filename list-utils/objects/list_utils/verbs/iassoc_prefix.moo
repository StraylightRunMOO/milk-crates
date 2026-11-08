@verb list_utils:iassoc_prefix this none this rxd
@program list_utils:iassoc_prefix
// $list_utils:iassoc_prefix(target, list[, index]) => INT
// Index of the first sublist whose index-th element has target as a prefix, or 0.
{target, lst, ?indx = 1} = args;
for i in [1..length(lst)]
  if (typeof(lsti = lst[i]) == LIST && (length(lsti) >= indx && index(lsti[indx], target) == 1))
    return i;
  endif
endfor
return 0;
.

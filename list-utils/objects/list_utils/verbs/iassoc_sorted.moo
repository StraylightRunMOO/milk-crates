@verb list_utils:iassoc_sorted this none this rxd
@program list_utils:iassoc_sorted
// $list_utils:iassoc_sorted(target, sortedlist[, i]) => INT
// Index of the last tuple whose i-th element is <= target. 0..length. i defaults to 1.
{target, lst, ?indx = 1} = args;
if ((r = length(lst)) < 25)
  for l in [1..r]
    if (target < lst[l][indx])
      return l - 1;
    endif
  endfor
  return r;
else
  l = 0;
  r = r + 1;
  while (r - 1 > l)
    if (target < lst[i = (r + l) / 2][indx])
      r = i;
    else
      l = i;
    endif
  endwhile
  return l;
endif
.

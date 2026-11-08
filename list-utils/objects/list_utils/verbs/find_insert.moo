@verb list_utils:find_insert this none this rxd
@program list_utils:find_insert
// $list_utils:find_insert(sortedlist, key) => INT
// Index of the first element in an increasing list that is > key (1..length+1).
{lst, key} = args;
if ((r = length(lst)) < 25)
  for l in [1..r]
    if (lst[l] > key)
      return l;
    endif
  endfor
  return r + 1;
else
  l = 1;
  while (r >= l)
    if (key < lst[i = (r + l) / 2])
      r = i - 1;
    else
      l = i + 1;
    endif
  endwhile
  return l;
endif
.

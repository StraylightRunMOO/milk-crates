@verb set_utils:intersection this none this rxd
@program set_utils:intersection
// $set_utils:intersection(@sets) => LIST
// Elements in every argument. {} if no args. Walks the shorter list each pair.
if (!args)
  return {};
endif
{result, @rest} = args;
for set in (rest)
  if (length(result) < length(set))
    set1 = result;
    set2 = set;
  else
    set1 = set;
    set2 = result;
  endif
  for x in (set1)
    if (!(x in set2))
      set1 = setremove(set1, x);
    endif
  endfor
  result = set1;
endfor
return result;
.

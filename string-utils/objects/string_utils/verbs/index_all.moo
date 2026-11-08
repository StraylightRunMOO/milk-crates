@verb string_utils:index_all this none this rxd
@program string_utils:index_all
// $string_utils:index_all(string, target) => LIST|E_TYPE
// 1-based positions of non-overlapping target in string.
{line, pattern} = args;
if (typeof(line) != STR || typeof(pattern) != STR)
  return E_TYPE;
else
  where = {};
  place = -1;
  next = 0;
  while ((place = index(line[next + 1..$], pattern)) != 0)
    where = {@where, place + next};
    next = place + next + length(pattern) - 1;
  endwhile
  return where;
endif
.

@verb match_utils:match_nth this none this rxd
@program match_utils:match_nth
// $match_utils:match_nth(string, objlist, n) => OBJ
// Nth object in objlist whose .aliases prefix-match string (1-based n).
// No nth match => $failed_match (#-3). Missing .aliases is skipped.
{what, where, n} = args;
for v in (where)
  z = 0;
  for q in (`v.aliases ! ANY => {}')
    z = z || index(q, what) == 1;
  endfor
  if (z && !(n = n - 1))
    return v;
  endif
endfor
return `$failed_match ! ANY => #-3';
.

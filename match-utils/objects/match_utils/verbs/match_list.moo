@verb match_utils:match_list this none this rxd
@program match_utils:match_list
// $match_utils:match_list(string, object-list) => LIST
// Prefix-match string against each object's .aliases. Unique objects, first-seen order.
// Empty string => {}. Missing .aliases is skipped (not E_PROPNF).
{what, where} = args;
if (!what)
  return {};
endif
r = {};
for v in (where)
  if (!(v in r))
    z = 0;
    for q in (`v.aliases ! ANY => {}')
      z = z || (q && index(q, what) == 1);
    endfor
    if (z)
      r = {@r, v};
    endif
  endif
endfor
return r;
.

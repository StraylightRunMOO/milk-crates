@verb list_utils:assoc_prefix this none this rxd
@program list_utils:assoc_prefix
// $list_utils:assoc_prefix(target, list[, index]) => LIST
// First sublist whose index-th element has target as a prefix. {} if none.
{target, thelist, ?indx = 1} = args;
for t in (thelist)
  if (typeof(t) == LIST && (length(t) >= indx && index(t[indx], target) == 1))
    return t;
  endif
endfor
return {};
.

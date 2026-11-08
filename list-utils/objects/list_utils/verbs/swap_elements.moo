@verb list_utils:swap_elements this none this rxd
@program list_utils:swap_elements
// $list_utils:swap_elements(list, i, j) => LIST|ERR
// Exchange 1-based elements i and j. E_RANGE/E_TYPE on bad args.
{l, i, j} = args;
if (typeof(l) == LIST && typeof(i) == INT && typeof(j) == INT)
  ll = length(l);
  if (i > 0 && i <= ll && (j > 0 && j <= ll))
    t = l[i];
    l[i] = l[j];
    l[j] = t;
    return l;
  else
    return E_RANGE;
  endif
else
  return E_TYPE;
endif
.

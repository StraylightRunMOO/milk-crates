@verb list_utils:amerge this none this rxd
@program list_utils:amerge
// $list_utils:amerge(alist[, tindex[, dindex]]) => LIST
// Merge tuples that share the same tindex-th element. tindex/dindex default to 1.
{alist, ?tidx = 1, ?didx = 1} = args;
// Copied from Uther's_Ghost (#93141):amerge Tue May 27 20:28:18 1997 PDT
if (alist)
  alist = this:sort_alist(alist, tidx);
  i = 1;
  res = {{cur = alist[1][tidx]}};
  for tuple in (alist)
    if (tuple[tidx] == cur)
      res[i] = {@res[i], @listdelete(tuple, tidx)};
    elseif (didx != 1)
      res[i] = this:swap_elements(res[i], 1, min(didx, length(res[i])));
    endif
  endfor
  return res;
endif
return alist;
.

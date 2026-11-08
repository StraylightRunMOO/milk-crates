@verb list_utils:difference this none this rxd
@program list_utils:difference
// $list_utils:difference(a, b) => LIST
// Elements of a that are not in b, first-occurrence order.
{a, b} = args;
out = {};
for x in (a)
  if (!(x in b))
    out = {@out, x};
  endif
endfor
return out;
.

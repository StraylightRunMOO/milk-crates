@verb list_utils:compress this none this rxd
@program list_utils:compress
// $list_utils:compress(list) => LIST
// Drop consecutive duplicate elements. {a,b,b,c,b} => {a,b,c,b}.
if (l = args[1])
  out = {last = l[1]};
  for x in (listdelete(l, 1))
    if (x != last)
      out = listappend(out, x);
      last = x;
    endif
  endfor
  return out;
else
  return l;
endif
.

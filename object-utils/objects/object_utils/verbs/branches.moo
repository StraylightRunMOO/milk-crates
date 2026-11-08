@verb object_utils:branches this none this rxd
@program object_utils:branches
// $object_utils:branches(OBJ object) => LIST
// descendants of <object> that have children
r = args[1..1];
i = 1;
while (i <= length(r))
  if (kids = children(r[i]))
    r[i + 1..i] = kids;
    i = i + 1;
  else
    r[i..i] = {};
  endif
endwhile
return r;
.

@verb object_utils:leaves this none this rxd
@program object_utils:leaves
// $object_utils:leaves(OBJ object) => LIST
// descendants of <object> that have no children
r = {args[1]};
i = 1;
while (i <= length(r))
  if (kids = children(r[i]))
    r[i..i] = kids;
  else
    i = i + 1;
  endif
endwhile
return r;
.

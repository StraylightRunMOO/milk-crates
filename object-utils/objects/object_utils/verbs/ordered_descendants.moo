@verb object_utils:ordered_descendants this none this rxd
@program object_utils:ordered_descendants
// $object_utils:ordered_descendants(OBJ object) => LIST
r = {what = args[1]};
for k in (children(what))
  if (children(k))
    r = {@r, @this:(verb)(k)};
  else
    r = {@r, k};
  endif
endfor
return r;
.

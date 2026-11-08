@verb object_utils:isoneof this none this rxd
@program object_utils:isoneof
// $object_utils:isoneof(x, y) => INT
// x isa z, for some z in list y
{what, targ} = args;
while (valid(what))
  if (what in targ)
    return 1;
  endif
  what = parent(what);
endwhile
return 0;
.

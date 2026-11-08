@verb object_tests:recycle_all this none this rxd
@program object_tests:recycle_all
// recycle_all(@objs) — recycle any valid objects in args. Ignores errors.
for o in (args)
  if (typeof(o) == OBJ)
    `recycle(o) ! ANY => 0';
  endif
endfor
.

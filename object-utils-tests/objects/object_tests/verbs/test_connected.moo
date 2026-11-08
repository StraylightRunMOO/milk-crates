@verb object_tests:test_connected this none none rxd
@program object_tests:test_connected
o = `create($root_class) ! ANY => 0';
if (typeof(o) != OBJ || !valid(o))
  return "create failed";
endif
r = 1;
got = `$object_utils:connected(o) ! ANY => 1';
if (got)
  r = "non-player connected => " + toliteral(got);
endif
ou = `$object_utils ! ANY => #-1';
if (r == 1 && valid(ou))
  got = `$object_utils:connected(ou) ! ANY => 1';
  if (got)
    r = "$object_utils connected => " + toliteral(got);
  endif
endif
this:recycle_all(o);
return r;
.

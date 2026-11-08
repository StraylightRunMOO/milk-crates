@verb object_tests:test_has_property this none none rxd
@program object_tests:test_has_property
p = `create($root_class) ! ANY => 0';
o = `create($root_class) ! ANY => 0';
ok = typeof(p) == OBJ && valid(p) && typeof(o) == OBJ && valid(o);
if (!ok)
  this:recycle_all(o, p);
  return "create failed";
endif
`chparent(o, p) ! ANY => 0';
r = 1;
if (!$object_utils:has_property(o, "name"))
  r = "has_property name";
elseif ($object_utils:has_property(o, "ou_no_such_prop_xyzzy"))
  r = "has_property missing";
endif
if (r == 1)
  hr = `$object_utils:has_readable_property(o, "name") ! ANY => 0';
  if (!hr)
    r = "has_readable_property name => " + toliteral(hr);
  endif
endif
who = caller_perms();
`add_property(p, "ou_test_foo", 1, {who, "rc"}) ! ANY => 0';
`add_property(p, "ou_test_secret", 1, {who, "c"}) ! ANY => 0';
if (r == 1 && `p.ou_test_foo ! ANY => 0' == 1)
  if (!$object_utils:has_property(p, "ou_test_foo"))
    r = "has_property defined";
  elseif (!$object_utils:has_property(o, "ou_test_foo"))
    r = "has_property inherited";
  else
    if (!$object_utils:defines_property(p, "ou_test_foo"))
      r = "defines_property parent";
    elseif ($object_utils:defines_property(o, "ou_test_foo"))
      r = "defines_property child should be false";
    endif
  endif
  if (r == 1)
    if (!$object_utils:has_readable_property(p, "ou_test_foo"))
      r = "has_readable_property rc";
    elseif ($object_utils:has_readable_property(p, "ou_test_secret"))
      r = "has_readable_property c should be false";
    endif
  endif
  if (r == 1)
    hrp = `$object_utils:hrp(p, "ou_test_foo") ! ANY => 0';
    if (!hrp)
      r = "hrp alias => " + toliteral(hrp);
    endif
  endif
endif
this:recycle_all(o, p);
return r;
.

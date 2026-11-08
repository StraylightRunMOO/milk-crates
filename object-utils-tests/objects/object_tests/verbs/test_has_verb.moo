@verb object_tests:test_has_verb this none none rxd
@program object_tests:test_has_verb
ou = `$object_utils ! ANY => #-1';
if (typeof(ou) != OBJ || !valid(ou))
  return "$object_utils missing";
endif
hv = `$object_utils:has_verb(ou, "descendants") ! ANY => 0';
if (typeof(hv) != LIST || !hv || hv[1] != ou)
  return "has_verb descendants => " + toliteral(hv);
endif
if ($object_utils:has_verb(ou, "ou_no_such_verb_xyzzy"))
  return "has_verb missing";
endif
if (!$object_utils:defines_verb(ou, "descendants"))
  return "defines_verb descendants";
endif
if ($object_utils:defines_verb(ou, "ou_no_such_verb_xyzzy"))
  return "defines_verb missing";
endif
hc = `$object_utils:has_callable_verb(ou, "descendants") ! ANY => 0';
if (typeof(hc) != LIST || !hc)
  return "has_callable_verb descendants => " + toliteral(hc);
endif
if ($object_utils:has_callable_verb(ou, "ou_no_such_verb_xyzzy"))
  return "has_callable_verb missing";
endif
o = `create($root_class) ! ANY => 0';
r = 1;
if (typeof(o) == OBJ && valid(o))
  if ($object_utils:has_verb(o, "descendants"))
    r = "fresh object has_verb descendants";
  endif
  this:recycle_all(o);
endif
return r;
.

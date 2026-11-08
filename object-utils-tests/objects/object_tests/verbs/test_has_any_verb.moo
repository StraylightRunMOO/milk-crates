@verb object_tests:test_has_any_verb this none none rxd
@program object_tests:test_has_any_verb
ou = `$object_utils ! ANY => #-1';
if (typeof(ou) != OBJ || !valid(ou))
  return "$object_utils missing";
endif
if (!$object_utils:has_any_verb(ou))
  return "has_any_verb $object_utils";
endif
o = `create($root_class) ! ANY => 0';
if (typeof(o) != OBJ || !valid(o))
  return "create failed";
endif
r = 1;
if ($object_utils:has_any_verb(o))
  r = "fresh object has_any_verb";
endif
if (r == 1 && $object_utils:has_any_property(o))
  r = "fresh object has_any_property";
endif
who = caller_perms();
`add_property(o, "ou_test_any", 1, {who, "rc"}) ! ANY => 0';
if (r == 1 && `o.ou_test_any ! ANY => 0' == 1)
  if (!$object_utils:has_any_property(o))
    r = "has_any_property after add";
  endif
endif
this:recycle_all(o);
return r;
.

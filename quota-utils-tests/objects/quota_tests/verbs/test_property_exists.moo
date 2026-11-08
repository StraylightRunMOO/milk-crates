@verb quota_tests:test_property_exists this none none rxd
@program quota_tests:test_property_exists
if (`$quota_utils:property_exists($quota_utils, "no_such_prop") ! ANY => 1')
  return "missing should be false";
endif
obj = `create($root_class) ! ANY => 0';
if (typeof(obj) != OBJ || !valid(obj))
  return 1;
endif
`add_property(obj, "qtmp", 1, {obj.owner, "rc"}) ! ANY => 0';
got = `$quota_utils:property_exists(obj, "qtmp") ! ANY => 0';
`recycle(obj) ! ANY => 0';
if (!got)
  return "qtmp missing";
endif
return 1;
.

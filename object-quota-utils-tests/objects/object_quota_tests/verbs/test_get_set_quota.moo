@verb object_quota_tests:test_get_set_quota this none none rxd
@program object_quota_tests:test_get_set_quota
obj = `create($root_class) ! ANY => 0';
if (typeof(obj) != OBJ || !valid(obj))
  return "create";
endif
`add_property(obj, "ownership_quota", 10, {obj.owner, "rc"}) ! ANY => 0';
got = `$object_quota_utils:get_quota(obj) ! ANY => 0';
if (got != 10)
  `recycle(obj) ! ANY => 0';
  return "get => " + toliteral(got);
endif
`$object_quota_utils:set_quota(obj, 7) ! ANY => 0';
got = `$object_quota_utils:quota_remaining(obj) ! ANY => 0';
`recycle(obj) ! ANY => 0';
if (got != 7)
  return "remaining => " + toliteral(got);
endif
return 1;
.

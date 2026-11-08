@verb quota_tests:test_get_set_quota this none none rxd
@program quota_tests:test_get_set_quota
obj = `create($root_class) ! ANY => 0';
if (typeof(obj) != OBJ || !valid(obj))
  return "create";
endif
`add_property(obj, "size_quota", {1000, 0, 0, 0}, {obj.owner, "rc"}) ! ANY => 0';
got = `$quota_utils:get_quota(obj) ! ANY => 0';
if (got != 1000)
  `recycle(obj) ! ANY => 0';
  return "get => " + toliteral(got);
endif
set = `$quota_utils:set_quota(obj, 2500) ! ANY => 0';
got = `$quota_utils:get_quota(obj) ! ANY => 0';
`recycle(obj) ! ANY => 0';
if (got != 2500)
  return "set => " + toliteral({set, got});
endif
return 1;
.

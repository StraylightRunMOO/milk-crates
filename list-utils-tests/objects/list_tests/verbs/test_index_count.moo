@verb list_tests:test_index_count this none none rxd
@program list_tests:test_index_count
if ($list_utils:index_all({1, 9, 1}, 1) != {1, 3})
  return "index_all";
endif
if ($list_utils:index_all({1, 2}, 9) != {})
  return "index_all miss";
endif
if ($list_utils:count(1, {1, 2, 1}) != 2)
  return "count";
endif
if ($list_utils:includes({1, 2, 3}, 2) != 2)
  return "includes";
endif
if ($list_utils:contains({1, 2, 3}, 9) != 0)
  return "contains miss";
endif
if ($list_utils:any_of({0, 0, 1}) != 1)
  return "any_of truthy";
endif
if ($list_utils:any_of({0, 0}) != 0)
  return "any_of none";
endif
if ($list_utils:any_of({1, 2, 3}, 2) != 2)
  return "any_of member";
endif
return 1;
.

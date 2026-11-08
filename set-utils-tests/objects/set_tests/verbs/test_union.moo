@verb set_tests:test_union this none none rxd
@program set_tests:test_union
if ($set_utils:union() != {})
  return "empty args";
endif
if ($set_utils:union({1, 2}, {2, 3}) != {1, 2, 3})
  return "union 1 2 + 2 3";
endif
if ($set_utils:union({1}, {1}, {1}) != {1})
  return "dupes";
endif
return 1;
.

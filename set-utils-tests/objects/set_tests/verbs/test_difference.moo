@verb set_tests:test_difference this none none rxd
@program set_tests:test_difference
if ($set_utils:difference({1, 2, 3}, {2}) != {1, 3})
  return "diff";
endif
if ($set_utils:diff({1, 2, 3}, {2}, {3}) != {1})
  return "diff alias multi";
endif
if ($set_utils:difference({1, 2}, {}) != {1, 2})
  return "minus empty";
endif
return 1;
.

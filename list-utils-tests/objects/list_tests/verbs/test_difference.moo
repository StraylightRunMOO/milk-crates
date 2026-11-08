@verb list_tests:test_difference this none none rxd
@program list_tests:test_difference
if ($list_utils:difference({1, 2, 3}, {2}) != {1, 3})
  return "difference";
endif
if ($list_utils:difference({1, 2}, {}) != {1, 2})
  return "difference empty";
endif
if ($list_utils:remove_multiple({1, 2, 3, 4}, {2, 4}) != {1, 3})
  return "remove_multiple";
endif
if ($list_utils:remove_multiple({1, 2, 3}, 2) != {1, 3})
  return "remove_multiple scalar";
endif
return 1;
.

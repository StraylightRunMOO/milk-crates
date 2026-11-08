@verb list_tests:test_reverse this none none rxd
@program list_tests:test_reverse
if ($list_utils:reverse({1, 2, 3}) != {3, 2, 1})
  return "reverse";
endif
if ($list_utils:reverse({}) != {})
  return "reverse empty";
endif
if ($list_utils:reverse_suspended({1, 2, 3}) != {3, 2, 1})
  return "reverse_suspended";
endif
return 1;
.

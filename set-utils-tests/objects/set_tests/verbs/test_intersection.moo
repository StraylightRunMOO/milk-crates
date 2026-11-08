@verb set_tests:test_intersection this none none rxd
@program set_tests:test_intersection
if ($set_utils:intersection() != {})
  return "empty args";
endif
if ($set_utils:intersection({1, 2, 3}, {2, 3, 4}) != {2, 3})
  return "pair";
endif
if ($set_utils:intersection({1, 2}, {3, 4}) != {})
  return "disjoint";
endif
return 1;
.

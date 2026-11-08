@verb seq_tests:test_union this none none rxd
@program seq_tests:test_union
if ($seq_utils:union() != {})
  return "empty args";
endif
if ($seq_utils:union({1, 3}) != {1, 3})
  return "one arg";
endif
if ($seq_utils:union({}, {1, 3}) != {1, 3})
  return "empty arg";
endif
if ($seq_utils:union({1, 3}, {2, 5}) != {1, 5})
  return "overlap";
endif
if ($seq_utils:union({1, 3}, {5, 7}) != {1, 3, 5, 7})
  return "disjoint";
endif
if ($seq_utils:union({1, 3}, {3, 5}, {10, 12}) != {1, 5, 10, 12})
  return "three";
endif
return 1;
.

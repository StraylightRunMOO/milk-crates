@verb seq_tests:test_intersection this none none rxd
@program seq_tests:test_intersection
if ($seq_utils:intersection({1, 5}) != {1, 5})
  return "one arg";
endif
if ($seq_utils:intersection({1, 5}, {3, 7}) != {3, 5})
  return "overlap";
endif
if ($seq_utils:intersection({1, 3}, {5, 7}) != {})
  return "disjoint";
endif
if ($seq_utils:intersection({1, 10}, {2, 8}, {4, 6}) != {4, 6})
  return "three";
endif
return 1;
.

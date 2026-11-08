@verb seq_tests:test_tolist this none none rxd
@program seq_tests:test_tolist
if ($seq_utils:tolist({}) != {})
  return "empty";
endif
if ($seq_utils:tolist({1, 4}) != {1, 2, 3})
  return "range";
endif
if ($seq_utils:tolist({5, 6}) != {5})
  return "singleton";
endif
if ($seq_utils:tolist({1, 3, 10, 12}) != {1, 2, 10, 11})
  return "two ranges";
endif
return 1;
.

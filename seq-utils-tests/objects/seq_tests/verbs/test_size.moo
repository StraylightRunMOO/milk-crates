@verb seq_tests:test_size this none none rxd
@program seq_tests:test_size
if ($seq_utils:size({}) != 0)
  return "empty";
endif
if ($seq_utils:size({1, 4}) != 3)
  return "1..3";
endif
if ($seq_utils:size({1, 4, 10, 12}) != 5)
  return "two ranges";
endif
if ($seq_utils:size({5, 6}) != 1)
  return "singleton";
endif
return 1;
.

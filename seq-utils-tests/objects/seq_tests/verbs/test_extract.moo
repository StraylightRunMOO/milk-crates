@verb seq_tests:test_extract this none none rxd
@program seq_tests:test_extract
if ($seq_utils:extract({1, 3, 5, 6}, {"a", "b", "c", "d", "e"}) != {"a", "b", "e"})
  return "extract";
endif
if ($seq_utils:extract({1, 2}, {"a", "b", "c"}) != {"a"})
  return "first";
endif
if ($seq_utils:extract({}, {"a", "b"}) != {})
  return "empty seq";
endif
if ($seq_utils:extract({1, 3}, {}) != {})
  return "empty array";
endif
return 1;
.

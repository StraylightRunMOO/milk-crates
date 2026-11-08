@verb seq_tests:test_tostr this none none rxd
@program seq_tests:test_tostr
if ($seq_utils:tostr({}) != "empty")
  return "empty";
endif
if ($seq_utils:tostr({1, 2}) != "1")
  return "singleton";
endif
if ($seq_utils:tostr({1, 4}) != "1..3")
  return "range";
endif
if ($seq_utils:tostr({1, 4, 5, 6}) != "1..3, 5")
  return "mixed";
endif
if ($seq_utils:tostr({1, 4}, "-") != "1-3")
  return "delim";
endif
return 1;
.

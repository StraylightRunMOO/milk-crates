@verb seq_tests:test_range this none none rxd
@program seq_tests:test_range
if ($seq_utils:range(1, 3) != {1, 4})
  return "1..3";
endif
if ($seq_utils:range(5, 5) != {5, 6})
  return "singleton";
endif
if ($seq_utils:range(5, 3) != {})
  return "backwards";
endif
return 1;
.

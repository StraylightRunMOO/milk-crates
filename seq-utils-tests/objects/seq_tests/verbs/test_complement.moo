@verb seq_tests:test_complement this none none rxd
@program seq_tests:test_complement
if ($seq_utils:complement({1, 4}, 0, 10) != {0, 1, 4, 11})
  return "bounded";
endif
if ($seq_utils:complement({1, 11}, 1, 10) != {})
  return "full range";
endif
return 1;
.

@verb seq_tests:test_first this none none rxd
@program seq_tests:test_first
if ($seq_utils:first({1, 4}) != 1)
  return "first";
endif
if ($seq_utils:first({10, 12, 20, 22}) != 10)
  return "two ranges";
endif
if ($seq_utils:first({}) != E_NONE)
  return "empty";
endif
return 1;
.

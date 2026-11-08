@verb seq_tests:test_last this none none rxd
@program seq_tests:test_last
if ($seq_utils:last({1, 4}) != 3)
  return "last";
endif
if ($seq_utils:last({10, 12, 20, 22}) != 21)
  return "two ranges";
endif
if ($seq_utils:last({}) != E_NONE)
  return "empty";
endif
return 1;
.

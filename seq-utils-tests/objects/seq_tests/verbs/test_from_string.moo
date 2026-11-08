@verb seq_tests:test_from_string this none none rxd
@program seq_tests:test_from_string
if ($seq_utils:from_string("") != {})
  return "empty";
endif
if ($seq_utils:from_string("2") != {2, 3})
  return "single";
endif
if ($seq_utils:from_string("1..3,5") != {1, 4, 5, 6})
  return "range and n";
endif
if ($seq_utils:from_string("1, 2, 4..6") != {1, 3, 4, 7})
  return "spaced";
endif
if ($seq_utils:from_string("foo") != E_INVARG)
  return "bad";
endif
return 1;
.

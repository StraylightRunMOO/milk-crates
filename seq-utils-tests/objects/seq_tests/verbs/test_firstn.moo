@verb seq_tests:test_firstn this none none rxd
@program seq_tests:test_firstn
if ($seq_utils:firstn({1, 10}, 3) != {1, 4})
  return "firstn 3";
endif
if ($seq_utils:firstn({1, 10}, 0) != {})
  return "n 0";
endif
if ($seq_utils:firstn({1, 3}, 10) != {1, 3})
  return "n larger";
endif
if ($seq_utils:firstn({1, 3, 10, 15}, 4) != {1, 3, 10, 12})
  return "across ranges";
endif
return 1;
.

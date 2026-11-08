@verb seq_tests:test_from_list this none none rxd
@program seq_tests:test_from_list
if ($seq_utils:from_list({}) != {})
  return "empty";
endif
if ($seq_utils:from_list({3, 1, 2, 5}) != {1, 4, 5, 6})
  return "unsorted";
endif
if ($seq_utils:from_list({7}) != {7, 8})
  return "singleton";
endif
return 1;
.

@verb seq_tests:test_from_sorted_list this none none rxd
@program seq_tests:test_from_sorted_list
if ($seq_utils:from_sorted_list({}) != {})
  return "empty";
endif
if ($seq_utils:from_sorted_list({1, 2, 3, 5}) != {1, 4, 5, 6})
  return "runs";
endif
if ($seq_utils:from_sorted_list({4, 5, 6}) != {4, 7})
  return "one run";
endif
return 1;
.

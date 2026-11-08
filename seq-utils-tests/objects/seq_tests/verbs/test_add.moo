@verb seq_tests:test_add this none none rxd
@program seq_tests:test_add
if ($seq_utils:add({1, 3}, 5, 5) != {1, 3, 5, 6})
  return "add singleton";
endif
if ($seq_utils:add({1, 3}, 3, 5) != {1, 6})
  return "add adjacent";
endif
if ($seq_utils:add({1, 4}, 2, 2) != {1, 4})
  return "add already in";
endif
if ($seq_utils:remove({1, 6}, 3, 4) != {1, 3, 5, 6})
  return "remove";
endif
if ($seq_utils:remove({1, 6}, 1, 5) != {})
  return "remove all";
endif
return 1;
.

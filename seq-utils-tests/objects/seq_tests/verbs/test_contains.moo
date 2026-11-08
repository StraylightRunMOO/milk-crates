@verb seq_tests:test_contains this none none rxd
@program seq_tests:test_contains
if (!$seq_utils:contains({1, 4}, 1))
  return "start";
endif
if (!$seq_utils:contains({1, 4}, 2))
  return "mid";
endif
if ($seq_utils:contains({1, 4}, 4))
  return "exclusive end";
endif
if ($seq_utils:contains({1, 4}, 0))
  return "before";
endif
if (!$seq_utils:contains({1, 3, 10, 12}, 11))
  return "second range";
endif
return 1;
.

@verb seq_tests:test_expand this none none rxd
@program seq_tests:test_expand
if ($seq_utils:expand({1, 4}, {}) != {1, 4})
  return "empty insert";
endif
if ($seq_utils:expand({1, 4}, {2, 3}) != {1, 2, 3, 5})
  return "hole";
endif
if ($seq_utils:expand({1, 4}, {1, 2}, 1) != {1, 5})
  return "include";
endif
if ($seq_utils:expand({1, 4}, {2}) != E_TYPE)
  return "odd eseq";
endif
return 1;
.

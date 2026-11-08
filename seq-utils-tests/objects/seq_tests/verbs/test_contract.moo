@verb seq_tests:test_contract this none none rxd
@program seq_tests:test_contract
if ($seq_utils:contract({1, 4}, {}) != {1, 4})
  return "empty cseq";
endif
if ($seq_utils:contract({1, 2, 3, 5}, {2, 3}) != {1, 4})
  return "hole";
endif
if ($seq_utils:contract($seq_utils:expand({1, 5}, {2, 3}), {2, 3}) != {1, 5})
  return "roundtrip";
endif
if ($seq_utils:contract({1, 4}, {2}) != E_TYPE)
  return "odd cseq";
endif
return 1;
.

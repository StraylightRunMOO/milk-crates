@verb seq_tests:test_lastn this none none rxd
@program seq_tests:test_lastn
if ($seq_utils:lastn({1, 10}, 3) != {7, 10})
  return "lastn 3";
endif
if ($seq_utils:lastn({1, 3}, 10) != {1, 3})
  return "n larger";
endif
if ($seq_utils:lastn({1, 3, 10, 15}, 4) != {11, 15})
  return "across ranges => " + toliteral($seq_utils:lastn({1, 3, 10, 15}, 4));
endif
return 1;
.

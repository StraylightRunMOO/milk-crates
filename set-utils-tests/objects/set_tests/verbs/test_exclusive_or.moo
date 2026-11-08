@verb set_tests:test_exclusive_or this none none rxd
@program set_tests:test_exclusive_or
if ($set_utils:exclusive_or() != {})
  return "empty args";
endif
x = $set_utils:xor({1, 2}, {2, 3});
if (!(1 in x) || !(3 in x) || 2 in x || length(x) != 2)
  return "xor pair => " + toliteral(x);
endif
return 1;
.

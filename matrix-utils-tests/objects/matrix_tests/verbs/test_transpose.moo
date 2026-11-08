@verb matrix_tests:test_transpose this none none rxd
@program matrix_tests:test_transpose
got = $matrix_utils:transpose({{1, 2}, {3, 4}});
if (got != {{1, 3}, {2, 4}})
  return "transpose 2x2 => " + toliteral(got);
endif
rect = $matrix_utils:transpose({{1, 2, 3}, {4, 5, 6}});
if (rect != {{1, 4}, {2, 5}, {3, 6}})
  return "transpose 2x3 => " + toliteral(rect);
endif
return 1;
.

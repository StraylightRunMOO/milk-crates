@verb matrix_tests:test_null this none none rxd
@program matrix_tests:test_null
got = $matrix_utils:null(2);
if (got != {{0, 0}, {0, 0}})
  return "null(2) => " + toliteral(got);
endif
rect = $matrix_utils:null(2, 3);
if (rect != {{0, 0, 0}, {0, 0, 0}})
  return "null(2, 3) => " + toliteral(rect);
endif
return 1;
.

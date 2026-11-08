@verb matrix_tests:test_determinant this none none rxd
@program matrix_tests:test_determinant
got = $matrix_utils:determinant({{1, 2}, {3, 4}});
if (got != -2)
  return "det {{1,2},{3,4}} => " + toliteral(got);
endif
return 1;
.

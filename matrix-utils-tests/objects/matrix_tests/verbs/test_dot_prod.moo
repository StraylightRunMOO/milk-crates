@verb matrix_tests:test_dot_prod this none none rxd
@program matrix_tests:test_dot_prod
got = $matrix_utils:dot_prod({1, 2, 3}, {4, 5, 6});
if (got != 32)
  return "dot_prod => " + toliteral(got);
endif
return 1;
.

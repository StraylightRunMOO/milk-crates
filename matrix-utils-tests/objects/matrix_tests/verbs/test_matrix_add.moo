@verb matrix_tests:test_matrix_add this none none rxd
@program matrix_tests:test_matrix_add
a = {{1, 2}, {3, 4}};
b = {{1, 1}, {1, 1}};
got = $matrix_utils:matrix_add(a, b);
if (got != {{2, 3}, {4, 5}})
  return "matrix_add => " + toliteral(got);
endif
ms = `$matrix_utils:matrix_sub(a, b) ! ANY => 0';
if (ms != {{0, 1}, {2, 3}})
  return "matrix_sub => " + toliteral(ms);
endif
return 1;
.

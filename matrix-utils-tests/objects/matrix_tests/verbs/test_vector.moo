@verb matrix_tests:test_vector this none none rxd
@program matrix_tests:test_vector
got = $matrix_utils:vector_add({1, 2}, {3, 4});
if (got != {4, 6})
  return "vector_add => " + toliteral(got);
endif
vs = `$matrix_utils:vector_sub({1, 2}, {3, 4}) ! ANY => 0';
if (vs != {-2, -2})
  return "vector_sub => " + toliteral(vs);
endif
return 1;
.

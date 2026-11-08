@verb matrix_tests:test_identity this none none rxd
@program matrix_tests:test_identity
got = $matrix_utils:identity(2);
if (got != {{1, 0}, {0, 1}})
  return "identity(2) => " + toliteral(got);
endif
return 1;
.

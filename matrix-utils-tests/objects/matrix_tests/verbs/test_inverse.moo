@verb matrix_tests:test_inverse this none none rxd
@program matrix_tests:test_inverse
a = {{1, 1}, {0, 1}};
inv = $matrix_utils:inverse(a);
if (inv != {{1, -1}, {0, 1}})
  return "inverse {{1,1},{0,1}} => " + toliteral(inv);
endif
return 1;
.

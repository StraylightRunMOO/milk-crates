@verb matrix_tests:test_cross_prod this none none rxd
@program matrix_tests:test_cross_prod
c = $matrix_utils:cross_prod({1, 0, 0}, {0, 1, 0});
if (typeof(c) != LIST || length(c) != 3)
  return "cross_prod => " + toliteral(c);
endif
if (abs(tofloat(c[1]) - 0.0) > 0.0001 || abs(tofloat(c[2]) - 0.0) > 0.0001 || abs(tofloat(c[3]) - 1.0) > 0.0001)
  return "cross_prod => " + toliteral(c);
endif
return 1;
.

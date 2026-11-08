@verb matrix_tests:test_norm this none none rxd
@program matrix_tests:test_norm
n = $matrix_utils:norm({3, 4});
if (typeof(n) != FLOAT || abs(n - 5.0) > 0.0001)
  return "norm {3,4} => " + toliteral(n);
endif
ln = `$matrix_utils:length({3, 4}) ! ANY => 0';
if (typeof(ln) != FLOAT || abs(ln - 5.0) > 0.0001)
  return "length alias => " + toliteral(ln);
endif
return 1;
.

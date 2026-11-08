@verb matrix_tests:test_dimensions this none none rxd
@program matrix_tests:test_dimensions
if ($matrix_utils:dimensions({{1, 0}, {0, 1}}) != {2, 2})
  return "dimensions I2 => " + toliteral($matrix_utils:dimensions({{1, 0}, {0, 1}}));
endif
if ($matrix_utils:dimensions({1, 2, 3}) != {3})
  return "dimensions vector => " + toliteral($matrix_utils:dimensions({1, 2, 3}));
endif
if (!$matrix_utils:is_square({{1, 2}, {3, 4}}))
  return "is_square 2x2";
endif
if ($matrix_utils:is_square({{1, 2, 3}, {4, 5, 6}}))
  return "is_square 2x3 should be false";
endif
if (!$matrix_utils:is_vector({1, 2, 3}))
  return "is_vector {1,2,3}";
endif
if ($matrix_utils:is_vector({{1, 2}}))
  return "is_vector matrix should be false";
endif
if (!$matrix_utils:is_matrix({{1, 2}, {3, 4}}))
  return "is_matrix 2x2";
endif
if ($matrix_utils:is_matrix({1, 2, 3}))
  return "is_matrix vector should be false";
endif
if (!$matrix_utils:is_identity($matrix_utils:identity(2)))
  return "is_identity I2";
endif
if ($matrix_utils:is_identity({{1, 2}, {3, 4}}))
  return "is_identity non-I";
endif
if ($matrix_utils:is_identity($matrix_utils:null(2)))
  return "is_identity O2 should be false";
endif
if (`$matrix_utils:is_reflexive({{1, 0}, {0, 1}}) ! ANY => 0' != 1)
  return "is_reflexive I2 => " + toliteral(`$matrix_utils:is_reflexive({{1, 0}, {0, 1}}) ! ANY => 0');
endif
if (!$matrix_utils:is_null($matrix_utils:null(2)))
  return "is_null O2";
endif
if ($matrix_utils:is_null($matrix_utils:identity(2)))
  return "is_null I2 should be false";
endif
return 1;
.

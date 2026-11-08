@verb convert_tests:test_c_to_k this none none rxd
@program convert_tests:test_c_to_k
if ($convert_utils:C_to_K(0) != 273.0)
  return "C_to_K(0) => " + toliteral($convert_utils:C_to_K(0));
endif
if ($convert_utils:degC_to_degK(0) != 273.0)
  return "alias degC_to_degK(0)";
endif
return 1;
.

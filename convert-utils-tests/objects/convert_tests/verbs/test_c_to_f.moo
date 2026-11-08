@verb convert_tests:test_c_to_f this none none rxd
@program convert_tests:test_c_to_f
if ($convert_utils:C_to_F(0) != 32.0)
  return "C_to_F(0) => " + toliteral($convert_utils:C_to_F(0));
endif
if ($convert_utils:degC_to_degF(0) != 32.0)
  return "alias degC_to_degF(0)";
endif
if ($convert_utils:C_to_F(100) != 212.0)
  return "C_to_F(100) => " + toliteral($convert_utils:C_to_F(100));
endif
return 1;
.

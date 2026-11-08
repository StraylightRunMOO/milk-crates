@verb convert_tests:test_f_to_c this none none rxd
@program convert_tests:test_f_to_c
if ($convert_utils:F_to_C(32) != 0.0)
  return "F_to_C(32) => " + toliteral($convert_utils:F_to_C(32));
endif
if ($convert_utils:degF_to_degC(32) != 0.0)
  return "alias degF_to_degC(32)";
endif
if ($convert_utils:F_to_C($convert_utils:C_to_F(0)) != 0.0)
  return "roundtrip 0 C";
endif
return 1;
.

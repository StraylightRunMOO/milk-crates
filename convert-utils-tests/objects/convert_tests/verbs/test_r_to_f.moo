@verb convert_tests:test_r_to_f this none none rxd
@program convert_tests:test_r_to_f
if ($convert_utils:R_to_F(459.67) != 0.0)
  return "R_to_F(459.67) => " + toliteral($convert_utils:R_to_F(459.67));
endif
if ($convert_utils:degR_to_degF(459.67) != 0.0)
  return "alias degR_to_degF(459.67)";
endif
if ($convert_utils:R_to_F($convert_utils:F_to_R(0)) != 0.0)
  return "roundtrip 0 F";
endif
return 1;
.

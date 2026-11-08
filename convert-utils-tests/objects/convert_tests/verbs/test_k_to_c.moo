@verb convert_tests:test_k_to_c this none none rxd
@program convert_tests:test_k_to_c
if ($convert_utils:K_to_C(273) != 0.0)
  return "K_to_C(273) => " + toliteral($convert_utils:K_to_C(273));
endif
if ($convert_utils:degK_to_degC(273.0) != 0.0)
  return "alias degK_to_degC(273)";
endif
if ($convert_utils:K_to_C($convert_utils:C_to_K(0)) != 0.0)
  return "roundtrip 0 C";
endif
return 1;
.

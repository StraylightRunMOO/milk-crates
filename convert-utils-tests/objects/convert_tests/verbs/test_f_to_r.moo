@verb convert_tests:test_f_to_r this none none rxd
@program convert_tests:test_f_to_r
if ($convert_utils:F_to_R(0) != 459.67)
  return "F_to_R(0) => " + toliteral($convert_utils:F_to_R(0));
endif
if ($convert_utils:degF_to_degR(0) != 459.67)
  return "alias degF_to_degR(0)";
endif
return 1;
.

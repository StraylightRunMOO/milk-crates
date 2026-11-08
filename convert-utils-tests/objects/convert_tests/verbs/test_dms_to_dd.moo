@verb convert_tests:test_dms_to_dd this none none rxd
@program convert_tests:test_dms_to_dd
if ($convert_utils:dms_to_dd(1, 30, 0) != 1.5)
  return "dms_to_dd 1 30 0 => " + toliteral($convert_utils:dms_to_dd(1, 30, 0));
endif
if ($convert_utils:hms_to_dh(1, 30, 0) != 1.5)
  return "alias hms_to_dh 1 30 0";
endif
dms = $convert_utils:dd_to_dms(45.5);
if ($convert_utils:dms_to_dd(@dms) != 45.5)
  return "roundtrip 45.5 => " + toliteral(dms);
endif
return 1;
.

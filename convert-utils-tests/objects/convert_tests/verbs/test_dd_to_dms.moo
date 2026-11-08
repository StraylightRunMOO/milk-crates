@verb convert_tests:test_dd_to_dms this none none rxd
@program convert_tests:test_dd_to_dms
dms = $convert_utils:dd_to_dms(1.5);
if (dms != {1, 30, 0.0})
  return "dd_to_dms 1.5 => " + toliteral(dms);
endif
hms = $convert_utils:dh_to_hms(1.5);
if (hms != {1, 30, 0.0})
  return "alias dh_to_hms 1.5 => " + toliteral(hms);
endif
return 1;
.

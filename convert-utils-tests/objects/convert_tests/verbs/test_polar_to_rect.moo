@verb convert_tests:test_polar_to_rect this none none rxd
@program convert_tests:test_polar_to_rect
xy = $convert_utils:polar_to_rect(5.0, 0.0);
if (xy != {5.0, 0.0})
  return "polar_to_rect 5 0 => " + toliteral(xy);
endif
return 1;
.

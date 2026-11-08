@verb convert_tests:test_rect_to_polar this none none rxd
@program convert_tests:test_rect_to_polar
rt = $convert_utils:rect_to_polar(5.0, 0.0);
if (rt != {5.0, 0.0})
  return "rect_to_polar 5 0 => " + toliteral(rt);
endif
rt = $convert_utils:rect_to_polar(3.0, 4.0);
if (rt[1] != 5.0)
  return "3-4-5 radius => " + toliteral(rt);
endif
xy = $convert_utils:polar_to_rect(5.0, 0.0);
rt = $convert_utils:rect_to_polar(xy[1], xy[2]);
if (rt != {5.0, 0.0})
  return "roundtrip => " + toliteral(rt);
endif
origin = $convert_utils:rect_to_polar(0.0, 0.0);
if (origin[1] != 0.0)
  return "origin radius => " + toliteral(origin);
endif
return 1;
.

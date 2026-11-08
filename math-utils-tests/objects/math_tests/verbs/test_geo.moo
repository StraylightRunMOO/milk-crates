@verb math_tests:test_geo this none none rxd
@program math_tests:test_geo
b = $math_utils:bearing_angle({0, 0}, {0, 1});
if (typeof(b) != LIST || length(b) != 2)
  return "bearing type => " + toliteral(b);
endif
if (abs(b[1] - 0.0) > 0.0001 || abs(b[2] - 0.0) > 0.0001)
  return "bearing north => " + toliteral(b);
endif
be = $math_utils:bearing_angle({0, 0}, {1, 0});
if (abs(be[1] - 90.0) > 0.0001)
  return "bearing east => " + toliteral(be);
endif
bp = $math_utils:bearing_angle({0, 0, 0}, {0, 1, 1});
if (typeof(bp) != LIST || length(bp) != 2 || abs(bp[2] - 45.0) > 0.01)
  return "bearing pitch => " + toliteral(bp);
endif
if ($math_utils:horizon_distance(0) != 0.0)
  return "horizon 0";
endif
h = $math_utils:horizon_distance(100);
if (typeof(h) != FLOAT || abs(h - 11.7) > 0.0001)
  return "horizon 100 => " + toliteral(h);
endif
tr = $math_utils:turning_radius(100, 30);
if (typeof(tr) != LIST || length(tr) != 2)
  return "turning_radius type => " + toliteral(tr);
endif
if (typeof(tr[1]) != FLOAT || typeof(tr[2]) != FLOAT || tr[1] <= 0.0 || tr[2] <= 0.0)
  return "turning_radius => " + toliteral(tr);
endif
return 1;
.

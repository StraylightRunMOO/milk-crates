@verb math_tests:test_trig this none none rxd
@program math_tests:test_trig
if ($math_utils:sin(90) != 10000)
  return "sin 90 => " + toliteral($math_utils:sin(90));
endif
if ($math_utils:sin(0) != 0)
  return "sin 0";
endif
if ($math_utils:sin(0.0) != 0.0)
  return "sin 0.0 => " + toliteral($math_utils:sin(0.0));
endif
ts = `$trig_utils:sin(0.0) ! ANY => 0';
if (ts != 0.0)
  return "$trig_utils:sin(0.0) => " + toliteral(ts);
endif
tc = `$trig_utils:cos(0.0) ! ANY => 0';
if (tc != 1.0)
  return "$trig_utils:cos(0.0) => " + toliteral(tc);
endif
if ($math_utils:cos(0) != 10000)
  return "cos 0 => " + toliteral($math_utils:cos(0));
endif
if ($math_utils:cos(0.0) != 1.0)
  return "cos 0.0 => " + toliteral($math_utils:cos(0.0));
endif
if ($math_utils:tan(0) != 0)
  return "tan 0 => " + toliteral($math_utils:tan(0));
endif
if ($math_utils:tan(0.0) != 0.0)
  return "tan 0.0 => " + toliteral($math_utils:tan(0.0));
endif
as0 = $math_utils:arcsin(0);
if (as0 != {0, 0})
  return "arcsin 0 => " + toliteral(as0);
endif
if ($math_utils:asin(0.0) != 0.0)
  return "asin 0.0 => " + toliteral($math_utils:asin(0.0));
endif
ac1 = $math_utils:arccos(10000);
if (ac1 != {0, 0})
  return "arccos 10000 => " + toliteral(ac1);
endif
if ($math_utils:acos(1.0) != 0.0)
  return "acos 1.0 => " + toliteral($math_utils:acos(1.0));
endif
if ($math_utils:arctan(0) != {0, 0})
  return "arctan 0 => " + toliteral($math_utils:arctan(0));
endif
if ($math_utils:atan(0.0) != 0.0)
  return "atan 0.0 => " + toliteral($math_utils:atan(0.0));
endif
if ($math_utils:xsin(0) != 0)
  return "xsin 0";
endif
if ($math_utils:xcos(0) != 10000)
  return "xcos 0 => " + toliteral($math_utils:xcos(0));
endif
d2r = $math_utils:deg2rads(180);
if (typeof(d2r) != FLOAT || abs(d2r - $math_utils.pi) > 1e-07)
  return "deg2rads 180 => " + toliteral(d2r);
endif
if (abs($math_utils:deg2rad(0) - 0.0) > 1e-07)
  return "deg2rad alias";
endif
r2d = $math_utils:rads2deg($math_utils.pi);
if (typeof(r2d) != FLOAT || abs(r2d - 180.0) > 0.0001)
  return "rads2deg pi => " + toliteral(r2d);
endif
if (abs($math_utils:rad2deg(0.0) - 0.0) > 1e-07)
  return "rad2deg alias";
endif
return 1;
.

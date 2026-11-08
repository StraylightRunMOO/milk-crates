@verb math_tests:test_div this none none rxd
@program math_tests:test_div
if ($math_utils:divmod(10, 3) != {3, 1})
  return "divmod 10 3 => " + toliteral($math_utils:divmod(10, 3));
endif
if ($math_utils:div(10, 3) != 3)
  return "div 10 3";
endif
if ($math_utils:mod(10, 3) != 1)
  return "mod 10 3";
endif
if ($math_utils:mod(-1, 5) != 4)
  return "mod -1 5 => " + toliteral($math_utils:mod(-1, 5));
endif
if ($math_utils:round(15, 10) != 20)
  return "round 15 10";
endif
if ($math_utils:round(14, 10) != 10)
  return "round 14 10";
endif
if ($math_utils:rint(1.5) != 2.0)
  return "rint 1.5 => " + toliteral($math_utils:rint(1.5));
endif
if ($math_utils:rint(-1.5) != -2.0)
  return "rint -1.5 => " + toliteral($math_utils:rint(-1.5));
endif
pr = $math_utils:precision(3.14159, 2);
if (typeof(pr) != FLOAT || abs(pr - 3.14) > 1e-07)
  return "precision => " + toliteral(pr);
endif
if ($math_utils:parts(10, 3, 2) != {3, 33})
  return "parts 10 3 2 => " + toliteral($math_utils:parts(10, 3, 2));
endif
return 1;
.

@verb math_tests:test_stats this none none rxd
@program math_tests:test_stats
if ($math_utils:mean({2, 4, 6}) != 4)
  return "mean list => " + toliteral($math_utils:mean({2, 4, 6}));
endif
if ($math_utils:mean(1, 2, 3) != 2)
  return "mean varargs";
endif
if ($math_utils:average({10, 20}) != 15)
  return "average alias";
endif
if ($math_utils:sum_int({1, 2, 3}) != 6)
  return "sum_int list";
endif
if ($math_utils:sum(1, 2, 3) != 6)
  return "sum alias";
endif
if ($math_utils:sum_float({1.5, 2.5}) != 4.0)
  return "sum_float => " + toliteral($math_utils:sum_float({1.5, 2.5}));
endif
if ($math_utils:sum_float(1.0, 2.0, 3.0) != 6.0)
  return "sum_float varargs";
endif
if ($math_utils:norm(3, 4) != 5)
  return "norm 3 4 => " + toliteral($math_utils:norm(3, 4));
endif
s = $math_utils:stats({1, 2, 3, 4});
if (typeof(s) != MAP)
  return "stats type => " + toliteral(s);
endif
if (s["min"] != 1)
  return "stats min => " + toliteral(s["min"]);
endif
if (s["max"] != 4)
  return "stats max => " + toliteral(s["max"]);
endif
if (s["sum"] != 10.0 && s["sum"] != 10)
  return "stats sum => " + toliteral(s["sum"]);
endif
if (typeof(s["mean"]) != FLOAT && typeof(s["mean"]) != INT)
  return "stats mean type";
endif
if (typeof(s["std"]) != FLOAT)
  return "stats std type";
endif
return 1;
.

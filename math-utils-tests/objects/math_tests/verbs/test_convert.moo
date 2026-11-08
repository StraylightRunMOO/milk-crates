@verb math_tests:test_convert this none none rxd
@program math_tests:test_convert
if ($math_utils:base_conversion("FF", 16, 10) != "255")
  return "base FF 16->10 => " + toliteral($math_utils:base_conversion("FF", 16, 10));
endif
if ($math_utils:base_conversion(10, 10, 2) != "1010")
  return "base 10 10->2 => " + toliteral($math_utils:base_conversion(10, 10, 2));
endif
if ($math_utils:base_conversion(0, 10, 2) != "0")
  return "base 0";
endif
if (`$math_utils:base_conversion(10, 1, 10) ! ANY => 0' != E_INVARG)
  return "base bad radix";
endif
if ($math_utils:from_percent(50, 200) != 100.0)
  return "from_percent => " + toliteral($math_utils:from_percent(50, 200));
endif
if ($math_utils:from_percentage(25, 80) != 20.0)
  return "from_percentage alias";
endif
if ($math_utils:to_percent(1, 4) != 25.0)
  return "to_percent => " + toliteral($math_utils:to_percent(1, 4));
endif
if ($math_utils:to_percentage(50, 200) != 25.0)
  return "to_percentage alias";
endif
return 1;
.

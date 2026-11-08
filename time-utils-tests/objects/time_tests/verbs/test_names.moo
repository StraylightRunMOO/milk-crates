@verb time_tests:test_names this none none rxd
@program time_tests:test_names
stamp = "Wed Oct 15 14:30:00 2025 GMT";
if ($time_utils:day(stamp) != "Wednesday")
  return "day => " + toliteral($time_utils:day(stamp));
endif
if ($time_utils:month(stamp) != "October")
  return "month => " + toliteral($time_utils:month(stamp));
endif
if ($time_utils:day("Sun Jan 10 00:00:00 1970 GMT") != "Sunday")
  return "day Sunday";
endif
if ($time_utils:month("Sun Jan 10 00:00:00 1970 GMT") != "January")
  return "month January";
endif
if ($time_utils:day({}) != E_TYPE)
  return "day type";
endif
if ($time_utils:month(1.5) != E_TYPE)
  return "month type";
endif
return 1;
.

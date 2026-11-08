@verb time_tests:test_hms this none none rxd
@program time_tests:test_hms
if (`$time_utils:to_seconds("01:00:00") ! ANY => 0' != 3600)
  return "to_seconds 01:00:00";
endif
if ($time_utils:to_seconds("00:00:00") != 0)
  return "to_seconds midnight";
endif
if ($time_utils:to_seconds("00:01:00") != 60)
  return "to_seconds minute";
endif
if ($time_utils:to_seconds("00:00:01") != 1)
  return "to_seconds second";
endif
if ($time_utils:to_seconds("23:59:59") != 86399)
  return "to_seconds 23:59:59";
endif
if ($time_utils:dhms(0) != "0")
  return "dhms 0";
endif
if ($time_utils:dhms(5) != "5")
  return "dhms 5";
endif
if ($time_utils:dayshoursminutesseconds(60) != "1:00")
  return "dhms alias 60";
endif
if ($time_utils:dhms(61) != "1:01")
  return "dhms 61";
endif
if ($time_utils:dhms(3600) != "1:00:00")
  return "dhms 3600";
endif
if ($time_utils:dhms(86400) != "1:00:00:00")
  return "dhms day";
endif
if ($time_utils:dhms(90061) != "1:01:01:01")
  return "dhms 90061";
endif
if ($time_utils:dhms(-60) != "-1:00")
  return "dhms neg";
endif
stamp = "Wed Oct 15 14:30:45 2025 GMT";
if ($time_utils:ampm(stamp) != "2:30 p.m.")
  return "ampm default => " + $time_utils:ampm(stamp);
endif
if ($time_utils:ampm(stamp, 1) != "2 p.m.")
  return "ampm hours";
endif
if ($time_utils:ampm(stamp, 3) != "2:30:45 p.m.")
  return "ampm seconds";
endif
if ($time_utils:ampm("Wed Oct 15 00:30:00 2025 GMT") != "12:30 a.m.")
  return "ampm midnight";
endif
if ($time_utils:ampm("Wed Oct 15 12:30:00 2025 GMT") != "12:30 p.m.")
  return "ampm noon";
endif
if ($time_utils:ampm("Wed Oct 15 09:08:00 2025 GMT") != "9:08 a.m.")
  return "ampm morning";
endif
if ($time_utils:ampm({}) != E_TYPE)
  return "ampm type";
endif
return 1;
.

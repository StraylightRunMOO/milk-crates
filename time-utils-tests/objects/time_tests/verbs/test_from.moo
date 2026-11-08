@verb time_tests:test_from this none none rxd
@program time_tests:test_from
if ($time_utils:from_day(5, 0, 28800) != 28800)
  return "from_day Thu at Thu midnight";
endif
if ($time_utils:from_day("Thursday", 0, 28800) != 28800)
  return "from_day Thursday name";
endif
if ($time_utils:from_day("Friday", 0, 28800) != 115200)
  return "from_day Friday";
endif
if ($time_utils:from_day("Sunday", 0, 28800) != 288000)
  return "from_day Sunday";
endif
if ($time_utils:from_day("Notaday") != E_DIV)
  return "from_day bad";
endif
thu = $time_utils:from_day("Thursday", 0);
if (typeof(thu) != INT || thu < 0)
  return "from_day now";
endif
if ($time_utils:from_month("Notamonth") != E_DIV)
  return "from_month bad";
endif
jan = `$time_utils:from_month("January") ! ANY => -1';
if (typeof(jan) != INT || jan < 0)
  return "from_month January";
endif
if ((jan - 28800) % 86400 != 0)
  return "from_month not PST midnight";
endif
oct = `$time_utils:from_month(10, 0, 15) ! ANY => -1';
if (typeof(oct) != INT || oct < 0)
  return "from_month Oct 15";
endif
past = `$time_utils:from_month("June", -1) ! ANY => -1';
fut = `$time_utils:from_month("June", 1) ! ANY => -1';
if (typeof(past) != INT || typeof(fut) != INT || fut < past)
  return "from_month order";
endif
t0 = `$time_utils:from_ctime("Sat Jan 10 00:00:00 1970 GMT") ! ANY => 0';
t1 = `$time_utils:from_ctime("Sat Jan 10 01:00:00 1970 GMT") ! ANY => 0';
if (typeof(t0) != INT || typeof(t1) != INT)
  return "from_ctime type";
endif
if (t1 - t0 != 3600)
  return "from_ctime hour delta => " + toliteral(t1 - t0);
endif
d1 = `$time_utils:from_ctime("Sun Jan 11 00:00:00 1970 GMT") ! ANY => 0';
if (d1 - t0 != 86400)
  return "from_ctime day delta";
endif
if (`$time_utils:from_ctime("Sat Jan 10 00:00:00 1970 UTC") ! ANY => 0' != t0)
  return "from_ctime UTC vs GMT";
endif
pst = `$time_utils:from_ctime("Sat Jan 10 00:00:00 1970 PST") ! ANY => 0';
if (pst - t0 != 28800)
  return "from_ctime PST";
endif
if (`$time_utils:from_ctime("Sat Jan 10 00:00:00 1970") ! ANY => 0' != pst)
  return "from_ctime default TZ";
endif
if ($time_utils:from_ctime("nope") != E_DIV)
  return "from_ctime bad";
endif
return 1;
.

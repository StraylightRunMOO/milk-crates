@verb time_tests:test_until this none none rxd
@program time_tests:test_until
now = ctime()[12..19];
z = `$time_utils:seconds_until_time(now) ! ANY => 99';
if (typeof(z) != INT || abs(z) > 1)
  return "until now => " + toliteral(z);
endif
mid = `$time_utils:seconds_until_time("00:00:00") ! ANY => "err"';
if (typeof(mid) != INT)
  return "until midnight type";
endif
noon = `$time_utils:seconds_until_time("12:00:00") ! ANY => "err"';
if (typeof(noon) != INT)
  return "until noon type";
endif
if (mid < -86399 || mid > 86399)
  return "until midnight range";
endif
d = `$time_utils:seconds_until_date("January", 1, "00:00:00", 0) ! ANY => "err"';
if (typeof(d) != INT)
  return "until date type";
endif
d2 = `$time_utils:seconds_until_date(6, 15, "12:00:00", 1) ! ANY => "err"';
if (typeof(d2) != INT)
  return "until date upcoming";
endif
return 1;
.

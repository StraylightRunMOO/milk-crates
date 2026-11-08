@verb time_tests:test_sun this none none rxd
@program time_tests:test_sun
a = `$time_utils:sun(0) ! ANY => "err"';
b = `$time_utils:sun(0) ! ANY => "err"';
if (typeof(a) != INT)
  return "sun 0 type => " + toliteral(a);
endif
if (a != b)
  return "sun 0 unstable";
endif
n = `$time_utils:sun() ! ANY => "err"';
if (typeof(n) != INT)
  return "sun now type";
endif
thu = `$time_utils:from_day("Thursday", 0) ! ANY => "err"';
dm = `$time_utils:dst_midnight(thu) ! ANY => "err"';
if (typeof(dm) != INT)
  return "dst_midnight type";
endif
fixed = `$time_utils:dst_midnight(28800) ! ANY => "err"';
if (typeof(fixed) != INT)
  return "dst_midnight epoch Thu";
endif
return 1;
.

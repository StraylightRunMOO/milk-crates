@verb time_tests:test_format this none none rxd
@program time_tests:test_format
stamp = "Wed Oct 15 14:30:00 2025 GMT";
if ($time_utils:mmddyy(stamp) != "10/15/25")
  return "mmddyy => " + $time_utils:mmddyy(stamp);
endif
if ($time_utils:ddmmyy(stamp) != "15/10/25")
  return "ddmmyy => " + $time_utils:ddmmyy(stamp);
endif
if ($time_utils:mmddyyyy(stamp) != "10/15/2025")
  return "mmddyyyy => " + $time_utils:mmddyyyy(stamp);
endif
if ($time_utils:ddmmyyyy(stamp) != "15/10/2025")
  return "ddmmyyyy => " + $time_utils:ddmmyyyy(stamp);
endif
if ($time_utils:mmddyy(stamp, "-") != "10-15-25")
  return "mmddyy sep";
endif
if ($time_utils:mmddyy("Sun Mar 5 09:08:07 2021 GMT") != "03/05/21")
  return "mmddyy pad";
endif
if ($time_utils:mmddyyyy("Sun Mar 5 09:08:07 2021 GMT") != "03/05/2021")
  return "mmddyyyy pad";
endif
if ($time_utils:mmddyy({}) != E_TYPE)
  return "mmddyy type";
endif
if ($time_utils:mmddyyyy({}) != E_TYPE)
  return "mmddyyyy type";
endif
t = time();
c = $string_utils:explode(ctime(t));
tz = length(c) >= 6 ? " " + c[6] | "";
want = tostr(c[1], ", ", c[3], " ", c[2], " ", c[5], " ", c[4], tz);
got = `$time_utils:rfc822_ctime(t) ! ANY => 0';
if (got != want)
  return "rfc822 => " + toliteral(got);
endif
bare = `$time_utils:rfc822_ctime() ! ANY => 0';
if (typeof(bare) != STR || !index(bare, ", "))
  return "rfc822 now";
endif
return 1;
.

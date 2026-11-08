@verb time_tests:test_english this none none rxd
@program time_tests:test_english
if ($time_utils:english_time(0) != "0 seconds")
  return "english 0";
endif
if ($time_utils:english_time(-3) != "0 seconds")
  return "english neg";
endif
if ($time_utils:english_time(1) != "1 second")
  return "english 1s";
endif
if ($time_utils:english_time(2) != "2 seconds")
  return "english 2s";
endif
if ($time_utils:english_time(60) != "1 minute")
  return "english 1m";
endif
if ($time_utils:english_time(61) != "1 minute and 1 second")
  return "english 61 => " + $time_utils:english_time(61);
endif
if ($time_utils:english_time(3600) != "1 hour")
  return "english 1h";
endif
if ($time_utils:english_time(3661) != "1 hour, 1 minute, and 1 second")
  return "english 3661 => " + $time_utils:english_time(3661);
endif
ref = "Thu Jan 10 00:00:00 1970 GMT";
if ($time_utils:english_time(86400, ref) != "1 day")
  return "english 1 day";
endif
if ($time_utils:english_time(31 * 86400, ref) != "1 month")
  return "english 31d => " + $time_utils:english_time(31 * 86400, ref);
endif
if ($time_utils:english_time(32 * 86400, ref) != "1 month and 1 day")
  return "english 32d => " + $time_utils:english_time(32 * 86400, ref);
endif
if (`$time_utils:parse_english_time_interval("30", "secs", "2", "minutes", "31", "seconds") ! ANY => 0' != 181)
  return "parse tokens";
endif
if ($time_utils:parse_english_time_interval("30 secs 2 minutes 31 seconds") != 181)
  return "parse string";
endif
if ($time_utils:parse_english_time_interval("1", "hour") != 3600)
  return "parse hour";
endif
if ($time_utils:parse_english_time_interval("a", "day") != 86400)
  return "parse a day";
endif
if ($time_utils:parse_english_time_interval("an", "hour") != 3600)
  return "parse an hour";
endif
if ($time_utils:parse_english_time_interval("no", "seconds") != 0)
  return "parse no";
endif
if ($time_utils:parse_english_time_interval("2 hours and 3 minutes") != 7380)
  return "parse and";
endif
if ($time_utils:parse_english_time_interval("2 hours, 3 minutes") != 7380)
  return "parse comma";
endif
if ($time_utils:parse_english_time_interval("1", "week") != 604800)
  return "parse week";
endif
if ($time_utils:parse_english_time_interval("1") != E_ARGS)
  return "parse odd";
endif
if ($time_utils:parse_english_time_interval("1", "fortnight") != E_INVARG)
  return "parse bad unit";
endif
if ($time_utils:parse_english_time_interval("foo", "hours") != E_INVARG)
  return "parse bad num";
endif
return 1;
.

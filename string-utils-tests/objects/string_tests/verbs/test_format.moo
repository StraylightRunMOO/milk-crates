@verb string_tests:test_format this none none rxd
@program string_tests:test_format
if ($string_utils:from_seconds(1) != "a second")
  return "from_seconds 1";
endif
if ($string_utils:from_seconds(120) != "2 minutes")
  return "from_seconds 120";
endif
if ($string_utils:max_length("hello world", 8) != "hello...")
  return "max_length";
endif
if ($string_utils:truncate("hi", 10, 1) != "hi        ")
  return "truncate alias";
endif
tb = $string_utils:to_bytes(1024);
if (typeof(tb) != STR || !index(tb, "KB"))
  return "to_bytes => " + toliteral(tb);
endif
if (typeof($string_utils:byte_string(12)) != STR)
  return "byte_string alias";
endif
if ($string_utils:a_or_an("apple") != "an" || $string_utils:a_or_an("box") != "a")
  return "a_or_an";
endif
if ($string_utils:a_or_an("unit") != "a")
  return "a_or_an unit";
endif
return 1;
.

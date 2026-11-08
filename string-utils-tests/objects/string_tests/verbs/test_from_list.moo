@verb string_tests:test_from_list this none none rxd
@program string_tests:test_from_list
if ($string_utils:from_list({"x", "y"}, "-") != "x-y")
  return "from_list dash";
endif
if ($string_utils:join({"x", "y"}, "-") != "x-y")
  return "join alias";
endif
if ($string_utils:implode({"x", "y"}, "-") != "x-y")
  return "implode dash";
endif
if ($string_utils:from_list({"x", "y"}) != "xy")
  return "from_list empty sep";
endif
if ($string_utils:implode({"x", "y"}) != "xy")
  return "implode empty sep";
endif
return 1;
.

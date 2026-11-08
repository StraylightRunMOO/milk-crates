@verb list_tests:test_longest this none none rxd
@program list_tests:test_longest
if ($list_utils:longest({"a", "bbb", "cc"}) != "bbb")
  return "longest";
endif
if ($list_utils:shortest({"a", "bbb", "cc"}) != "a")
  return "shortest";
endif
if ($list_utils:longest({}) != E_RANGE)
  return "longest empty";
endif
if ($list_utils:max_length({"aa", "b"}) != 2)
  return "max_length";
endif
if ($list_utils:max_length({"aa", "b"}, 5) != 5)
  return "max_length default";
endif
return 1;
.

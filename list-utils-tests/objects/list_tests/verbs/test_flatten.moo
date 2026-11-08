@verb list_tests:test_flatten this none none rxd
@program list_tests:test_flatten
if ($list_utils:flatten({{1, 2}, {3}}) != {1, 2, 3})
  return "flatten shallow";
endif
if ($list_utils:flatten({{1, {2}}, 3}) != {1, 2, 3})
  return "flatten nested";
endif
if ($list_utils:flatten({1, 2, 3}) != {1, 2, 3})
  return "flatten flat";
endif
if ($list_utils:flatten({{}}) != {})
  return "flatten empty nest";
endif
if ($list_utils:flatten_suspended({{1, {2}}, 3}) != {1, 2, 3})
  return "flatten_suspended";
endif
return 1;
.

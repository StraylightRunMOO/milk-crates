@verb list_tests:test_find_insert this none none rxd
@program list_tests:test_find_insert
if ($list_utils:find_insert({1, 3, 5}, 4) != 3)
  return "find mid";
endif
if ($list_utils:find_insert({1, 3, 5}, 0) != 1)
  return "find before";
endif
if ($list_utils:find_insert({1, 3, 5}, 5) != 4)
  return "find after equal";
endif
if ($list_utils:find_insert({}, 1) != 1)
  return "find empty";
endif
return 1;
.

@verb list_tests:test_unique this none none rxd
@program list_tests:test_unique
if ($list_utils:unique({1, 2, 2, 3}) != {1, 2, 3})
  return "unique";
endif
if ($list_utils:remove_duplicates({1, 2, 2, 3}) != {1, 2, 3})
  return "remove_duplicates";
endif
if ($list_utils:unique({}) != {})
  return "unique empty";
endif
return 1;
.

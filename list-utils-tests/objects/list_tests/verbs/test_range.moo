@verb list_tests:test_range this none none rxd
@program list_tests:test_range
if ($list_utils:range(2, 4) != {2, 3, 4})
  return "range 2 4";
endif
if ($list_utils:range(3) != {1, 2, 3})
  return "range 3";
endif
if ($list_utils:range(5, 5) != {5})
  return "range same";
endif
return 1;
.

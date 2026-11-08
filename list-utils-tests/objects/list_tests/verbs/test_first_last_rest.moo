@verb list_tests:test_first_last_rest this none none rxd
@program list_tests:test_first_last_rest
if ($list_utils:first({9, 8, 7}) != 9)
  return "first";
endif
if ($list_utils:last({9, 8, 7}) != 7)
  return "last";
endif
if ($list_utils:rest({9, 8, 7}) != {8, 7})
  return "rest";
endif
if ($list_utils:rest({9}) != {})
  return "rest singleton";
endif
if ($list_utils:first({}) != E_RANGE)
  return "first empty";
endif
if ($list_utils:first(9) != E_TYPE)
  return "first type";
endif
return 1;
.

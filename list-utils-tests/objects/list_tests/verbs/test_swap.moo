@verb list_tests:test_swap this none none rxd
@program list_tests:test_swap
if ($list_utils:swap_elements({"a", "b", "c"}, 1, 3) != {"c", "b", "a"})
  return "swap";
endif
if ($list_utils:swap_elements({"a"}, 1, 2) != E_RANGE)
  return "swap range";
endif
if ($list_utils:swap_elements("no", 1, 1) != E_TYPE)
  return "swap type";
endif
return 1;
.

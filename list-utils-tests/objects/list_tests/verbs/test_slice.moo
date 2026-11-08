@verb list_tests:test_slice this none none rxd
@program list_tests:test_slice
if ($list_utils:slice({{"z", 1}, {"y", 2}, {"x", 5}}, 2) != {1, 2, 5})
  return "slice col";
endif
if ($list_utils:slice({{"z", 1}, {"y", 2}}) != {"z", "y"})
  return "slice default";
endif
if ($list_utils:slice({{"z", 1, 3}, {"y", 2, 4}}, {2, 1}) != {{1, "z"}, {2, "y"}})
  return "slice multi";
endif
return 1;
.

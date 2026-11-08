@verb list_tests:test_arrayset this none none rxd
@program list_tests:test_arrayset
if ($list_utils:arrayset({1, 2, 3}, 9, 2) != {1, 9, 3})
  return "arrayset";
endif
if ($list_utils:arrayset({{1, 2}, {3, 4}}, 9, 1, 2) != {{1, 9}, {3, 4}})
  return "arrayset nested";
endif
return 1;
.

@verb list_tests:test_alist this none none rxd
@program list_tests:test_alist
if ($list_utils:build_alist({1, 2, 3, 4, 5, 6}, 3) != {{1, 2, 3}, {4, 5, 6}})
  return "build_alist";
endif
if ($list_utils:build_alist({1, 2, 3}, 2) != E_RANGE)
  return "build_alist range";
endif
if ($list_utils:make_alist({{1, 2, 3}, {"a", "b"}}) != {{1, "a"}, {2, "b"}, {3, 0}})
  return "make_alist";
endif
if ($list_utils:amerge({{"a", 1}, {"a", 2}}) != {{"a", 1, 2}})
  return "amerge";
endif
if ($list_utils:amerge({}) != {})
  return "amerge empty";
endif
return 1;
.

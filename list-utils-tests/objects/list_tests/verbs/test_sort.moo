@verb list_tests:test_sort this none none rxd
@program list_tests:test_sort
if ($list_utils:sort({3, 1, 2}) != {1, 2, 3})
  return "sort";
endif
if ($list_utils:sort({"x1", "x3", "x2"}, {1, 3, 2}) != {"x1", "x2", "x3"})
  return "sort keys";
endif
if ($list_utils:sort_alist({{"b", 2}, {"a", 1}}) != {{"a", 1}, {"b", 2}})
  return "sort_alist";
endif
if ($list_utils:sort_suspended(0, {3, 1, 2}) != {1, 2, 3})
  return "sort_suspended";
endif
if ($list_utils:sort_alist_suspended(0, {{"b", 2}, {"a", 1}}) != {{"a", 1}, {"b", 2}})
  return "sort_alist_suspended";
endif
if ($list_utils:sort_by_property({$list_utils}) != {$list_utils})
  return "sort_by_property";
endif
return 1;
.

@verb list_tests:test_iassoc this none none rxd
@program list_tests:test_iassoc
al = {{"a", 1}, {"b", 2}};
if ($list_utils:iassoc("b", al) != 2)
  return "iassoc";
endif
if ($list_utils:iassoc("z", al) != 0)
  return "iassoc miss";
endif
if ($list_utils:iassoc_new("b", al) != 2)
  return "iassoc_new";
endif
if ($list_utils:iassoc_prefix("b", {{"bat", 1}, {"cat", 2}}) != 1)
  return "iassoc_prefix";
endif
if ($list_utils:iassoc_sorted(3, {{1}, {2}, {4}, {5}}) != 2)
  return "iassoc_sorted";
endif
if ($list_utils:iassoc_suspended("b", al) != 2)
  return "iassoc_suspended";
endif
return 1;
.

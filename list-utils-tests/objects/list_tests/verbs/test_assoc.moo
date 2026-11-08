@verb list_tests:test_assoc this none none rxd
@program list_tests:test_assoc
al = {{"a", 1}, {"b", 2}};
if ($list_utils:assoc("b", al) != {"b", 2})
  return "assoc";
endif
if ($list_utils:assoc("z", al) != {})
  return "assoc miss";
endif
if ($list_utils:assoc(2, al, 2) != {"b", 2})
  return "assoc index";
endif
if ($list_utils:assoc_prefix("b", {{"bat", 1}, {"cat", 2}}) != {"bat", 1})
  return "assoc_prefix";
endif
if ($list_utils:assoc_suspended("b", al) != {"b", 2})
  return "assoc_suspended";
endif
if ($list_utils:passoc("b", {"a", "b", "c"}, {1, 2, 3}) != {"b", 2})
  return "passoc";
endif
if ($list_utils:passoc("z", {"a", "b"}, {1, 2}) != {})
  return "passoc miss";
endif
return 1;
.

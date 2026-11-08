@verb list_tests:test_setops this none none rxd
@program list_tests:test_setops
if ($list_utils:setadd({1, 2}, 3) != {1, 2, 3})
  return "setadd";
endif
if ($list_utils:setadd({1, 2}, 2) != {1, 2})
  return "setadd existing";
endif
if ($list_utils:setremove({1, 2, 3}, 2) != {1, 3})
  return "setremove";
endif
if ($list_utils:setremove_all({1, 2, 1, 3, 1}, 1) != {2, 3})
  return "setremove_all";
endif
if ($list_utils:setmove({"x", "y", "z"}, 1, 3) != {"y", "z", "x"})
  return "setmove";
endif
return 1;
.

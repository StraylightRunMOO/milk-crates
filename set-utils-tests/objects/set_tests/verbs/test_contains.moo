@verb set_tests:test_contains this none none rxd
@program set_tests:test_contains
if (!$set_utils:contains({1, 2, 3}, {2, 3}))
  return "superset";
endif
if ($set_utils:contains({1, 2}, {2, 9}))
  return "not super";
endif
if (!$set_utils:contains({1}))
  return "one arg";
endif
if (!$set_utils:contains({1, 2}, {}))
  return "super of empty";
endif
if (!$set_utils:contains({}, {}))
  return "empty of empty";
endif
return 1;
.

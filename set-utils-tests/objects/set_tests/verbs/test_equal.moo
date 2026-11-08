@verb set_tests:test_equal this none none rxd
@program set_tests:test_equal
if (!$set_utils:equal({1, 2, 2}, {2, 1}))
  return "same elements";
endif
if ($set_utils:equal({1, 2}, {1, 2, 3}))
  return "extra";
endif
if ($set_utils:equal({1}, {2}))
  return "disjoint";
endif
return 1;
.

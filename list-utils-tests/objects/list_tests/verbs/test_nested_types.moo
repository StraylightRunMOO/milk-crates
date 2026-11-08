@verb list_tests:test_nested_types this none none rxd
@program list_tests:test_nested_types
if (!$list_utils:is_nested_list({{1}, 2}))
  return "nested";
endif
if ($list_utils:is_nested_list({1, 2}))
  return "flat";
endif
if ($list_utils:is_nested_list(1))
  return "nonlist";
endif
if (!$list_utils:contains_only_these_types({1, 2}, INT))
  return "only int";
endif
if ($list_utils:contains_only_these_types({1, "a"}, INT))
  return "mixed";
endif
return 1;
.

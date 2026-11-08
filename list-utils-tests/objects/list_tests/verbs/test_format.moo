@verb list_tests:test_format this none none rxd
@program list_tests:test_format
if ($list_utils:prefix({"a", "b"}, "[", "]") != {"[a]", "[b]"})
  return "prefix";
endif
if ($list_utils:trim_elements({" a ", 1, "b "}) != {"a", 1, "b"})
  return "trim_elements";
endif
if ($list_utils:remove_empty_strings({"a", "", "b", 0}) != {"a", "b", 0})
  return "remove_empty_strings";
endif
r = $list_utils:merge_columns({{"a"}, {"b"}});
if (typeof(r) != LIST || !r || r[1] != "ab")
  return "merge_columns => " + toliteral(r);
endif
return 1;
.

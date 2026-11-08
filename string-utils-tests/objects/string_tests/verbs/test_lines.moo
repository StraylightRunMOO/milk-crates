@verb string_tests:test_lines this none none rxd
@program string_tests:test_lines
if ($string_utils:lines_to_list("a", {"b", "c"}) != {"a", "b", "c"})
  return "lines_to_list";
endif
if ($string_utils:enlist("x") != {"x"})
  return "enlist alias";
endif
if ($string_utils:lines_to_string("a", {"b"}) != "ab")
  return "lines_to_string";
endif
return 1;
.

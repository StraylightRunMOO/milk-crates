@verb string_tests:test_parse this none none rxd
@program string_tests:test_parse
if ($string_utils:end_expression("foo bar") != 3)
  return "end_expression foo";
endif
if ($string_utils:end_expression("(foo)") != 5)
  return "end_expression paren";
endif
if (!$string_utils:inside_quotes("a\"b"))
  return "inside_quotes open";
endif
if ($string_utils:inside_quotes("a\"b\""))
  return "inside_quotes closed";
endif
return 1;
.

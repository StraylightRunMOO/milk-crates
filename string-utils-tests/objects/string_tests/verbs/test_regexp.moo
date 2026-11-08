@verb string_tests:test_regexp this none none rxd
@program string_tests:test_regexp
q = $string_utils:regexp_quote("a.b");
if (!index(q, "%.") || q[1] != "a")
  return "regexp_quote => " + toliteral(q);
endif
return 1;
.

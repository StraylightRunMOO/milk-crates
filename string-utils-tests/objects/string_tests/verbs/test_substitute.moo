@verb string_tests:test_substitute this none none rxd
@program string_tests:test_substitute
if ($string_utils:substitute("abc", {{"a", "x"}, {"c", "z"}}) != "xbz")
  return "substitute";
endif
if ($string_utils:subst("Cc: banana", {{"a", "b"}, {"b", "c"}, {"c", "a"}}, 1) != "Ca: cbnbnb")
  return "subst alias";
endif
if ($string_utils:substitute_first("aaa", "a", "b") != "baa")
  return "substitute_first";
endif
sd = $string_utils:substitute_delimited("hello world", {{"hello", "hi"}});
if (sd != "hi world")
  return "substitute_delimited => " + toliteral(sd);
endif
return 1;
.

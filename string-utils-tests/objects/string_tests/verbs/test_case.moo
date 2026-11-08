@verb string_tests:test_case this none none rxd
@program string_tests:test_case
if ($string_utils:uppercase("moo") != "MOO")
  return "uppercase";
endif
if ($string_utils:lowercase("MOO") != "moo")
  return "lowercase";
endif
if ($string_utils:capitalize("moo") != "Moo")
  return "capitalize";
endif
if ($string_utils:capitalise("moo") != "Moo")
  return "capitalise alias";
endif
if ($string_utils:capitalize_each("foo bar") != "Foo Bar")
  return "capitalize_each";
endif
if ($string_utils:camelBack("foo bar baz") != "fooBarBaz")
  return "camelBack";
endif
if ($string_utils:camel_case("foo bar") != "fooBar")
  return "camel_case alias";
endif
return 1;
.

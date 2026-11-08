@verb string_tests:test_types this none none rxd
@program string_tests:test_types
if ($string_utils:string_from_type(STR) != "STR")
  return "string_from_type STR";
endif
if ($string_utils:type_from_string("INT") != INT)
  return "type_from_string INT";
endif
if ($string_utils:type_from_string("nope") != -1)
  return "type_from_string unknown";
endif
if ($string_utils:string_from_type(-99) != "")
  return "string_from_type unknown";
endif
return 1;
.

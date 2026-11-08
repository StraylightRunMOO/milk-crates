@verb string_tests:test_english_list this none none rxd
@program string_tests:test_english_list
if ($string_utils:english_list({"red", "green", "blue"}) != "red, green, and blue")
  return "english_list three";
endif
if ($string_utils:english_list({"a", "b"}) != "a and b")
  return "english_list two";
endif
if ($string_utils:english_list({}) != "nothing")
  return "english_list empty";
endif
q = $string_utils:quoted_english_list({"a", "b"});
if (q != "\"a\" and \"b\"")
  return "quoted_english_list => " + toliteral(q);
endif
if ($string_utils:quoted_list({"a"}) != "\"a\"")
  return "quoted_list alias";
endif
return 1;
.

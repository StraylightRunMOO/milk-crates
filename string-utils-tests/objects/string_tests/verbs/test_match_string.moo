@verb string_tests:test_match_string this none none rxd
@program string_tests:test_match_string
ms = $string_utils:match_string("Jack waves to Jill", "* waves to *");
if (ms != {"Jack", "Jill"})
  return "match_string => " + toliteral(ms);
endif
if ($string_utils:match_stringlist("bar", {"food", "bar"}) != 2)
  return "match_stringlist exact";
endif
if ($string_utils:match_string_list("fo", {"food", "bar"}) != 1)
  return "match_string_list prefix";
endif
if ($string_utils:match_stringlist("x", {"food", "bar"}) != $failed_match)
  return "match_stringlist fail";
endif
if ($string_utils:match_stringlist("f", {"food", "foo"}) != $ambiguous_match)
  return "match_stringlist ambig";
endif
return 1;
.

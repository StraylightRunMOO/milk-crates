@verb string_tests:test_chars this none none rxd
@program string_tests:test_chars
if ($string_utils:to_ASCII("A") != 65)
  return "to_ASCII";
endif
if ($string_utils:from_ASCII(65) != "A")
  return "from_ASCII";
endif
if ($string_utils:char_list("abad") != {"a", "b", "a", "d"})
  return "char_list";
endif
if ($string_utils:reverse("This is a test.") != ".tset a si sihT")
  return "reverse";
endif
if ($string_utils:incr_alpha("aaa") != "aab")
  return "incr_alpha aaa";
endif
if ($string_utils:incr_alpha("") != "a")
  return "incr_alpha empty";
endif
if ($string_utils:incr_alpha("z") != "aa")
  return "incr_alpha z";
endif
return 1;
.

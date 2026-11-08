@verb string_tests:test_index this none none rxd
@program string_tests:test_index
if ($string_utils:index_all("aaabacadae", "a") != {1, 2, 3, 5, 7, 9})
  return "index_all";
endif
if ($string_utils:index_count("aaa", "aa") != 1)
  return "index_count";
endif
if ($string_utils:index_delimited("hello world", "hello") != 1)
  return "index_delimited hello";
endif
if ($string_utils:index_delimited("hello world", "ell") != 0)
  return "index_delimited interior";
endif
if ($string_utils:find_prefix("he", {"hi", "hello"}) != 2)
  return "find_prefix unique";
endif
if ($string_utils:find_prefix("he", {"hello", "help"}) != $ambiguous_match)
  return "find_prefix ambig";
endif
if ($string_utils:find_prefix("z", {"hello"}) != 0)
  return "find_prefix none";
endif
if ($string_utils:common("hello", "help") != 3)
  return "common";
endif
return 1;
.

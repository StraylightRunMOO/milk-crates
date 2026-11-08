@verb string_tests:test_starts_with this none none rxd
@program string_tests:test_starts_with
if (!$string_utils:starts_with("hello", "he") || $string_utils:ends_with("hello", "x"))
  return "starts/ends smoke";
endif
if (!$string_utils:ends_with("hello", "lo"))
  return "ends_with lo";
endif
if (!$string_utils:starts_with("hello", "") || !$string_utils:ends_with("hello", ""))
  return "empty affix";
endif
return 1;
.

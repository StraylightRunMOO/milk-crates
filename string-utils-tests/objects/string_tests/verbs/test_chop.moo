@verb string_tests:test_chop this none none rxd
@program string_tests:test_chop
if ($string_utils:chop("abcdef", 2) != {"ab", "cd", "ef"})
  return "chop even";
endif
if ($string_utils:chop("abcde", 2) != {"ab", "cd", "e"})
  return "chop remainder";
endif
if (`$string_utils:chop("ab", 0) ! ANY => E_INVARG' != E_INVARG)
  return "chop size 0";
endif
return 1;
.

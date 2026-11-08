@verb string_tests:test_strip this none none rxd
@program string_tests:test_strip
if ($string_utils:strip_chars("hello", "l") != "heo")
  return "strip_chars";
endif
if ($string_utils:strip_all_but("hello", "lo") != "llo")
  return "strip_all_but";
endif
if ($string_utils:strip_all_but_seq("xxllyy", "ll") != "ll")
  return "strip_all_but_seq";
endif
enc = `encode_binary("hi") ! ANY => 0';
if (typeof(enc) == STR)
  got = `$string_utils:strip_binary(enc) ! ANY => 0';
  if (got != "hi")
    return "strip_binary => " + toliteral(got);
  endif
else
  `$string_utils:strip_binary("hi") ! ANY => 0';
endif
return 1;
.

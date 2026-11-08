@verb string_tests:test_aliases this none none rxd
@program string_tests:test_aliases
got = $string_utils:aliases_from_name("yellow baseball bat");
if (got != {"baseball bat", "bat", "yellow baseball bat"})
  return "aliases_from_name => " + toliteral(got);
endif
return 1;
.

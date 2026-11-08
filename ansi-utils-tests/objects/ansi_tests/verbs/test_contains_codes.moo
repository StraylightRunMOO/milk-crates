@verb ansi_tests:test_contains_codes this none none rxd
@program ansi_tests:test_contains_codes
if (`$ansi_utils:contains_codes("hi") ! ANY => 1')
  return "plain should be false";
endif
if (!`$ansi_utils:contains_codes("[red]hi") ! ANY => 0')
  return "red should be true";
endif
return 1;
.
